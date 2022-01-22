// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;


contract Ballot {

/* requirements:
    - One chairperson
      Rights:
        - can register candidates before voting starts
        - can give right to vote
        - can start vote
    - Registered Voters  can vote
    - Anyone can see winner
*/
    struct Candidate {
        string name;
        string party;
        int totalVotes;
        bool valid;
    }

    struct Voter {
        bool registered;
        bool voted;
    }


    address public chairperson;
    bool public votingStarted;
    mapping(string => Candidate) public candidates;
    mapping(address => Voter) public voters;
    string[] public candidatesName;

    modifier onlyChairperson() {
        require(msg.sender == chairperson, "Only ChairPerson is permitted to execute this action");
        _;
    }

    modifier votingHasStarted() {
        require(votingStarted==true, "");
        _;
    }

    modifier votingHasNotStarted() {
        require(votingStarted==false, "");
        _;
    }

    constructor() {
        chairperson = msg.sender;
        addVoter(msg.sender);
    }

    function registerCandidate(string memory _name, string memory _party) public onlyChairperson() votingHasNotStarted() returns(Candidate memory candidate){
        candidate = Candidate({
            name: _name,
            party: _party,
            totalVotes: 0,
            valid: true
        });

        candidates[_name] = candidate;
        candidatesName.push(_name);
    }

    function startVote() public onlyChairperson() {
        votingStarted = true;
    }


    function addVoter(address _voter_address) public onlyChairperson() votingHasNotStarted() {
        if (_voter_address != address(0x00) && !voters[_voter_address].registered){

            voters[_voter_address] = Voter({
                registered: true,
                voted: false
            });
        }
    }

    function vote(string memory _candidate_name) public votingHasStarted() {
        require(voters[msg.sender].registered, "Voter is not registered");
        require(!voters[msg.sender].voted, "Voter has voted");
        Candidate memory _candidate = candidates[_candidate_name];
        require(_candidate.valid == true, "Invalid candidate");

        _candidate.totalVotes += 1;
        voters[msg.sender].voted = true;
    }

    function getWinner() public view returns (Candidate memory winner) {
        int max_vote = 0;
        for (uint256 i = 0; i < candidatesName.length; i++) {
            if (candidates[candidatesName[i]].totalVotes > max_vote){
                max_vote = candidates[candidatesName[i]].totalVotes;
                winner = candidates[candidatesName[i]];
            }
        }
    }

}