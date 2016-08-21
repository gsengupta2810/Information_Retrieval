import os 
import json 

path = '../alldocs'
for filename in os.listdir(path):
	filename_with_path=os.path.join(path,filename)
	f=file(filename_with_path).read()
	for word in f.split():
		print word
		with open("./jSon.txt", 'r') as dic:
			print "entering"
			print os.path.getsize('./jSon.txt')
			if os.path.exists('./jSon.txt') and os.path.getsize('./jSon.txt')>0 :
				print "entering 1.0"
				f2=open("./jSon.txt", 'r')
				data={}
				s=f2.read()
				data=json.loads(s)
				if word not in data:
					print "entering 1.1"
					list_of_fileNames=[filename]
					data[word] = {
						'filenames' : list_of_fileNames ,
						'frequency' : 1
					}
				else :
					print "entering 1.2"
					data[word][filenames].append(filename) 
					data[word][frequency]+=1
				dic=open("./jSon.txt", 'a')
				s1=json.dumps(data)
				dic.write(s1)	
			else:
				print "entering 2.1"
				data={}
				list_of_fileNames=[filename]
				data[word] = {
					'filenames' : list_of_fileNames ,
					'frequency' : 1
				}
				s2=json.dumps(data)
				with open("./jSon.txt",'w') as f1:
					f1.write(s2)

			


