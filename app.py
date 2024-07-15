from flask import Flask, jsonify, request # type: ignore

app = Flask(__name__)

@app.route('/')
def home():
    return "Welcome to the simple Flask app!"

@app.route('/hello/<name>')
def hello(name):
    return f"Hello, {name}!"

@app.route('/add', methods=['POST'])
def add():
    data = request.get_json()
    num1 = data.get('num1')
    num2 = data.get('num2')
    result = num1 + num2
    return jsonify({'result': result})

if __name__ == '__main__':
    app.run(debug=True)
