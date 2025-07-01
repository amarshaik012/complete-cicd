from flask import Flask, render_template
from prometheus_client import generate_latest, Counter

app = Flask(__name__)

# Custom Prometheus metric
REQUEST_COUNTER = Counter('flask_home_requests_total', 'Total home page requests')

@app.route('/')
def home():
    REQUEST_COUNTER.inc()
    app.logger.info("Serving index page")
    return render_template('index.html')

@app.route('/metrics')
def metrics():
    return generate_latest(), 200, {'Content-Type': 'text/plain'}

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5050)
