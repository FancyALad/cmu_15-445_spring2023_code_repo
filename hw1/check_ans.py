f1 = open('D:/15445/hw1/my_ans.txt', 'r')
f2 = open('D:/15445/hw1/ans.txt', 'r')

l1 = []
for line in f1.readlines():
    l1.append(line.strip())
l2 = []
for line in f2.readlines():
    l2.append(line.strip())
for line1, line2 in zip(l1, l2):
    if line1 != line2:
        print(line1, line2)
        break
else:
    print('Correct')
f1.close()
f2.close()
