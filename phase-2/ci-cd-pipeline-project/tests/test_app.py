from app.app import create_app
from pathlib import Path

def test_health_ok():
    app = create_app()
    client = app.test_client()
    resp = client.get("/health")
    assert resp.status_code == 200
    assert resp.data.decode().strip() == "ok"

def test_version_matches_file():
    app = create_app()
    client = app.test_client()
    resp = client.get("/version")
    assert resp.status_code == 200

    version_file = Path(__file__).resolve().parents[1] / "VERSION"
    expected = version_file.read_text(encoding="utf-8").strip()
    assert resp.data.decode().strip() == expected
