#!/usr/bin/env python3
"""
Nucleus Tools Web Interface Development Server
"""

import http.server
import socketserver
import os
import sys
import argparse

def main():
    parser = argparse.ArgumentParser(description='Nucleus Tools Web Interface Development Server')
    parser.add_argument('--port', '-p', type=int, default=8080, help='Port to run the server on (default: 8080)')
    parser.add_argument('--host', type=str, default='', help='Host to bind to (default: all interfaces)')
    args = parser.parse_args()
    
    PORT = args.port
    HOST = args.host
    
    # Change to the directory containing index.html
    os.chdir(os.path.dirname(os.path.abspath(__file__)))
    
    # Create a simple HTTP server
    Handler = http.server.SimpleHTTPRequestHandler
    
    try:
        with socketserver.TCPServer((HOST, PORT), Handler) as httpd:
            print(f"🚀 Nucleus Tools Web Interface is running at:")
            print(f"   http://localhost:{PORT}")
            print(f"   http://127.0.0.1:{PORT}")
            if HOST:
                print(f"   http://{HOST}:{PORT}")
            print(f"\n💡 Press Ctrl+C to stop the server")
            print(f"📁 Serving files from: {os.getcwd()}")
            
            try:
                httpd.serve_forever()
            except KeyboardInterrupt:
                print(f"\n🛑 Server stopped.")
                sys.exit(0)
    except OSError as e:
        if e.errno == 48:  # Address already in use
            print(f"❌ Error: Port {PORT} is already in use.")
            print(f"💡 Try using a different port: python server.py --port {PORT + 1}")
        else:
            print(f"❌ Error starting server: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()
