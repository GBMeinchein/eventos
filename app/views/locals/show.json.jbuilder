json.extract! @local, :id, :nome, :cidade_id, :created_at, :updated_at, :latitude, :longitude

%h1=@local.nome
%p
  lat:
  =@local.latitude
%p
  lng:
  =@local.longitude
/ map div
#map{:style => "width: 550px; height: 350px;"}

:javascript
  $(document).ready(function(){
    var company = #{@local.to_json}    // pass ruby variable to javascript
    gmap_show(company);    // init show map for company card (only print marker)
  });
