#!/usr/bin/env bash
# Build script for Render deployment

set -o errexit

# Install Python dependencies
pip install --upgrade pip
pip install -r requirements.txt

# For Windows libmagic compatibility on Linux (Render)
pip uninstall python-magic -y 2>/dev/null || true
pip uninstall python-magic-bin -y 2>/dev/null || true
pip install python-magic

# Collect static files
python manage.py collectstatic --no-input

# Run database migrations
python manage.py migrate
