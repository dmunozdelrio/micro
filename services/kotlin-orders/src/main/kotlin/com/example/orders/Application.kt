package com.example.orders

import io.ktor.server.application.*
import io.ktor.server.engine.*
import io.ktor.server.netty.*
import io.ktor.http.*
import io.ktor.server.response.*
import io.ktor.server.request.*
import io.ktor.server.routing.*
import io.ktor.server.plugins.contentnegotiation.*
import io.ktor.serialization.kotlinx.json.*
import kotlinx.serialization.Serializable
import java.util.concurrent.atomic.AtomicInteger

fun main() {
    embeddedServer(
        Netty,
        port = System.getenv("PORT")?.toInt() ?: 3010,
        module = Application::module
    ).start(wait = true)
}

fun Application.module() {
    install(ContentNegotiation) { json() }

    val idCounter = AtomicInteger()
    val orders = mutableListOf<Order>()

    routing {
        get("/") {
            call.respondText("Order service running")
        }

        get("/orders") {
            call.respond(orders)
        }

        post("/orders") {
            val req = call.receive<OrderRequest>()
            val order = Order(idCounter.incrementAndGet(), req.item, req.quantity)
            orders.add(order)
            call.respond(HttpStatusCode.Created, order)
        }
    }
}

@Serializable
data class Order(val id: Int, val item: String, val quantity: Int)

@Serializable
data class OrderRequest(val item: String, val quantity: Int)
