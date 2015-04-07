#from lfsr import *
import random
import math

data = None

def parseFile():
    file = open("data.csv")
    lines = file.readlines()
    file.close()

    data = []
    for line in lines:
        row = {}
        row['name'] = line.split(",")[0]
        row['x'] = float( line.split(",")[1] )
        row['y'] = float( line.split(",")[2] )
        data.append(row)

    return data

# computes distance between two points
def computeDistancePoints(pos1, pos2):
    row1 = data[pos1]
    row2 = data[pos2]

    diffX = row1['x'] - row2['x']
    diffY = row1['y'] - row2['y']

    return math.sqrt( math.pow(diffX, 2) + math.pow(diffY, 2) )

# computes distance over an entire solution
def computeDistanceSolution(sol):
    distance = 0
    for n in range(0, len(sol-1)):
        distance += computeDistancePoints(sol[n], sol[n+1])

    return distance

# performs the initial breeding
def initialBreeding():
    solution = []
    for n in range(0, 30):
        solution.append(n)

    # produce 50 random strings
    breed = []
    for n in range(0, 50):
        shuffled = list(solution)
        random.shuffle(shuffled)
        breed.append(shuffled)

    return breed

# selects most fit in list
def select(breed):
    # compute distance of each breed
    dDict = {}
    for sol in breed:
        distance = computeDistanceSolution(sol)
        dDict[distance] = sol

    # double check to make sure distances are all different
    if len(dDict) != 50:
        print("Error: overlap in distances")

    # pluck out best 20 nodes
    selected = []
    numSelected = 0
    for distance in sorted(dDict.keys()):
        if numSelected >= 20:
            break
        numSelected += 1

        selected.append( dDict[distance] )

    # shuffle the selected and only pull the first 10 elements
    random.shuffle(selected)
    selected = selected[0:10]

    return selected

def createShuffleMutant(sol):
    mutant = list(sol)

    # perform a random number of swaps
    for n in range(0, random.randint(1,3)):
        # find two different indices
        index1 = 0
        index2 = 0
        while index1 != index2:
            index1 = random.randint(0, len(data)-1)
            index2 = random.randint(0, len(data)-1)

        # swap the two values
        tempStore = mutant[index1]
        mutant[index1] = mutant[index2]
        mutant[index2] = tempStore

    return mutant

def createInsertionMutant(sol):
    mutant = []

    # perform a random number of swaps
    for n in range(0, random.randint(1,2)):
        start = random.randint(0, len(sol)-1)
        length = random.randint(2,4)


def main():
    parseFile()

if __name__ == "__main__":
    main()
