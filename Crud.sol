pragma solidity ^0.5.1;


contract Crud {
    struct User {
        uint id;
        string name;
        string email;
        string telephone;
        string fonction; 
        string adresse;
    }

    User[] public users;
    uint public nextId;

    function createUser (string memory _name, string memory _email, string memory _telephone,
    string memory _fonction, string memory _adresse) public
    {
        users.push(User(nextId, _name, _email, _telephone, _fonction, _adresse));
        nextId++;
    }

    function updateUser (uint _id, string memory _name, string memory _email, string memory _telephone,
    string memory _fonction, string memory _adresse) public
    {
        uint i = findUser(_id);
        users[i].name = _name;
        users[i].email = _email;
        users[i].telephone = _telephone;
        users[i].fonction = _fonction;
        users[i].adresse = _adresse;
    }

    function readUser(uint _id) public view returns (uint, string memory, string memory,
    string memory, string memory, string memory)
    {
        uint i = findUser(_id);
        return (users[i].id, users[i].name, users[i].email, users[i].telephone, users[i].fonction, users[i].adresse);
    }

    function deleteUser(uint _id) public {
        uint i = _id;
        delete users[i];
    }

    function findUser (uint _id) internal view returns (uint) {
        for (uint i = 0; i < users.length; i++) {
            if (users[i].id == _id) {
                return i;
            }
        }
    }
}