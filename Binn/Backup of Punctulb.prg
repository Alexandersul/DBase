set talk off
clear
use pacient.dbf
index on CNP to iicnp
use fisa.dbf
index on CNP to fcnp
use diagnostice.dbf
index on Cod_diagnostic to codd

use Pacient.dbf in 1 index icnp alias pac
use Fisa.dbf in 2 index fcnp alias fi
use Diagnostice.dbf in 3 index codd alias di

select pac
set relation to CNP into fi
select fi
set relation to Cod_diagnostic into di

numar=reccount()

for iul=1 to numar
go iul in di
if not(di->Repaos_recomandat ='.T.')
go iul in fi
replace fi->Concediu_medical with .F.
endif
endfor
close all
clear all
return