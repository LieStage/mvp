FROM python:3.9

# Create a dedicated user
RUN useradd -ms /bin/bash -d /app botuser
# Set the user's home directory
ENV HOME="/app"

# Install dependencies before changing user 
WORKDIR /app
COPY requirements.txt /app/
RUN pip3 install -r requirements.txt

# Set the user to run the bot (before copying files)
USER botuser
# Create the app directory owned by botuser
RUN mkdir /app && chown botuser:botuser /app

# Copy your project files 
COPY . /app

# Start your bot
CMD ["python3", "bot.py"]
