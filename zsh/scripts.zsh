#!/usr/bin/env zsh

# open chrome with specified url
function chrome() {
  /usr/bin/open -a "/Applications/Google Chrome.app" "$1"
}

# openai
function gpt() {

  # Ensure jq is installed to parse the JSON response
  if ! command -v jq &> /dev/null; then
    echo "jq is not installed. Please install it and try again."
    return 
  fi

  # Replace this with your actual API key
  API_KEY="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"
  QUERY="$1"

  if [ -z "$QUERY" ]; then
    echo "Please provide a query as an argument."
    return
  fi

  DATA="{ \
  \"model\":\"gpt-3.5-turbo\", \
  \"messages\": [{\"role\":\"user\",\"content\":\"$QUERY\"}] \
  }"

  curl -s -X POST \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $API_KEY" \
    --data "$DATA" \
    "https://api.openai.com/v1/chat/completions" \
    | jq -r '.choices[0].message.content'
}

