# Custom-API-Functions
Some very simple API based functions meant to be deployed as a lambda function.

## Building for Lambda
Via bash, run:
```bash
./build_zip.sh
```

If on windows without access to a bash terminal, zip up `lambda_function.py`, `Utils.py`, `APIDocs.py`, and `__init__.py` into a zip file.

## Deploying to Lambda
Be sure your lambda function uses Python, any modern version should work.
Upload the zip file generated as its code.

## Testing
The exact url will vary based on your setup. See `APIDocs.py` for exact documentation (which is also available via the API):
`GET /` => Returns full API documentation
`GET /?function=<function_name>` => Runs the specified function. Be sure to include parameters if needed.
