#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
using namespace std;

int field[20][20];

pair<int,int> calc_move(int x, int y, const string &pos) {
    pair<int,int> result;

    switch (field[y][x]) {
        case 0:
            result = make_pair(x, y);
            break;
        case 1:
            result = make_pair(x, y+1);
            break;
        case 2:
            if (pos == "LEFT")
                result = make_pair(x + 1, y);
            else
                result = make_pair(x - 1, y);
            break;
        case 3:
            result = make_pair(x, y + 1);
            break;
        case 4:
            if (pos == "TOP")
                result = make_pair(x - 1, y);
            else
                result = make_pair(x, y + 1);
            break;
        case 5:
            if (pos == "TOP")
                result = make_pair(x + 1, y);
            else
                result = make_pair(x, y + 1);
            break;
        case 6:
            if (pos == "LEFT")
                result = make_pair(x + 1, y);
            else
                result = make_pair(x - 1, y);
            break;
        case 7:
        case 8:
        case 9:
            result = make_pair(x, y + 1);
            break;
        case 10:
            result = make_pair(x - 1, y);
            break;
        case 11:
            result = make_pair(x + 1, y);
            break;
        case 12:
        case 13:
            result = make_pair(x, y + 1);
            break;
    }

    return result;
}

int main()
{
    int w; // number of columns.
    int h; // number of rows.
    cin >> w >> h;
    for (int i = 0; i < h; i++) {
        for (int j = 0; j < w; j++) {
            cin >> field[i][j];
        }
    }
    int ex; // the coordinate along the X axis of the exit (not useful for this first mission, but must be read).
    cin >> ex;

    // game loop
    while (1) {
        int x;
        int y;
        string pos;
        cin >> x >> y >> pos;

        pair<int,int> move = calc_move(x, y, pos);
        cout << move.first << " " << move.second << endl;
    }
}
