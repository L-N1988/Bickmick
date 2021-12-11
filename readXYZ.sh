#!/bin/bash -e

DIR=$(pwd)
cd $DIR
cat './Points' | tr -d ['(',')'] > temp
cat temp | awk '{print $1}' > Xs
cat temp | awk '{print $2}' > Ys
cat temp | awk '{print $3}' > Zs
rm temp

# -s FILE exists and has a size greater than zero
if [ -s hexBlock.py ]
then
    # The file is not-empty.
    cat /dev/null > hexBlock.py
else
    # The file is empty.
    touch hexBlock.py
fi
echo 'import matplotlib.pyplot as plt' >> hexBlock.py
echo 'import numpy as np' >> hexBlock.py
echo 'X = open("./Xs", "r")' >> hexBlock.py
echo 'Y = open("./Ys", "r")' >> hexBlock.py
echo 'Z = open("./Zs", "r")' >> hexBlock.py
echo 'xx = []' >> hexBlock.py
echo 'yy = []' >> hexBlock.py
echo 'zz = []' >> hexBlock.py
echo 'for x in X:' >> hexBlock.py
echo '  xx.append(float(x))' >> hexBlock.py
echo 'for y in Y:' >> hexBlock.py
echo '  yy.append(float(y))' >> hexBlock.py
echo 'for z in Z:' >> hexBlock.py
echo '  zz.append(float(z))' >> hexBlock.py
echo 'fig = plt.figure()' >> hexBlock.py
echo 'ax = fig.add_subplot(projection='"'"'3d'"'"')' >> hexBlock.py # '"'"' enable single quote
echo 'ax.scatter(xx, yy, zz)' >> hexBlock.py
echo 'plt.show()' >> hexBlock.py
python hexBlock.py
