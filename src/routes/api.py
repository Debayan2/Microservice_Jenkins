from flask import Blueprint, jsonify # type: ignore
from service.logic import get_message # type: ignore

api_blueprint = Blueprint("api", __name__)

@api_blueprint.route("/health", methods=["GET"])
def health_check():
    return jsonify({"status": "ok"}), 200

@api_blueprint.route("/message", methods=["GET"])
def message():
    return jsonify({"message": get_message()}), 200
