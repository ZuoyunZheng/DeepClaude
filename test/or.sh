source .env

curl https://openrouter.ai/api/v1/chat/completions \
-H "Authorization: Bearer $CLAUDE_API_KEY" \
-H "Content-Type: application/json" \
-d '{
    "model": "deepseek/deepseek-r1:free"
    "messages": [{"role": "user", "content": "Please calculate 1+3!"}],
		"temperature": 0.7, "stream": false
}'
#"model": "google/gemini-2.0-flash-thinking-exp:free",
#"model": "cognitivecomputations/dolphin3.0-r1-mistral-24b:free",
