import pytest
from todo_project import app

@pytest.fixture
def client():
    app.config['TESTING'] = True
    with app.test_client() as client:
        yield client

def test_homepage(client):
    response = client.get('/')
    assert response.data == b'Hello, World!'  # Altere conforme sua resposta real
    assert response.status_code == 200

