import asyncio
import json

import aiohttp


async def main():
    async with aiohttp.ClientSession() as session:
        headers = {
            "Content-Type": "application/json",
        }
        data = {
            "model": "deepseek-r1:1.5b",
            "messages": [
                {
                    "role": "user",
                    "content": "Please count the number of the letter r in strawberry!",
                }
            ],
            "stream": True,
        }

        async with session.post(
            "http://127.0.0.1:11434/v1/chat/completions", json=data
        ) as response:
            if response.status != 200:
                error_text = await response.text()
                logger.error(f"API 请求失败: {error_text}")
                return

            async for chunk in response.content.iter_any():
                chunk_str = chunk.decode("utf-8")
                print(
                    json.loads(chunk[len("data: ") :])["choices"][0]["delta"]["content"]
                )


if __name__ == "__main__":
    asyncio.run(main())
