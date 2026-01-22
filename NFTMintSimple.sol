// SPDX-Licence-idintifier:MIT 

pragma solidity ^0.8.10;

    import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
    import "@openzeppelin/contracts/access/Ownable.sol";

contract Mintnft is ERC721, Ownable (address(this)){
   
    uint256 public mintprice = 0.05 ether;
    uint256 public totalsupply;
    uint256 public MaxSupply;
    bool public isMintEnable;
    mapping (address => uint256) public mintedWallets;

    constructor () payable ERC721('Mintnft','EasyMint'){

        MaxSupply = 20;
    }

    function toggleisMintEnabled() public    onlyOwner() {
        isMintEnable = !isMintEnable;
    }

    function SetMaxSupply(uint256 MaxSupply_) external onlyOwner(){
        MaxSupply = MaxSupply_;

    }
    

    function mint() external payable {
        require(isMintEnable,"mint not enable");
        require(mintedWallets[msg.sender] <1 , "Mint max per wallet");
        require(msg.value == mintprice ,"Wrong value");
        require(MaxSupply > totalsupply , "Sold out");
        mintedWallets[msg.sender]++;
        totalsupply++;
        uint tokenid = totalsupply;
        _safeMint (msg.sender , tokenid);

    }
}
}


    function mint() external payable {
        require(isMintEnable,"mint not enable");
        require(mintedWallets[msg.sender] <1 , "Mint max per wallet");
        require(msg.value == mintprice ,"Wrong value");
        require(MaxSupply > totalsupply , "Sold out");
        mintedWallets[msg.sender]++;
        totalsupply++;
        uint tokenid = totalsupply;
        _safeMint (msg.sender , tokenid);

    }
}
}





