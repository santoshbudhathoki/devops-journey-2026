# 3-Tier Network Lab (Load Balancer → App → Database)

## Purpose
Demonstrate a production-style 3-tier architecture using Docker, with clear traffic flow, isolation between tiers, and tested failure scenarios.

---

## Architecture
Client → Load Balancer (Nginx) → Application (Flask) → Database (MySQL)

- Load Balancer handles all inbound traffic
- Application processes requests and optionally queries DB
- Database is isolated and only reachable from the app tier

---

## Traffic Flow
1. Client sends request to localhost:8080
2. Docker maps host port 8080 to LB container port 80
3. Nginx forwards requests to app:5000 using internal DNS
4. App serves `/` directly
5. App serves `/db` by connecting to MySQL on db:3306

---

## Ports and Exposure
- Host:
  - 8080/tcp → Load Balancer
- Internal Docker network:
  - lb:80
  - app:5000
  - db:3306

Database is not exposed to the host, enforcing proper tier isolation.

---

## DNS Resolution
Docker Compose provides internal DNS:
- `app` resolves to the app container IP
- `db` resolves to the database container IP

The application connects to the database using `DB_HOST=db`.

---

## Failure Scenarios Tested

### Database Down
- `/` endpoint still works
- `/db` returns error
- Confirms app tier does not fully depend on DB availability

### Load Balancer Down
- `localhost:8080` becomes unreachable
- App still responds internally on port 5000
- Confirms LB is the single external entry point

---

## Evidence
See evidence/ directory for:
- curl outputs
- container status
- application logs

