--
-- Name: autores autores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autores
    ADD CONSTRAINT autores_pkey PRIMARY KEY (cod_autor);


--
-- Name: dewey dewey_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dewey
    ADD CONSTRAINT dewey_pkey PRIMARY KEY (cod_dewey);


--
-- Name: editoriales editoriales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoriales
    ADD CONSTRAINT editoriales_pkey PRIMARY KEY (cod_editorial);


--
-- Name: forma_ingreso forma_ingreso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forma_ingreso
    ADD CONSTRAINT forma_ingreso_pkey PRIMARY KEY (cod_forma_ingreso);


--
-- Name: funciones funciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funciones
    ADD CONSTRAINT funciones_pkey PRIMARY KEY (cod_funcion);


--
-- Name: inventario inventario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventario
    ADD CONSTRAINT inventario_pkey PRIMARY KEY (cod_registro);


--
-- Name: obra_autor obra_autor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obra_autor
    ADD CONSTRAINT obra_autor_pkey PRIMARY KEY (cod_obra, cod_autor, cod_funcion);


--
-- Name: obra_editorial obra_editorial_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obra_editorial
    ADD CONSTRAINT obra_editorial_pkey PRIMARY KEY (cod_obra, cod_editorial);


--
-- Name: obra_tema obra_tema_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obra_tema
    ADD CONSTRAINT obra_tema_pkey PRIMARY KEY (cod_tema, cod_obra);


--
-- Name: obras obras_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obras
    ADD CONSTRAINT obras_pkey PRIMARY KEY (cod_obra);


--
-- Name: paises paises_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paises
    ADD CONSTRAINT paises_pkey PRIMARY KEY (cod_pais);


--
-- Name: temas temas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temas
    ADD CONSTRAINT temas_pkey PRIMARY KEY (cod_tema);


--
-- Name: inventario inventario_cod_forma_ingreso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventario
    ADD CONSTRAINT inventario_cod_forma_ingreso_fkey FOREIGN KEY (cod_forma_ingreso) REFERENCES public.forma_ingreso(cod_forma_ingreso);


--
-- Name: inventario inventario_cod_obra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventario
    ADD CONSTRAINT inventario_cod_obra_fkey FOREIGN KEY (cod_obra) REFERENCES public.obras(cod_obra);


--
-- Name: obra_autor obra_autor_cod_autor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obra_autor
    ADD CONSTRAINT obra_autor_cod_autor_fkey FOREIGN KEY (cod_autor) REFERENCES public.autores(cod_autor);


--
-- Name: obra_autor obra_autor_cod_funcion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obra_autor
    ADD CONSTRAINT obra_autor_cod_funcion_fkey FOREIGN KEY (cod_funcion) REFERENCES public.funciones(cod_funcion);


--
-- Name: obra_autor obra_autor_cod_obra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obra_autor
    ADD CONSTRAINT obra_autor_cod_obra_fkey FOREIGN KEY (cod_obra) REFERENCES public.obras(cod_obra);


--
-- Name: obra_editorial obra_editorial_cod_editorial_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obra_editorial
    ADD CONSTRAINT obra_editorial_cod_editorial_fkey FOREIGN KEY (cod_editorial) REFERENCES public.editoriales(cod_editorial);


--
-- Name: obra_editorial obra_editorial_cod_obra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obra_editorial
    ADD CONSTRAINT obra_editorial_cod_obra_fkey FOREIGN KEY (cod_obra) REFERENCES public.obras(cod_obra);


--
-- Name: obra_tema obra_tema_cod_obra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obra_tema
    ADD CONSTRAINT obra_tema_cod_obra_fkey FOREIGN KEY (cod_obra) REFERENCES public.obras(cod_obra);


--
-- Name: obra_tema obra_tema_cod_tema_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obra_tema
    ADD CONSTRAINT obra_tema_cod_tema_fkey FOREIGN KEY (cod_tema) REFERENCES public.temas(cod_tema);


--
-- Name: obras obras_cod_dewey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obras
    ADD CONSTRAINT obras_cod_dewey_fkey FOREIGN KEY (cod_dewey) REFERENCES public.dewey(cod_dewey);


--
-- Name: obras obras_pais_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obras
    ADD CONSTRAINT obras_pais_fkey FOREIGN KEY (pais) REFERENCES public.paises(cod_pais);


--
-- PostgreSQL database dump complete
--

