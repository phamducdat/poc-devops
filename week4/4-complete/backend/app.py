from flask import Flask, request, jsonify
from flask_cors import CORS


app = Flask(__name__)
cors = CORS(app)

todos = [
    { "id": 0, "description": "Test this fancy application", "completed": False },
    { "id": 1, "description": "Learn Docker (because it is awesome)", "completed": False },
    { "id": 2, "description": "Pass this assignment", "completed": False },
]

@app.route("/todos", methods=["GET", "POST", "PUT", "DELETE"])
def todos_endpoint():
    if request.method=='GET':
        return jsonify({
            "todos" : todos,
            "message": "Successfully retrieved TODOs."
        })
    elif request.method=='POST':
        id = max([todo['id'] for todo in todos ]) + 1
        todo = {
            "id": id,
            "description": request.json["description"],
            "completed": request.json["completed"]
        }
        todos.append(todo)
        return jsonify({
            "new": todo,
            "todos" : todos,
            "message": "Successfully created TODOs."
        })
    elif request.method=='PUT':
        update_index = find_todo(request.json["id"])
        if update_index != -1:
            todos[update_index]["description"] = request.json["description"]
            todos[update_index]["completed"] = request.json["completed"]
        return jsonify({
            "todos" : todos,
            "message": "Successfully updated TODO."
        })
    elif request.method=='DELETE':
        found_index = find_todo(request.json["id"])
        if found_index != -1:
            del todos[found_index]
        return jsonify({
            "todos" : todos,
            "message": "Successfully removed TODO."
        })
    else:
        return jsonify({
            "host" : request.host,
            "message": "Unsupported HTTP method"
        })


def find_todo(id):
    for index, todo in enumerate(todos):
        if todo["id"] == id:
            return index
    return -1


@app.route("/")
def index():
    return jsonify({
        "host" : request.host,
        "message": "Successfully connected to the backend."
    })


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
    