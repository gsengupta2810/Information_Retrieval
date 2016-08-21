import json  
import os 

print os.path.getsize('jSon.txt')
book ={}

array=['a','b','c']

book['tom']={
	'name' : 'tom' ,
	'fileames' : array,
	'class' : 10
}
book['bob']={
	'name' : 'bob' ,
	'fileames' : array,
	'class' : 12
}
s=json.dumps(book)
print s
with open("./jSon.txt",'w') as f:
	f.write(s)

print os.path.getsize('jSon.txt')

f=open('./jSon.txt','r')
s=f.read()
book=json.loads(s)
book['bob']['class']+=1
(book['bob']['fileames']).append('d')
print book['bob']['class']
print book['bob']['fileames']
s1=json.dumps(book)
f=open('./jSon.txt','w')
f.write(s1)

print os.path.getsize('jSon.txt')
