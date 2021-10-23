# base image
FROM node:14-alpine

# set working directory
WORKDIR /frontend

# add `/frontend/node_modules/.bin` to $PATH
ENV PATH /frontend/node_modules/.bin:$PATH

# install app dependencies
COPY package.json ./
#COPY package-lock.json ./
RUN npm install
RUN npm install react-scripts@3.4.1
# add app
COPY . ./
# start app
CMD ["npm", "start", "--port 3000"]

