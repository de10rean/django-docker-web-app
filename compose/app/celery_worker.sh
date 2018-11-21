#!/usr/bin/env bash
celery -A django_app worker -l info -B