/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mymaven.webservices;

import javax.ws.rs.ClientErrorException;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.WebTarget;

/**
 * Jersey REST client generated for REST resource:myservices [services]<br>
 * USAGE:
 * <pre>
 *        InsertQuestionClient client = new InsertQuestionClient();
 *        Object response = client.XXX(...);
 *        // do whatever with response
 *        client.close();
 * </pre>
 *
 * @author georgia
 */
public class DeleteEmployeeClient {

    private WebTarget webTarget;
    private Client client;
    private static final String BASE_URI = "http://localhost:8080/project/webresources";

    public DeleteEmployeeClient() {
        client = javax.ws.rs.client.ClientBuilder.newClient();
        webTarget = client.target(BASE_URI).path("services");
    }

    public <T> T DeleteEmplpoyee(Object requestEntity, Class<T> responseType) throws ClientErrorException {
        return webTarget.path("Deleteemployees").request(javax.ws.rs.core.MediaType.APPLICATION_XML).post(javax.ws.rs.client.Entity.entity(requestEntity, javax.ws.rs.core.MediaType.APPLICATION_XML), responseType);
    }

    public void close() {
        client.close();
    }
}
    
