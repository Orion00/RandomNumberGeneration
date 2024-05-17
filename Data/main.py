
### Using random package to get 10,000,000 random pulls
import random

random.seed(121)

dat1a = random.choices(range(1, 17), k=10000000)

dat1a = [str(item) for item in dat1a]

file = open('Prand.txt','w')
for line in dat1a:
    file.write(line+"\n")
file.close()

# ### Using random package sample command
#
# dat3a = random.sample(range(1,17),k = 10000000)
#
# file = open('Psample.txt','w')
# for line in dat3a:
#     file.write(line+"\n")
# file.close()

### Using numpy.random package to get 10,000,000 random pulls

import numpy as np
rng = np.random.default_rng(121)
dat2a = rng.integers(low=1, high=17, size=10000000)

dat2a = [str(item) for item in dat2a]

file = open('Pnprand.txt','w')
for line in dat2a:
    file.write(line+"\n")
file.close()


