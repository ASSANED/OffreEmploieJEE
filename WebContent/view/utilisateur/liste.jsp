<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../header.jsp"></jsp:include>
      <div class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                    <div class="card-header card-header-primary">
                  <h4 class="card-title">Edit Profile</h4>
                  <p class="card-category">Complete your profile</p>
                </div>
                <div class="card-body">
                  <form method="post" action=Utilisateur>
                   
                      <div class="col-md-5">
                        <div class="form-group">
                          <label class="bmd-label-floating">Company (disabled)</label>
                          <input type="text" class="form-control" disabled>
                        </div>
                      </div>
                      <div class="col-md-3">
                        <div class="form-group">
                          <label class="bmd-label-floating">Nom</label>
                          <input type="text" name="nom" class="form-control">
                        </div>
                      </div>
                      <div class="col-md-3">
                        <div class="form-group">
                          <label class="bmd-label-floating">Prenom</label>
                          <input type="text" name="prenom" class="form-control">
                        </div>
                      </div>
                      <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label class="bmd-label-floating">email </label>
                          <input type="text" name="email" class="form-control">
                        </div>
                      </div>
                    </div>
                    
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label class="bmd-label-floating">Password </label>
                          <input type="password" name="password" class="form-control">
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label class="bmd-label-floating">Photo </label>
                          <input type="text" name="photo" class="form-control">
                        </div>
                      </div>
                    </div>
                    
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label class="bmd-label-floating">Profil </label>
                          <select name="profil" class="form-control">
                          <option value="">Faites votre choix</option>
                          <c:forEach items="${profils }" var="p">                
		                    <option value="${p.id }">${p.nom }</option>		                    		                   
                          </c:forEach>
                          </select>
                        </div>
                      </div>
                    </div>
                   
                    <button type="submit" class="btn btn-success pull-right">Envoyer</button>
                    <div class="clearfix"></div>
                  </form>
                </div>
                
              </div>
            </div>
            <div class="col-md-12">
              <div class="card card-plain">
                <div class="card-header card-header-primary">
                  <h4 class="card-title mt-0"> La liste des Utilisateurs</h4>
                  
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table table-hover">
                    <tr>
                    <th>Identifiant</th>
                    <th>Nom</th>                    
                    <th>Prenom</th>
                    <th>Email</th>                    
                    <th>Profil</th>                    
                    <th>Action</th>
                    <th>Action</th>
                    </tr>
                    <c:forEach items="${utilisateurs }" var="u">
                    <tr>
                    <td>${u.id }</td>
                    <td>${u.nom }</td>                                       
                    <td>${u.prenom }</td>
                    <td>${u.email }</td>                    
                     <td>${u.profil.nom }</td>                  
                    <td>Editer</td>
                    <td>Supprimer</td>
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