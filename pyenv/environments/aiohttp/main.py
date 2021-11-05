import aiohttp
import asyncio

async def main(url):
    async with aiohttp.ClientSession() as session:
        async with session.get(url) as response:
            print("Status:", response.status)
            resp_text = await response.text()
            print(resp_text)

url = input("Enter URL: ")
url = url.strip()
loop = asyncio.get_event_loop()
loop.run_until_complete(main(url))
