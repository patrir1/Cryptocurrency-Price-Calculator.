#include <stdio.h>
#include <stdlib.h>

extern float convert_to_ars(float , float * );
extern float convert_to_usd(float , float * );
extern float convert_to_eur(float , float * );



int main()
{
    float btc_price, eth_price;
    float usd_ars_rate = 0.0, usd_eur_rate = 0.0;
    char buffer[100]; // Aumentar el tamaño del buffer
    FILE *fp;
    

    fp = fopen("crypto_prices.txt", "r");
    if (fp == NULL)
    {
        printf("Error opening file\n");
        exit(1);
    }

    fgets(buffer, sizeof(buffer), fp); // Usar fgets en vez de fscanf
    sscanf(buffer, "%f", &btc_price); // Usar sscanf en vez de fscanf
    fgets(buffer, sizeof(buffer), fp); // Usar fgets en vez de fscanf
    sscanf(buffer, "%f", &eth_price); // Usar sscanf en vez de fscanf

    fclose(fp);

    printf("Bitcoin price in USD: %.2f\n", btc_price);
    printf("Ethereum price in USD: %.2f\n", eth_price);

    usd_ars_rate = 96.50;
    usd_eur_rate = 0.83;

    float btc_ars = convert_to_ars(btc_price, &usd_ars_rate);
    float btc_usd = convert_to_usd(btc_price, &usd_ars_rate);
    float btc_eur = convert_to_eur(btc_price, &usd_eur_rate);

    float eth_ars = convert_to_ars(eth_price, &usd_ars_rate);
    float eth_usd = convert_to_usd(eth_price, &usd_ars_rate);
    float eth_eur = convert_to_eur(eth_price, &usd_eur_rate);

 

    printf( "Bitcoin price in ARS: %.2f\n", btc_ars);
    printf( "Bitcoin price in USD: %.2f\n", btc_usd);
    printf( "Bitcoin price in EUR: %.2f\n", btc_eur);

    printf("Ethereum price in ARS: %.2f\n", eth_ars);
    printf("Ethereum price in USD: %.2f\n", eth_usd);
    printf("Ethereum price in EUR: %.2f\n", eth_eur);

    fclose(fp);

    return 0;
}


/*float convert_to_ars(float price, float  rate){
    return rate*price;
}

float convert_to_usd(float price, float  rate){
     return rate*price;
    
}

float convert_to_eur(float price, float  rate){
     return rate*price;
    
}
*/