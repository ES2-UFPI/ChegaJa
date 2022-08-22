package com.tech.chegaJa.domain.form;

import com.tech.chegaJa.domain.model.Empresa;
import com.tech.chegaJa.domain.model.Endereco;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EnderecoForm {
    private String bairro;
    private String logradouro;
    private String complemento;
    private String cep;
    private String longitude;
    private String latitude;
    private String uf;
    private String numeroCasa;

    public Endereco toEntity() {
        Endereco endereco = new Endereco();
        endereco.setBairro(this.bairro);
        endereco.setCep(this.getCep());
        endereco.setComplemento(this.getComplemento());
        endereco.setLatitude(this.getLatitude());
        endereco.setLongitude(this.getLongitude());
        endereco.setLogradouro(this.getLogradouro());
        endereco.setUf(this.getUf());
        endereco.setNumeroCasa(this.getNumeroCasa());
        return endereco;
    }
}
