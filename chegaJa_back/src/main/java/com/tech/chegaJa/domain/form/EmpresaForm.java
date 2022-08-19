package com.tech.chegaJa.domain.form;

import com.tech.chegaJa.domain.model.Empresa;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EmpresaForm {
    private String email;
    private String senha;
    private String telefone;
    private String cnpj;
    private String nome;

    public Empresa toEntity(){
        Empresa empresa = new Empresa();
        empresa.setEmail(this.email);
        empresa.setSenha(this.senha);
        empresa.setTelefone(this.telefone);
        empresa.setCnpj(this.cnpj);
        empresa.setNome(this.nome);
        return empresa;
    }
}
