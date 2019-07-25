FROM python:3.7-alpine
LABEL Emeka Chinedu

# Tells python to run in an unbuffered environment
ENV PYTHONUNBUFFERED 1

# Set dependencies file
COPY ./requirements.txt /requirements.txt

# Install dependencies
RUN pip install -r /requirements.txt

#  Make a directory to store app source code
RUN mkdir /app 
# Switch to app as default directory
WORKDIR /app
# Copy from app folder in local machine to app folder in docker image
COPY ./app /app 

# Create a user to run our application processes
RUN adduser -D user
USER user
