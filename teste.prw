#INCLUDE 'TOTVS.CH'

/*
user function tesperso()
  
  local oBrowse 
  local oButton
  Local cTitulo := PADC("Pedidos de Compra",90)
  Local aArea   := GetArea()
  Local cFunBkp := FunName()

DEFINE DIALOG oDlg TITLE cTitulo FROM 0, 0 TO 270, 470 PIXEL           

    SetFunName("tesperso")
     
    oBrowse := FWMBrowse():New(50,10,220,80,oDlg,,16,,1)  
    oBrowse:SetAlias("SC7")
    oBrowse:SetDescription(cTitulo)
   
     
       
    oBrowse:addColumn( TCColumn():new( "Nº Pedido", { || oDlg[oBrowse:nAt, 1] },,,, "CENTER",, .T., .T.,,,, .T. ) )
    oBrowse:addColumn( TCColumn():new( "Fornecedor", { || oDlg[oBrowse:nAt, 2] },,,, "CENTER",, .T., .T.,,,, .T. ) )
    oBrowse:addColumn( TCColumn():new( "Razão Social", { || oDlg[oBrowse:nAt, 3] },,,, "CENTER",, .T., .T.,,,, .T. ) )
    oBrowse:Refresh()
    oBrowse:Activate()

    oButton:= TButton():New(10,10,"Incluir",oDlg,{||},40,15,,,,.t.)
    oButton:= TButton():New(10,55,"Alterar",oDlg,{|u| fAltera()},40,15,,,,.t.)
    oButton:= TButton():New(10,100,"Visualizar",oDlg,{|| fShowAll()} ,40,15,,,,.t.)
    oButton:= TButton():New(10,145,"Outras ações",oDlg,{||},40,15,,,,.t.)
    oButton:= TButton():New(10,190,"Sair",oDlg,{||,oDlg:End()},40,15,,,,.t.)

  SetFunName(cFunBkp)
     
  RestArea(aArea)
  ACTIVATE DIALOG oDlg CENTERED
 
return
*/

/*
static function exclpc()
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






/*

Private cGNpedid   := Space(5)
  Private cGNome     := Space(20)
  Private cGRazsoc   := Space(30)

    osPedid    := TSay():New( 040,016,{||"Nº pedido"},oDlg,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,040,008)
    osNome     := TSay():New( 040,54,{||"Fornecedor"},oDlg,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,032,008)
    oSRazsoc   := TSay():New( 040,126,{||"razão social"},oDlg,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,032,008)
    oGNpedid   := TGet():New( 052,016,{|u| If(PCount()>0,cGNpedid:=u,cGNpedid)},oDlg,30,010,'',,CLR_BLACK,CLR_WHITE,,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","cGNpedid",,)
    oGNome     := TGet():New( 052,54,{|u| If(PCount()>0,cGNome:=u,cGNome)},oDlg,70,010,'',,CLR_BLACK,CLR_WHITE,,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","cGNome",,)
    oGRazsoc   := TGet():New( 052,126,{|u| If(PCount()>0,cGRazsoc:=u,cGRazsoc)},oDlg,100,010,'',,CLR_BLACK,CLR_WHITE,,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","cGRazsoc",,)
 */
