import names
textfile = open('C:/Users/MOUSSAOUI/Desktop/AD_PS-master/AD_PS-master/names_generated_by_py.txt', 'w')

"""
for i in range(10):
    print(names.get_full_name())
    
    
"""
for i in range(10):
    rand_name = names.get_full_name(gender='male')
    #rand_name = names.get_full_name(gender='female')
    #rand_name = names.get_first_name(gender='male')
    #rand_name = names.get_last_name()
    textfile.write(rand_name+"\n")
    print(rand_name)
    

textfile.close()