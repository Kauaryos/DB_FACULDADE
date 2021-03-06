USE db_faculdade;

ALTER TABLE
	departamento MODIFY nome_departamento CHAR(20) NOT NULL;

ALTER TABLE
	professor MODIFY nome_professor CHAR(20) NOT NULL,
	MODIFY sobrenome_professor CHAR(50) NOT NULL,
	MODIFY fk_cod_departamento INT(4),
	MODIFY status BOOLEAN;

ALTER TABLE
	disciplina MODIFY cod_disciplina INTEGER(4) AUTO_INCREMENT,
	MODIFY carga_horaria INTEGER(4) NOT NULL,
	MODIFY num_alunos INTEGER(4) NOT NULL,
	MODIFY fk_cod_departamento INTEGER(4) NOT NULL;

ALTER TABLE
	telefone MODIFY cod_telefone INTEGER(4) AUTO_INCREMENT,
	MODIFY numero_telefone CHAR(20);

ALTER TABLE
	endereco MODIFY cod_endereco INT(4) AUTO_INCREMENT,
	MODIFY nome_rua char(50) NOT NULL,
	MODIFY numero_rua INT(4) NOT NULL,
	MODIFY CEP CHAR(8) NOT NULL,
	MODIFY complemento CHAR(20) NULL,
	MODIFY fk_cod_tipo_logradouro INT(4) NOT NULL;

ALTER TABLE
	aluno MODIFY RA INT(4) AUTO_INCREMENT;

ALTER TABLE
	historico MODIFY cod_historico INT(4) AUTO_INCREMENT,
	MODIFY fk_RA INT(4) NOT NULL;

ALTER TABLE
	professor_disciplina MODIFY fk_cod_professor INT(4) NOT NULL,
	MODIFY fk_cod_disciplina INT(4) NOT NULL;

ALTER TABLE
	curso_disciplina MODIFY fk_cod_curso INT(4) NOT NULL,
	MODIFY fk_cod_disciplina INT(4) NOT NULL;

ALTER TABLE
	disciplina_historico MODIFY fk_cod_disciplina INT(4) NOT NULL,
	MODIFY fk_cod_historico INT(4) NOT NULL;

ALTER TABLE
	aluno_disciplina MODIFY fk_RA INT(4) NOT NULL,
	MODIFY fk_cod_disciplina INT(4) NOT NULL;
