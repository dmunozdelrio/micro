using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System.Collections.Concurrent;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddSingleton<IUserStore, UserStore>();

var app = builder.Build();

app.MapGet("/", () => "Identity service running");

app.MapPost("/register", (UserCredentials creds, IUserStore store) =>
{
    if (store.AddUser(creds.Username, creds.Password))
    {
        return Results.Ok(new { status = "registered" });
    }
    return Results.BadRequest(new { error = "User exists" });
});

app.MapPost("/login", (UserCredentials creds, IUserStore store) =>
{
    if (store.ValidateUser(creds.Username, creds.Password))
    {
        return Results.Ok(new { status = "authenticated" });
    }
    return Results.Unauthorized();
});

app.Run("http://0.0.0.0:3006");

record UserCredentials(string Username, string Password);

interface IUserStore
{
    bool AddUser(string username, string password);
    bool ValidateUser(string username, string password);
}

class UserStore : IUserStore
{
    private readonly ConcurrentDictionary<string, string> _users = new();

    public bool AddUser(string username, string password) =>
        _users.TryAdd(username, password);

    public bool ValidateUser(string username, string password) =>
        _users.TryGetValue(username, out var pass) && pass == password;
}

