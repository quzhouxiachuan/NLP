awk '/class V/ { match($0, /class V/); print substr($0, RSTART - 50, RLENGTH + 100); }' renalnotes_forNLP.txt  > classV.txt
sort classV.txt | uniq -u > classV_nonduplicate.txt

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
