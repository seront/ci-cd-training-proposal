FROM node
USER root

RUN git clone 'https://github.com/seront/ci-cd-training-proposal.git' /root/app
WORKDIR /root/app
RUN git pull origin 'feature/pipeline-update'
RUN npm i --no-package-lock 
RUN npm run test
#RUN npm run start

CMD PORT=$PORT node index
