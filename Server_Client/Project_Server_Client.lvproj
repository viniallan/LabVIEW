<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="19008000">
	<Item Name="My Computer" Type="My Computer">
		<Property Name="NI.SortType" Type="Int">3</Property>
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="Server" Type="Folder">
			<Item Name="Calibração" Type="Folder">
				<Item Name="Cria_arquivo_config.vi" Type="VI" URL="../Cria_arquivo_config.vi"/>
				<Item Name="Atualiza_array_calibracao.vi" Type="VI" URL="../Atualiza_array_calibracao.vi"/>
				<Item Name="Calibracao.vi" Type="VI" URL="../Calibracao.vi"/>
			</Item>
			<Item Name="Prioridades_server" Type="Folder">
				<Item Name="Filtra_Tag_prioridades_server.vi" Type="VI" URL="../Filtra_Tag_prioridades_server.vi"/>
				<Item Name="Prioridade_variaveis_server.vi" Type="VI" URL="../Prioridade_variaveis_server.vi"/>
			</Item>
			<Item Name="Conversao_e_calculos" Type="Folder">
				<Item Name="Conversao_valores_engenharia_entrada_TODOS.vi" Type="VI" URL="../Conversao_valores_engenharia_entrada_TODOS.vi"/>
				<Item Name="Conversao_valores_engenharia_saida_TODOS.vi" Type="VI" URL="../Conversao_valores_engenharia_saida_TODOS.vi"/>
				<Item Name="Conversao_valores_UCM.0300_ENTRADA.vi" Type="VI" URL="../Conversao_valores_UCM.0300_ENTRADA.vi"/>
				<Item Name="Conversao_valores_UCM.0300_SAIDA.vi" Type="VI" URL="../Conversao_valores_UCM.0300_SAIDA.vi"/>
				<Item Name="Conversao_valores_UCM.0200_ENTRADA.vi" Type="VI" URL="../Conversao_valores_UCM.0200_ENTRADA.vi"/>
				<Item Name="Conversao_valores_UCM.0200_SAIDA.vi" Type="VI" URL="../Conversao_valores_UCM.0200_SAIDA.vi"/>
				<Item Name="Calculo_conversao_4096_to_or_from_Max_Min.vi" Type="VI" URL="../Calculo_conversao_4096_to_or_from_Max_Min.vi"/>
				<Item Name="Calculo_valores_internos.vi" Type="VI" URL="../Calculo_valores_internos.vi"/>
				<Item Name="Propriedades.vi" Type="VI" URL="../Propriedades.vi"/>
			</Item>
			<Item Name="Help" Type="Folder">
				<Item Name="Help_geral.vi" Type="VI" URL="../Help_geral.vi"/>
			</Item>
			<Item Name="Server.vi" Type="VI" URL="../Server.vi"/>
			<Item Name="Listener_Paralelo.vi" Type="VI" URL="../Listener_Paralelo.vi"/>
			<Item Name="Conversao_todos_e_link_CLP.vi" Type="VI" URL="../Conversao_todos_e_link_CLP.vi"/>
		</Item>
		<Item Name="Client" Type="Folder">
			<Item Name="Prioridades_client" Type="Folder">
				<Item Name="Atualiza_array_prioridade.vi" Type="VI" URL="../Atualiza_array_prioridade.vi"/>
				<Item Name="Prioridade_variaveis_client.vi" Type="VI" URL="../Prioridade_variaveis_client.vi"/>
				<Item Name="Abre_prioridade_file_client.vi" Type="VI" URL="../Abre_prioridade_file_client.vi"/>
				<Item Name="Atualiza_prioridades_client.vi" Type="VI" URL="../Atualiza_prioridades_client.vi"/>
			</Item>
			<Item Name="Certificados_calibracao" Type="Folder">
				<Item Name="Abre_Certificado_PDF.vi" Type="VI" URL="../Abre_Certificado_PDF.vi"/>
				<Item Name="Devolve_PDF_pela_TAG.vi" Type="VI" URL="../Devolve_PDF_pela_TAG.vi"/>
				<Item Name="Editor_vinculo_instrumento_PDF.vi" Type="VI" URL="../Editor_vinculo_instrumento_PDF.vi"/>
				<Item Name="Abrir_central_todos_certificados.vi" Type="VI" URL="../Abrir_central_todos_certificados.vi"/>
			</Item>
			<Item Name="Client.vi" Type="VI" URL="../Client.vi"/>
		</Item>
		<Item Name="Padrao" Type="Folder">
			<Item Name="SAIDA" Type="Folder">
				<Item Name="padrao_todos_os_dados_SAIDA.ctl" Type="VI" URL="../padrao_todos_os_dados_SAIDA.ctl"/>
				<Item Name="padrao_dados_cliente_para_server.ctl" Type="VI" URL="../padrao_dados_cliente_para_server.ctl"/>
				<Item Name="padrao_UCM.004.EEL.0300_SAIDA.ctl" Type="VI" URL="../padrao_UCM.004.EEL.0300_SAIDA.ctl"/>
				<Item Name="padrao_UCM.004.EEL.0200_SAIDA.ctl" Type="VI" URL="../padrao_UCM.004.EEL.0200_SAIDA.ctl"/>
				<Item Name="padrao_ADAM_SAIDA.ctl" Type="VI" URL="../padrao_ADAM_SAIDA.ctl"/>
			</Item>
			<Item Name="ENTRADA" Type="Folder">
				<Item Name="padrao_UCM.004.EEL.0300_ENTRADA.ctl" Type="VI" URL="../padrao_UCM.004.EEL.0300_ENTRADA.ctl"/>
				<Item Name="padrao_UCM.004.EEL.0200_ENTRADA.ctl" Type="VI" URL="../padrao_UCM.004.EEL.0200_ENTRADA.ctl"/>
				<Item Name="padrao_todos_os_dados_ENTRADA.ctl" Type="VI" URL="../padrao_todos_os_dados_ENTRADA.ctl"/>
				<Item Name="padrao_ADAM_ENTRADA.ctl" Type="VI" URL="../padrao_ADAM_ENTRADA.ctl"/>
			</Item>
			<Item Name="INTERNO" Type="Folder">
				<Item Name="padrao_INTERNO.ctl" Type="VI" URL="../padrao_INTERNO.ctl"/>
			</Item>
			<Item Name="OUTROS" Type="Folder">
				<Item Name="Propriedades" Type="Folder">
					<Item Name="padrao_entry_type_propriedades.ctl" Type="VI" URL="../padrao_entry_type_propriedades.ctl"/>
					<Item Name="padrao_fluid_name_propriedades.ctl" Type="VI" URL="../padrao_fluid_name_propriedades.ctl"/>
					<Item Name="padrao_unidades_medida_propriedades.ctl" Type="VI" URL="../padrao_unidades_medida_propriedades.ctl"/>
					<Item Name="padrao_propriedades_propriedades.ctl" Type="VI" URL="../padrao_propriedades_propriedades.ctl"/>
				</Item>
				<Item Name="padrao_tipo_dado.ctl" Type="VI" URL="../padrao_tipo_dado.ctl"/>
				<Item Name="padrao_listener_client.ctl" Type="VI" URL="../padrao_listener_client.ctl"/>
				<Item Name="padrao_informacoes_meu_computador.ctl" Type="VI" URL="../padrao_informacoes_meu_computador.ctl"/>
				<Item Name="padrao_enum.ctl" Type="VI" URL="../padrao_enum.ctl"/>
				<Item Name="padrao_TAGS_prioridades_client.ctl" Type="VI" URL="../padrao_TAGS_prioridades_client.ctl"/>
				<Item Name="padrao_array_cluster_calibracao.ctl" Type="VI" URL="../padrao_array_cluster_calibracao.ctl"/>
			</Item>
		</Item>
		<Item Name="outros_VIs" Type="Folder">
			<Item Name="Run_VI.vi" Type="VI" URL="../Run_VI.vi"/>
			<Item Name="Meu_IP_Address.vi" Type="VI" URL="../Meu_IP_Address.vi"/>
			<Item Name="ID_ja_aberto.vi" Type="VI" URL="../ID_ja_aberto.vi"/>
			<Item Name="Pega_Tags_cluster_entrada.vi" Type="VI" URL="../Pega_Tags_cluster_entrada.vi"/>
			<Item Name="Pega_Tags_cluster_saida.vi" Type="VI" URL="../Pega_Tags_cluster_saida.vi"/>
			<Item Name="Estou_no_server.vi" Type="VI" URL="../Estou_no_server.vi"/>
		</Item>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="Clear Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Clear Errors.vi"/>
				<Item Name="8.6CompatibleGlobalVar.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/config.llb/8.6CompatibleGlobalVar.vi"/>
				<Item Name="NI_LVConfig.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/config.llb/NI_LVConfig.lvlib"/>
				<Item Name="NI_PackedLibraryUtility.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/LVLibp/NI_PackedLibraryUtility.lvlib"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="NI_FileType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/lvfile.llb/NI_FileType.lvlib"/>
				<Item Name="Check if File or Folder Exists.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Check if File or Folder Exists.vi"/>
				<Item Name="whitespace.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/whitespace.ctl"/>
				<Item Name="Trim Whitespace.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace.vi"/>
				<Item Name="Space Constant.vi" Type="VI" URL="/&lt;vilib&gt;/dlg_ctls.llb/Space Constant.vi"/>
				<Item Name="System Exec.vi" Type="VI" URL="/&lt;vilib&gt;/Platform/system.llb/System Exec.vi"/>
				<Item Name="NI_Data Type.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/Data Type/NI_Data Type.lvlib"/>
			</Item>
			<Item Name="PythonNode_Calc_air_drop.vi" Type="VI" URL="../PythonNode_Calc_air_drop.vi"/>
			<Item Name="ToPythonVersionString.vi" Type="VI" URL="../Laminador/Python/support/ToPythonVersionString.vi"/>
			<Item Name="GetExampleModulePath.vi" Type="VI" URL="../Laminador/Python/support/GetExampleModulePath.vi"/>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
