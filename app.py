from flask import Flask
from flask.logging import create_logger
import logging

app = Flask(__name__)
LOG = create_logger(app)
LOG.setLevel(logging.INFO)

@app.route('/')
def home():
    LOG.info("Welcome to the Udacity's Capstone Project")
    return "<p>Hello .. Welcome to the Udacity's Capstone Project</p>" 

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80, debug=True) # specify port=80
