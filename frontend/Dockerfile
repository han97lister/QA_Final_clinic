FROM node:latest
WORKDIR /app2
COPY . /app2
RUN npm install -g @angular/cli
EXPOSE 4200
ENTRYPOINT ng serve --host 0.0.0.0 --port 4200 --disableHostCheck true

