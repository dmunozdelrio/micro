name := "scala-reporting"
version := "0.1.0"
scalaVersion := "2.13.8"

// Assembly plugin configuration
assembly / mainClass := Some("Main") // Assuming your main class is Main, adjust if needed
assembly / assemblyJarName := "scala-reporting-assembly.jar"
