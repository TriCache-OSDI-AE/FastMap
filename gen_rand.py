#!/usr/bin/env python3
import numpy as np
import sys
n = int(sys.argv[1])
for i in range(n):
    print('{'+", ".join(map(str, list(np.random.permutation(n))))+'},')

