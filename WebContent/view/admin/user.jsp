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
                  <form method="post" action=User class="md-form" enctype="multipart/form-data" >
                   
                      <div class="col-md-5">
                        <div class="form-group">
                          <label class="bmd-label-floating">Company (disabled)</label>
                          <input type="text" class="form-control" disabled>
                        </div>
                      </div>
                      <div class="row">
                      <div class="col-md-3">
                        <div class="form-group">
                          <label class="bmd-label-floating">Email</label>
                          <input type="email" name="email" class="form-control">
                        </div>
                        </div>
                      </div>
                      
                      <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label class="bmd-label-floating">Nom</label>
                          <input type="text" name="nom" class="form-control">
                        </div>
                      </div>
                    </div>
                    
                     <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label class="bmd-label-floating">Mot de Passe</label>
                          <input type="password" name="password" class="form-control">
                        </div>
                      </div>
                    </div>
                                                       
                     <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label class="bmd-label-floating">Prénom</label>
                          <input type="text" name="prenom"  class="form-control">
                        </div>
                      </div>
                    </div>                    
                     <!--  <div>
                      <input type="file" name="photo" accept="image/*" multiple>
                      </div>--> 
                      <!-- pour les fichiers -->
                      <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                         <label class="bmd-label-floating">Photo</label> 
                                                  
                        </div>
                      <div class="file-field">
						    <div class="btn btn-primary btn-sm float-left">
						      <span>Choose file</span>
						      <input type="file" id="file" name="file" />
						    </div>						    
						  </div> 
						   </div>                       
                    </div>                 
                    <button type="submit" class="btn btn-success pull-right">Envoyer</button>
                    <div class="clearfix"></div> 
                  </form>
                </div>                
              </div>
            </div>
           
           
            
            
           
          </div>
        </div>
      </div>
      <jsp:include page="../../footer.jsp"></jsp:include>