FROM python:3.6

ENV PYTHONUNBUFFERED 1

ENV PROJECT_ROOT=/code USR_LOCAL_BIN=/usr/local/bin/

ENV PYTHONPATH=$PYTHONPATH:$PROJECT_ROOT

ARG requirements

RUN apt-get update && apt-get install -y gettext libgettextpo-dev

RUN mkdir $PROJECT_ROOT

ADD ./src $PROJECT_ROOT

RUN pip install -U pip
RUN pip install --no-cache-dir -r $PROJECT_ROOT/requirements.txt

COPY ./compose/app/entrypoint.sh $USR_LOCAL_BIN/entrypoint.sh
RUN sed -i 's/\r//' $USR_LOCAL_BIN/entrypoint.sh \
    && chmod +x $USR_LOCAL_BIN/entrypoint.sh

COPY ./compose/app/runserver.sh $USR_LOCAL_BIN/runserver.sh
RUN sed -i 's/\r//' $USR_LOCAL_BIN/runserver.sh \
    && chmod +x $USR_LOCAL_BIN/runserver.sh


COPY ./compose/app/celery_worker.sh $USR_LOCAL_BIN/celery_worker.sh
RUN sed -i 's/\r//' $USR_LOCAL_BIN/celery_worker.sh \
    && chmod +x $USR_LOCAL_BIN/celery_worker.sh


ENTRYPOINT ["entrypoint.sh"]

WORKDIR $PROJECT_ROOT
