FROM node:12.20.1
WORKDIR /frontend
COPY . /frontend
RUN npm install
RUN npm install -g @angular/cli@latest
RUN apt-get update && \
    apt-get install -y --no-install-recommends chromium
ENV CHROME_BIN=chromium 
ENTRYPOINT ["ng", "test"]