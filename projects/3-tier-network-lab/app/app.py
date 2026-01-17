import os
from flask import Flask
import mysql.connector

app = Flask(__name__)

DB_HOST = os.getenv("DB_HOST", "db")
DB_USER = os.getenv("DB_USER", "appuser")
DB_PASSWORD = os.getenv("DB_PASSWORD", "apppass")
DB_NAME = os.getenv("DB_NAME", "appdb")

def db_ping():
    conn = mysql.connector.connect(
        host=DB_HOST,
        user=DB_USER,
        password=DB_PASSWORD,
        database=DB_NAME,
        connection_timeout=3,
    )
    cur = conn.cursor()
    cur.execute("SELECT 1;")
    cur.fetchone()
    cur.close()
    conn.close()

@app.get("/")
def home():
    return "OK: app is running\n"

@app.get("/db")
def dbcheck():
    try:
        db_ping()
        return "OK: db reachable\n"
    except Exception as e:
        return f"CRITICAL: db error: {e}\n", 500

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

