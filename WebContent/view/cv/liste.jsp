<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--
=========================================================
Material Dashboard - v2.1.2
=========================================================

Product Page: https://www.creative-tim.com/product/material-dashboard
Copyright 2020 Creative Tim (https://www.creative-tim.com)
Coded by Creative Tim

=========================================================
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. -->
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="public/template/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="public/template/assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>Gestion des offres d'emploi
  </title>
  <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
  <!-- CSS Files -->
  <link href="public/template/assets/css/material-dashboard.css?v=2.1.2" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="public/template/assets/demo/demo.css" rel="stylesheet" />
</head>
<script>
function readFilesAndDisplayPreview(files){
	let imageList = document.querySelector('#list');
	imageList.innerHTML = "";
	for(let file of files){
		let reader = new FileReader();
		reader.addEventListener("load", function(event) {
			let span = document.createElement('span');
			span.innerHTML = '<img height="60" src="' + event '"/>';
				imageList.appendChild(span);
				
			
		});
		reader.readAsDataURL( file );
		}
	
}
</script>
<body class="">
  <div class="wrapper ">
    <div class="sidebar" data-color="purple" data-background-color="white" data-image="../assets/img/sidebar-1.jpg">
      <!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"

        Tip 2: you can also add an image using data-image tag
    -->
      <div class="logo"><a href="http://www.creative-tim.com" class="simple-text logo-normal">
          Gestion des offres d'emploi
        </a></div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li class="nav-item  ">
            <a class="nav-link" href="http://localhost:8080/OffreEmploieWEB/">
              <i class="material-icons">dashboard</i>
              <p>Tableau de bord</p>
            </a>
          </li>
         <li class="nav-item ">
            <a class="nav-link" href="Utilisateur">
              <i class="material-icons">Personne</i>
              <p>Profile Demandeur</p>
            </a>
          </li>
          <li class="nav-item active ">
            <a class="nav-link" href="OffreDemandeur">
              <i class="material-icons">content_paste</i>
              <p>Les Offres</p>
            </a>
          </li>
          <li class="nav-item active ">
            <a class="nav-link" href="CV">
              <i class="material-icons">content_paste</i>
              <p>Gestion des Curriculum vitæ</p>
            </a>
          </li>
          
          <li class="nav-item active ">
            <a class="nav-link" href="Utilisateur">
              <i class="material-icons">content_paste</i>
              <p>Inscription</p>
            </a>
          </li>
         
          
        </ul>
      </div>
    </div>
    <div class="main-panel">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <a class="navbar-brand" href="javascript:;">Table List</a>
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="sr-only">Toggle navigation</span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
          </button>
          <div class="collapse navbar-collapse justify-content-end">
            <form class="navbar-form">
              <div class="input-group no-border">
                <input type="text" value="" class="form-control" placeholder="Search...">
                <button type="submit" class="btn btn-white btn-round btn-just-icon">
                  <i class="material-icons">search</i>
                  <div class="ripple-container"></div>
                </button>
              </div>
            </form>
            <ul class="navbar-nav">
              <li class="nav-item">
                <a class="nav-link" href="javascript:;">
                  <i class="material-icons">dashboard</i>
                  <p class="d-lg-none d-md-block">
                    Stats
                  </p>
                </a>
              </li>
              
              <li class="nav-item dropdown">
                <a class="nav-link" href="javascript:;" id="navbarDropdownProfile" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <img style="width:25px;height:25px;" src="${user.photo}" alt="Personne"/>
                 <!-- <i class="material-icons">person</i>                  
                  <p class="d-lg-none d-md-block">
                    Account
                  </p>-->
                  
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownProfile">
                  <a class="dropdown-item" href="#">Profile</a>
                  <a class="dropdown-item" href="#">${user.prenom} ${user.nom }</a>
                  <a class="dropdown-item" href="#">Settings</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="Logout">Log out</a>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
      <div class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                    <div class="card-header card-header-primary">
                  <h4 class="card-title">Creez votre CV</h4>
                  <p class="card-category">Curriculum Vital</p>
                </div>
                <div class="card-body">
                  <form method="post" action=CV>
                   
                      <div class="col-md-5">
                        <div class="form-group">
                          <label class="bmd-label-floating">Company (disabled)</label>
                          <input type="text" class="form-control" disabled>
                        </div>
                      </div>
                     	
                      <div class="col-md-3">
                        <div class="form-group">
                          <label class="bmd-label-floating">Nom</label>
                          <c:if test="${curricirum !=null }">
                          <input type="hidden" name="id" class="form-control" value='${curricirum.id  }'>
                          </c:if>                         
                          <input type="text" name="nom" class="form-control" value='<c:if test="${curricirum !=null }">${curricirum.nom  }</c:if>'>
                          
                        </div>
                      </div>
                      <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label class="bmd-label-floating">Prenom</label>
                          <input type="text" name="prenom" class="form-control" value='<c:if test="${curricirum !=null }">${curricirum.prenom  }</c:if>'>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label class="bmd-label-floating">Age</label>
                          <input type="text" name="age" class="form-control" value='<c:if test="${curricirum !=null }">${curricirum.age  }</c:if>'>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label class="bmd-label-floating">Adresse</label>
                          <input type="text" name="adresse" class="form-control" value='<c:if test="${curricirum !=null }">${curricirum.adresse  }</c:if>'>
                        </div>
                      </div>
                    </div>
                    
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label class="bmd-label-floating">Email</label>
                          <input type="text" name="email" class="form-control" value='<c:if test="${curricirum !=null }">${curricirum.email  }</c:if>'>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label class="bmd-label-floating">Tel</label>
                          <input type="text" name="tel" class="form-control" value='<c:if test="${curricirum !=null }">${curricirum.tel  }</c:if>'>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label class="bmd-label-floating">Specialiter</label>
                          <input type="text" name="specialite" class="form-control" value='<c:if test="${curricirum !=null }">${curricirum.specialite  }</c:if>'>
                        </div>
                      </div>
                    </div>
                     <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label class="bmd-label-floating">Niveau Etude</label>
                          <input type="text" name="niveauEtude" class="form-control" value='<c:if test="${curricirum !=null }">${curricirum.niveauEtude  }</c:if>'>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label class="bmd-label-floating">Experiance Professionel</label>
                          <input type="text" name="expProffessionel" class="form-control" value='<c:if test="${curricirum !=null }">${curricirum.expProffessionel  }</c:if>'>
                        </div>
                      </div>
                    </div>
                    
                    
                      
                   <c:if test="${curricirum !=null }">                  
                   <button type="submit" class="btn btn-success pull-right">Modifier</button>
                   </c:if>
                   <c:if test="${curricirum == null }">
                   <button type="submit" class="btn btn-success pull-right">Envoyer</button>
                   </c:if>
                    
                    <div class="clearfix"></div>
                  </form>
                </div>
                
              </div>
            </div>
            <div class="col-md-12">
              <div class="card card-plain">
                <div class="card-header card-header-primary">
                  <h4 class="card-title mt-0"> La liste des Curriculum vitæ</h4>
                  
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table table-hover">
                    <tr>
                    <th>Identifiant</th>
                    <th>Nom</th> 
                    <th>Prenom</th>
                    <th>Age</th>
                    <th>Adresse</th>
                    <th>Email</th> 
                    <th>Telephone</th>
                    <th>Specialiter</th>
                    <th>Niveau Etude</th>
                    <th>Experiance Professionel</th>                  
                    <th>Action</th>
                    <th>Action</th>
                    </tr>
                    <c:forEach items="${curricirums }" var="c">
                    <tr>
                    <td>${c.id }</td>
                    <td>${c.nom }</td>
                    <td>${c.prenom }</td> 
                    <td>${c.age }</td> 
                    <td>${c.adresse }</td> 
                    <td>${c.email }</td>
                    <td>${c.tel }</td> 
                    <td>${c.specialite }</td>
                    <td>${c.niveauEtude }</td>
                    <td>${c.expProffessionel }</td>
                                         
                    <td><a href="CV?action=edit&idCV=${c.id }">Editer</a></td>
                    <td><a href="CV?action=delete&idCV=${c.id }" onclick="if(!confirm('Voulez-vous supprimé ?')) return false;">Supprimer</a></td>
                    </tr>
                    </c:forEach>
                      </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <jsp:include page="../../footer.jsp"></jsp:include>