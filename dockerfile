FROM node:16

WORKDIR /usr/src/app

COPY nodeapp/package*.json ./

RUN npm install

COPY nodeapp/ .

EXPOSE 3000

CMD ["node", "app.js"]
