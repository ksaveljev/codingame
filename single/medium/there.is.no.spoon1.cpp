#include <iostream>
#include <string>
#include <vector>
#include <algorithm>

using namespace std;

int width, height;
char field[30][30];

void print_right_node(int row, int col) {
    for (int i = col + 1; i < width; i++) {
        if (field[row][i] == '0') {
            cout << i << " " << row << " ";
            return;
        }
    }
    cout << "-1 -1 ";
}

void print_bottom_node(int row, int col) {
    for (int i = row + 1; i < height; i++) {
        if (field[i][col] == '0') {
            cout << col << " " << i << endl;
            return;
        }
    }
    cout << "-1 -1" << endl;
}

int main()
{
    string line;
    cin >> width >> height;
    cin.ignore();

    for (int i = 0; i < height; i++) {
        getline(cin, line);
        for (int j = 0; j < width; j++) {
            field[i][j] = line[j];
        }
    }

    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            if (field[i][j] == '.') continue;
            cout << j << " " << i << " ";

            print_right_node(i, j);
            print_bottom_node(i, j);
        }
    }
}
