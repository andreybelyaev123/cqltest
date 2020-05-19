package com.clarivate.cql;

import java.net.InetSocketAddress;
import java.util.Collections;
import java.util.List;

import software.aws.mcs.auth.SigV4AuthProvider;
import com.datastax.oss.driver.api.core.CqlSession;

import javax.net.ssl.SSLContext;

public class AmazonKeyspaces {

  public static void main(String[] args) {
    String datacenter = "us-west-2";
    String endpoint = "cassandra.us-west-2.amazonaws.com";
    String keyspace = "dynomite_dev";

    SigV4AuthProvider provider = new SigV4AuthProvider(datacenter);
    List<InetSocketAddress> contactPoints = Collections.singletonList(new InetSocketAddress(endpoint, 9142));
    try {
      CqlSession session = CqlSession.builder()
          .addContactPoints(contactPoints)
          .withSslContext(SSLContext.getDefault())
          .withAuthProvider(provider)
          .withLocalDatacenter(datacenter)
          .withKeyspace(keyspace)
          .build();
    }
    catch (Exception e) {
      System.out.println(e.getStackTrace());
    }
  }
}
