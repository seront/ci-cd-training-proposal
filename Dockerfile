FROM node
USER root

# RUN mkdir app
RUN git clone 'https://github.com/seront/ci-cd-training-proposal.git' /root/app
WORKDIR /root/app
RUN npm i --no-package-lock 
RUN npm run test
#RUN npm run start
EXPOSE 3000
CMD npm run start
