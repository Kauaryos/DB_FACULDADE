CREATE DATABASE IF NOT EXISTS faculdade DEFAULT CHARSET utf8mb4 DEFAULT COLLATE utf8mb4_0900_ai_ci;

USE faculdade;

CREATE TABLE IF NOT EXISTS tipo_logradouro (
	cod_tipo_logradouro INTEGER(4) NOT NULL AUTO_INCREMENT,
	tipo_logradouro CHAR(11) NOT NULL,
	PRIMARY KEY (cod_tipo_logradouro)
);

CREATE TABLE IF NOT EXISTS tipo_telefone (
	cod_tipo_telefone INT(4) AUTO_INCREMENT NOT NULL,
	tipo_telefone CHAR(8),
	PRIMARY KEY (cod_tipo_telefone)
);

CREATE TABLE IF NOT EXISTS departamento (
	cod_departamento INT(15) AUTO_INCREMENT NOT NULL,
	nome_departamento CHAR(20),
	PRIMARY KEY (cod_departamento)
);

CREATE TABLE IF NOT EXISTS professor (
	cod_professor INT(15) PRIMARY KEY AUTO_INCREMENT NOT NULL,
	fk_cod_departamento INT(15),
	nome CHAR(20),
	sobrenome CHAR(20),
	status VARCHAR (15),
	FOREIGN KEY (fk_cod_departamento) REFERENCES departamento (cod_departamento)
);

CREATE TABLE IF NOT EXISTS disciplina (
	cod_disciplina INTEGER(4) NOT NULL AUTO_INCREMENT,
	nome_disciplina CHAR(20),
	carga_horaria INTEGER(4),
	descricao CHAR(50),
	num_alunos INTEGER(4),
	fk_cod_departamento INTEGER(4),
	PRIMARY KEY (cod_disciplina),
	FOREIGN KEY (fk_cod_departamento) REFERENCES departamento (cod_departamento)
);

CREATE TABLE IF NOT EXISTS professor_disciplina (
	fk_cod_professor INT(15),
	fk_cod_departamento INT(15),
	PRIMARY KEY (fk_cod_professor, fk_cod_departamento),
	FOREIGN KEY (fk_cod_professor) REFERENCES professor (cod_professor),
	FOREIGN KEY (fk_cod_departamento) REFERENCES departamento (cod_departamento)
);

CREATE TABLE IF NOT EXISTS curso (
	cod_curso INT(15) PRIMARY KEY AUTO_INCREMENT NOT NULL,
	fk_cod_departamento INT(15),
	nome CHAR(10),
	FOREIGN KEY (fk_cod_departamento) REFERENCES departamento (cod_departamento)
);

CREATE TABLE IF NOT EXISTS curso_disciplina (
	fk_cod_curso INT(15),
	fk_cod_disciplina INT(15),
	PRIMARY KEY (fk_cod_curso, fk_cod_disciplina),
	FOREIGN KEY (fk_cod_curso) REFERENCES curso (cod_curso),
	FOREIGN KEY (fk_cod_disciplina) REFERENCES disciplina (cod_disciplina)
);

CREATE TABLE IF NOT EXISTS turma (
	cod_turma INT(15) PRIMARY KEY AUTO_INCREMENT NOT NULL,
	periodo CHAR(15),
	numero_aluno CHAR(20),
	dt_inicio DATE,
	dt_fim DATE,
	fk_cod_curso INT(15),
	FOREIGN KEY (fk_cod_curso) REFERENCES curso (cod_curso)
);

CREATE TABLE IF NOT EXISTS endereco (
	cod_endereco INT(4) PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nome_rua char(50),
	numero_rua INT(4),
	bairro CHAR(20),
	CEP CHAR(8),
	complemento CHAR(20),
	fk_cod_tipo_logradouro INT(4),
	FOREIGN KEY (fk_cod_tipo_logradouro) REFERENCES tipo_logradouro (cod_logradouro)
);

CREATE TABLE IF NOT EXISTS aluno (
	RA INT(4) PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nome CHAR(20),
	sobrenome CHAR(35),
	CPF INT(15),
	RG INT(15),
	whatsapp CHAR(20),
	status BOOLEAN,
	sexo CHAR(1),
	nome_pai CHAR(20),
	nome_mae CHAR(20),
	email CHAR(50),
	fk_cod_curso INT(15),
	fk_cod_turma INT(15),
	fk_cod_endereco INT(15),
	FOREIGN KEY (fk_cod_turma) REFERENCES turma (cod_turma),
	FOREIGN KEY (fk_cod_curso) REFERENCES curso (cod_curso),
	FOREIGN KEY (fk_cod_endereco) REFERENCES endereco (cod_endereco)
);

CREATE TABLE IF NOT EXISTS aluno_disciplina (
	fk_RA INT(4),
	fk_cod_disciplina INT(15),
	PRIMARY KEY (fk_RA, fk_cod_disciplina),
	FOREIGN KEY (fk_RA) REFERENCES aluno (RA),
	FOREIGN KEY (fk_cod_disciplina) REFERENCES disciplina (cod_disciplina)
);

CREATE TABLE IF NOT EXISTS telefone (
	cod_telefone INTEGER(4) NOT NULL AUTO_INCREMENT,
	numero_telefone CHAR(20) NOT NULL,
	fk_cod_tipo INTEGER(4),
	PRIMARY KEY (cod_telefone),
	FOREIGN KEY (fk_cod_tipo) REFERENCES tipo_telefone (cod_tipo)
);

CREATE TABLE IF NOT EXISTS telefone_aluno (
	cod_tel_aluno INT(4) PRIMARY KEY AUTO_INCREMENT NOT NULL,
	fk_RA INT(4),
	fk_cod_telefone INT(4),
	FOREIGN KEY (fk_RA) REFERENCES aluno (RA),
	FOREIGN KEY (fk_cod_telefone) REFERENCES telefone (cod_telefone)
);

CREATE TABLE IF NOT EXISTS historico (
	cod_historico INT(15) PRIMARY KEY AUTO_INCREMENT NOT NULL,
	dt_inicio DATE,
	dt_fim DATE,
	fk_RA INT(4),
	FOREIGN KEY (fk_RA) REFERENCES aluno (RA)
);

CREATE TABLE IF NOT EXISTS disciplina_historico (
	nota FLOAT(4, 2),
	frequencia INT(4),
	fk_cod_disciplina INT(15),
	fk_cod_historico INT(15),
	PRIMARY KEY (fk_cod_disciplina, fk_cod_historico),
	FOREIGN KEY (fk_cod_disciplina) REFERENCES disciplina (cod_disciplina),
	FOREIGN KEY (fk_cod_historico) REFERENCES historico (cod_historico)
);