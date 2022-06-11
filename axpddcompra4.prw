#INCLUDE 'TOTVS.CH'

user function tlcompra()

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
 
    oBrowse := TSBrowse():New(30,10,220,100,oDlg,,16,,1)    
    oBrowse:setArray( aDados )
 
    oBrowse:addColumn( TCColumn():new( "Código", { || aDados[oBrowse:nAt, 1] },,,, "CENTER",, .F., .F.,,,, .F. ) )
    oBrowse:addColumn( TCColumn():new( "Fantasia", { || aDados[oBrowse:nAt, 2] },,,, "CENTER",, .F., .F.,,,, .F. ) )
    oBrowse:addColumn( TCColumn():new( "Razão Social", { || aDados[oBrowse:nAt, 3] },,,, "CENTER",, .F., .F.,,,, .F. ) )
    oBrowse:Refresh()
 
    oButton:= TButton():New(10,10,"Incluir",oDlg,{|u| fInclui()},40,15,,,,.t.)
    oButton:= TButton():New(10,55,"Alterar",oDlg,{|u| fAltera()},40,15,,,,.t.)
    oButton:= TButton():New(10,100,"Visualizar",oDlg,{||},40,15,,,,.t.)
    oButton:= TButton():New(10,145,"Outras ações",oDlg,{||},40,15,,,,.t.)
    oButton:= TButton():New(10,190,"Sair",oDlg,{||,oDlg:End()},40,15,,,,.t.)

oDlg:Activate()

return

Static Function fInclui()

Private cGCod      := Space(6)
Private cGNome     := Space(20)
Private cGEnde     := Space(30)

oDlg1      := MSDialog():New( 094,225,450,650,"Incluir",,,.F.,,,,,,.T.,,,.T. )

osCod      := TSay():New( 040,016,{||"Nº pedido"},oDlg1,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,040,008)
osNome     := TSay():New( 040,54,{||"Fantasia"},oDlg1,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,032,008)
oSEnd      := TSay():New( 040,126,{||"razão social"},oDlg1,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,032,008)

oGCod      := TGet():New( 052,016,{|u| If(PCount()>0,cGCod:=u,cGCod)},oDlg1,30,010,'',,CLR_BLACK,CLR_WHITE,,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","cGCod",,)
oGNome     := TGet():New( 052,54,{|u| If(PCount()>0,cGNome:=u,cGNome)},oDlg1,70,010,'',,CLR_BLACK,CLR_WHITE,,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","cGNome",,)
oGEnde     := TGet():New( 052,126,{|u| If(PCount()>0,cGEnde:=u,cGEnde)},oDlg1,100,010,'',,CLR_BLACK,CLR_WHITE,,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","cGEnde",,)

oBIncluir  	 := TButton():New( 10,16,"Incluir",oDlg1,{|u| adicionar(cGCod,cGNome,cGEnde), oDlg1:end(),u_tlcompra()},048,012,,,,.T.,,"",,,,.F. )

oDlg1:Activate(,,,.T.)

return

static function adicionar(codigo,fantasia,razao)
if Empty(Alltrim(codigo)) .Or. Empty(Alltrim(fantasia)) .Or. Empty(Alltrim(razao))
	Alert("EXISTEM CAMPOS VAZIOS, FAVOR PREENCHER!")
ELSE
	dbSelectArea("SC7")
		RecLock("SC7",.T.)  
    SC7->C7_NUM     := codigo
    SC7->C7_FORNECE := fantasia
    SC7-> C7_DESCRI := razao
	MsUnlock()

	MsgInfo("Inclusão concluída com sucesso!")
ENDIF
	dbCloseArea("SC7")
return

Static Function fAltera()

Private cGCod      := Space(6)
Private cGNome     := Space(20)
Private cGEnde     := Space(30)

oDlg1      := MSDialog():New( 094,225,450,650,"Alterar",,,.F.,,,,,,.T.,,,.T. )

osCod      := TSay():New( 010,016,{||"Nº pedido"},oDlg1,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,040,008)
osNome     := TSay():New( 010,54,{||"Fantasia"},oDlg1,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,032,008)
oSEnd      := TSay():New( 010,126,{||"razão social"},oDlg1,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,032,008)

oGCod      := TGet():New( 020,016,{|u| If(PCount()>0,cGCod:=u,cGCod)},oDlg1,30,010,'',,CLR_BLACK,CLR_WHITE,,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","cGCod",,)
oGNome     := TGet():New( 020,54,{|u| If(PCount()>0,cGNome:=u,cGNome)},oDlg1,70,010,'',,CLR_BLACK,CLR_WHITE,,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","cGNome",,)
oGEnde     := TGet():New( 020,126,{|u| If(PCount()>0,cGEnde:=u,cGEnde)},oDlg1,100,010,'',,CLR_BLACK,CLR_WHITE,,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","cGEnde",,)

oBAlterar  	 := TButton():New( 40,16,"Alterar",oDlg1,{|u| alterar(codg, fants, rzao), oDlg1:end(),u_tlcompra()},048,012,,,,.T.,,"",,,,.F. )

oDlg1:Activate(,,,.T.)
return


Static Function alterar(codg, fants, rzao)
dbSelectArea("SC7")
dbSetOrder(1)

if !(dbSeek(xFilial("SC7")+codg))
	Alert("Este registro não existe,"+Chr(13)+Chr(10)+"portanto não pode ser alterado!")
	dbCloseArea("SC7")
else
//GRAVA ALTERACAO NO BANCO DE DADOS	
	dbSelectArea("SC7")
		RecLock("SC7",.F.)  
		SC7->C7_NUM 	:= codg
		SC7->C7_FORNECE	:= fants
		SC7->C7_DESCRI 	:= rzao
	MsUnlock()
	dbCloseArea("SC7")	
	MsgInfo("Alteração concluída com sucesso!")
ENDIF


























/*
user function cadpc()

  Local cTitulo := "Pedidos de compra"
  Local cAlias := "SC7"
  Local cFunExc := "U_exclpc()"
  Local cFunAlt := "U_exsimOrn()"

  AxCadastro(cAlias, cTitulo, cFunExc, cFunAlt)
 
return

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

