from todo_project import app, db

if __name__ == "__main__":
    with app.app_context():
        db.create_all()  # Isso cria todas as tabelas definidas nos modelos
    app.run(debug=True)
