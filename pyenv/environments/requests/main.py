import requests

url = input("Enter URL: ")
url = url.strip()
resp = requests.get(url)
print(resp.text)
