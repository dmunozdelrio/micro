from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI(title="Forecast Service")

class ForecastRequest(BaseModel):
    location: str

@app.get("/health")
def health():
    return {"status": "ok"}

@app.post("/forecast")
def forecast(data: ForecastRequest):
    # Placeholder logic for demonstration purposes
    return {"location": data.location, "forecast": "sunny"}

