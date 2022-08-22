package com.tech.chegaJa.repository;

import com.tech.chegaJa.domain.form.DadoBancarioForm;
import com.tech.chegaJa.domain.model.DadosBancario;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DadoBancarioRepository extends JpaRepository<DadosBancario,Long> {
}
