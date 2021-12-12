import matplotlib.pyplot as plt
import numpy as np
X = open("./Xs", "r")
Y = open("./Ys", "r")
Z = open("./Zs", "r")
xx = []
yy = []
zz = []
i = 10
cnt = []
for x in X:
  xx.append(float(x))
  cnt.append(i)
  i += 1
for y in Y:
  yy.append(float(y))
for z in Z:
  zz.append(float(z))
fig = plt.figure()
ax = fig.add_subplot(projection='3d')
ax.scatter(xx, yy, zz)
ax.set_xlabel('X Label')
ax.set_ylabel('Y Label')
ax.set_zlabel('Z Label')
for num, x, y, z in zip(cnt, xx, yy, zz):
  label = num
  ax.text3D(x, y, z, label, zdir='z', fontsize=10)
plt.show()
