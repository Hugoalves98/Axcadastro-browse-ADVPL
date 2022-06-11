#INCLUDE 'TOTVS.CH'

user function tlvenda()

local aDados := {}
local cTitulo := PADC("Pedido de Venda",90)
local oDlg

DbSelectArea("SC5")
DbSetOrder(1)
DBGOTOP()

while SC5->(!EOF())    
   aAdd(aDados,{SC5->C5_NUM,SC5->C5_CLIENTE,SC5->C5_CLIENT}) 
    SC5->(DbSkip())   
  
ENDDO 

DEFINE DIALOG oDlg TITLE cTitulo FROM 0, 0 TO 270, 470 PIXEL           
 
    oBrowse := TSBrowse():New(30,10,220,100,oDlg,,16,,1)    
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

/*
user function cadpv()

  Local cTitulo := "Pedidos de venda"
  Local cAlias := "SC5"
  Local cFunExc := "U_exclpv()"
  Local cFunAlt := "U_exsimOrn"

  AxCadastro(cAlias, cTitulo, cFunExc, cFunAlt)
 
return

static function exclpv()
Local lRet := MsgBox("Tem certeza que deseja excluir o registro selecionado?", "Confirmação","YESNO")

return lRet

static function exsimOrn()
Local lRet := .F.
Local cMsg := ""
If INCLUI 
  cMsg := "Confirmar a inclusão do registro?"
else
  cMsg := "Confirmar a alteração do registro?"
endif

lRet := MsgBox(cMsg := "Confirmação", "YESNO")

return lRet
*/

