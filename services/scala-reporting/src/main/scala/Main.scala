object Main extends App {
  val port = sys.env.getOrElse("PORT", "3011").toInt
  val server = com.sun.net.httpserver.HttpServer.create(new java.net.InetSocketAddress(port), 0)
  server.createContext("/", exchange => {
    val response = "Scala Reporting Service"
    exchange.sendResponseHeaders(200, response.length())
    val os = exchange.getResponseBody
    os.write(response.getBytes())
    os.close()
  })
  server.start()
  println(s"Scala Reporting Service running on port $port")
}
