# Swift Notifications Service

A lightweight HTTP service written in Swift that returns `Swift Notifications Service` on port **3017**.

## Build

```
cd services/swift-notifications
swift build -c release
.build/release/swift-notifications
```

## Docker

```
docker build -t swift-notifications .
docker run -p 3017:3017 swift-notifications
```
