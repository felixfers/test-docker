from flask import Flask
app = Flask(__name__)

@app.route('/datos')
def get_data():
    return {"mensaje": "Hola desde el Backend en Docker!", "status": "online"}

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
