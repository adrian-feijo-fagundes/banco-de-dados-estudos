# Subconsultas e Cláusula HAVING

## Subconsultas

```sql
SELECT nome, salario
FROM empregados
WHERE salario > (SELECT AVG(salario) FROM empregados);
```

## Cláusula HAVING

```sql
SELECT departamentos.nome, AVG(cargos.salario)
FROM empregados
JOIN cargos ON empregados.departamento_id = cargos.departamento_id
GROUP BY departamentos.nome
HAVING AVG(cargos.salario) > 5000.00;
```

