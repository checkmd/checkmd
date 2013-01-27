import os
from flask import Flask
from flask import render_template
import jinja2

app = Flask(__name__, static_folder="public", static_url_path="")
jinja_loader = jinja2.ChoiceLoader([
    app.jinja_loader,
    jinja2.FileSystemLoader(os.path.dirname(os.path.abspath(__file__)) + 
    '/public'),
])
app.jinja_loader = jinja_loader

@app.route("/")
def index():
    return render_template('index.html')

if __name__ == "__main__":
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port)