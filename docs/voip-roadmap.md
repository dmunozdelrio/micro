# Self-hosted VoIP Integration Roadmap

This document outlines a forward-thinking plan (2025‑2027) to integrate a fully self-hosted voice service with the ERP stack maintained in this repository. It summarizes technology choices, project phases, and helpful resources.

## 0. Quick Overview

| Component | Role | Reason for Choice | Base Image |
|-----------|------|------------------|------------|
| FreeSWITCH 1.10 | SIP/PBX engine with native WebRTC | High performance, JSON event socket, horizontal scaling | `bettervoice/freeswitch-container` |
| Asterisk 20 (optional) | Advanced logic via ARI | Mature ecosystem, many dial‑plans | `andrius/asterisk:alpine-latest-20.5.2` |
| Janus Gateway | Pure WebRTC gateway | Audio and future video with same signalling | `docker-janus-gateway` |
| PostgreSQL / CDR | Call detail records and analytics | Reuse existing SQL stack | official Postgres |
| RabbitMQ (voice-bus) | CALL_INIT/CALL_END events and transcripts | Decouple ERP from real‑time flows | official RabbitMQ |
| voice-gateway-svc | FastAPI/Node wrapper | Exposes `/call` and `/status`, maps JSON ↔ SIP | custom |

Security hardening from FreeSWITCH v1.10.7 is recommended.

## 1. Phase 0 — Analysis & PoC (1‑2 weeks)

1. Clone the FreeSWITCH container prototype:
   ```bash
   git clone https://github.com/BetterVoice/freeswitch-container voice-lab
   cd voice-lab && docker compose up -d
   ```
   Validate calls between two softphones on the LAN.
2. Create branch `feature/voip` in the mono‑repo.
3. PoC API: `POST /call/outbound {to, from, uuid}` → WebSocket → FreeSWITCH `mod_event_socket`.
4. Quality control: use a `sipp` script with 50 calls per hour.
5. Deliverables: `docker-compose.voice.yml` and a README explaining the PoC.

## 2. Phase 1 — Integrated MVP (4‑6 weeks)

### 2.1 Service Architecture

```
           ERP UI ───▶ voice-gateway ──┐ REST/WS
                                     ▼
                                FreeSWITCH  ≈ SIP + RTP
                                     │ ESL
                                     ▼
                                  PostgreSQL (CDR)
```

The `voice-gateway` exposes REST endpoints, signs JWTs, and relays commands to the Event Socket Layer (or ARI when using Asterisk). Use an overlay network `voice-net` in Docker Swarm.

### 2.2 Repository Layout

```
apps/
 └─ backend/
     ├─ voice_gateway/   # FastAPI service
     │   ├─ Dockerfile
     │   └─ src/
     └─ freeswitch/      # Dockerfile + config mounts
infra/
 └─ docker/
     └─ stack-voice.yml  # Swarm stack
```

### 2.3 CI/CD

- GitHub Actions build images (`voice-gateway`, `freeswitch`) and run `sipp` tests.
- Version control FreeSWITCH configuration to prevent drift.

### 2.4 Security & Observability

- TLS on `5061` (SIPS) and SRTP/DTLS.
- Prometheus metrics via `mod_prometheus` or an exporter script.
- Grafana dashboard "Voice KPI": CPS, ASR, ACD, MOS.

## 3. Phase 2 — Scalability & Resilience (Q3‑Q4 2025)

- Add Kamailio as SBC front‑end to balance FreeSWITCH by DNS SRV.
- Deploy Coturn relay cluster for media and dynamic transcoding.
- Replicate the stack in a second data center with GeoDNS + Consul.
- Schedule regular `pg_dump` backups and volume snapshots.
- Store CDRs in a warehouse and cross reference with ERP billing.

## 4. Phase 3 — Innovation 2026‑2027

- AI voice bots: stream audio via WebSocket to a STT → LLM → TTS microservice.
- Conversational analytics: sentiment, silence detection, topic mining.
- Prepare FreeSWITCH nodes with DPDK for edge 5G deployments (<20 ms latency).
- Pilot IPv6‑only and QUIC‑SIP tests.
- Consider migrating to Kubernetes with StatefulSets if exceeding 400 CPS.

## 5. Immediate Adoption Checklist

| Step | Deliverable | Owner |
|------|-------------|-------|
| 1 | `stack-voice.yml` with FreeSWITCH + Postgres | DevOps |
| 2 | `voice_gateway` service (create call, hangup, status) | Backend |
| 3 | `seed_sip_users.sql` script and test softphones | DBA |
| 4 | CI pipeline (build, `sipp` test, push registry) | DevOps |
| 5 | Confluence documentation: ports, JWT, flows | PMO |
| 6 | PoC demo: click‑to‑call from ERP CRM module | Frontend |

## Useful Resources

- [FreeSWITCH container repository](https://github.com/BetterVoice/freeswitch-container)
- [Janus deployment guide](https://janus.conf.meetecho.com)
- [Asterisk/ARI docker example](https://github.com/asterisk/ari-examples)

This roadmap provides a self-hosted voice service aligned with the microservices architecture and ready to scale with future technologies such as AI and native WebRTC.
