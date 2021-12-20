## Local Filebin

You can run a local instance of Filebin. First clone repository.

```{bash eval = FALSE}
# Clone with SSH.
git clone git@github.com:espebra/filebin2.git
# Clone with HTTPS.
git clone https://github.com/espebra/filebin2.git
```

Change into `filebin2` directory.

```{bash eval = FALSE}
cd filebin2
```

Start the service.

```{bash eval = FALSE}
docker-compose up --build
```

The local Filebin instance will then be available at http://localhost:8080/. You can access the administrative interface at http://admin:changeme@localhost:8080/admin.

To use the local Filebin instance with `{filebin}` just update the base URL.

```{r eval = FALSE}
base_url("http://localhost:8080")
```

To use the S3 backend you'll need to set the following environment variables prior to launching the Docker containers:

```
export S3_ACCESS_KEY=
export S3_SECRET_KEY=
export S3_REGION=
export S3_BUCKET=
```
