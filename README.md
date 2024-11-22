# amazon_clone


In this repository contains functional Amazon Clone with the cross-platform framework, Flutter, with the backend as Firebase.
With Authentication, Database Integration, State Management, Firebase Storage, Firebase Firestore, and much more!






## Roles and Interactions Flowchart

This flowchart demonstrates the key roles (User, Seller, and Admin) and their interactions within platform.
```mermaid
graph TD
    User[User] -->|Browse Products| Seller[Seller]
    User -->|Add to Cart| Seller
    User -->|Place Order| Admin[Admin]
    Seller -->|List Products| Admin
    Seller -->|Manage Inventory| Admin
    Admin -->|Manage Orders| User
    

```

## Screenshots

| Sign-In Screen                                | Sign-Up Screen                                      |
| --------------------------------------------- | --------------------------------------------------- |
| ![image](assets/images/sign%20in.png)         | ![image](assets/images/sign%20up.png)               |
| Home Screen                                   | Home Screen                                         |
| ![image](assets/images/homepage.png)          | ![image](assets/images/homepage2.png)               |
| Account Screen                                | Sell Screen                                         |
| ![image](assets/images/account%20screeen.png) | ![image](assets/images/sell%20screeen%20.png)       |
| Cart Screen                                   | More Screen                                         |
| ![image](assets/images/cart%20screen.png)     | ![image](assets/images/more%20screen.png)           |
| Product Screen                                | Review Add                                          |
| ![image](assets/images/productpage.png)       | ![image](assets/images/productpage%20reviewadd.png) |
| Search Screen                                 |
| ![image](assets/images/search%20screen.png)   |


