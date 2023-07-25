def add(x, y):
    return x+y
def outer(x):
    def inner(y):
        return x+y
    return inner
print(outer(2)(4))
x = 2
# from functools import partial
import functools
print(functools.partial(add, x)(2))

f = '2023-05-01 10:20:05 200 GET /page1.html'

def func():
    for line in f:
        yield from f.split(' ')[1]

# print(func())
for ch in func():
    print(ch)
x = 10
print(x**2, x^2, x*x)
# print("1+2.3")*3
print([0,1]*3)
print(20^2)
values = [1,2,3,4,5,6]

print(sum(x**2 for x in values if x %2 == 0))
print(sum(x * x if x %2 == 0 else 0 for x in values ))
# print(sum(x * x if x %2 == 0 for x in values ))
a = [None, 3,2, None, 1,0,1]
print(sum(a) / len(a))
# good = [t for t in a if t]
# avg = sum(good) / len(good)
# for i, t in enumerate(a):
#     a[i] = t or avg
# print(a)

# good = [t for t in a if t is not None]
# avg = sum(good) / len(good)
# a = [t or avg for t in a]

good = [t for t in a if t is not None]

avg = sum(good) / len(good)
a[:] = [t if t is not None else avg for t in a]
print(a, "sssss")