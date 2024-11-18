from flask import Flask, jsonify
import psycopg2
import os

app = Flask(__name__)

def get_db_connection():
    """Establish a connection to the PostgreSQL database."""
    conn = psycopg2.connect(
        host=os.getenv('DB_HOST', 'db'),
        database=os.getenv('DB_NAME', 'testdb'),
        user=os.getenv('DB_USER', 'user'),
        password=os.getenv('DB_PASSWORD', 'password')
    )
    return conn

@app.route("/")
def default_page():
    return '''<style>
        body { font-family: Arial, sans-serif; text-align: center; padding: 50px; }
        h1 { color: green; }
    </style>
<h1> <style="text-decoration: underline;">Welcome to Flask App Development</h1>'''

@app.route('/dynamic')
def dynamic():
    """Fetch all records from both the employee_id and employee_name tables."""
    conn = get_db_connection()
    cur = conn.cursor()

    try:
        # Execute the SELECT queries to fetch all rows from both tables
        cur.execute('SELECT * FROM employee_id;')
        employee_id_records = cur.fetchall()  # Fetch all records from employee_id table
        
        cur.execute('SELECT * FROM employee_name;')
        employee_name_records = cur.fetchall()  # Fetch all records from employee_name table
        
        # If no records found in either table, return a custom message
        if not employee_id_records and not employee_name_records:
            return jsonify({"message": "No records found in the employee_id and employee_name tables."})

        # Return both sets of records as a JSON response
        return jsonify({
            "message": "Here are records from both the employee_id and employee_name tables:",
            "employee_id_records": employee_id_records,
            "employee_name_records": employee_name_records
        })

    except Exception as e:
        # Handle any exceptions that occur during the queries
        return jsonify({"error": str(e)})
    finally:
        # Close the cursor and connection
        cur.close()
        conn.close()

if __name__ == '__main__':
    # Start the Flask app
    app.run(host='0.0.0.0', port=5000, debug=True)
