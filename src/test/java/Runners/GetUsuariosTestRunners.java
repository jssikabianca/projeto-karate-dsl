package Runners;

import com.intuit.karate.junit5.Karate;

public class GetUsuariosTestRunners {
    
    @Karate.Test
    public Karate runGetusuarios()
    {
        return Karate.run("classpath:features/usuarios/GetUsuarios.feature").tags("~@skipme");
    }
    
    @Karate.Test
    public Karate runDeleteusuarios()
    {
        return Karate.run("classpath:features/usuarios/DeleteUsuarios.feature").tags("~@skipme");
    }
}
