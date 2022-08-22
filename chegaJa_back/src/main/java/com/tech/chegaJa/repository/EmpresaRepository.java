package com.tech.chegaJa.repository;

import com.tech.chegaJa.domain.model.Empresa;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EmpresaRepository extends JpaRepository<Empresa, Long> {
}
