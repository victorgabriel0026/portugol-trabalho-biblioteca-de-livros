algoritmo "Sistema de Biblioteca"
// Professor   : Vinicius Luchtenberg Pagnussat

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

   // Variaveis auxiliares
   i           : inteiro
   busca       : caractere
   encontrado  : logico
   posicao     : inteiro
   proxCodigo  : inteiro

// ============================================================
// PROCEDIMENTO: Inicializar dados
// ============================================================
procedimento inicializar()
inicio
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
   escreval("-------- MENU PRINCIPAL --------")
   escreval("  1 - Cadastrar livro")
   escreval("  2 - Cadastrar Usuário")
   escreval("  3 - Emprestar livro")
   escreval("  4 - Devolver livro")
   escreval("  5 - Consultar livro por titulo")
   escreval("  6 - Listar todos os livros")
   escreval("  7 - Consultar lista de empréstimos")
   escreval("  0 - Sair")
   escreval("--------------------------------")
   escreva("  Escolha uma opcao: ")
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
      nomeLeitor[totalLivros] := ""
      proxCodigo              := proxCodigo + 1

      escreval("")
      escreval("Livro cadastrado com sucesso!")
      escreval("Codigo atribuido: ", codigo[totalLivros])
   fimse
fimprocedimento

// ============================================================
// PROCEDIMENTO: Cadastrar Usuário
// ============================================================
procedimento cadastrarUsuario()
inicio
   limpatela
   escreval("===== CADASTRAR USUÁRIO =====")
   
      usuarios := usuarios + 1

      escreva("Nome do Usuário : ")
      leia(nome[usuarios])
      
      escreva("Senha : ")
      leia(senha[usuarios])

      escreva("Permissão           : ")
      leia(permissao[usuarios])

      disponivel[usuarios]    := verdadeiro

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
         escreval("  Status  : EMPRESTADO para ", nomeLeitor[posicao])
         escreval("")
         escreval("Este livro ja esta emprestado. Nao e possivel emprestar novamente.")
      senao
         escreval("  Status  : Disponivel")
         escreval("")
         escreva("Nome do leitor: ")
         leia(nomeLeitor[posicao])
         disponivel[posicao] := falso
         escreval("")
         escreval("Emprestimo realizado com sucesso!")
         escreval("Livro '", titulo[posicao], "' emprestado para ", nomeLeitor[posicao], ".")
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
         escreval("  Status  : Emprestado para ", nomeLeitor[posicao])
         escreval("")
         disponivel[posicao]  := verdadeiro
         nomeLeitor[posicao]  := ""
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
            escreval("  Status : Emprestado para ", nomeLeitor[i])
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
            escreval("      Status : Emprestado - ", nomeLeitor[i])
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
   cabecalho()
   escreval("Sistema iniciado com ", totalLivros, " livros pre-cadastrados.")

   repita
      exibirMenu()
      leia(opcao)

      escolha opcao
         caso 1
            cadastrarLivro()
         caso 2
            emprestarLivro()
         caso 3
            devolverLivro()
         caso 4
            consultarLivro()
         caso 5
            listarLivros()
         caso 6
            escreval("")
            escreval("Encerrando o sistema. Ate logo!")
         outrocaso
            escreval("")
            escreval("Opcao invalida! Digite um numero de 1 a 6.")
      fimescolha

   ate opcao = 7
fimalgoritmo
