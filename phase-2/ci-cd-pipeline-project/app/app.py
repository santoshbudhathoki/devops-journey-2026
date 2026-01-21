from flask import Flask, Response
from pathlib import Path

def create_app() -> Flask:
    app = Flask(__name__)

    @app.get("/health")
    def health():
        return Response("ok", mimetype="text/plain")

    @app.get("/version")
    def version():
        version_file = Path(__file__).resolve().parents[1] / "VERSION"
        ver = version_file.read_text(encoding="utf-8").strip()
        return Response(ver, mimetype="text/plain")

    return app

if __name__ == "__main__":
    app = create_app()
    app.run(host="0.0.0.0", port=5000)
