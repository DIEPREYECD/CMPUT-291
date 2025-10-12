import sqlite3


def setup_database():
    """Creates the employees and tasks tables."""
    conn = sqlite3.connect("company_tasks.db")
    conn.row_factory = sqlite3.Row
    cursor = conn.cursor()

    cursor.executescript('''
        DROP TABLE IF EXISTS employees;
        DROP TABLE IF EXISTS tasks;
        
        CREATE TABLE IF NOT EXISTS employees (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            department TEXT NOT NULL
        );

        CREATE TABLE IF NOT EXISTS tasks (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            employee_id INTEGER NOT NULL,
            description TEXT NOT NULL,
            status TEXT CHECK( status IN ('Pending', 'Completed') ) DEFAULT 'Pending',
            FOREIGN KEY (employee_id) REFERENCES employees(id)
        );
    ''')
    conn.commit()
    conn.close()


def insert_employees(cursor):
    """Inserts predefined employees into the database."""
    employees_data = [
        ("Alice Johnson", "HR"),
        ("Bob Smith", "IT"),
        ("Charlie Lee", "Finance"),
        ("David Kim", "Marketing")
    ]

    cursor.execute('''
        DELETE FROM employees;
    ''')

    for name, department in employees_data:
        cursor.execute('''
            INSERT INTO employees (name, department)
            VALUES (?, ?)
        ''', (name, department))


def insert_tasks(cursor):
    """Inserts predefined tasks into the database."""
    tasks_data = [
        {"emp_id": 1, "desc": "Review resumes"},
        {"emp_id": 2, "desc": "Fix server issue"},
        {"emp_id": 3, "desc": "Prepare budget report"},
        {"emp_id": 4, "desc": "Create marketing plan"}
    ]

    cursor.execute('''
        DELETE FROM tasks;
    ''')

    for task in tasks_data:
        cursor.execute('''
            INSERT INTO tasks (employee_id, description)
            VALUES (:emp_id, :desc)
        ''', task)


def fetch_all_employees(cursor):
    """Fetch all employees from the database."""

    cursor.execute('''
        SELECT * FROM employees
    ''')
    return cursor.fetchall()


def fetch_employee_by_id(cursor, emp_id):
    """Fetch a single employee by ID."""
    cursor.execute('''
        SELECT * FROM employees WHERE id = ?
    ''', (emp_id,))
    return cursor.fetchone()


def fetch_tasks_by_employee(cursor, emp_id):
    """Fetch all tasks assigned to a given employee ID."""
    cursor.execute('''
        SELECT * FROM tasks WHERE employee_id = ?
    ''', (emp_id,))
    return cursor.fetchall()


def update_task_status(cursor, task_id, status):
    """Update the status of a task."""
    cursor.execute('''
        UPDATE tasks SET status = ? WHERE id = ?
    ''', (status, task_id))


def delete_task(cursor, task_id):
    """Delete a task by ID."""
    cursor.execute('''
        DELETE FROM tasks WHERE id = ?
    ''', (task_id,))


def generate_summary_report(cursor):
    """Generate a summary report of employees and their tasks."""
    cursor.execute('''
        SELECT e.id AS employee_id, e.name AS employee_name, t.id AS task_id, t.description AS task_description, t.status AS task_status
        FROM employees e
        LEFT JOIN tasks t ON e.id = t.employee_id
        ORDER BY e.id, t.id
    ''')
    return cursor.fetchall()

def count_tasks_per_employee(cursor):
    """Count the number of tasks assigned to each employee."""
    cursor.execute('''
        SELECT e.id, e.name, COUNT(t.id) AS task_count
        FROM employees e
        LEFT JOIN tasks t ON e.id = t.employee_id
        GROUP BY e.id, e.name
    ''')
    return cursor.fetchall()


def test_keys_function(cursor):
    """Test how to access and use .keys()."""
    cursor.execute("SELECT * FROM employees LIMIT 1")
    row = cursor.fetchone()
    if row:
        print("Column Names:", row.keys())
        print("Value for 'name':", row["name"] ) # complete this line by printing the name of the employee using the key


if __name__ == "__main__":
    setup_database()
    conn = sqlite3.connect("company_tasks.db")
    conn.row_factory = sqlite3.Row
    cursor = conn.cursor()

    insert_employees(cursor)
    insert_tasks(cursor)
    conn.commit()

    print("Employees:")
    for row in fetch_all_employees(cursor):
        print(dict(row))

    print("\nTasks for Employee 1:")
    for row in fetch_tasks_by_employee(cursor, 1):
        print(dict(row))

    update_task_status(cursor, 1, "Completed")
    print("\nUpdated Tasks for Employee 1:")
    for row in fetch_tasks_by_employee(cursor, 1):
        print(dict(row))

    print("\nSummary Report:")
    for row in generate_summary_report(cursor):
        print(dict(row))

    print("\nTask Counts:")
    for row in count_tasks_per_employee(cursor):
        print(dict(row))

    print("\nTesting keys() function:")
    test_keys_function(cursor)

    conn.commit()
    conn.close()
    print("\nDatabase operations complete.")
