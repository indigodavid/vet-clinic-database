CREATE TABLE patients (
  id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
  name varchar(255),
  date_of_birth date,
  PRIMARY KEY (id)
);

CREATE TABLE medical_histories (
  id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
  admitted_at timestamp,
  patient_id integer,
  status varchar(100),
  PRIMARY KEY (id),
  CONSTRAINT fk_patients FOREIGN KEY (patient_id) REFERENCES patients(id)
);

CREATE TABLE treatments (
  id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
  type varchar(255),
  name varchar(255) 
);

CREATE TABLE invoice_items (
  id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
  unit_price real,
  quantity integer,
  total_price real,
  invoice_id integer,
  treatment_id integer,
  PRIMARY KEY (id),
  CONSTRAINT fk_invoices FOREIGN KEY (invoice_id) REFERENCES invoices(id),
  CONSTRAINT fk_treatments FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);

CREATE TABLE invoices (
  id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
  total_amount real,
  generated_at timestamp,
  payed_at timestamp,
  medical_history_id integer,
  PRIMARY KEY (id),
  CONSTRAINT fk_medical_histories FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
);


