#include <iostream>
#include <sstream>
#include <string>
#include <vector>
#include <algorithm>
#include <iomanip>
#include <fstream>
using namespace std;

int main(int argc, char* argv[]) {
	
	int num = atoi(argv[1]);
	int length = atoi(argv[2]);
	
	string line;
	bool dim1 = false;
	vector<pair<double, double>> list;

	ofstream statFile("./persistence.csv",  std::ios_base::app);
	ofstream statFileFiltered("./persistence_filter.csv",  std::ios_base::app);
	
	while(getline(cin, line)) {
		if(dim1) {
			double x, y;
			
			// read x and y from line
			stringstream stream(line);
			stream.ignore(2);
			stream >> x;
			stream.ignore(1);
			stream >> y;
			
			// make pair in list
			list.push_back(make_pair(y - x, x));
		}
		if(line == "persistence intervals in dim 1:") dim1 = true;
	}
	
	sort(list.rbegin(), list.rend());	// reverse iterators
	
	cout << fixed << setprecision(6);
	
	// print to statFile
	for(int i = 0; i < list.size(); i++) {
		double x = list[i].second, y = list[i].first + list[i].second;
		statFile << num << "," << x << "," << y << "," << y - x << endl;
		if(i < length) {
			statFileFiltered << num << "," << x << "," << y << "," << y - x << endl;
		}
	}
	statFile.close();
	statFileFiltered.close();
	
	// write changed values to
	for(int i = 0; i < length; i++) {
		if(i != 0) {
			cout << ",";
		}
		if(i >= list.size()) {
			cout << "0.0";
		} else {
			cout << list[i].first;
		}
	}
	return 0;
}