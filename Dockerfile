FROM python:3.9

# Create a volume for the app directory to make it writable
VOLUME /app

# Set the working directory
WORKDIR /app

# Copy requirements.txt
COPY requirements.txt /app/

# Install dependencies
RUN pip3 install -r requirements.txt

# Copy application code
COPY . /app

# Create a new folder for your specific needs
RUN mkdir /app/data 

# Start the application with Gunicorn and your bot script
CMD gunicorn app:app & python3 bot.py

EXPOSE 80
