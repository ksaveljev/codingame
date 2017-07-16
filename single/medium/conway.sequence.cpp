#include <iostream>
#include <string>
#include <queue>
#include <algorithm>
using namespace std;

int main()
{
    int r, element, line, count;
    queue<int> current, next;

    cin >> r >> line;
    current.push(r);
    for (int i = 2; i <= line; i++) {
        element = current.front();
        count = 0;
        while (!current.empty()) {
            if (element == current.front()) {
                current.pop();
                count++;
            } else {
                next.push(count);
                next.push(element);
                element = current.front();
                current.pop();
                count = 1;
            }
        }
        next.push(count);
        next.push(element);
        while (!next.empty()) {
            current.push(next.front());
            next.pop();
        }
    }

    while (!current.empty()) {
        cout << current.front();
        current.pop();
        if (!current.empty()) cout << " ";
    }
    cout << endl;
}
