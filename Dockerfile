FROM alpine:3.14

WORKDIR /app

COPY . .

RUN apt-get install --no-install-recommends apt-utils --yes \
    && apt-get install --no-install-recommends npm --yes

CMD ['node','app.js']
