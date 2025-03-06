// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Election {
    
    struct Candidate {
        uint256 id;
        string name;
        uint256 voteCount;
    }
    
    mapping (uint256 => Candidate) public candidates;
    uint256 public candidatecount;
    mapping (address => bool) public voter;
    
    event VoteCast(uint256 indexed _candidateid);
    
    constructor() {
        addCandidate("Nikita");
        addCandidate("Aditi");
        addCandidate("Priya");
         addCandidate("Rahul");
    }
    
    function addCandidate(string memory _name) private {
        candidatecount++;
        candidates[candidatecount] = Candidate(candidatecount, _name, 0);
    }
    
    function vote(uint256 _candidateid) public {
        require(!voter[msg.sender], "You have already voted.");
        require(_candidateid > 0 && _candidateid <= candidatecount, "Invalid candidate ID.");
        
        voter[msg.sender] = true;
        candidates[_candidateid].voteCount++;
        
        emit VoteCast(_candidateid);
    }
}
