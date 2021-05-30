//
// Created by NelosG.
//
#include <iostream>
#include <algorithm>

using namespace std;

int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(nullptr);
    cout.tie(nullptr);
    long long a, b, c, d;
    cin >> a >> b >> c >> d;
    while (a % d != b) {
        a += c;
    }
    cout << a << endl;
    return 0;
}
