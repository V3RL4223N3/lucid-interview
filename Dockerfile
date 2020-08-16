FROM golang:1.14.2
RUN go get github.com/revel/revel
RUN go get github.com/revel/cmd/revel
#RUN go get github.com/kyawmyintthein/revel_mgo

ADD app /go/src/github.com/V3RL4223N3/lucid-uk-interview/app
ADD conf /go/src/github.com/V3RL4223N3/lucid-uk-interview/conf
ADD messages /go/src/github.com/V3RL4223N3/lucid-uk-interview/messages
ADD public /go/src/github.com/V3RL4223N3/lucid-uk-interview/public
ADD tests /go/src/github.com/V3RL4223N3/lucid-uk-interview/tests


RUN cd /go/src/github.com/V3RL4223N3/lucid-uk-interview
#RUN revel_mgo mgo:setup

WORKDIR /go/src 
RUN revel build  github.com/V3RL4223N3/lucid-uk-interview dev
CMD ./dev/run.sh
EXPOSE 9000

