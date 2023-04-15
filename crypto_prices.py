#!/bin/env python3
import requests
import subprocess


def get_prices():
    # URL de la API para obtener el precio de Bitcoin en USD
    url_btc = "https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd"

    # URL de la API para obtener el precio de Ethereum en USD
    url_eth = "https://api.coingecko.com/api/v3/simple/price?ids=ethereum&vs_currencies=usd"

    # Hacer una solicitud HTTP GET a la API para obtener los precios de Bitcoin y Ethereum
    response_btc = requests.get(url_btc)
    response_eth = requests.get(url_eth)

    if response_btc.status_code == 200 and response_eth.status_code == 200:
        # Obtener el precio de Bitcoin en USD del JSON de la respuesta
        btc_price = response_btc.json()["bitcoin"]["usd"]
        
        # Obtener el precio de Ethereum en USD del JSON de la respuesta
        eth_price = response_eth.json()["ethereum"]["usd"]

        return btc_price, eth_price

    return None, None

def main(argv):
    # Obtener los precios de Bitcoin y Ethereum
    print('Pidiendo precios...')

    btc_price, eth_price = get_prices()
    if btc_price and eth_price:
        print('Precios obtenidos!')
        print("Bitcoin price USD: $%.2f" % btc_price)
        print("Ethereum price USD: $%.2f" % eth_price)

        try: 
            subprocess.run(['./main', str(eth_price), str(btc_price)])
        except FileNotFoundError:
            print("\nEjecutable main no encontrado\n")
        try:
            subprocess.run(['./main64', str(eth_price), str(btc_price)])
        except FileNotFoundError:
            print("\nEjecutable main64 no encontrado\n")
    else:
        print('Error al obtener los precios')
        return 1

    return 0


if __name__ == "__main__":
    import sys
    exit(main(sys.argv))