FROM node:16-alpine
WORKDIR /app

COPY ./local/package.json ./
RUN apk add --update nodejs-current npm
RUN npm install

CMD ["npm", "run", "dev"]

EXPOSE 3000