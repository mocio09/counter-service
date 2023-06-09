response=$(curl -sS http://localhost:8212/health)
if [ "$response" = "OK" ]; then
    echo "Health check passed. The server is healthy."
else
    echo "Health check failed. The server is not healthy."
    exit 1
fi

response_post=$(curl -sS -o /dev/null -w "%{http_code}" -X POST http://localhost:8212/)
if [ "$response" = "200" ]; then
    echo "POST request succeeded. Status code: 200"
else
    echo "POST request failed. Status code: $response"
    exit 1
fi

response_post=$(curl -sS -o /dev/null -w "%{http_code}" -X GET http://localhost:8212/)
if [ "$response" = "200" ]; then
    echo "POST request succeeded. Status code: 200"
else
    echo "POST request failed. Status code: $response"
    exit 1
fi
