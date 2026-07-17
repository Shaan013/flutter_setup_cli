#!/bin/bash

set -e

TEMPLATE_ROOT="$HOME/flutter_templates"

echo "===================================="
echo "      Flutter Project Generator"
echo "===================================="

templates=()

i=1

for dir in "$TEMPLATE_ROOT"/*; do
    if [[ -d "$dir" ]]; then
        templates+=("$dir")
        echo "$i) $(basename "$dir")"
        ((i++))
    fi
done

echo

read -p "Select template: " choice

TEMPLATE_PATH="${templates[$((choice-1))]}"

if [[ ! -d "$TEMPLATE_PATH" ]]; then
    echo "Invalid Selection"
    exit 1
fi

echo
echo "Selected: $(basename "$TEMPLATE_PATH")"

if [[ ! -f pubspec.yaml ]]; then
    echo
    echo "Run inside Flutter Project"
    exit 1
fi

PROJECT_NAME=$(grep "^name:" pubspec.yaml | awk '{print $2}')

echo
echo "Project Name : $PROJECT_NAME"

echo
echo "Updating pubspec..."

sed "s/PROJECT_NAME_PLACEHOLDER/$PROJECT_NAME/g" \
"$TEMPLATE_PATH/master_pubspec.yaml" > pubspec.yaml

echo
echo "Cleaning lib..."

rm -rf lib
mkdir lib

echo
echo "Copying lib..."

cp -R "$TEMPLATE_PATH/flutter_core/." lib/

echo
echo "Copying assets..."

if [[ -d "$TEMPLATE_PATH/assets" ]]; then
    rm -rf assets
    cp -R "$TEMPLATE_PATH/assets" .
fi

echo
echo "Copying extra files..."

for file in "$TEMPLATE_PATH"/*; do

    name=$(basename "$file")

    if [[ "$name" == "flutter_core" ]]; then
        continue
    fi

    if [[ "$name" == "assets" ]]; then
        continue
    fi

    if [[ "$name" == "master_pubspec.yaml" ]]; then
        continue
    fi

    cp -R "$file" .
done

echo
echo "Running pub get..."

flutter pub get

echo
echo "Fixing imports..."

find lib -name "*.dart" | while read file
do
    sed -i '' "s/package:flutter_template\//package:$PROJECT_NAME\//g" "$file"
done

echo
echo "Formatting..."

dart format lib

echo
echo "===================================="
echo "Project Ready"
echo "===================================="
