## R CMD check results

There was 1 NOTE:

```
Found the following (possibly) invalid URLs:
  URL: http://admin:changeme@localhost:8080/admin
    From: README.md
    Status: Error
    Message: libcurl error code 7:
      	Failed to connect to localhost port 8080: Connection refused
  URL: http://localhost:8080/
    From: README.md
    Status: Error
    Message: libcurl error code 7:
      	Failed to connect to localhost port 8080: Connection refused
```

Both of these URLs refer to `localhost` and are only available if running a local Filebin instance. The `README` gives details of setting up such a local instance.
