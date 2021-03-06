#INCLUDE 'TOTVS.CH'

user function tlecomrc()

local aDados := {}
local cTitulo := PADC("Cadastro de clientes e-commerce",90)
local oDlg

DbSelectArea("ZZ1")
DbSetOrder(1)
DBGOTOP()

while ZZ1->(!EOF())    
   aAdd(aDados,{ZZ1->ZZ1_CDGO,ZZ1->ZZ1_RAZ,ZZ1->ZZ1_CLI}) 
    ZZ1->(DbSkip())   
  
ENDDO 

DEFINE DIALOG oDlg TITLE cTitulo FROM 0, 0 TO 270, 470 PIXEL           
 
    oBrowse := TSBrowse():New(30,10,220,100,oDlg,,16,,1)    
    oBrowse:setArray( aDados )
    oMenu := TMenu():New(0,0,0,0,.T.)
    oTMenuIte1 := TMenuItem():New(oDlg,">> Pr?ximo registro*",,,,{|| oBrowse:GoDown(), oBrowse:setFocus() },,,,,,,,,.T.)
    oTMenuIte2 := TMenuItem():New(oDlg,">> Registro Anterior*",,,,{|| oBrowse:GoUp(), oBrowse:setFocus() } ,,,,,,,,,.T.)
    oTMenuIte3 := TMenuItem():New(oDlg,"Num Registro Atual",,,,{||Alert(oBrowse:nAt)} ,,,,,,,,,.T.)
    oTMenuIte4 := TMenuItem():New(oDlg,"Total de Registro",,,,{||Alert(oBrowse:nLen)} ,,,,,,,,,.T.)
    oTMenuIte5 := TMenuItem():New(oDlg,"Muda a ordem de pesquisa",,,,{||Alert("TMenuItem 05")} ,,,,,,,,,.T.)
    oMenu:Add(oTMenuIte1)
    oMenu:Add(oTMenuIte2)
    oMenu:Add(oTMenuIte3)
    oMenu:Add(oTMenuIte4)
    oMenu:Add(oTMenuIte5)
 
    oBrowse:addColumn( TCColumn():new( "C?digo", { || aDados[oBrowse:nAt, 1] },,,, "CENTER",, .F., .F.,,,, .F. ) )
    oBrowse:addColumn( TCColumn():new( "Fantasia", { || aDados[oBrowse:nAt, 2] },,,, "CENTER",, .F., .F.,,,, .F. ) )
    oBrowse:addColumn( TCColumn():new( "Raz?o Social", { || aDados[oBrowse:nAt, 3] },,,, "CENTER",, .F., .F.,,,, .F. ) )
    // oBrowse:Refresh()
 
    oButton:= TButton():New(10,10,"Exportar",oDlg,{|| oBrowse:GoTop(),oBrowse:setFocus()},40,15,,,,.t.)
    oButton:= TButton():New(10,55,"Importar",oDlg,{|| oBrowse:GoBottom(), oBrowse:setFocus()},40,15,,,,.t.)
    oButton:= TButton():New(10,100,"Visualizar",oDlg,{||},40,15,,,,.t.)
    oTButton1:= TButton():New(10,145,"Outras a??es",oDlg,{||},40,15,,,,.t.)
    oButton:= TButton():New(10,190,"Sair",oDlg,{||,oDlg:End()},40,15,,,,.t.)
    
    oTButton1:SetPopupMenu(oMenu)
 
oDlg:Activate()

return


