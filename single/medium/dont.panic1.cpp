#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
using namespace std;

string getElevatorDirection(int clonePos, int elevatorPos) {
    return (elevatorPos >= clonePos ? "RIGHT" : "LEFT");
}

int main()
{
    int nbFloors; // number of floors
    int width; // width of the area
    int nbRounds; // maximum number of rounds
    int exitFloor; // floor on which the exit is found
    int exitPos; // position of the exit on its floor
    int nbTotalClones; // number of generated clones
    int nbAdditionalElevators; // ignore (always zero)
    int nbElevators; // number of elevators
    int elevators[15];
    bool blocked[15];

    fill(elevators, elevators + 15, -1);
    fill(blocked, blocked + 15, false);

    cin >> nbFloors >> width >> nbRounds >> exitFloor >> exitPos >> nbTotalClones >> nbAdditionalElevators >> nbElevators;

    for (int i = 0; i < nbElevators; i++) {
        int elevatorFloor;
        int elevatorPos;
        cin >> elevatorFloor >> elevatorPos;
        elevators[elevatorFloor] = elevatorPos;
    }

    while (1) {
        int cloneFloor; // floor of the leading clone
        int clonePos; // position of the leading clone on its floor
        string direction; // direction of the leading clone: LEFT or RIGHT

        cin >> cloneFloor >> clonePos >> direction;

        if (cloneFloor == -1) {
            cout << "WAIT" << endl;
        } else if (!blocked[cloneFloor]) {
            string elevatorDirection = getElevatorDirection(clonePos, elevators[cloneFloor]);
            blocked[cloneFloor] = true;
            if (elevatorDirection == direction) {
                cout << "WAIT" << endl;
            } else {
                cout << "BLOCK" << endl;
            }
        } else {
            cout << "WAIT" << endl;
        }
    }
}
