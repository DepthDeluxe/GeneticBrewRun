#from lfsr import *
import random
import math

data = None

def parseFile():
    global data

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
    for n in range(0, len(sol)-1):
        distance += computeDistancePoints(sol[n], sol[n+1])

    return distance

def findBestSolution(breed):
    shortestDistance = 892839589
    shortestSolution = breed[0]
    for sol in breed:
        distance = computeDistanceSolution(sol)
        if distance < shortestDistance:
            shortestDistance = distance
            shortestSolution = sol

    return [shortestDistance, shortestSolution]

# performs the initial breeding
def createInitialBreed():
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
    #if len(dDict) != 50:
    #    print("Error: overlap in distances, " + str(len(dDict)))

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
    for rnd in range(0, random.randint(1,3)):
        # find two different indices
        index1 = random.randint(0, len(mutant)-1)
        index2 = random.randint(0, len(mutant)-1)

        # swap the two values
        tempStore = mutant[index1]
        mutant[index1] = mutant[index2]
        mutant[index2] = tempStore

    return mutant

def createInsertionMutant(sol):
    # perform a random number of swaps
    mutant = list(sol)
    for rnd in range(0, random.randint(1,2)):
        length = random.randint(2,4)
        start = random.randint(0, len(mutant)-length)
        dest = random.randint(0, len(mutant)-length)

        # get the string
        string = []
        for n in range(start, start+length):
            string.append( mutant[n] )

        # clone the mutant and remove all elements of the string
        for elem in string:
            mutant.remove(elem)

        # insert each element into the destination, if done in reverse
        # order, this should place out the list
        for elem in reversed(string):
            mutant.insert(dest, elem)

    return mutant

def createReverseMutant(sol):
    # choose the string length
    mutant = list(sol)
    for rnd in range(0, random.randint(1,2)):
        length = random.randint(2,4)
        start = random.randint(0, len(mutant)-length)

        # get the string
        string = []
        for n in range(start, start+length):
            string.append( mutant[n] )

        # remove from the mutnat
        for elem in string:
            mutant.remove(elem)

        # add back in the same order (which reverses it)
        for elem in string:
            mutant.insert(start, elem)

    return mutant

def mutate(selected):
    newBreed = []
    for elem in selected:
        newBreed.append(elem)
        newBreed.append(createShuffleMutant(elem))
        newBreed.append(createShuffleMutant(elem))
        newBreed.append(createInsertionMutant(elem))
        newBreed.append(createReverseMutant(elem))

    return newBreed

def main():
    parseFile()

    breed = createInitialBreed()
    initialBreed = list(breed)
    for n in range(0, 30000):
        selected = select(breed)
        breed = mutate(selected)

    # get the solution from the selected breed and from the initial breed
    shortest = findBestSolution(breed)
    shortestInitial = findBestSolution(initialBreed)

    print("Solution =======")
    print("  * Distance: " + str(shortest[0]))
    print("  * Path: " + str(shortest[1]))
    print("Original =======")
    print("  * Distance: " + str(shortestInitial[0]))
    print("  * Path: " + str(shortestInitial[1]))

if __name__ == "__main__":
    main()
