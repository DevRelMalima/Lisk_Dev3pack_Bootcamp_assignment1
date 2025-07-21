# Lisk_Dev3pack_Summer_Bootcamp
Week 1 Lecture 2 - Solidity Fundamentals

## Welcome to our User Registration Smart Contract

This is a straightforward smart contract that enables users to register and manage their profiles on the blockchain. Think of it as a basic sign-up system, but decentralized!

### What does this contract do?

Our `Profile` contract is like a digital guestbook where:

- **New folks can sign up** with their name, age, and email
- **Already registered? No problem!** You can update your info anytime
- **Want to check your profile?** Ask, and the contract will show you

### The Technical Stuff (but keeping it simple!)

**Contract Name**: `profile`  
**Solidity Version**: 0.8.30  
**License**: MIT (free to use!)

### How we store your info

We keep your data in a neat little package called a `User`:
```solidity
struct User {
    string name;        // Your name
    uint age;          // Your age
    string email;      // Your email
    uint registrationTime;  // When you joined us
    bool exists;       // A flag to know you're registered
}
```

### What can you do with this contract?

#### 1. Sign Up! 
```solidity
register("Your Name", 20, "you@email.com")
```
Just call this function with your details and boom - you're in! Don't worry about registering twice; the contract won't let you.

#### 2. Update Your Info 
```solidity
updateProfile("New Name", 30, "malima@email.com")
```
Changed your email? Got older? No worries, just update your profile!

#### 3. Check Your Profile 
```solidity
getProfile()
```
This displays all your stored information, including the date you first registered.
