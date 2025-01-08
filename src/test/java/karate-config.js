function fn() {
	
	var config = {
		name : "jancy" ,
		baseURL : 'https://reqres.in/api/users?page=2'
		
	};
	
	var env = karate.en;
	karate.log('The values of env is:' ,env);
	
	if(env == 'qa') {
		config.baseURL = 'https://reqres.in/api/qa';
	}
	else if(env == 'dev') {
		config.baseURL = 'https://reqres.in/api/dev';
	}
	else {
		config.baseURL = 'https://reqres.in/api/api';
	}
	
	karate.configure('connectTimeout',5000);
	karate.configure('readTimeout',5000);
	
	return config ;
	
}