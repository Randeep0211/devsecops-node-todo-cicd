FROM alpine:3.14

WORKDIR /app

COPY . .

RUN npm install

RUN npm run test

CMD ['node','app.js']
