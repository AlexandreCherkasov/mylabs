#!/bin/bash

#exec 0<>/dev/console 1<>/dev/console 2<>/dev/console
cat << 'LOGO'

                     ..                  ..                                   
                      :_.              ._-                                    
       ....            -:=;__......_.===-     ...          ._         ._..    
     _;==+=+=.           -========+===-       .=:          ==       _====+=;  
   .===--. -===            --==+===--         .+:          :=.     :==-  -:== 
  .==-       -==.              ==             .=:          ==.    .+;      --.
  ==`          +=              ==             .+:          :=.    ==          
 ==:           :=:             ==             .=:          ==.    ==          
 ==             ==       .=:   ==   =;        .+:          :=.    ==          
:+:             :=:       -    ==   -`        .=:          ==.    :=:         
==.              +;            ==             .+:          :=.     ==_        
==               +=            =;             .=:          ==.      =+=;.     
==              .==            =`             .+:          :=.       -:+==_   
==               +=            :              .=:          ==.          -=+=. 
==.             .==                           .+:          :=.            -== 
:=:             :=:                           .=;          ==              :=;
 +=             ==                             +;          ==               +;
 ==.           :=;                             +=         .==              .=;
  ==.         .==                              :+:        :=`      .       .+:
  -==_       _=+                                +=.      :==      ==.     .==`
    +==_..._===                                 -==_....;==       :==_..._==- 
     -===+===-            ....    ....           -:++===+=         -=======`  
       -----              =:::    =:.=              ----              ---     
                             .        -                                       


LOGO
read -n 1 -s -r -t 15 -p "Press any key to continue...  OR boot will continue after 15 seconds "
echo
