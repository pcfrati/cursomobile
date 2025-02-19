package Model;

public class Aluno extends Pessoa {
    //? atributos
    private String matricula;
    private double nota;

    //? métodos
    public Aluno(String nome, String cpf, String matricula) {
        super(nome, cpf);
        this.matricula = matricula;
    }

    // g&s
    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public double getNota() {
        return nota;
    }

    public void setNota(double nota) {
        this.nota = nota;
    }

    // sobreescrita exibirInformacoes
    @Override
    public void exibirInformacoes(){
        super.exibirInformacoes();
        System.out.println("Matrícula: "+matricula);
        System.out.println("Nota: "+nota);
    }
    
    
}
    