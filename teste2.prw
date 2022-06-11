#INCLUDE "TOTVS.CH"

user function telaxte()

local aDados := {}
local cTitulo := PADC("Pedido de compra",90)
local oDlg

DbSelectArea("SC7")
DbSetOrder(1)
DBGOTOP()

while SC7->(!EOF())    
   aAdd(aDados,{SC7->C7_NUM,SC7->C7_FORNECE,SC7-> C7_DESCRI}) 
    SC7->(DbSkip())   
  
ENDDO 

DEFINE DIALOG oDlg TITLE cTitulo FROM 0, 0 TO 270, 470 PIXEL           
 
    oBrowse := TSBrowse():New(50,10,220,80,oDlg,,16,,1)    
    oBrowse:setArray( aDados )
 
    oBrowse:addColumn( TCColumn():new( "Código", { || aDados[oBrowse:nAt, 1] },,,, "CENTER",, .F., .F.,,,, .F. ) )
    oBrowse:addColumn( TCColumn():new( "Fantasia", { || aDados[oBrowse:nAt, 2] },,,, "CENTER",, .F., .F.,,,, .F. ) )
    oBrowse:addColumn( TCColumn():new( "Razão Social", { || aDados[oBrowse:nAt, 3] },,,, "CENTER",, .F., .F.,,,, .F. ) )
    // oBrowse:Refresh()
 
    oButton:= TButton():New(10,10,"Incluir",oDlg,{||},40,15,,,,.t.)
    oButton:= TButton():New(10,55,"Alterar",oDlg,{||},40,15,,,,.t.)
    oButton:= TButton():New(10,100,"Visualizar",oDlg,{||},40,15,,,,.t.)
    oButton:= TButton():New(10,145,"Outras ações",oDlg,{||},40,15,,,,.t.)
    oButton:= TButton():New(10,190,"Sair",oDlg,{||,oDlg:End()},40,15,,,,.t.)

 
oDlg:Activate()

return


