import ballerina/http;

configurable string host = ?;
configurable int port = ?;

listener http:Listener ep0 = new (port, config = {host: host});

service /user\-management on ep0 {
    # Create a new user
    #
    # + payload - parameter description 
    # + return - returns can be any of following types
    # http:Created (User created)
    # http:BadRequest (Bad request)
    resource function post users(@http:Payload User payload) returns json|error? {
        json response = {
            status: "User created successfully",
            userId: "usr123"
        };
        return response;
    }
    # Get user by ID
    #
    # + userId - Unique ID of the user 
    # + return - returns can be any of following types
    # http:Ok (User details)
    # http:NotFound (User not found)
    resource function get users/[string userId]() returns User|http:Ok|http:NotFound {
        User user = {
            userId: "usr123",
            username: "JohnDoe",
            email: "johndoe@example.com"
        };
        return user;
    }
}
