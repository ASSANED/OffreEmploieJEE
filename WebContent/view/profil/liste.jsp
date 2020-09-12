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
                  <form method="post" action=Profil>
                   
                      <div class="col-md-5">
                        <div class="form-group">
                          <label class="bmd-label-floating">Company (disabled)</label>
                          <input type="text" class="form-control" disabled>
                        </div>
                      </div>
                     	
                      <div class="col-md-3">
                        <div class="form-group">
                          <label class="bmd-label-floating">Nom</label>
                          <c:if test="${profil !=null }">
                          <input type="hidden" name="id" class="form-control" value='${profil.id  }'>
                          </c:if>                         
                          <input type="text" name="nom" class="form-control" value='<c:if test="${profil !=null }">${profil.nom  }</c:if>'>
                          
                        </div>
                      </div>
                      
                   <c:if test="${profil !=null }">                  
                   <button type="submit" class="btn btn-success pull-right">Modifier</button>
                   </c:if>
                   <c:if test="${profil == null }">
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
                  <h4 class="card-title mt-0"> La liste des Profils</h4>
                  
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table table-hover">
                    <tr>
                    <th>Identifiant</th>
                    <th>Nom</th>                    
                    <th>Action</th>
                    <th>Action</th>
                    </tr>
                    <c:forEach items="${profils }" var="p">
                    <tr>
                    <td>${p.id }</td>
                    <td>${p.nom }</td>                   
                    <td><a href="Profil?action=edit&idP=${p.id }">Editer</a></td>
                    <td><a href="Profil?action=delete&idP=${p.id }" onclick="if(!confirm('Voulez-vous supprim� ?')) return false;">Supprimer</a></td>
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