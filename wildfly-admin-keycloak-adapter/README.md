# wildfly-admin-keycloak-adapter

This image extends the ivonet/wildfly-admin image and extends the installed wildfly with the keycload wildfly adapter.
The application.xml is also adjusted for the standalone profile to enable the keycloak security provider though the installed adapter.



Tip:
You can make deployments easy during development if you start the server with something like the following commands.

add somehting like this to your maven project pom.xml:
```xml
    <build>
        <finalName>${project.artifactId}</finalName>
        <plugins>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-war-plugin</artifactId>
                <version>2.5</version>
                <configuration>
                    <warName>${project.artifactId}</warName>
                    <outputDirectory>artifact</outputDirectory>
                </configuration>
            </plugin>
        </plugins>
    </build>
```

That wil put the war file in the <project>/artifact folder.  

Now if you start the wildfly instance with somehting like the following command while residing in the root of your project folder it will autodeploy the war on every build because you mounted the project artifact folder in the container at the place where wildfly searches for auto deployments...

```bash
docker run --name ivonet-wildfly -p 8080:8080 -p 9990:9990 -v $(pwd)/artifact:/opt/jboss/wildfly/standalone/deployments/ -d ivonet/wildfly-admin-keycloak-adapter
```


# Note:
Right now this image is maintained in another repository under IvoNet and because of backwards compatebility I will leave it there until a new release.