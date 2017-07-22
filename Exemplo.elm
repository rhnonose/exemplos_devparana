module Exemplo exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import String

-- Boostrap
import Bootstrap.CDN as CDN
import Bootstrap.Grid as Grid
import Bootstrap.ListGroup as ListGroup
import Bootstrap.Button as Button
import Bootstrap.Card as Card


main =
  beginnerProgram { model = init, view = view, update = update }

init = {nome = "", titulo = "", foto = "", descricao = ""}

type alias Model = Palestrante

type Msg = Seleciona Palestrante
  | Esconde

type alias Palestrante =
  { nome : String
  , titulo : String
  , descricao : String
  , foto : String
  }

update msg model =
  case msg of
    Seleciona palestrante -> palestrante
    Esconde -> init


view : Model -> Html Msg
view model =
  Grid.container []
    [ CDN.stylesheet
    , Grid.row []
      [ Grid.col [] (highlight model)
      , Grid.col [] [ lista ]
      ]
    ]

highlight model =
  case model.nome of
    "" -> []
    _ -> [card model]

lista =
  ListGroup.custom (List.map linha palestrantes)

linha palestrante =
  ListGroup.button [] [
    div
      [ onClick (Seleciona palestrante) ]
      [ text palestrante.nome ]
  ]

card palestrante =
  Card.config []
        |> Card.header [ class "text-center"]
          [ img [ src palestrante.foto ] []
          , h3 [] [ text palestrante.nome ]
          ]
        |> Card.block [] [ Card.text [] [ text palestrante.titulo ] ]
        |> Card.block [] [ Card.text [] [ text palestrante.descricao ] ]
        |> Card.footer []
            [ Button.button [ Button.onClick Esconde ] [ text "Esconde"] ]
        |> Card.view

palestrantes =
  [ {nome = "Edson Yanaga", titulo = "Dados e Microservices: lidando com bancos legados na era de serviços distribuídos", foto = "fotos/yanaga.jpg", descricao = "Nas arquiteturas de microservices, com suas múltiplas partes distribuídas e interconectadas, não podemos permitir que o downtime gerado por um único componente derrube o sistema inteiro. Isso é especialmente delicado em sistemas usando bancos legados, originados de arquiteturas monolíticas. No legado um modelo dominante é o baseado em transações, consistência forte e CRUD. E para garantir integridade e consistência sem gerar downtime, é necessário rever esses conceitos. Nesta palestra discutiremos consistência eventual e consistência forte, CQRS e Event Sourcing, e como essas técnicas se relacionam e se aplicam em estratégias de integração e evolução de dados relacionais, no contexto de microservices. Vamos explorar Views, Materialized Views, Mirror Tables,Streaming e Data Virtualization, e como seu uso viabiliza arquiteturas eficazes baseadas em microservices, partindo de um legado monolítico e de BDs relacionais tradicionais."}
  , {nome = "Otavio Santana", titulo = "Cassandra – NoSQL, NoLimits!", foto = "fotos/otavio.jpg", descricao = "Apache Cassandra é um altamente escalável, alta performance, banco de dados distribuído e desenhado para um alto volume de dados com alta disponibilidade sem pontos de falha. Cassandra tem comportamentos particulares como User Defined Type, Cassandra Query language e nível de consistência que faz o Cassandra único. Essa apresentação cobrirá sobre esse banco de dados, arquitetura, boas práticas e quando e como utilizar essa tecnologia de banco de dados."}
  , {nome = "Gustavo Costa", titulo = "Change detection em Angular e sua reinvenção", foto = "fotos/gustavo.jpg", descricao = "{{binding}} de dados na view é uma caracteristica que qualquer framework front-end moderno possui e que hoje não conseguimos viver sem, mas como o Angular sabe como e quando atualizar esses valores? Parece mágica, mas envolve event loop, zones, assincronismo, dados imutaveis, programação reativa, codigo monomórfico... Mas por que eu preciso saber o que há/acontece debaixo do capô? Nós iremos entender os milhares benefícios de ter uma detecção de mudança mais inteligente utilizando todos os recursos que a nova versão do framework disponibiliza para nós, e claro o quanto isso irá impactar na performance da sua aplicação"}
  , {nome = "Jeferson Fernando Noronha", titulo = "Descomplicando o Docker", foto = "fotos/jeferson.jpg", descricao = "Vamos abordar de maneira muito leve e divertida tudo o que você precisa saber para criar, administrar e escalar containers utilizando Docker! Traga seu notebook, pois como sempre será prático! #VAIIII"}
  , {nome = "Leonardo Saraiva", titulo = "Liberdade e escalabilidade: Microserviços, Kubernetes, gRPC e Docker", foto = "fotos/vyper.jpg", descricao = "Usando Kubernetes e Docker é possível entregar uma arquitetura de microserviços, multi cloud e encontrar a felicidade em forma de escalabilidade e liberdade, sem ficar amarrado e dependente das 'mágicas' de um PaaS."}
  , {nome = "Rodrigo Nonose", titulo = "Programação Funcional na web com Elixir e Elm", foto = "fotos/nonose.jpg", descricao = "O paradigma funcional está cada vez mais em vista recentemente e com boa razão: diversas linguagens e frameworks têm trazido um ponto de vista diferente para se resolver os problemas inerentes do desenvolvimento web. Nesta apresentação, pretende-se ilustrar conceitualmente como o as linguagens Elixir (backend) e Elm (frontend) resolvem os problemas mais comuns de uma maneira elegante e compreensível."}
  , {nome = "Raphael Amorim", titulo = "Merging Products with Components", foto = "fotos/raphael.jpg", descricao = "Nesta palestra, veremos o case da plataforma de vídeos da globo.com, onde em diversos produtos com times diferentes havia a necessidade de unificar tanto componentes visuais quanto fonte de dados (que são baseadas em APIs diferentes, de produtos diferentes [globoplay, globosatplay, sportv, telecine…]), logo surgiu uma plataforma de componentes dentro da área de vídeos da globo.com. A ideia é contar sobre as escolhas de arquitetura e de nível técnico voltadas para atender diversos produtos, times, fontes de dados."}
  , {nome = "Sebastian Ferrari", titulo = "Redux to the bones", foto = "fotos/sebastian.jpg", descricao = "O bom funcionamento das aplicações no front-end dependem de uma arquitetura que permita lidar com todos os eventos e interações complexas que seus usuários realizam. Se você já tentou usar algo como MVC, MV* ou Flux, pode ser que tenha ouvido falar do Redux ou já esteja usando. Saiba como realmente funciona e descubra os paradigmas da programação funcional utilizados na sua criação. Quais são seus benefícios, e entenda porque precisa gerenciar o estado de sua aplicação de maneira previsível. Para entender melhor como o Redux funciona, vamos criar uma versão simples do Redux, desde a criação da Store até os Enahancers passando por Middlewares e seus Reducers."}
  ]
