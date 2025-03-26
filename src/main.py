from flask import Flask # type: ignore
from routes.api import api_blueprint

app = Flask(__name__)

# Register API routes
app.register_blueprint(api_blueprint)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
