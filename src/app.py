from flask import Flask, request

# We keep the data in a 'counter' file for peristency . We will create a volume 
# that is mounted on the host. This ensure that the counter data is not lost even when we deploy a new version of the container.

app = Flask(__name__)
counter_file = '/data/counter.txt'


def read_counter():
    try:
        with open(counter_file, 'r') as file:
            return int(file.read())
    except FileNotFoundError:
        return 0


def write_counter(counter):
    with open(counter_file, 'w') as file:
        file.write(str(counter))


@app.route('/', methods=['GET'])
def get_counter():
    counter = read_counter()
    return f'''
    <html>
        <head>
            <title>Counter</title>
        </head>
        <body>
            <h1>Counter: {counter}</h1>
        </body>
    </html>
    '''


@app.route('/', methods=['POST'])
def increment_counter():
    counter = read_counter()
    counter += 1
    write_counter(counter)
    return 'POST request received'


@app.route('/health', methods=['GET'])
def health_check():
    return 'OK'


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
    
    
