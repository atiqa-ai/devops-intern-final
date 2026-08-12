#!/usr/bin/env python3

import time
from http.server import BaseHTTPRequestHandler, HTTPServer


class MetricsHandler(BaseHTTPRequestHandler):

    def do_GET(self):

        if self.path == "/metrics":

            metrics = """# HELP app_running Application running status
# TYPE app_running gauge
app_running 1

# HELP app_info Application information
# TYPE app_info gauge
app_info{app="devops-intern"} 1
"""

            self.send_response(200)
            self.send_header("Content-Type", "text/plain")
            self.end_headers()
            self.wfile.write(metrics.encode())

        else:

            self.send_response(404)
            self.end_headers()

    def log_message(self, format, *args):
        return


def start_metrics_server():

    server = HTTPServer(("0.0.0.0", 8000), MetricsHandler)

    print("Metrics server running on port 8000")

    server.serve_forever()


print("Hello, DevOps!")

start_metrics_server()
