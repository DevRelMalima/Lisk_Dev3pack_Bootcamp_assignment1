// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract Profile {
    // Define User struct
    struct User {
        string name;
        uint age;
        string email;
        uint registrationTimestamp;
    }

    // Mapping from user address to User struct
    mapping(address => User) private users;

    // Events
    event UserRegistered(address indexed userAddress, uint timestamp);
    event ProfileUpdated(address indexed userAddress);

    // Register a new user
    function register(string memory _name, uint _age, string memory _email) public {
        require(users[msg.sender].registrationTimestamp == 0, "User already registered.");

        users[msg.sender] = User({
            name: _name,
            age: _age,
            email: _email,
            registrationTimestamp: block.timestamp
        });

        emit UserRegistered(msg.sender, block.timestamp);
    }

    // Update existing user profile
    function updateProfile(string memory _name, uint _age, string memory _email) public {
        require(users[msg.sender].registrationTimestamp != 0, "User not registered.");

        users[msg.sender].name = _name;
        users[msg.sender].age = _age;
        users[msg.sender].email = _email;

        emit ProfileUpdated(msg.sender);
    }

    // Get user profile
    function getProfile(address userAddress) public view returns (
        string memory name,
        uint age,
        string memory email,
        uint registrationTimestamp
    ) {
        require(users[userAddress].registrationTimestamp != 0, "User not found.");
        User memory user = users[userAddress];
        return (user.name, user.age, user.email, user.registrationTimestamp);
    }

    // Get caller's profile
    function myProfile() public view returns (
        string memory name,
        uint age,
        string memory email,
        uint registrationTimestamp
    ) {
        return getProfile(msg.sender);
    }

    // Optional: Check if user is registered
    function isRegistered(address userAddress) public view returns (bool) {
        return users[userAddress].registrationTimestamp != 0;
    }
}
