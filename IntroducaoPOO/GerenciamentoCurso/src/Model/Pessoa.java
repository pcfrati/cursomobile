package Model;

public abstract class Pessoa {
    //? atributos 
    private String nome;  // encapsulameto (private)
    private String cpf;

    //? métodos
    public Pessoa(String nome, String cpf){  // construtor (mesmo nome da classe)
        this.nome=nome;
        this.cpf=cpf;
    }

    //  getters (pegam informações/return) and setters (alteram informações/void)
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    // exibir ingormações
    public void exibirInformacoes(){
        System.out.println("Nome: "+nome);
        System.out.println("CPF: "+cpf);
    }

    
}
