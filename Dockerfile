FROM python:3.7-slim-buster
RUN apt-get update -y

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . /app

EXPOSE 8080
#ENTRYPOINT ["python", "run.py"]
# Twistlock Container Defender - app embedded
ADD twistlock_defender_app_embedded.tar.gz /tmp
ENV DEFENDER_TYPE="appEmbedded"
ENV DEFENDER_APP_ID="e-lambda-container"
ENV FILESYSTEM_MONITORING="false"
ENV WS_ADDRESS="wss://asia-northeast1.cloud.twistlock.com:443"
ENV DATA_FOLDER="/tmp"
ENV INSTALL_BUNDLE="eyJzZWNyZXRzIjp7InNlcnZpY2UtcGFyYW1ldGVyIjoiSmdHTkloNVdPeXdaemJKdlVyeHE0M2o2M3grL242THZ1Ry9LbTBqRVVsWlhJRjNkNGUyVWxENWNIM3IwdWN2Z3pIaXhxbDhIQmpkd09MUHhBcHpBN1E9PSJ9LCJnbG9iYWxQcm94eU9wdCI6eyJodHRwUHJveHkiOiIiLCJub1Byb3h5IjoiIiwiY2EiOiIiLCJ1c2VyIjoiIiwicGFzc3dvcmQiOnsiZW5jcnlwdGVkIjoiIn19LCJjdXN0b21lcklEIjoiamFwYW4tMTE2NzI1OTc4NiIsImFwaUtleSI6IklFWUFhaEEray9wUGJUQUUzdUlKNzY3YkYrNVErTmRMcVJ3V0d0aExWVU1vOHAvSFNvK2lCcXF4QTdxZHZCTm5xdDBsdjhRcmZFWGhsNlBNTWx2MEZRPT0iLCJtaWNyb3NlZ0NvbXBhdGlibGUiOmZhbHNlLCJpbWFnZVNjYW5JRCI6ImUzZTdjZDVjLWQ0MGQtNWZjNC1hMzk1LWZhY2VlMTdhNTI5NyJ9"
ENV FIPS_ENABLED="false"
ENTRYPOINT ["/tmp/defender", "app-embedded", "python", "run.py"]
