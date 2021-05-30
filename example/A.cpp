//
// Created by NelosG.
//
#include <iostream>

static void printPrimes(int currentValue) {
    double sqrt = std::sqrt(currentValue);
    int multiplier = 2;
    while(currentValue % multiplier == 0) {
        printf_s("%d ", multiplier);
        currentValue /= multiplier;
    }
    multiplier++;
    while (currentValue > 1 && multiplier <= sqrt) {
        if (currentValue % multiplier == 0) {
            printf_s("%d ", multiplier);
            currentValue /= multiplier;
        } else if (multiplier != 2) {
            multiplier += 2;
        }
    }
    if (currentValue != 1) {
        printf_s("%d", currentValue);
    }
}

int main() {

    std::ios_base::sync_with_stdio(false);
    std::cin.tie(nullptr);
    std::cout.tie(nullptr);

    int a;
    printPrimes((std::cin >> a, a));
}