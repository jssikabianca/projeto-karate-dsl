Feature: Metodo get para listar usuários cadastrados

Background:
    * url 'http://localhost:3000'

#@smoke
Scenario: Listar todos os usuários
    Given path '/usuarios'
    When method get
    Then status 200

Scenario: Buscar nome específico
    Given path '/usuarios'
    And param nome = 'Fulano da Silva'
    When method get
    Then status 200


Scenario: Buscar nome e email específico
    Given path '/usuarios'
    And params {nome: 'Fulano da Silva', email: 'fulano@qa.com'}
    When method get
    Then status 200

Scenario: Buscar nome e email específico e validar o nome do usuário
    Given path '/usuarios'
    And params {nome: 'Fulano da Silva', email: 'fulano@qa.com'}
    When method get
    Then status 200
    And match response.usuarios[0].nome == 'Fulano da Silva'

Scenario: Buscar nome e email específico e verificar se algum é Fulano da Silva
    Given path '/usuarios'
    When method get
    Then status 200
    And match response.usuarios[*].nome contains 'Fulano da Silva'

Scenario: Verificar conteudo do response
    Given path '/usuarios'
    When method get
    Then status 200
    And match response.quantidade != '#null'
   # And match response.quantidade == 8
    And match response.quantidade != '#string'
    And match response.quantidade == "#number"



