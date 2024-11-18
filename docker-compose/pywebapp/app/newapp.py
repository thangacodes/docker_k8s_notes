from flask import Flask, render_template_string
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
<h1>Welcome to Flask App Development</h1>'''

@app.route('/dynamic')
def dynamic():
    """Fetch all records from both the employee_id and employee_name tables and render them as an HTML table."""
    conn = get_db_connection()
    cur = conn.cursor()

    try:
        # Execute the SELECT queries to fetch all rows from both tables
        cur.execute('SELECT * FROM employee_id;')
        employee_id_records = cur.fetchall()  # Fetch all records from employee_id table
        
        cur.execute('SELECT * FROM employee_name;')
        employee_name_records = cur.fetchall()  # Fetch all records from employee_name table
        
        cur.execute('SELECT * FROM devops_tools;')
        devops_tools_records = cur.fetchall()  # Fetch all records from devops_tools table
        
        # If no records found in any of the tables, show a message
        if not employee_id_records and not employee_name_records and not devops_tools_records:
            return "<h3>No records found in the tables.</h3>"

        # Create the HTML table to display records
        table_html = '''
        <style>
            table { width: 80%; margin: 20px auto; border-collapse: collapse; }
            th, td { padding: 8px 12px; text-align: left; border: 1px solid #ddd; }
            th { background-color: #f2f2f2; }
            tr:nth-child(even) { background-color: #f9f9f9; }
        </style>
        <h2>Employee ID Records</h2>
        <table>
            <tr><th>ID</th><th>Employee ID</th></tr>
        '''
        # Add rows for employee_id_records
        for record in employee_id_records:
            table_html += f'<tr><td>{record[0]}</td><td>{record[1]}</td></tr>'

        table_html += '</table>'

        table_html += '''
        <h2>Employee Name Records</h2>
        <table>
            <tr><th>ID</th><th>Employee Name</th></tr>
        '''
        # Add rows for employee_name_records
        for record in employee_name_records:
            table_html += f'<tr><td>{record[0]}</td><td>{record[1]}</td></tr>'

        table_html += '</table>'

        table_html += '''
        <h2>DevOps Tools Records</h2>
        <table>
            <tr><th>ID</th><th>Tool Name</th></tr>
        '''
        # Add rows for devops_tools_records
        for record in devops_tools_records:
            table_html += f'<tr><td>{record[0]}</td><td>{record[1]}</td></tr>'

        table_html += '</table>'

        # Return the constructed HTML
        return render_template_string(table_html)

    except Exception as e:
        # Handle any exceptions that occur during the queries
        return f"<h3>Error: {str(e)}</h3>"
    finally:
        # Close the cursor and connection
        cur.close()
        conn.close()

if __name__ == '__main__':
    # Start the Flask app
    app.run(host='0.0.0.0', port=5000, debug=True)
