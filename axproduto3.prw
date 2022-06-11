#INCLUDE 'TOTVS.CH'


user function cadpro()

  Local cTitulo := "Cadastro de produtos"
  Local cAlias := "SB1"
  Local cFunExc := "U_exclprod()"
  Local cFunAlt := "U_exsimOrn"

  AxCadastro(cAlias, cTitulo, cFunExc, cFunAlt)
 
return

static function exclprod()
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


