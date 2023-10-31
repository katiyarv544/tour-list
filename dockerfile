# step one build
FROM node:20.9.0 as builder
LABEL application="tour-list"
LABEL owner="vikash"
RUN mkdir /code
WORKDIR /code
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
# CMD ["npm", "start"]

# step 2

FROM nginx
COPY --from=builder /code/build/ /usr/share/nginx/html
