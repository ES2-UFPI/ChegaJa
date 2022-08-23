package com.tech.chegaJa.domain.form;

import com.tech.chegaJa.domain.model.Cliente;
import com.tech.chegaJa.domain.model.Pacote;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ClienteForm {
    private String nome;
    private String contato;
    private Long idEndereco;
    public Cliente toEntity() {
        Cliente cliente = new Cliente();
        cliente.setNome(nome);
        cliente.setContato(contato);
        return cliente;
    }
    //comentario
}
