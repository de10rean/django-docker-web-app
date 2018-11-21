#!/usr/bin/env bash
$PROJECT_ROOT/manage.py migrate
$PROJECT_ROOT/manage.py collectstatic --noinput
$PROJECT_ROOT/manage.py compilemessages
$PROJECT_ROOT/manage.py runserver 0.0.0.0:8000