pragma solidity ^0.4.18;

contract SecretBallot {
    // The address of the account that created this ballot.
    address public treasureHuntHost;

    string private answer;

    // // Is voting finished? The ballot creator determines when to set this flag.
    bool public gameHasEnded;

    // The total number of votes cast so far. Revealed before voting has ended.
    uint256 public totalGuesses;

    // TODO pot

    constructor(string _answer) public {
        treasureHuntHost = msg.sender;
        answer = _answer;
    }

    function compareStrings (string memory a, string memory b) public view 
        returns (bool) {
        return (keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked((b))) );
    }

    function makeGuess (string myGuess) public {
        // can only vote during voting period
        require(!gameHasEnded);
        // prevent overflow
        require(totalGuesses < ~uint256(0));

        // TODO add their money to the pot

        if (compareStrings(myGuess, answer)) {
            // TODO how to pay out msg.sender?
            gameHasEnded = true;
            return;
        }
        totalGuesses += 1;
    }

}
