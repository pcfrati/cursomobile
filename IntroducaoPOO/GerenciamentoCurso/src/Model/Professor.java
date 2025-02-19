package Model;

public class Professor extends Pessoa {
    //? atributos
    private double salario;

    //? métodos
    public Professor(String nome, String cpf, double salario) {
        super(nome, cpf);
        this.salario = salario;
    }

    // g&s
    public double getSalario() {
        return salario;
    }
    public void setSalario(double salario) {
        this.salario = salario;
    }

    // sobreescrita exibirInformacoes
    @Override
    public void exibirInformacoes(){
        super.exibirInformacoes();
        System.out.println("Salário: "+salario);
    }
}
