source .env

docker run -d \
    -p 8001:8001 \
		-e ALLOW_API_KEY=${ALLOW_API_KEY} \
		-e ALLOW_ORIGINS=${ALLOW_ORIGINS} \
		-e DEEPSEEK_API_KEY=${DEEPSEEK_API_KEY} \
		-e DEEPSEEK_API_URL=${DEEPSEEK_API_URL} \
		-e DEEPSEEK_MODEL=${DEEPSEEK_MODEL} \
		-e IS_ORIGIN_REASONING=${IS_ORIGIN_REASONING} \
		-e CLAUDE_API_KEY=${CLAUDE_API_KEY} \
		-e CLAUDE_MODEL=${CLAUDE_MODEL} \
		-e CLAUDE_PROVIDER=${CLAUDE_PROVIDER} \
		-e CLAUDE_API_URL=${CLAUDE_API_URL} \
		-e LOG_LEVEL=INFO \
    --restart always \
		--name deepclaude \
	  --network deepclaude_sillytavern \
    deepclaude:latest
