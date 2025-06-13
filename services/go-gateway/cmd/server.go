package main

import (
	"log"
	"os"

	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/middleware/proxy"
)

func authMiddleware(token string) fiber.Handler {
	return func(c *fiber.Ctx) error {
		if c.Get("Authorization") != "Bearer "+token {
			return c.Status(fiber.StatusUnauthorized).JSON(fiber.Map{"error": "unauthorized"})
		}
		return c.Next()
	}
}

func main() {
	authToken := os.Getenv("AUTH_TOKEN")
	if authToken == "" {
		authToken = "secret"
	}

	backend := os.Getenv("NOTIFICATIONS_URL")
	if backend == "" {
		backend = "http://localhost:3001"
	}

	app := fiber.New()
	app.Use(authMiddleware(authToken))

	app.All("/notifications/*", func(c *fiber.Ctx) error {
		target := backend + "/" + c.Params("*")
		q := c.Request().URI().QueryString()
		if len(q) > 0 {
			target += "?" + string(q)
		}
		return proxy.Do(c, target)
	})

	port := os.Getenv("PORT")
	if port == "" {
		port = "3003"
	}
	log.Fatal(app.Listen(":" + port))
}
