use actix_web::{post, get, web, App, HttpServer, Responder, HttpResponse};
use std::sync::Mutex;
use std::collections::VecDeque;

struct AppState {
    events: Mutex<VecDeque<String>>,
}

#[post("/event")]
async fn event(data: web::Data<AppState>, body: String) -> impl Responder {
    let mut events = data.events.lock().unwrap();
    events.push_back(body.clone());
    // keep only latest 100 events
    if events.len() > 100 {
        events.pop_front();
    }
    HttpResponse::Ok().body("stored")
}

#[get("/")]
async fn index() -> impl Responder {
    HttpResponse::Ok().body("Analytics service running")
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    let state = web::Data::new(AppState {
        events: Mutex::new(VecDeque::new()),
    });
    HttpServer::new(move || {
        App::new()
            .app_data(state.clone())
            .service(index)
            .service(event)
    })
    .bind(("0.0.0.0", 3007))?
    .run()
    .await
}
