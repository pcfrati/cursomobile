package View;

import java.util.Scanner;

import Controller.CursoController;
import Model.Aluno;
import Model.Professor;

public class CursoView {
    // ? atributos
    Professor JP = new Professor("Joao Pereira", "123.456.789-09", 15000.00);
    CursoController cursoJava = new CursoController("Programação", JP);

    private int operacao;
    private boolean continuar = true;
    Scanner sc = new Scanner(System.in);

    // ? métodos
    public void menu() {
        while (continuar) {
            System.out.println(" == Gerenciamento Curso ==");
            System.out.println("|     Escolha a opção:   |");
            System.out.println("|                        |");
            System.out.println("|1. Cadastrar Aluno      |");
            System.out.println("|2. Informações do Curso |");
            System.out.println("|3. Lançar Nota          |");
            System.out.println("|4. Status da Turma      |");
            System.out.println("|5. Sair                 |");
            System.out.println(" =========================");
            operacao = sc.nextInt();
            switch (operacao) {
                case 1:
                    Aluno aluno = cadastrarAluno();
                    cursoJava.adicionarAluno(aluno);
                    break;

                case 2:
                    cursoJava.exibirInformacoesCurso();
                    break;

                case 3:
                    break;

                case 4:
                    break;

                case 5:
                    System.out.println("Saindo...");
                    continuar = false;
                    break;

                default:
                    break;
            }
        }
    }

    public Aluno cadastrarAluno() {
        System.out.println("Digite o nome do aluno: ");
        String nome = sc.next();
        System.out.println("Informe o CPF do aluno: ");
        String cpf = sc.next();
        System.out.println("Informe a matrícula do aluno: ");
        String matricula = sc.next();
        return new Aluno(nome, cpf, matricula);
    }
}
