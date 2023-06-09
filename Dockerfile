FROM python:3.9

WORKDIR /app

# Copy the source code into the container
COPY src/app.py /app/app.py

# Copy the requirements file into the container
COPY requirements.txt /app/requirements.txt

# Install the required dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Set the entrypoint to start the application
ENTRYPOINT ["python", "app.py"]

