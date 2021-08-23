from flask import Flask
from   flaskimportrequest
app = Flask(__name__)

@app.route("/")
def hello_world():
    return "Hello World"

@app.route("/info")
def headers_info():
    request_info = request.headers
    print(type(request_info))
    my_response = ""
    for i, j in request_info.items():
        my_response = my_response + "<h2>" + i + ":" + j + "</h2>\n"
        


    print(my_response)
    
    return '%s' %str(my_response)


if __name__ = = "__main__":
    app.run("0.0.0.0", 5000)
