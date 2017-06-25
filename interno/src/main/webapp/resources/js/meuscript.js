

/*Formulario de login*/

   $(document).ready(function(){
	  
	   $("#fmLogin").validate({
		  
		   rules:{
			   
			   login:{
				   required: true
			   },
			   
			   senha:{
				   required: true
			   }
		   },
		   
		   messages:{
			   
			   login:{
				   required: "<i class='fa fa-window-close' aria-hidden='true'></i> Campo obrigatório!"
			   },
			   
			   senha:{
				   required: "<i class='fa fa-window-close' aria-hidden='true'></i> Campo obrigatório!"
			   }
		   },
		   submitHandler: function(){
			   
			   var dados = $("#fmLogin").serialize();
			   document.getElementById('divLogin').style.display = "none";
			   document.getElementById('loginLoader').style.display = "block";
			   $.ajax({
				  
				   type:'POST',
				   url:'login?action=efetua-login',
				   data: dados,
				   success: function(data){
					   
					   if(data == 'true'){
						   document.getElementById('divLogin').style.display = "block";
						   document.getElementById('loginLoader').style.display = "none";
						   location = "main?action=index"
					   }else{
						   document.getElementById('divLogin').style.display = "block";
						   document.getElementById('loginLoader').style.display = "none";
						   noty({
							    text: '<strong>ATEDUC</strong><br> <br>Login ou Senha informado é inválido! ',
							    type: 'error',
							    layout : 'topRight',
							    timeout: 4000,
							    progressBar : true,
							    animation: {
							        open: {height: 'toggle'},
							        close: {height: 'toggle'},
							        easing: 'swing',
							        speed: 500 // opening & closing animation speed
							    }
							});
					   }
				   }
				   
			   });
		   }
	   });
   });
   
   
   /*Formulario cadastro de usuario*/
   function habilitaDivCadastro(){
	     $('#pNewUser').delay(800).fadeIn(500);
	     $("#btnEnter[type=submit]").attr("disabled", "disabled");
	     $("#btnhabil[type=button]").attr("disabled", "disabled");

   }
   function desabilitaDiv(){
	     $('#pNewUser').delay(400).fadeOut(200);
	     $("#btnEnter[type=submit]").attr("disabled", false);
	     $("#btnhabil[type=button]").attr("disabled", false);

   }
   $(document).ready(function(){
	   $("#fone").mask("(99) 99999-9999");
	   
	   /*VALIDAR INPUT SOMENTE COM LETRAS*/

	
	   
	   $("#fmNovoUser").validate({
		  
		   rules:{
			   
			   nome:{
				   required:true,
				   rangelength: [5,20]
			   },
			   email:{
				   required:true,
				   email: true
			   },
			   senha:{
				   required:true,
				   rangelength: [4,10]
			   }
		   },
		   
		   messages:{
			   nome:{
				   required: "<i class='fa fa-window-close' aria-hidden='true'></i> Campo obrigatório!",
				   rangelength: "<i class='fa fa-window-close' aria-hidden='true'></i> O campo nome deve conter entre 5 á 20 caracteres!"
			   },
			 
			   email:{
				   required:"<i class='fa fa-window-close' aria-hidden='true'></i> Campo obrigatório!",
				   email: "<i class='fa fa-window-close' aria-hidden='true'></i> Email Invalido!"
			   },
			   senha:{
				   required:"<i class='fa fa-window-close' aria-hidden='true'></i> Campo obrigatório!",
				   rangelength: "<i class='fa fa-window-close' aria-hidden='true'></i> O campo senha deve conter entre 4 á 10 caracteres!"
			   }
		   },
		   submitHandler: function(){
			  var dados = $("#fmNovoUser").serialize();
		
			  $.ajax({
				  url: 'login?action=novo-usuario',
				  type: 'POST',
				  data: dados,
				  success: function(data){
					
				
					  
					  if(data == "true"){
						  
						   noty({
							    text: '<strong>ATEDUC</strong><br> <br>Usuário cadastrado com sucesso! ',
							    type: 'success',
							    layout : 'topRight',
							    timeout: 3000,
							    progressBar : true,
							    animation: {
							        open: {height: 'toggle'},
							        close: {height: 'toggle'},
							        easing: 'swing',
							        speed: 500 // opening & closing animation speed
							    }
							});
						     
						     document.getElementById("fmNovoUser").reset();
							 document.getElementById('cadusuarioLoader').style.display = "none";
							 desabilitaDiv();
							
					  }else{
						  noty({
							    text: '<strong>ATEDUC</strong><br> <br>Erro ao cadastrar usuário, Tente novamente. ',
							    type: 'error',
							    layout : 'topRight',
							    timeout: 3000,
							    progressBar : true,
							    animation: {
							        open: {height: 'toggle'},
							        close: {height: 'toggle'},
							        easing: 'swing',
							        speed: 500 // opening & closing animation speed
							    }
							});
					  }

                   }
			  });
		   }
	   });
   });
   
   
   /*Alterar div servico cadastro*/
   alteraDiv = function (){
      
	   if($('#selectServico').val() == ""){
	    	$("#tablet").hide();
	        $("#micro").hide();
	        $("#visita").hide();
	    }
	    
	    if($('#selectServico').val() == 1){
	        $("#tablet").show();
	        $("#micro").hide();
	        $("#visita").hide();
	     }
	    
	    if($('#selectServico').val() == 2){
	        $("#micro").show();
	        $("#tablet").hide();
	        $("#visita").hide();
	    }

	    if($('#selectServico').val() == 3){
	        $("#visita").show();
	        $("#tablet").hide();
	        $("#micro").hide();
	    }
	}
   
   /*Listar instituição autocomplete*/


  	    $(document).ready(function(){
  	    	 var options = {
  	  				url: "/interno/instituicaoJSON.jsp",
  	  				getValue: "nome",

  	  				list: {

  	  					onSelectItemEvent: function() {
  	  						var value = $("#instituicao").getSelectedItemData().id;

  	  						$("#instituicao_id").val(value).trigger("change");
  	  					},
  	  					
  	  					match: {
  	  						enabled: true
  	  					},
  	  					maxNumberOfElements: 10
  	  				},
  	  	    
  	  	  theme: "plate-dark"
  	  			};
  	  		$("#instituicao").easyAutocomplete(options);

  	    	
  	    });
  	    
  	    
  	   
 /*Validar formulario de cadastro do tablet*/
  	    $(document).ready(function(){
  	    	
  	    	$("#fmTablet").validate({
  	    		
  	    		rules:{
  	    			
  	    			instituicao:{
  	    				required: true
  	    					
  	    			},
  	    			nome:{
  	    				required: true
  	    			},
  	    			cargo:{
  	    				required: true
  	    			},
  	    			matricula:{
  	    				required: true
  	    			},
  	    			fone:{
  	    				required: true
  	    			},
  	    			patrimonio:{
  	    				required: true
  	    			},
  	    			marca:{
  	    				required: true
  	    			},
  	    			modelo:{
  	    				required: true
  	    			},
  	    			desc_problema:{
  	    				required: true
  	    			}
  	    			
  	    		},
  	    		
             messages:{
  	    			
  	    			instituicao:{
  	    				required: "<span class='fa fa-window-close' aria-hidden='true'></span> Escolha uma instituição..."
  	    			},
  	    			nome:{
  	    				required: "<i class='fa fa-window-close' aria-hidden='true'></i> Campo obrigatório!"  	    		
  	    			},
  	    			cargo:{
  	    				required: "<i class='fa fa-window-close' aria-hidden='true'></i> Campo obrigatório!"
  	    			},
  	    			matricula:{
  	    				required: "<i class='fa fa-window-close' aria-hidden='true'></i> Campo obrigatório!"
  	    			},
  	    			fone:{
  	    				required: "<i class='fa fa-window-close' aria-hidden='true'></i> Campo obrigatório!"
  	    			},
  	    			patrimonio:{
  	    				required: "<i class='fa fa-window-close' aria-hidden='true'></i> Campo obrigatório!"
  	    			},
  	    			marca:{
  	    				required: "<i class='fa fa-window-close' aria-hidden='true'></i> Campo obrigatório!"
  	    			},
  	    			modelo:{
  	    				required: "<i class='fa fa-window-close' aria-hidden='true'></i> Campo obrigatório!"
  	    			},
  	    			desc_problema:{
  	    				required: "<i class='fa fa-window-close' aria-hidden='true'></i> Campo obrigatório!"
  	    			}
  	    			
  	    		},
  	    		
  	    		submitHandler: function (){
  	    			var dados = $("#fmTablet").serialize();
  	    			
  	    			$.ajax({
  	    				url: 'main?action=cadastrar-tablet',
  	    				type: 'POST',
  	    				data: dados,
  	    				success : function( data ){
  	    					var vdd = data.substring(0,4);
  	    					var chamado = data.substring(4,16);
                     
  	    					if(vdd == 'true'){
  	    						
  	    						 noty({
  	  							    text: '<strong>ATEDUC</strong><br> <br>Chamado cadastrado com sucesso! ',
  	  							    type: 'success',
  	  							    layout : 'topRight',
  	  							    timeout: 3000,
  	  							    progressBar : true,
  	  							    animation: {
  	  							        open: {height: 'toggle'},
  	  							        close: {height: 'toggle'},
  	  							        easing: 'swing',
  	  							        speed: 500 // opening & closing animation speed
  	  							    }
  	  							});
  	    					
  	    						
  	    						location = "main?action=detalhe-chamado-tablet&numero-chamado-interno="+chamado;
  	    					}else{
  	    						noty({
  	  							    text: '<strong>ATEDUC</strong><br> <br>Erro ao cadastrar chamado, tente novamente! ',
  	  							    type: 'error',
  	  							    layout : 'topRight',
  	  							    timeout: 3000,
  	  							    progressBar : true,
  	  							    animation: {
  	  							        open: {height: 'toggle'},
  	  							        close: {height: 'toggle'},
  	  							        easing: 'swing',
  	  							        speed: 500 // opening & closing animation speed
  	  							    }
  	  							});
  	    					}
  	    					
  	    				
  						     
  						    // document.getElementById("fmTablet").reset();
  	    					
  	    				}
  	    				
  	    			});
  	    			
  	    		}
  	    	});
  	    });
  	    
  	    /*Validar cadastro de micro*/
  	    $(document).ready(function(){
  	    	
  	    	$("#fmMicro").validate({
  	    		
  	    		rules:{
  	    			
  	    			instituicao:{
  	    				required: true		
  	    			},
  	    			solicitante:{
  	    				required: true
  	    			},
  	    			nome:{
  	    				required: true
  	    			},
  	    			'tipo_micro[0]':{
  	    				required: true
  	    			},
  	    			'desc_problema[0]':{
  	    				required: true
  	    			},
  	    		},
  	    			messages:{
  	  	    			
  	  	    			instituicao:{
  	  	    				required: "Campo obrigatório!"  	  	    					
  	  	    			},
  	  	    			solicitante:{
  	  	    				required: "Campo obrigatório!"
  	  	    			},
  	  	    			nome:{
  	  	    				required: "Campo obrigatório!"
  	  	    			},
  	  	    			'tipo_micro[0]':{
  	  	    				required: "Campo obrigatório!"
  	  	    			},
  	  	    		'desc_problema[0]':{
  	  	    				required: "Campo obrigatório!"
  	  	    			},
  	    			},
  	    			submitHandler: function (){
  	    				
  	    			    var dialog = bootbox.dialog({
	    				        message: '<p class="text-center">Cadastrando...</p>',
	    				        closeButton: false
	    				    });
	    				    
	    				    
  	    				var dados = $("#fmMicro").serialize();
  	    				$.ajax({
  	    					    type: 'POST',
  	    						url: 'main?action=cadastrar-micro',
  	    	    				data: dados,
  	    	    				success : function ( data ){
  	    	    					

  	    	    					var vdd = data.substring(0,4);
  	    	    					var chamado = data.substring(4,16);

  	    	    				
  	    	    					
  	    	    					if(vdd == 'true'){
  	    	    					// do something in the background
  	    		    				    dialog.modal('hide');
  	    	    						$("#mdMicro").modal('show');
                                        document.getElementById("nChamado").innerHTML =chamado;
                                        $("#numeroInterno").val(chamado);
  	    	 					        document.getElementById("fmMicro").reset();

  	    	    						
  	    	    					}else{
  	    	    						noty({
  	    	  							    text: '<strong>ATEDUC</strong><br> <br>Erro ao cadastrar chamado, tente novamente! ',
  	    	  							    type: 'error',
  	    	  							    layout : 'topRight',
  	    	  							    timeout: 3000,
  	    	  							    progressBar : true,
  	    	  							    animation: {
  	    	  							        open: {height: 'toggle'},
  	    	  							        close: {height: 'toggle'},
  	    	  							        easing: 'swing',
  	    	  							        speed: 500 // opening & closing animation speed
  	    	  							    }
  	    	  							});
  	    	    					}  	    	    					
  	    	    					
  	    	    				}
  	    				});
  	    				
  	    			
  	    			}
  	    			
  	    		
  	    	});
  	    	
  	    });
  	    
  	    
  	    /*Leva usuario para pagina de detalhes do chamado de pc*/
  	    function verChamadoPC(){
  	    	
  	    var chamado = $("#numeroInterno").val();
			location = "main?action=detalhe-chamado&numero-chamado-interno="+chamado;  	    
  	    }
  	    
  	
  	   /*vizualizar detalhes do micro*/
  	    function verDetalheMicro(idMicro){
  	    	$.ajax({
  	    		url: 'main?action=detalhe-micro&idMicro='+idMicro,
  	    		dataType: 'json',
  	    		async: false,
  	    		success : function( response ){
  	    		
  	    			$("#tipo_micro").val(response[0].tipo_micro);
  	    			$("#localizacao").val(response[0].localizacao);
  	    			$("#desc_problema").val(response[0].desc_problema);
  	    			$("#idMicro").val(response[0].id);
  	    			
  	    			if(response[0].backup == true){
  	  	    			$("#backup").val("true");
                     }else{
   	  	    			$("#backup").val("false");
                     }
  	    			$("#nf").val("");
	    	    		$("#pat").val("");

  	    			if(response[0].patrimonio != ""){
  	    				
  	  	    			$("#patrimonio").val(response[0].patrimonio);
  	    	    		$("#pat").show();
  	    	    		$("#nota").hide();
  	    	    		$("#tipo_patri").val("2");
  	  	    			$("#nf").val("");



  	    			}else if(response[0].nota_fiscal != ""){
  	  	    			$("#nf").val(response[0].nota_fiscal);
  	    	    		$("#nota").show();
  	    	    		$("#pat").hide();
  	    	    		$("#tipo_patri").val("1");
  	    	    		$("#pat").val("");
  	    			}
  	    		}
  	    		
  	    	});
  	    }
  	    
  	    function verificaPatMicroEditar(){
  	    	
  	    	if($("#tipo_patri").val() == 1){
  	    		$("#pat").hide();
  	    		$("#nota").show();
  	    	}
  	    	if($("#tipo_patri").val() == 2){
  	    		$("#pat").show();
  	    		$("#nota").hide();
  	    	}
  	    }
  	    
  	   function verificaPatMicroNovo(){
 	    	
  		 if($("#tipo_patri_new").val() == 0){
	    		$("#pat_new").hide();
	    		$("#nota_new").hide();
	    		$("#nf_new").val("");
	    		$("#patrimonio_new").val("");
	    	}
 	    	if($("#tipo_patri_new").val() == 1){
 	    		$("#pat_new").hide();
 	    		$("#nota_new").show();
	    		$("#patrimonio_new").val("");
 	    	}
 	    	if($("#tipo_patri_new").val() == 2){
 	    		$("#pat_new").show();
 	    		$("#nota_new").hide();
 	    		$("#nf_new").val("");
 	    	}
 	    }
  	    
  	    /*Finalizar micro */
  	  function finalizaMicro(idMicro){
	    	$.ajax({
	    		url: 'main?action=detalhe-micro&idMicro='+idMicro,
	    		dataType: 'json',
	    		async: false,
	    		success : function( response ){
	    		
	    			$("#patrimonio_finaliza").val(response[0].patrimonio);
	    			$("#nf_finaliza").val(response[0].nota_fiscal);
	    			$("#tipo_micro_finaliza").val(response[0].tipo_micro);
	    			$("#localizacao_finaliza").val(response[0].localizacao);
	    			$("#desc_problema_finaliza").val(response[0].desc_problema);
	    			$("#idMicro_finaliza").val(response[0].id);
	    			
	    			
  	    			if(response[0].backup == true){
  	  	    			$("#backup_finaliza").val("true");
                     }else{
   	  	    			$("#backup_finaliza").val("false");
                     }
	    		}
	    		
	    	});
	    }
  	    
  	    
  	    /*Atualização do micro*/
  	    $(document).ready(function(){
  	    	
  	    	$("#fmAltMicro").validate({
  	    		
  	    		rules:{
  	    			desc_problema:{
  	    				required: true
  	    			},
  	    			tipo_micro:{
  	    				required: true
  	    			}
  	    		},
  	    		
  	    		messages:{
  	    			desc_problema:{
  	    				required: "Campo obrigatório"
  	    			},
  	    			tipo_micro:{
  	    				required: "Campo obrigatório"
  	    			}
  	    		},
  	    		
  	    		submitHandler: function (){
  	    			
  	    			var dados = $("#fmAltMicro").serialize();
  	    			$.ajax({
  	    				
  	    				type: 'POST',
  	    				url: 'main?action=atualiza-micro',
  	    				data: dados,
  	    				success : function ( data ){
  	    					
  	    				 if(data == 'true'){
  	    				    noty({
  							    text: '<strong>ATEDUC</strong><br> <br>Atualizado com sucesso! ',
  							    type: 'success',
  							    layout : 'topRight',
  							    timeout: 3000,
  							    progressBar : true,
  							    animation: {
  							        open: {height: 'toggle'},
  							        close: {height: 'toggle'},
  							        easing: 'swing',
  							        speed: 500 // opening & closing animation speed
  							    }
  							});
  	    				    
  	    				  var table = $('#tbMicros').DataTable();
  	    				table.ajax.reload();
  	    				 }else{
  	    					noty({
	  							    text: '<strong>ATEDUC</strong><br> <br>Erro ao atualizar micro, tente novamente! ',
	  							    type: 'error',
	  							    layout : 'topRight',
	  							    timeout: 3000,
	  							    progressBar : true,
	  							    animation: {
	  							        open: {height: 'toggle'},
	  							        close: {height: 'toggle'},
	  							        easing: 'swing',
	  							        speed: 500 // opening & closing animation speed
	  							    }
	  							});
  	    				 }
  	    				}
  	    				
  	    			});
  	    		}
  	    	});
  	    });
  	    
  	    /*Validar motivo finalização micro*/
  	    $(document).ready(function(){
  	    	
  	    	$("#fmFinalizatMicro").validate({
  	    		
  	    		rules:{
  	    			
  	    			desc_finaliza:{
  	    				required: true,
  	    				 rangelength: [5,90]
  	    			}
  	    		},
  	    		
  	    	   messages:{
  	    		   
  	    		 desc_finaliza:{
	    				required: "Campo obrigatório!",
	    				 rangelength: "O campo deve conter entre 5 á 90 caracteres!"
	    			}
  	    				

                 },
  	    			submitHandler: function (){
  	    				
  	    				var dados = $("#fmFinalizatMicro").serialize();
  	    				
  	    				$.ajax({
  	    					
  	    					type: 'POST',
  	    					url: 'main?action=finaliza-micro',
  	    					data: dados,
  	    					success : function ( data ){
  	    						
  	    						if(data == 'true'){
  	    				          
  	    							$("#mdMicroFinaliza").modal('hide');
    	 					        document.getElementById("fmFinalizatMicro").reset();
    	 					        window.location.reload();
    	 					        
    	 					       noty({
 	    							    text: '<strong>ATEDUC</strong><br> <br>Micro finalizado com sucesso! ',
 	    							    type: 'warning',
 	    							    layout : 'topRight',
 	    							    timeout: 3000,
 	    							    progressBar : true,
 	    							    animation: {
 	    							        open: {height: 'toggle'},
 	    							        close: {height: 'toggle'},
 	    							        easing: 'swing',
 	    							        speed: 500 // opening & closing animation speed
 	    							    }
 	    							});
    	 					        
  	    						}else{
  	    						    noty({
  	    							    text: '<strong>ATEDUC</strong><br> <br>Erro ao finalizar micro, tente novamente! ',
  	    							    type: 'error',
  	    							    layout : 'topRight',
  	    							    timeout: 3000,
  	    							    progressBar : true,
  	    							    animation: {
  	    							        open: {height: 'toggle'},
  	    							        close: {height: 'toggle'},
  	    							        easing: 'swing',
  	    							        speed: 500 // opening & closing animation speed
  	    							    }
  	    							});
  	    						}
  	    					}
  	    				});
  	    			}
  	    		
  	    	});
  	    });
  	    
  	    /*Validar modal novo micro*/
  	    $(document).ready(function(){
  	    	
  	    	$("#fmNewMicro").validate({
  	    		
  	    		rules:{
  	    			tipo_micro_new:{
  	    				required: true
  	    			},
  	    			desc_problema_new:{
  	    				required:true,
  	    				rangelength: [5,90]
  	    			}
  	    		},
  	    		
  	    		messages:{
  	    	
   					tipo_micro_new:{
   						required: "Campo obrigatório!"  	    
   							},
  	    			desc_problema_new:{
  	    				required: "Campo obrigatório!",
  	    				 rangelength: "O campo deve conter entre 5 á 90 caracteres!"
  	    			}
  	    		},
  	    		submitHandler: function (){
  	    			
  	    			var dados = $("#fmNewMicro").serialize();
  	    			
  	    			$.ajax({
  	    				
  	    				type: 'POST',
  	    				url: 'main?action=new-micro',
  	    				data: dados,
  	    				success : function( data ){
  	    					
  	    					if(data == 'true'){
	 					        window.location.reload();

  	    					    noty({
  	  							    text: '<strong>ATEDUC</strong><br> <br>Micro adicionado com sucesso! ',
  	  							    type: 'success',
  	  							    layout : 'topRight',
  	  							    timeout: 3000,
  	  							    progressBar : true,
  	  							    animation: {
  	  							        open: {height: 'toggle'},
  	  							        close: {height: 'toggle'},
  	  							        easing: 'swing',
  	  							        speed: 500 // opening & closing animation speed
  	  							    }
  	  							});
  	  	    				    
  	    					}else{
  	    					  noty({
    							    text: '<strong>ATEDUC</strong><br> <br>Erro ao adicionar novo micro, tente novamente! ',
    							    type: 'error',
    							    layout : 'topRight',
    							    timeout: 3000,
    							    progressBar : true,
    							    animation: {
    							        open: {height: 'toggle'},
    							        close: {height: 'toggle'},
    							        easing: 'swing',
    							        speed: 500 // opening & closing animation speed
    							    }
    							});
  	    					}
  	    				}
  	    			});
  	    		}
  	    	});
  	    });
  	    
  	    /*recupera id do micro para adiconar na tabela de manutenção*/
  	    function addMicroManutencao(idMicro){
  	    	
  	    	$("#idMicroManutencao").val(idMicro);
  	    	$("#mdAddMicroManutencao").modal('show');
  	    }
  	    
  	    /*envia micro para tabela de manutencao */

  	    
  	    $(document).ready(function(){
  	    	
  	    	$("#fmAddMicroManutencao").validate({
  	    		
  	    		rules:{
  	    			idMicroManutencao:{
  	    				required:true
  	    			}
  	    		},
  	    		messages:{
  	    		   idMicroManuuencao:{
  	    			 required: "Campo obrigatório!" 
  	    		   }
  	    		},
  	    		
  	    		submitHandler: function (){
  	    			var dados = $("#fmAddMicroManutencao").serialize();
  	    	    	$.ajax({
  	    	    		type: 'POST',
  	    	    		url: 'main?action=add-micro-manutencao',
  	    	    		data: dados,
  	    	    		success : function( data ){
  	    	    			
  	    	    			if(data == "true"){
  	    	    			   noty({
 	  							    text: '<strong>ATEDUC</strong><br> <br>Micro adicionado com sucesso! ',
 	  							    type: 'success',
 	  							    layout : 'topRight',
 	  							    timeout: 3000,
 	  							    progressBar : true,
 	  							    animation: {
 	  							        open: {height: 'toggle'},
 	  							        close: {height: 'toggle'},
 	  							        easing: 'swing',
 	  							        speed: 500 // opening & closing animation speed
 	  							    }
 	  							});
  	    	    			   
  	    	    	  	    	$("#mdAddMicroManutencao").modal('hide');
	 					        window.location.reload();


  	    	    			}else{
  	    	    			   noty({
 	  							    text: '<strong>ATEDUC</strong><br> <br>Erro ao enviar micro para manutenção, Tente novamente! ',
 	  							    type: 'error',
 	  							    layout : 'topRight',
 	  							    timeout: 3000,
 	  							    progressBar : true,
 	  							    animation: {
 	  							        open: {height: 'toggle'},
 	  							        close: {height: 'toggle'},
 	  							        easing: 'swing',
 	  							        speed: 500 // opening & closing animation speed
 	  							    }
 	  							});
  	    	    			}
  	    	    		}
  	    	    	});
  	    		}
  	    		
  	    	});
  	    });
  	  
  	    //Ver detalhes do micro manutenção*/
  	    function verMicroManutencao(idManutencao){
			location = "main?action=detalhe-micro-manutencao&idManutencao="+idManutencao;  	    
  	    }
  	    
  	    /*realiza atendimento de manutenção*/
  	 $(document).ready(function(){
  		
  		 $("#fmTecnicoResp").validate({
  			 
  			 rules:{
  				idMicroManutencao:{
  					required: true
  				},
  				idUsuario:{
  					required: true
  				}
  			 },
  			 
  			 messages:{
  				idMicroManutencao:{
  					required: true
  				},
  				idUsuario:{
  					required: true
  				}
  			 },
  			submitHandler: function (){
  				
  				 var dados = $("#fmTecnicoResp").serialize();
  		  		 $.ajax({
  		  			 type: 'POST',
  		  			 url: 'main?action=detalhe-micro-manutencao',
  		  			 data: dados,
  		  			 success : function( data ){
  		  				  if(data == 'true'){
  		  					  
  		  				   noty({
  							    text: '<strong>ATEDUC</strong><br> <br>Responsável adicionado com sucesso! ',
  							    type: 'success',
  							    layout : 'topRight',
  							    timeout: 3000,
  							    progressBar : true,
  							    animation: {
  							        open: {height: 'toggle'},
  							        close: {height: 'toggle'},
  							        easing: 'swing',
  							        speed: 500 // opening & closing animation speed
  							    }
  							});
  		  				   
  		  				$("#mdAddTecnicoAtendimento").modal('hide');
					        window.location.reload();
  		  				  }else{
  		  					  
  		  				   noty({
 							    text: '<strong>ATEDUC</strong><br> <br>Erro ao adicionar o técnico, tente novamente! ',
 							    type: 'error',
 							    layout : 'topRight',
 							    timeout: 3000,
 							    progressBar : true,
 							    animation: {
 							        open: {height: 'toggle'},
 							        close: {height: 'toggle'},
 							        easing: 'swing',
 							        speed: 500 // opening & closing animation speed
 							    }
 							});
  		  				  }
  		  			 }
  		  		 });
  		  		 
  			}
  		 });
  	
  	 });
  	 
  /*Valida o formulario de manutencao de micro*/
  	 $(document).ready(function(){
  		
  		 $("#fmFinalizaManutencaoChamado").validate({
  			
  			 rules:{
  				 solucao:{
  					 required:true
  				 },
  				 hd:{
  					 required: true
  				 },
  				 ram:{
  					 required: true
  				 },
  				 processador:{
  					 required: true
  				 },
  				 so:{
  					 required: true
  				 },
  				 marca:{
  					 required: true
  				 }
  			 },
  			 
  			 messages:{
  				 
  				 solucao:{
  					 required:"Campo obrigatório!"
  				 },
  				 hd:{
  					required:"Campo obrigatório!"
  				 },
  				 ram:{
  					required:"Campo obrigatório!"
  				 },
  				 processador:{
  					required:"Campo obrigatório!"
  				 },
  				 so:{
  					required:"Campo obrigatório!"
  				 },
  				 marca:{
  					required:"Campo obrigatório!"
  				 }
  				 
  			 },
  			submitHandler: function (){
  				
  				
  			    var dialog = bootbox.dialog({
  			        message: '<p class="text-center"><i class="fa fa-spin fa-spinner" ></i> Finalizando...</p>',
  			        closeButton: false
  			    });
  			  
  				var dados = $("#fmFinalizaManutencaoChamado").serialize();

  				$.ajax({
  					
  					type: 'POST',
  					url: 'main?action=finaliza-manutencao-micro',
  					data: dados,
  					success : function( data ){
  						
  					  dialog.modal('hide');
  					  
  						bootbox.alert({ 
  						  size: "small",
  						  title: "Tecnologia da Educação",
  						  message: "Micro finalizado com sucesso!", 
  						  callback: function(){
  							  
  							  location.reload();
  						  }
  						})
  					}
  				});
  			}
  		 });
  	 });
  	 
  	 
  
  	 
  	/*Alterar div tipo de patrimonio*/
     alteraDivPat = function (){
        
  	if($("#select_tipo_pat").val()){
  		
  	   if($('#select_tipo_pat').val() == 0){
 	    	$("#notFiscal").hide();
 	        $("#pat").hide();
 	    }
 	    
 	    if($('#select_tipo_pat').val() == 1){
 	    	$("#notFiscal").show();
 	        $("#pat").hide();
 	     }
 	    
 	    if($('#select_tipo_pat').val() == 2){
 	    	$("#notFiscal").hide();
 	        $("#pat").show();
 	    }
  	}
  	
  	for(x=1; x<=10; x++){
  	if($("#select_tipo_pat"+x).val()){
  		
   	   if($('#select_tipo_pat'+x).val() == 0){
  	    	$("#notFiscal"+x).hide();
  	        $("#pat"+x).hide();
  	    }
  	    
  	    if($('#select_tipo_pat'+x).val() == 1){
  	    	$("#notFiscal"+x).show();
  	        $("#pat"+x).hide();
  	     }
  	    
  	    if($('#select_tipo_pat'+x).val() == 2){
  	    	$("#notFiscal"+x).hide();
  	        $("#pat"+x).show();
  	    }
   	}
  	}
  	}
     
     /*valida fechamento chamado computador*/
     $(document).ready(function(){
    	$("#fmFechaChamadoComp").validate({
    		rules:{
    			desc_fechamento:{
    				required:true
    			}
    		},
    		messages:{
    			desc_fechamento:{
    				required:"Campo obrigatório!"
    			}
    		},
    		submitHandler: function(){
    			var dados = $("#fmFechaChamadoComp").serialize();
    			
    			$.ajax({
    				type: 'POST',
    				url: 'main?action=fecha-chamado-micro',
    				data: dados,
    				success : function(data){
    					
    					if(data == 'true'){
    						  noty({
    							    text: '<strong>ATEDUC</strong><br> <br>Chamado Encerrado! ',
    							    type: 'success',
    							    layout : 'topRight',
    							    timeout: 3000,
    							    progressBar : true,
    							    animation: {
    							        open: {height: 'toggle'},
    							        close: {height: 'toggle'},
    							        easing: 'swing',
    							        speed: 500 // opening & closing animation speed
    							    }
    							});
    					}else{
    						  noty({
  							    text: '<strong>ATEDUC</strong><br> <br>Erro ao encerrar chamado, tente novamente! ',
  							    type: 'error',
  							    layout : 'topRight',
  							    timeout: 3000,
  							    progressBar : true,
  							    animation: {
  							        open: {height: 'toggle'},
  							        close: {height: 'toggle'},
  							        easing: 'swing',
  							        speed: 500 // opening & closing animation speed
  							    }
  							});
    					}
    				}
    			});
    		}
    	}) ;
     });
  
     /*Gera termo de entrega de micro da manutenção*/
     function geraTermoEntregaMicro(chamado){
    	 window.open('main?action=termo-entrega-micro&num-chamado='+chamado);
     }
     
     function selectSolucaoTablet(){
    	 
    	 if($("#select_problema_tablet").val() == ""){
    		 $("#sol").hide();
    	 }
    	 if($("#select_problema_tablet").val() == 'ima'){
    		 $("#sol").hide();
    	 }
    	 if($("#select_problema_tablet").val() == 'departamento'){
    		 $("#sol").show();
    	 }
     }
     
     /*Adiciona tecnico manutenção em tablet*/
	 $(document).ready(function(){
	  		
  		 $("#fmTecnicoRespTablet").validate({
  			 
  			 rules:{
  				idMicroManutencao:{
  					required: true
  				},
  				idUsuario:{
  					required: true
  				}
  			 },
  			 
  			 messages:{
  				idMicroManutencao:{
  					required: true
  				},
  				idUsuario:{
  					required: true
  				}
  			 },
  			submitHandler: function (){
  				
  				 var dados = $("#fmTecnicoRespTablet").serialize();
  		  		 $.ajax({
  		  			 type: 'POST',
  		  			 url: 'main?action=detalhe-chamado-tablet',
  		  			 data: dados,
  		  			 success : function( data ){
  		  				  if(data == 'true'){
  		  					  
  		  				   noty({
  							    text: '<strong>ATEDUC</strong><br> <br>Responsável adicionado com sucesso! ',
  							    type: 'success',
  							    layout : 'topRight',
  							    timeout: 3000,
  							    progressBar : true,
  							    animation: {
  							        open: {height: 'toggle'},
  							        close: {height: 'toggle'},
  							        easing: 'swing',
  							        speed: 500 // opening & closing animation speed
  							    }
  							});
  		  				   
  		  				$("#mdAddTecnicoAtendimentoTablet").modal('hide');
					        window.location.reload();
  		  				  }else{
  		  					  
  		  				   noty({
 							    text: '<strong>ATEDUC</strong><br> <br>Erro ao adicionar o técnico, tente novamente! ',
 							    type: 'error',
 							    layout : 'topRight',
 							    timeout: 3000,
 							    progressBar : true,
 							    animation: {
 							        open: {height: 'toggle'},
 							        close: {height: 'toggle'},
 							        easing: 'swing',
 							        speed: 500 // opening & closing animation speed
 							    }
 							});
  		  				  }
  		  			 }
  		  		 });
  		  		 
  			}
  		 });
  	
  	 });
	 
	 /*Adiciona tecnicovisita*/
	 $(document).ready(function(){
	  		
  		 $("#fmTecnicoVisita").validate({
  			 
  			 rules:{
  				idMicroManutencao:{
  					required: true
  				},
  				idUsuario:{
  					required: true
  				}
  			 },
  			 
  			 messages:{
  				idMicroManutencao:{
  					required: true
  				},
  				idUsuario:{
  					required: true
  				}
  			 },
  			submitHandler: function (){
  				 var dados = $("#fmTecnicoVisita").serialize();
  		  		 $.ajax({
  		  			 type: 'POST',
  		  			 url: 'main?action=detalhe-chamado-visita',
  		  			 data: dados,
  		  			 success : function( data ){
  		  				  if(data == 'true'){
  		  					  
  		  				   noty({
  							    text: '<strong>ATEDUC</strong><br> <br>Responsável adicionado com sucesso! ',
  							    type: 'success',
  							    layout : 'topRight',
  							    timeout: 3000,
  							    progressBar : true,
  							    animation: {
  							        open: {height: 'toggle'},
  							        close: {height: 'toggle'},
  							        easing: 'swing',
  							        speed: 500 // opening & closing animation speed
  							    }
  							});
  		  				   
  		  				$("#mdAddTecnicoAtendimentoVisita").modal('hide');
					        window.location.reload();
  		  				  }else{
  		  					  
  		  				   noty({
 							    text: '<strong>ATEDUC</strong><br> <br>Erro ao adicionar o técnico, tente novamente! ',
 							    type: 'error',
 							    layout : 'topRight',
 							    timeout: 3000,
 							    progressBar : true,
 							    animation: {
 							        open: {height: 'toggle'},
 							        close: {height: 'toggle'},
 							        easing: 'swing',
 							        speed: 500 // opening & closing animation speed
 							    }
 							});
  		  				  }
  		  			 }
  		  		 });
  		  		 
  			}
  		 });
  	
  	 });
	 /*Valida formulario finaliza tablet manutencao*/
	 $(document).ready(function(){
		
		 $("#fmFinalizaTablet").validate({
			
			 rules:{
				 select_problema_tablet:{
					 required:true
				 },
				 solucao:{
					 required:true
				 }
			 },
			 messages:{
				 
				 select_problema_tablet:{
					 required:"<i class='fa fa-window-close' aria-hidden='true'></i> Selecione uma opção"
				 },
				 solucao:{
					 required:"<i class='fa fa-window-close' aria-hidden='true'></i> Campo obrigatório!"
				 }
			 },
			 submitHandler:function(){
				 
				 var dados = $("#fmFinalizaTablet").serialize();
				 
				 $.ajax({
					type: 'POST',
					url: 'main?action=finaliza-chamado-tablet',
					data: dados,
					success : function(data){
						if(data == 'true'){
		  					  
	  		  				   noty({
	  							    text: '<strong>ATEDUC</strong><br> <br>Finalizado com sucesso! ',
	  							    type: 'success',
	  							    layout : 'topRight',
	  							    timeout: 3000,
	  							    progressBar : true,
	  							    animation: {
	  							        open: {height: 'toggle'},
	  							        close: {height: 'toggle'},
	  							        easing: 'swing',
	  							        speed: 500 // opening & closing animation speed
	  							    }
	  							});
	  		  				   
						        window.location.reload();
	  		  				  }else{
	  		  					  
	  		  				   noty({
	 							    text: '<strong>ATEDUC</strong><br> <br>Erro ao finalizar, tente novamente! ',
	 							    type: 'error',
	 							    layout : 'topRight',
	 							    timeout: 3000,
	 							    progressBar : true,
	 							    animation: {
	 							        open: {height: 'toggle'},
	 							        close: {height: 'toggle'},
	 							        easing: 'swing',
	 							        speed: 500 // opening & closing animation speed
	 							    }
	 							});
	  		  				  }
					}
				 });
			 }
		 });
	 });
	 
	 /*Valida formulario envia tablet para ima*/
	 $(document).ready(function(){
		
		 $("#fmEnviaTabletIma").validate({
			
			 rules:{
				 resp_ima:{
					 required:true
				 },
				 idUsuarioEnviaIma:{
					 required:true
				 }
			 },
			 messages:{
				 
				 resp_ima:{
					 required:"<i class='fa fa-window-close' aria-hidden='true'></i> Informe o nome do responsável..."
				 },
				 idUsuarioEnviaIma:{
					 required:"<i class='fa fa-window-close' aria-hidden='true'></i> Campo obrigatório!"
				 }
			 },
			 submitHandler:function(){
				 var dados = $("#fmEnviaTabletIma").serialize();
				 
				 $.ajax({
					type: 'POST',
					url: 'main?action=finaliza-chamado-tablet',
					data: dados,
					success : function(data){
						  if(data == 'true'){
  		  					  
	  		  				   noty({
	  							    text: '<strong>ATEDUC</strong><br> <br>Salvo com sucesso! ',
	  							    type: 'success',
	  							    layout : 'topRight',
	  							    timeout: 3000,
	  							    progressBar : true,
	  							    animation: {
	  							        open: {height: 'toggle'},
	  							        close: {height: 'toggle'},
	  							        easing: 'swing',
	  							        speed: 500 // opening & closing animation speed
	  							    }
	  							});
	  		  				   
						        window.location.reload();
	  		  				  }else{
	  		  					 noty({
		  							    text: '<strong>ATEDUC</strong><br> <br>Erro ao salvar! ',
		  							    type: 'success',
		  							    layout : 'topRight',
		  							    timeout: 3000,
		  							    progressBar : true,
		  							    animation: {
		  							        open: {height: 'toggle'},
		  							        close: {height: 'toggle'},
		  							        easing: 'swing',
		  							        speed: 500 // opening & closing animation speed
		  							    }
		  							});
	  		  				  }
					}
				 });
			 }
		 });
	 });
	 
	 /*Valida formulario chega tablet da ima*/
	 $(document).ready(function(){
		
		 $("#fmChegaTabletIma").validate({
			
			 rules:{
				 idUsuarioRecIma:{
					 required:true
				 },
				 chamado:{
					 required:true
				 }
			 },
			 messages:{
				 
				 idUsuarioRecIma:{
					 required:"<i class='fa fa-window-close' aria-hidden='true'></i> Campo deve ser preenchido..."
				 },
				 chamado:{
					 required:"<i class='fa fa-window-close' aria-hidden='true'></i> Campo obrigatório!"
				 }
			 },
			 submitHandler:function(){
				 var dados = $("#fmChegaTabletIma").serialize();
				 
				 $.ajax({
					type: 'POST',
					url: 'main?action=finaliza-chamado-tablet',
					data: dados,
					success : function(data){
						  if(data == 'true'){
  		  					  
	  		  				   noty({
	  							    text: '<strong>ATEDUC</strong><br> <br>Salvo com sucesso! ',
	  							    type: 'success',
	  							    layout : 'topRight',
	  							    timeout: 3000,
	  							    progressBar : true,
	  							    animation: {
	  							        open: {height: 'toggle'},
	  							        close: {height: 'toggle'},
	  							        easing: 'swing',
	  							        speed: 500 // opening & closing animation speed
	  							    }
	  							});
	  		  				   
						        window.location.reload();
	  		  				  }else{
	  		  					 noty({
		  							    text: '<strong>ATEDUC</strong><br> <br>Erro ao salvar! ',
		  							    type: 'error',
		  							    layout : 'topRight',
		  							    timeout: 3000,
		  							    progressBar : true,
		  							    animation: {
		  							        open: {height: 'toggle'},
		  							        close: {height: 'toggle'},
		  							        easing: 'swing',
		  							        speed: 500 // opening & closing animation speed
		  							    }
		  							});
	  		  				  }
					}
				 });
			 }
		 });
	 });
	
     /*Vizualiza tablet manutencao*/
	 function detalheTabletManutencao(chamado){
		 location = "main?action=detalhe-chamado-tablet&numero-chamado-interno="+chamado;
	 }
	
	 /*Muda status do usuario*/
	 function mudaStatusUsuario(id){
        $("#mdMudaStatusUser").modal('show');
        $("#idUsuarioMudarStatus").val(id);

	 }
	 
	 $(document).ready(function(){
		
		 $("#fmMudaStatusUsuario").validate({
			
			 rules:{
				 idUsuarioMudarStatus:{
					 required:true
				 },
				 idUsuarioAdm:{
					 required:true 
				 }
			 },
			 messages:{
				 idUsuarioMudarStatus:{
					 required:true
				 },
				 idUsuarioAdm:{
					 required:true 
				 }
			 },
			 submitHandler: function(){
				 var dados = $("#fmMudaStatusUsuario").serialize();
				 
				 $.ajax({
					 type:'POST',
					 url: 'main?action=administra-usuario',
					 data: dados,
					 success : function(data){
						 
						 if(data == "true"){
							 location.reload();
						 }else{
							 noty({
	  							    text: '<strong>ATEDUC</strong><br> <br>Erro ao mudar status, Tente novamente. ',
	  							    type: 'error',
	  							    layout : 'topRight',
	  							    timeout: 3000,
	  							    progressBar : true,
	  							    animation: {
	  							        open: {height: 'toggle'},
	  							        close: {height: 'toggle'},
	  							        easing: 'swing',
	  							        speed: 500 // opening & closing animation speed
	  							    }
	  							});
						 }
					 }
				 });
			 }
		 });
	 });
	 
	 /*Ver hisorico do usuario**/
	 function verHistoricoUser(id){
		 location = "main?action=usuario-historico&idUsuario="+id;
	 }
	 
	 /*Validar formulario de cadastro do visita tecnica*/
	    $(document).ready(function(){
	    	
	    	$("#fmVisita").validate({
	    		
	    		rules:{
	    			
	    			instituicao:{
	    				required: true
	    					
	    			},
	    		
	    			desc_problema:{
	    				required: true
	    			}
	    			
	    		},
	    		
          messages:{
	    			
	    			instituicao:{
	    				required: "<span class='fa fa-window-close' aria-hidden='true'></span> Escolha uma instituição..."
	    			},
	    			desc_problema:{
	    				required: "<i class='fa fa-window-close' aria-hidden='true'></i> Campo obrigatório!"
	    			}
	    			
	    		},
	    		
	    		submitHandler: function (){
	    			var dados = $("#fmVisita").serialize();
	    			
	    			$.ajax({
	    				url: 'main?action=cadastrar-visita',
	    				type: 'POST',
	    				data: dados,
	    				success : function( data ){
	    					var vdd = data.substring(0,4);
	    					var chamado = data.substring(4,16);
                  
	    					if(vdd == 'true'){
	    						
	    						 noty({
	  							    text: '<strong>ATEDUC</strong><br> <br>Chamado cadastrado com sucesso! ',
	  							    type: 'success',
	  							    layout : 'topRight',
	  							    timeout: 3000,
	  							    progressBar : true,
	  							    animation: {
	  							        open: {height: 'toggle'},
	  							        close: {height: 'toggle'},
	  							        easing: 'swing',
	  							        speed: 500 // opening & closing animation speed
	  							    }
	  							});
	    					
	    						
	    						location = "main?action=detalhe-chamado-visita&numero-chamado-interno="+chamado;
	    					}else{
	    						noty({
	  							    text: '<strong>ATEDUC</strong><br> <br>Erro ao cadastrar chamado, tente novamente! ',
	  							    type: 'error',
	  							    layout : 'topRight',
	  							    timeout: 3000,
	  							    progressBar : true,
	  							    animation: {
	  							        open: {height: 'toggle'},
	  							        close: {height: 'toggle'},
	  							        easing: 'swing',
	  							        speed: 500 // opening & closing animation speed
	  							    }
	  							});
	    					}
	    					
	    				
						     
						    // document.getElementById("fmTablet").reset();
	    					
	    				}
	    				
	    			});
	    			
	    		}
	    	});
	    });