import os

from flask import Flask
from main.views import main

app = Flask(__name__)
app.config.from_object('config')
app.register_blueprint(main)

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))
    debug = port == 5000
    app.run(host='0.0.0.0', port=port, debug=debug)
