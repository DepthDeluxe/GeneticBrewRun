import random
import math

# constants
EARTH_RADIUS = 3960.0
DEG_TO_RAD = math.pi / 180.0
RAD_TO_DEG = 180.0 / math.pi

def parseFile():
    file = open("data.csv")
    lines = file.readlines()
    file.close()

    data = []
    for line in lines:
        row = {}
        row['name'] = line.split(",")[0]
        row['lat'] = float( line.split(",")[1] )
        row['lon'] = float( line.split(",")[2] )
        data.append(row)

    return data

# computes distance between two points
def computeDistancePoints(data, pos1, pos2):
    row1 = data[pos1]
    row2 = data[pos2]

    phi1 = row1['lat'] * DEG_TO_RAD
    phi2 = row2['lat'] * DEG_TO_RAD
    deltaPhi = phi2 - phi1
    deltaLambda = (row2['lon'] - row1['lon']) * DEG_TO_RAD

    a = pow( math.sin(deltaPhi / 2), 2 ) + math.cos(phi1) * math.cos(phi2) * pow( math.sin(deltaLambda / 2), 2 )

    c = 2 * math.atan2(math.sqrt(a), math.sqrt(1-a));

    return EARTH_RADIUS * c;

def computeDistancePermutation(data):
    pairs = {}
    for i in range(0, len(data)):
        for j in range(i+1, len(data)):
            dist = computeDistancePoints(data, i, j)
            pairs[str(i) + ',' + str(j)] = dist

    return pairs

def savePairsToCSV(pairs, dataLen):
    f = open("pairs.csv", "w")
    for i in range(0, dataLen):
        for j in range(i+1, dataLen):
            key = str(i) + ',' + str(j)
            dist = pairs[key]

            f.write(key + ',' + str(dist) + '\n')

    f.close()

def main():
    data = parseFile()

    pairs = computeDistancePermutation(data)

    savePairsToCSV(pairs, len(data))

if __name__ == "__main__":
    main()
