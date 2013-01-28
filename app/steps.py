from flask import Blueprint, render_template
from app import db

class Step(db.Model):
    pass

steps = Blueprint('steps', __name__, template_folder='templates')

@steps.route('/')
def index():
    return render_template('index.html')