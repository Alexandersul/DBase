set talk off
clear
use pacient.dbf
index on CNP to icnp
use fisa.dbf
index on CNP to fcnp
use diagnostice.dbf
index on Cod_diagnostic to codd

use pacient.dbf in 1 index icnp alias pac
use fisa.dbf in 2 index fcnp alias fi
use diagnostice.dbf in 3 index codd alias di

select pac
set relation to CNP into fi
select fi
set relation to Cod_diagnostic into di

select pac
do while .T.
clear
text
Programul afiseaza delaliile vizitelor unui pacient cu CNP dat
endtext
wait 'Incepeti d/n: ' to r
do case
case r='d'
c1='CNP pacient: '
c2='CNP'
case r='n'
close all
clear all
return
other 
?'Raspuns '+r+' invalid'
wait
loop
endcase
clear
ch=accept(c1)
seek trim(ch)
if eof()
? 'Pacientul nu exista'
wait
loop
endif
do while CNP=ch
clear
?'Pacientul: '+Nume+' '+Prenume
?'CNP: '+str(CNP)
if eof(2)
?'Pacientul nu are fisa medicala'
else
*? fi->Data_consult
?'Data consultatiei: '+dtoc(fi->Data_consult)
if eof(3)
?'Pacientul nu are diagnostic'
else
*? di->Cod_diagnostic,di->denumire
?'Codul diagnosticului: '+di->Cod_diagnostic
?'Denumire diagnostic: '+di->denumire
endif
endif
?
wait 'Continuati d/n: ' to r
skip
enddo
enddo
return