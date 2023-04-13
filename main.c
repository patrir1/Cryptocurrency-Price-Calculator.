#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "cdecl.h"


//extern float convert(float , float);
extern float convert64(float , float);
//extern float otherConvert64(float, float, float, float, float, float);

//float convert(float, float);

int main(int argc, char *argv[])
{   
    if (argc != 3)
    {
        printf("Usage: %s <eth_price> <btc_price>\n", argv[0]);
        exit(1);
    }

    float usd_ars_rate = 96.50;
    float usd_eur_rate = 0.83;

    float eth_price = atof(argv[1]);
    float btc_price = atof(argv[2]);
  
/*
    float btc_ars = convert(btc_price, usd_ars_rate);
    float btc_eur = convert(btc_price, usd_eur_rate);

    float eth_ars = convert(eth_price, usd_ars_rate);
    float eth_eur = convert(eth_price, usd_eur_rate);
*/

    float btc_ars = convert64(btc_price, usd_ars_rate);
    float btc_eur = convert64(btc_price, usd_eur_rate);

    float eth_ars = convert64(eth_price, usd_ars_rate);
    float eth_eur = convert64(eth_price, usd_eur_rate);
  
    printf("Bitcoin price in ARS: %.2f\n", btc_ars);
    printf("Bitcoin price in EUR: %.2f\n", btc_eur);

    printf("Ethereum price in ARS: %.2f\n", eth_ars);
    printf("Ethereum price in EUR: %.2f\n", eth_eur);

    return EXIT_SUCCESS;
}

/*float convert(float crypto, float rate){
return (crypto*rate);
}*/