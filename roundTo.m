function value = roundTo(number, decimals)
value = round(number * (10^decimals)) / (10^decimals);