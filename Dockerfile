FROM alpine:3.14

WORKDIR /app

COPY . .

RUN npm install

RUN npm run test

EXPOSE 8000

CMD ['node','app.js']
