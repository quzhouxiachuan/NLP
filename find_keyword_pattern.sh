awk '/class V/ { match($0, /class V/); print substr($0, RSTART - 50, RLENGTH + 100); }' renalnotes_forNLP.txt  > classV.txt
sort classV.txt | uniq -u > classV_nonduplicate.txt

awk '/class II/ { match($0, /class II/); print substr($0, RSTART - 50, RLENGTH + 100); }' renalnotes_forNLP.txt  > classII.txt
awk '/classII/ { match($0, /class II/); print substr($0, RSTART - 50, RLENGTH + 100); }' renalnotes_forNLP.txt  >> classII.txt
awk '/ClassII/ { match($0, /Class II/); print substr($0, RSTART - 50, RLENGTH + 100); }' renalnotes_forNLP.txt  >> classII.txt
awk '/Class II/ { match($0, /Class II/); print substr($0, RSTART - 50, RLENGTH + 100); }' renalnotes_forNLP.txt  >> classII.txt
sort classII.txt | uniq -u > classII_nonduplicate.txt

awk '/proteinuria/ { match($0, /proteinuria/); print substr($0, RSTART - 100, RLENGTH + 200); }' renalnotes_forNLP.txt  > proteinuria.txt
sort proteinuria.txt | uniq -u > proteinuria_nonduplicate.txt

awk '/immunofluorescence/ { match($0, /immunofluorescence/); print substr($0, RSTART - 100, RLENGTH + 200); }' renalnotes_forNLP.txt  > immunofluorescence.txt
sort immunofluorescence.txt | uniq -u > immunofluorescence_nonduplicate.txt

#1. lupus nephritis class *II  (waiting to confirm if I should use lupus nephritis class II combination )
#2. lupus nephritis class *III
#3. lupus nephritis class *IV
#4. lupus nephritis class *V 
#5. lupus nephritis
#6. proteinuria*greater*than*0.5*gm 
#7. proteinuria*>*0.5*gm
#8. dsDNA
#9. ANA
#10. podocytopathy*class II 
#11. thrombotic microangiopathy
#12. tubulointerstitial inflammation
#13. tubulointerstitial fibrosis
#14. microthrombi
#15. subendothelial deposits
#16.  subepithelial deposits
#17. + immunofluorescence
#18. immunofluorescence + 
#19. immunofluorescence*positive
#20. positive*immunofluorescence
#21. mesangial proliferation
# ?lab+ renal biopsy + ANA -> definite 
# renal biopsy + DsDNA 
#>=1 clinical (Malar rash/photosensitive rash/acute cutaneous lupus
#Discoid
#Oral ulcers
#Non-scarring alopecia
#Arthritis
#Serositis
#Renal
#Neurologic
#Hemolytic Anemia
#Leukopenia Lymphopenia (<1.5k) Lymphopenia (<1k)
#Thrombocytopenia) + >=1 immunological  (ANA
#Anti-dsDNA
#Anti-Sm
#Antiphospholipid antibody
#Low Complement 
#direct coombs) + >=4 criteira 



#EULARL: at 10 point to be definite SLE 
