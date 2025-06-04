# Pre test Recruitment Quality Assurance Engineer

This repository contains various automation testing assignments Pre test Recruitment Quality Assurance Engineer at Lion Parcel covering different types of testing: API Testing, Web Testing, Mobile Testing, and a JavaScript programming task.

## Project Structure

```
├── Assignment-1-2-4/
│   ├── api/
│   │   └── TestCase/
│   │       ├── GetSingleUser.robot
│   │       └── PostSingleUser.robot
│   ├── web/
│   │   ├── Resource/
│   │   │   ├── Locator/
│   │   │   ├── Pages/
│   │   │   └── Variables/
│   │   └── TestCase/
│   │       └── Checkout.robot
│   └── app/
│       └── TestCase/
│           └── ShipmentRates.robot
└── Assignment-3/
    └── script.js
```

## Assignment Details

### Task 1: API Automation Testing
Location: `Assignment-1-2-4/api/TestCase/`
- Contains Robot Framework test cases for API testing
- Includes tests for:
  - GetSingleUser.robot: Testing GET request for single user
  - PostSingleUser.robot: Testing POST request for creating a user

### Task 2: Web Automation Testing (Page Object Model)
Location: `Assignment-1-2-4/web/`
- Implemented using Robot Framework with Page Object Model (POM) design pattern
- Structure:
  - `Resource/Locator/`: Contains all web element locators
  - `Resource/Pages/`: Contains page-specific keywords and actions
  - `Resource/Variables/`: Contains global variables and test data
  - `TestCase/`: Contains test scenarios (e.g., Checkout.robot)
- Test Case: Checkout flow testing on saucedemo.com

### Task 3: JavaScript Programming
Location: `Assignment-3/script.js`
- Implements a function to sort an array of integers
- Requirements:
  - Sort numbers in descending order
  - Even numbers first, followed by odd numbers
  - Input: [3,2,5,1,8,9,6]
  - Output: [8,6,2,9,5,3,1]

### Task 4: Mobile Testing Automation
Location: `Assignment-1-2-4/app/TestCase/ShipmentRates.robot`
- Mobile automation testing using Robot Framework and Appium
- Tests the shipment rate calculation feature on Lion Parcel website
- Features:
  - Chrome browser automation on Android
  - Form filling for shipment details
  - Rate calculation verification

Notes: Im sorry i was only able to automate the positive scenario due to time constraints and several technical challenges encountered while working on mobile browser automation using Robot Framework.

## Technologies Used
- Robot Framework
- Appium
- Selenium
- Page Object Model (POM)
- API Testing
- Web Testing
- Mobile Testing
- JavaScript

## Prerequisites
- For detail on requirements.txt
- Python
- Robot Framework
- Appium
- Node.js (for Task 3)
- Chrome Browser
- Android Emulator (for Task 4)

## Recording
 - Already attached recording file on PDF file for running all automation task