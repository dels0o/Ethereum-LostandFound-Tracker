// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract LostAndFound {

    struct Item {
        uint id;
        string name;
        string category;
        string location;
        string description;
        bool found;
        address reporter;
    }

    uint public itemCount;

    mapping(uint => Item) public items;

    event ItemReported(
        uint id,
        string name,
        address reporter
    );

    event ItemFound(
        uint id
    );

    function reportItem(
        string memory _name,
        string memory _category,
        string memory _location,
        string memory _description
    ) public {

        itemCount++;

        items[itemCount] = Item(
            itemCount,
            _name,
            _category,
            _location,
            _description,
            false,
            msg.sender
        );

        emit ItemReported(
            itemCount,
            _name,
            msg.sender
        );
    }

    function markAsFound(uint _id) public {

        require(
            msg.sender == items[_id].reporter,
            "Only reporter can update"
        );

        items[_id].found = true;

        emit ItemFound(_id);
    }

    function getItem(uint _id)
        public
        view
        returns(Item memory)
    {
        return items[_id];
    }

}
