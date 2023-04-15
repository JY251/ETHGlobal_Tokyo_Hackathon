pragma solidity ^0.8.0;

contract OrderBook {
    enum OrderType {Buy, Sell}

    struct Order {
        uint256 price;
        uint256 amount;
        OrderType orderType;
    }

    mapping(uint256 => Order[]) private buyOrders;
    mapping(uint256 => Order[]) private sellOrders;

    function addOrder(uint256 price, uint256 amount, OrderType orderType) public {
        Order memory order = Order(price, amount, orderType);
        if (orderType == OrderType.Buy) {
            buyOrders[price].push(order);
        } else if (orderType == OrderType.Sell) {
            sellOrders[price].push(order);
        }
    }

    function removeOrder(uint256 price, uint256 index, OrderType orderType) public {
        if (orderType == OrderType.Buy) {
            delete buyOrders[price][index];
        } else if (orderType == OrderType.Sell) {
            delete sellOrders[price][index];
        }
    }

    function getBestBid() public view returns (uint256, uint256) {
        uint256 bestPrice = 0;
        uint256 bestAmount = 0;
        for (uint256 i = 0; i < buyOrders[bestPrice].length; i++) {
            if (buyOrders[bestPrice][i].amount > bestAmount) {
                bestAmount = buyOrders[bestPrice][i].amount;
            }
        }
        return (bestPrice, bestAmount);
    }

    function getBestAsk() public view returns (uint256, uint256) {
        uint256 bestPrice = 0;
        uint256 bestAmount = 0;
        for (uint256 i = 0; i < sellOrders[bestPrice].length; i++) {
            if (sellOrders[bestPrice][i].amount > bestAmount) {
                bestAmount = sellOrders[bestPrice][i].amount;
            }
        }
        return (bestPrice, bestAmount);
    }
}