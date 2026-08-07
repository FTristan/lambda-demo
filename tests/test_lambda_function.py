from lambda_function import lambda_handler


def test_lambda_handler_returns_success_response():
    response = lambda_handler({}, None)

    assert response["statusCode"] == 200
    assert "Hello from Fernando" in response["body"]
