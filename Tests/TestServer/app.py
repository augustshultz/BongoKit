from flask import Flask, jsonify

app = Flask(__name__)


@app.route("/predictions/<int:stop_id>")
def predictions(stop_id):
    return jsonify([
        {
            "routeid": 2433,
            "name": "Hawkeye Express",
            "shortname": "Hawk Exp",
            "busid": 2917,
            "busnumber": "101",
            "seconds": -6,
            "minutes": 0,
            "schedulePrediction": False,
            "agency": "uiowa",
            "agencyname": "Cambus",
        },
        {
            "routeid": 2369,
            "name": "Red Route",
            "shortname": "Red",
            "busid": 2915,
            "busnumber": "112",
            "seconds": -5,
            "minutes": 0,
            "schedulePrediction": False,
            "agency": "uiowa",
            "agencyname": "Cambus",
        },
        {
            "routeid": 2355,
            "name": "Oakcrest",
            "shortname": "oakcrst",
            "busid": 4108,
            "busnumber": "81",
            "seconds": 68,
            "minutes": 2,
            "schedulePrediction": False,
            "agency": "iowacity",
            "agencyname": "Iowa City Transit",
        },
    ])
