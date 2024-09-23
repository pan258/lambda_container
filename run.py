from flask import Flask

import socket



app = Flask(__name__)

@app.route("/")
def hello():
    try:
        addr1 = socket.gethostbyname('www.google.com')
    except PermissionError:
        addr1 = "Cannot get Google"
    
    try:
        addr2 = socket.gethostbyname('www.yahoo.com')
    except PermissionError:
        addr2 = "Cannot get Yahoo"

    html = "<b>Yahoo Hostname:</b> {hostnameyahoo}<br/>" \
           "<b>Google Hostname:</b> {hostnamegoogle}<br/>"
    
    return html.format(hostnameyahoo=addr1, hostnamegoogle=addr2)

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080)
