import pandas as pd
import io
import re
import os
os.chdir('C:/Users/***/Documents/')

renal = open('./renalnotes_forNLP.txt',  encoding='utf-8').read()
#renal[:1000]
individual = renal.split('77endofline777')
newtxt = ''
for line in individual:
    #split the line using AlonaendAlona to get content of each column 
    eachline = line.split('\tAlonaendAlona\t')
    #notefield is in column index 6 
    notefield = eachline[6]
    #print (notefield+'\n'+'=======================')
    #regex to find the word you want to match, re.I indicate case insensitive  
    
    lupus = re.finditer('lupus',notefield, re.I)
    #.span help to find the position index of each words 
    lupus_ind = [i.span() for i in lupus]
    if not lupus_ind:
        lupus_ind = 'NULL'
        
    classIII =  re.finditer('class *III',notefield, re.I)
    classIII_ind = [i.span() for i in classIII]
    if not classIII_ind: 
        classIII_ind = 'NULL'
    classII =  re.finditer('class *II',notefield, re.I)
    classII_ind = [i.span() for i in classII]
    
    if not classII_ind:
        classII_ind = 'NULL'
    nephritis = re.finditer('nephritis',notefield, re.I)
    nephritis_ind = [i.span() for i in nephritis]
    
    proteinuria  = re.finditer('proteinuria',notefield, re.I)
    proteinuria_ind  = [i.span() for i in proteinuria ]
    if not proteinuria_ind:
        proteinuria_ind = 'NULL'
        
    dsDNA = re.finditer('dsDNA',notefield, re.I)
    dsDNA_ind  = [i.span() for i in dsDNA ]
    if not dsDNA_ind:
        dsDNA_ind = 'NULL'
        
    ANA = re.finditer('ANA',notefield, re.I)
    ANA_ind  = [i.span() for i in ANA]
    if not ANA_ind:
        ANA_ind = 'NULL'
    
    #add the position index to the end of the line 
    print (ANA_ind)
    newline = line+'\tAlonaendAlona\t' + str(lupus_ind) \
    + '\tAlonaendAlona\t' + str(classIII_ind) \
    + '\tAlonaendAlona\t' + str(classII_ind) \
    + '\tAlonaendAlona\t' + str(nephritis_ind) \
    + '\tAlonaendAlona\t' + str(proteinuria_ind) \
    + '\tAlonaendAlona\t' + str(dsDNA_ind) \
    + '\tAlonaendAlona\t' + str(ANA_ind) \
    + '\tAlonaendAlona\t' + '77endofline777'+'\n'
    newtxt = newtxt + newline
    #print (newline+'\n'+'================================')
 
#delete the '\ufeff' at the beginning of the file to deal with the encoding errors 
newtxt = re.sub('\ufeff', '', newtxt)
newtxt = 'ir_id\tAlonaendAlona\tnote_key\tAlonaendAlona\tpatient_key\tAlonaendAlona\t department_key \tAlonaendAlona\t \
department_name \tAlonaendAlona\t note_type \tAlonaendAlona\t note_text \tAlonaendAlona\t signed_date_key \tAlonaendAlona\t \
lupus \tAlonaendAlona\t classIII \tAlonaendAlona\t classII \tAlonaendAlona\t nephritis \tAlonaendAlona\t proteinuria \tAlonaendAlona\t dsDNA \tAlonaendAlona\t ANA \tAlonaendAlona\tendofline' + newtxt
# write into a new file with positions of each keywords 
with open('renalnotes_newfile_101618.txt','w') as f:
    f.write(newtxt)
