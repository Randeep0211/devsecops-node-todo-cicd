FROM alpine:3.14

WORKDIR /app

COPY . .

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs=8.17.0-1nodesource1

CMD ['node','app.js']
