Feature: Metodo post para cadastrar usuários

Background:
    * url 'http://localhost:3000'

@skipme
Scenario: Cadastrar usuario com sucesso com payload no corpo do teste 
    * def body = 
    """
    {
        "nome": "Fulano Silva",
        "email": "beltrano1@qa.com.br",
        "password": "teste",
        "administrador": "true"
    }
    """
    Given path '/usuarios'
    And request body
    When method Post
    Then status 201
    And match response.message == "Cadastro realizado com sucesso"

Scenario: Cadastrar usuario com body em json
   * def now = function(){ return java.lang.System.currentTimeMillis()} 
   * def body = read('classpath:/jsons/usuario.json')
   * set body.nome = 'maria'
   * set body.email = 'maria'+now()+'@qa.com.br'
   * set body.password = '123456'
   * set body.administrador = 'false'

   Given path '/usuarios'
   And request body
   When method Post 
   Then status 201
   And match response.message == "Cadastro realizado com sucesso"
