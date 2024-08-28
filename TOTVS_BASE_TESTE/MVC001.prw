#Include "Protheus.ch"
#Include "FwMVCDef.ch"

/*/(Protheus.doc) MVC001
Exemplo 01 de Tela MVC

@author Ibson Vieira 
@since 09/06/2024
/*/



User Function MVC001()

    //-- FwMBrowse():New() -- cria um container no tamanho da Tela do Computador e todos objetos criados estará dentro deste container
    Local oBrowse   := FwMBrowse():New()
    
    oBrowse:SetAlias('SZ0')
    oBrowse:SetDescription('Cadastro de Carteira de Clientes')
    oBrowse:Activate()

Return


Static Function ModelDef()

    //-- FWFormStruct() -- refere-se a uma funçao de Estrutura de Formulário. 1º parãmentro: 1 -> construe o modelo, 2 -> construe view || 2º parâmetro: 'SZ0' -> alias da tabela  
    Local oStrutSZ0 := FWFormStruct(1,'SZ0')
    Local oModel

    oModel := MPFormModel():New("SZ0MASTER")
    oModel:AddFields('SZ0MASTER', /*cOwner*/, oStrutSZ0)
    oModel:SetDescription('Modelo de dados de Carteiras')
    oModel:GetModel('SZ0MASTER'):SetDescription('Dados de Clientes')

Return oModel


Static Function ViewDef()

    //-- FWLoadModel() -- refere-se a uma função que carrega o modelo. Sendo o parâmetro: 'MVC001' -> o nome do próprio arquivo PRW que também será o nome principal da USER FUNCTION
    //-- FWFormStruct() -- refere-se a uma funçao de Estrutura de Formulário. 1º parãmentro: 2 -> construe o view || 2º parâmetro: 'MVC001' -> nome do PRW
    Local oModel    := FWLoadModel('MVC001')
    Local oStrutSZ0 := FWFormStruct(2, 'SZ0')
    Local oView

    oView := FWFormView():New()
    oView:SetModel(oModel)
    oView:AddField('VIEW_SZ0', oStrutSZ0, 'SZ0MASTER')
    oView:CreateHorizontalBox('TELA', 100)
    oView:SetOwnerView('VIEW_SZ0', 'TELA')

Return oView



Static Function MenuDef()

    Local aRotina := {}
    
    ADD OPTION aRotina Title 'Incluir'      Action 'VIEWDEF.MVC001' OPERATION 3 ACCESS 0
    ADD OPTION aRotina Title 'Alterar'      Action 'VIEWDEF.MVC001' OPERATION 4 ACCESS 0
    ADD OPTION aRotina Title 'Visualizar'   Action 'VIEWDEF.MVC001' OPERATION 2 ACCESS 0
    ADD OPTION aRotina Title 'Excluir'      Action 'VIEWDEF.MVC001' OPERATION 5 ACCESS 0
    ADD OPTION aRotina Title 'Imprimir'     Action 'VIEWDEF.MVC001' OPERATION 8 ACCESS 0
    ADD OPTION aRotina Title 'Copiar'       Action 'VIEWDEF.MVC001' OPERATION 9 ACCESS 0

Return aRotina
