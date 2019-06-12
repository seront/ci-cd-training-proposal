FROM node
USER root
# CMD npm run start
WORKDIR /root/app
RUN mkdir app
RUN git clone 'https://github.com/seront/ci-cd-training-proposal.git' /root/app
RUN npm i --no-package-lock 
RUN npm run test
RUN npm run start