class LFSR:
    def __init__(self, seed):
        # shift each of the bits of the shift register
        self.sr = []
        for n in range(0, 32):
            self.sr.append(seed & 1)
            seed = seed >> 1

    def _shift(self):
        # compute the next bit
        nextBit = self.sr[0] ^ self.sr[1] ^ self.sr[21] ^ self.sr[31] ^ 1

        # insert at beginning of shift register and then delete end of sr
        self.sr.insert(0, nextBit)
        self.sr = self.sr[:-1]

    def generateRandom(self):
        val = 0
        for n in range(0, 8):
            val = val << 1 | self.sr[31]
            self._shift()

        return val
