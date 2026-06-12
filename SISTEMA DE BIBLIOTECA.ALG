algoritmo "Sistema de Biblioteca"
//
//
// Disciplina   : VisuAlg
// Professor   : Vinicius
// Alunos   : Vinicius Luchtenberg, Mikael, Endrel, Victor Gabriel

// ============================================================
//  SISTEMA DE BIBLIOTECA - Portugol (VisuAlg)
//  Funcionalidades:
//    1. Cadastrar livro
//    2. Cadastrar Usuário
//    3. Emprestar livro
//    4. Devolver livro
//    5. Consultar livro por titulo
//    6. Listar todos os livros
//    7. Lista de Empréstimos
//    0. Sair
// ============================================================

const
   MAX = 50
var
   // Dados dos livros
   titulo      : vetor [1..MAX] de caractere
   autor       : vetor [1..MAX] de caractere
   codigo      : vetor [1..MAX] de inteiro
   disponivel  : vetor [1..MAX] de logico
   nomePessoa  : vetor [1..MAX] de caractere

   totalLivros : inteiro
   opcao       : inteiro
   //variaveis de usuario

   quantidade_usuarios : inteiro
   usuarios            : vetor [1..MAX] de caractere
   senha_usuarios      : vetor [1..MAX] de caractere
   permissao_usuarios  : vetor [1..MAX] de inteiro
   usuario_logado      : caractere
   permissao_logada    : inteiro
   login_ok            : logico

   // Variaveis auxiliares
   i           : inteiro
   busca       : caractere
   encontrado  : logico
   posicao     : inteiro
   proxCodigo  : inteiro

   // ============================================================
   // PROCEDIMENTO: Tela de Login
   // ============================================================

procedimento login()
var
   nome_digitado  : caractere
   senha_digitada : caractere
   i              : inteiro
inicio
   login_ok := falso

   repita
      limpatela
      escreval("========================================")
      escreval("           TELA DE LOGIN")
      escreval("========================================")

      escreva("Usuario: ")
      leia(nome_digitado)

      escreva("Senha: ")
      leia(senha_digitada)

      login_ok := falso

      para i de 1 ate quantidade_usuarios faca
         se (usuarios[i] = nome_digitado) e (senha_usuarios[i] = senha_digitada) entao
            login_ok := verdadeiro
            usuario_logado := usuarios[i]
            permissao_logada := permissao_usuarios[i]
         fimse
      fimpara

      se login_ok = falso entao
         escreval("")
         escreval("Usuario ou senha incorretos!")
         escreval("Pressione ENTER para tentar novamente...")
         leia(nome_digitado)
      fimse

   ate login_ok = verdadeiro

   escreval("")
   escreval("Login realizado com sucesso!")
   escreval("Bem-vindo, ", usuario_logado)
fimprocedimento

// ============================================================
// PROCEDIMENTO: Inicializar dados
// ============================================================
procedimento inicializar()
inicio
   quantidade_usuarios := 1

   usuarios[1] := "LabvgAdmin"
   senha_usuarios[1] := "123456"
   permissao_usuarios[1] := 1  // 1 = ADMIN

   totalLivros := 0
   proxCodigo  := 1001

   totalLivros := 5

   titulo[1]     := "Dom Casmurro"
   autor[1]      := "Machado de Assis"
   codigo[1]     := 1001
   disponivel[1] := verdadeiro
   nomePessoa[1] := ""

   titulo[2]     := "O Cortico"
   autor[2]      := "Aluisio Azevedo"
   codigo[2]     := 1002
   disponivel[2] := verdadeiro
   nomePessoa[2] := ""

   titulo[3]     := "Vidas Secas"
   autor[3]      := "Graciliano Ramos"
   codigo[3]     := 1003
   disponivel[3] := verdadeiro
   nomePessoa[3] := ""

   titulo[4]     := "A Moreninha"
   autor[4]      := "Joaquim Manuel de Macedo"
   codigo[4]     := 1004
   disponivel[4] := verdadeiro
   nomePessoa[4] := ""

   titulo[5]     := "O Guarani"
   autor[5]      := "Jose de Alencar"
   codigo[5]     := 1005
   disponivel[5] := verdadeiro
   nomePessoa[5] := ""

   proxCodigo := 1006
fimprocedimento

// ============================================================
// PROCEDIMENTO: Exibir cabecalho
// ============================================================
procedimento cabecalho()
inicio
   limpatela
   escreval("========================================")
   escreval("               BookManager              ")
   escreval("========================================")
fimprocedimento

// ============================================================
// PROCEDIMENTO: Exibir menu
// ============================================================
procedimento exibirMenu()
inicio
   escreval("")
   escreval("Usuario logado: ", usuario_logado)

   se permissao_logada = 1 entao
      // ADMIN
      escreval("-------- MENU ADMIN --------")
      escreval("  1 - Cadastrar livro")
      escreval("  2 - Usuarios")
      escreval("  3 - Emprestar livro")
      escreval("  4 - Devolver livro")
      escreval("  5 - Consultar livro por titulo")
      escreval("  6 - Listar todos os livros")
      escreval("  7 - Sair")
      escreval("----------------------------")
   senao
      // ATENDENTE
      escreval("------ MENU ATENDENTE ------")
      escreval("  1 - Cadastrar livro")
      escreval("  3 - Emprestar livro")
      escreval("  4 - Devolver livro")
      escreval("  5 - Consultar livro por titulo")
      escreval("  6 - Listar todos os livros")
      escreval("  7 - Sair")
      escreval("----------------------------")
   fimse

   escreva("Escolha uma opcao: ")
fimprocedimento

// ============================================================
// PROCEDIMENTO: Cadastrar livro
// ============================================================
procedimento cadastrarLivro()
inicio
   limpatela
   escreval("===== CADASTRAR LIVRO =====")

   se totalLivros >= MAX entao
      escreval("ATENCAO: Acervo cheio! Nao e possivel cadastrar mais livros.")
   senao
      totalLivros := totalLivros + 1

      escreva("Titulo do livro : ")
      leia(titulo[totalLivros])

      escreva("Autor           : ")
      leia(autor[totalLivros])

      codigo[totalLivros]     := proxCodigo
      disponivel[totalLivros] := verdadeiro
      nomePessoa[totalLivros] := ""
      proxCodigo              := proxCodigo + 1

      escreval("")
      escreval("Livro cadastrado com sucesso!")
      escreval("Codigo atribuido: ", codigo[totalLivros])
   fimse
fimprocedimento

// ============================================================
// PROCEDIMENTO: Tela de Usuário
// ============================================================
procedimento Usuario()
inicio
   limpatela
   escreval("-------- USUÁRIO --------")
   escreval(" 1 - Trocar usuário")
   escreval(" 2 - Cadastrar Usuário")
   escreval(" 3 - Voltar")
   escreval("--------------------------")

   leia(opcao)

   escolha opcao
   caso 1
      trocarUsuario()
   caso 2
      cadastrarUsuario()
   caso 3
      exibirMenu()
   fimescolha

fimprocedimento

// ============================================================
// PROCEDIMENTO: Trocar de Usuário
// ============================================================

procedimento trocarUsuario()

var
   i, escolhe : inteiro
      senha_digitada : caractere
inicio
   limpatela
   escreval("===== TROCAR USUARIO =====")

   se quantidade_usuarios = 0 entao
      escreval("Nao ha usuarios cadastrados.")
      retorne
   fimse

   escreval("")
   escreval("Usuarios disponiveis:")

   para i de 1 ate quantidade_usuarios faca
      escreval(i, " - ", usuarios[i])
   fimpara

   escreval("")
   escreva("Escolha o numero do usuario: ")
   leia(escolhe)

   se (escolhe < 1) ou (escolhe > quantidade_usuarios) entao
      escreval("Usuario invalido!")
   senao
      escreva("Digite a senha: ")
      leia(senha_digitada)

      se senha_digitada = senha_usuarios[escolhe] entao
         usuario_logado := usuarios[escolhe]
            permissao_logada := permissao_usuarios[escolhe]

               escreval("")
               escreval("Usuario alterado com sucesso!")
               escreval("Usuario atual: ", usuario_logado)

               se permissao_logada = 1 entao
                  escreval("Permissao: ADMIN")
               senao
                  escreval("Permissao: ATENDENTE")
               fimse
            senao
               escreval("")
               escreval("Senha incorreta!")
            fimse
         fimse
fimprocedimento

// ============================================================
// PROCEDIMENTO: Cadastra Usuário
// ============================================================

procedimento cadastrarUsuario()
inicio
   limpatela
   escreval("===== CADASTRAR USUÁRIO =====")
   se quantidade_usuarios >= MAX entao
      escreval("ATENCAO: Quantidade de usuario cheio! Nao e possivel cadastrar mais usuarios.")
   senao
      quantidade_usuarios := quantidade_usuarios + 1

      escreva("Nome do Usuário : ")
      leia(usuarios[quantidade_usuarios])

      escreva("Senha : ")
      leia(senha_usuarios[quantidade_usuarios])

      escreva("Permissão (1-Admin / 0-Atendente): ")
      leia(permissao_usuarios[quantidade_usuarios])

      escreval("")
      escreval("Usuário cadastrado com sucesso!")
   fimse
fimprocedimento

// ============================================================
// PROCEDIMENTO: Emprestar livro
// ============================================================
procedimento emprestarLivro()
inicio
   limpatela
   escreval("===== EMPRESTAR LIVRO =====")

   escreva("Digite o titulo do livro: ")
   leia(busca)

   encontrado := falso
   posicao    := 0

   para i de 1 ate totalLivros faca
      se titulo[i] = busca entao
         encontrado := verdadeiro
         posicao    := i
      fimse
   fimpara

   se nao encontrado entao
      escreval("Livro nao encontrado no acervo.")
   senao
      escreval("")
      escreval("Livro encontrado!")
      escreval("  Titulo  : ", titulo[posicao])
      escreval("  Autor   : ", autor[posicao])
      escreval("  Codigo  : ", codigo[posicao])

      se nao disponivel[posicao] entao
         escreval("  Status  : EMPRESTADO para ", nomePessoa[posicao])
         escreval("")
         escreval("Este livro ja esta emprestado. Nao e possivel emprestar novamente.")
      senao
         escreval("  Status  : Disponivel")
         escreval("")
         escreva("Nome do leitor: ")
         leia(nomePessoa[posicao])
         disponivel[posicao] := falso
         escreval("")
         escreval("Emprestimo realizado com sucesso!")
         escreval("Livro '", titulo[posicao], "' emprestado para ", nomePessoa[posicao], ".")
      fimse
   fimse
fimprocedimento

// ============================================================
// PROCEDIMENTO: Devolver livro
// ============================================================
procedimento devolverLivro()
inicio
   limpatela
   escreval("===== DEVOLVER LIVRO =====")

   escreva("Digite o titulo do livro: ")
   leia(busca)

   encontrado := falso
   posicao    := 0

   para i de 1 ate totalLivros faca
      se titulo[i] = busca entao
         encontrado := verdadeiro
         posicao    := i
      fimse
   fimpara

   se nao encontrado entao
      escreval("Livro nao encontrado no acervo.")
   senao
      escreval("")
      escreval("Livro encontrado!")
      escreval("  Titulo  : ", titulo[posicao])
      escreval("  Autor   : ", autor[posicao])
      escreval("  Codigo  : ", codigo[posicao])

      se disponivel[posicao] entao
         escreval("  Status  : Disponivel")
         escreval("")
         escreval("Este livro nao esta emprestado. Nao ha devolucao a registrar.")
      senao
         escreval("  Status  : Emprestado para ", nomePessoa[posicao])
         escreval("")
         disponivel[posicao]  := verdadeiro
         nomePessoa[posicao]  := ""
         escreval("Devolucao registrada com sucesso!")
         escreval("Livro '", titulo[posicao], "' devolvido ao acervo.")
      fimse
   fimse
fimprocedimento

// ============================================================
// PROCEDIMENTO: Consultar livro por titulo
// ============================================================
procedimento consultarLivro()
inicio
   limpatela
   escreval("===== CONSULTAR LIVRO =====")

   escreva("Digite o titulo do livro: ")
   leia(busca)

   encontrado := falso

   para i de 1 ate totalLivros faca
      se titulo[i] = busca entao
         encontrado := verdadeiro
         escreval("")
         escreval("------ Informacoes do Livro ------")
         escreval("  Codigo : ", codigo[i])
         escreval("  Titulo : ", titulo[i])
         escreval("  Autor  : ", autor[i])

         se disponivel[i] entao
            escreval("  Status : Disponivel para emprestimo")
         senao
            escreval("  Status : Emprestado para ", nomePessoa[i])
         fimse

         escreval("----------------------------------")
      fimse
   fimpara

   se nao encontrado entao
      escreval("Livro nao encontrado no acervo.")
   fimse
fimprocedimento

// ============================================================
// PROCEDIMENTO: Listar todos os livros
// ============================================================
procedimento listarLivros()
inicio
   limpatela
   escreval("===== ACERVO COMPLETO =====")

   se totalLivros = 0 entao
      escreval("Nenhum livro cadastrado no acervo.")
   senao
      escreval("Total de livros: ", totalLivros)
      escreval("")

      para i de 1 ate totalLivros faca
         escreval("------------------------------------------")
         escreval("  [", i, "] Codigo : ", codigo[i])
         escreval("      Titulo : ", titulo[i])
         escreval("      Autor  : ", autor[i])

         se disponivel[i] entao
            escreval("      Status : Disponivel")
         senao
            escreval("      Status : Emprestado - ", nomePessoa[i])
         fimse
      fimpara

      escreval("------------------------------------------")
   fimse
fimprocedimento

// ============================================================
// INICIO DO PROGRAMA PRINCIPAL
// ============================================================
inicio
   inicializar()
   login()
   cabecalho()
   escreval("Sistema iniciado com ", totalLivros, " livros pre-cadastrados.")

   repita
      exibirMenu()
      leia(opcao)

      escolha opcao
      caso 1
         cadastrarLivro()
      caso 2
         Usuario()
      caso 3
         emprestarLivro()
      caso 4
         devolverLivro()
      caso 5
         consultarLivro()
      caso 6
         listarLivros()
      caso 7
         escreval("")
         escreval("Encerrando o sistema. Ate logo!")
      outrocaso
         escreval("")
         escreval("Opcao invalida! Digite um numero de 1 a 8.")
      fimescolha

   ate opcao = 7
fimalgoritmo
