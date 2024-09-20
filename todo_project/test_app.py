import pytest
from todo_project import create_app  # Ajuste conforme sua função de criação de app

@pytest.fixture
def client():
    app = create_app()  # Chame a função que cria sua aplicação Flask
    app.config['TESTING'] = True

    with app.test_client() as client:
        yield client

def test_homepage(client):
    """Teste se a homepage está acessível e retorna 200."""
    response = client.get('/')
    assert response.status_code == 200
