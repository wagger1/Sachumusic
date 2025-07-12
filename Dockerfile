FROM nikolaik/python-nodejs:python3.9-nodejs18

# ✅ Set timezone to UTC to fix Telegram msg_id sync errors
ENV TZ=Etc/UTC
RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
        tzdata \
        ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY . /app/
WORKDIR /app/

# ✅ Upgrade pip and install deps
RUN pip3 install --upgrade pip
RUN pip3 install --no-cache-dir --upgrade --requirement requirements.txt

CMD ["bash", "start"]
