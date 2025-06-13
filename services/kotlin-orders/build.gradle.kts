plugins {
    kotlin("jvm") version "2.0.21"
    application
}

repositories {
    mavenCentral()
}

dependencies {
    implementation("io.ktor:ktor-server-core-jvm:2.3.7")
    implementation("io.ktor:ktor-server-netty-jvm:2.3.7")
    implementation("io.ktor:ktor-server-content-negotiation-jvm:2.3.7")
    implementation("io.ktor:ktor-serialization-kotlinx-json-jvm:2.3.7")
    testImplementation("io.ktor:ktor-server-tests-jvm:2.3.7")
    testImplementation(kotlin("test"))
}

application {
    mainClass.set("com.example.orders.ApplicationKt")
}

tasks.test {
    useJUnitPlatform()
}
