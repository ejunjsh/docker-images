FROM node 

MAINTAINER ejunjsh <sjj050121014@163.com>

WORKDIR /root

RUN git clone git://github.com/mobz/elasticsearch-head.git
RUN cd elasticsearch-head && npm install


CMD [ "sh", "-c", "cd elasticsearch-head;npm run start"]

