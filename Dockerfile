FROM nikolaik/python-nodejs:python3.9-nodejs18

# ✅ Fix: Force timezone and install tzdata to fix Telegram msg_id sync error
ENV TZ=Etc/UTC
RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends ffmpeg tzdata \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY . /app/
WORKDIR /app/
RUN pip3 install --no-cache-dir --upgrade --requirement requirements.txt
CMD bash start
