import requests

# URL de la API para obtener el precio de Bitcoin en USD
url_btc = "https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd"

# URL de la API para obtener el precio de Ethereum en USD
url_eth = "https://api.coingecko.com/api/v3/simple/price?ids=ethereum&vs_currencies=usd"

# Hacer una solicitud HTTP GET a la API para obtener los precios de Bitcoin y Ethereum
response_btc = requests.get(url_btc)
response_eth = requests.get(url_eth)

# Verificar si la solicitud fue exitosa
if response_btc.status_code == 200 and response_eth.status_code == 200:
    # Obtener el precio de Bitcoin en USD del JSON de la respuesta
    btc_price = response_btc.json()["bitcoin"]["usd"]
    
    # Obtener el precio de Ethereum en USD del JSON de la respuesta
    eth_price = response_eth.json()["ethereum"]["usd"]

    # Guardar los precios de Bitcoin y Ethereum en un archivo de texto
    with open("crypto_prices.txt", "w") as f:
        f.write(str(btc_price) + "\n") # Escribir el precio de Bitcoin en la primera línea del archivo
        f.write(str(eth_price) + "\n") # Escribir el precio de Ethereum en la segunda línea del archivo
else:
    # Si la solicitud no fue exitosa, imprimir un mensaje de error
    print("Error in API request")