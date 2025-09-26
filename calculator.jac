# Simple Calculator in JacLang

obj Calculator {
    has name: str = "Simple Calculator";
    has version: str = "1.0";

    def init {
        super.init();
        print(f"Welcome to {self.name} v{self.version}");
    }

    def add(a: float, b: float) -> float {
        return a + b;
    }

    def subtract(a: float, b: float) -> float {
        return a - b;
    }

    def multiply(a: float, b: float) -> float {
        return a * b;
    }

    def divide(a: float, b: float) -> float {
        if b == 0 {
            print("Error: Division by zero!");
            return 0.0;
        }
        return a / b;
    }

    def power(a: float, b: float) -> float {
        return a ** b;
    }

    def show_menu {
        print("\n=== Calculator Menu ===");
        print("1. Addition (+)");
        print("2. Subtraction (-)");
        print("3. Multiplication (*)");
        print("4. Division (/)");
        print("5. Power (**)");
        print("6. Exit");
        print("=======================");
    }

    def get_numbers -> (float, float) {
        print("Enter first number: ");
        a = float(input());
        print("Enter second number: ");
        b = float(input());
        return (a, b);
    }

    def run {
        while True {
            self.show_menu();
            print("Choose an operation (1-6): ");
            choice = input().strip();

            if choice == "6" {
                print("Thank you for using the calculator!");
                break;
            }

            if choice in ["1", "2", "3", "4", "5"] {
                nums = self.get_numbers();
                a = nums[0];
                b = nums[1];
                result = 0.0;

                if choice == "1" {
                    result = self.add(a, b);
                    print(f"Result: {a} + {b} = {result}");
                } elif choice == "2" {
                    result = self.subtract(a, b);
                    print(f"Result: {a} - {b} = {result}");
                } elif choice == "3" {
                    result = self.multiply(a, b);
                    print(f"Result: {a} * {b} = {result}");
                } elif choice == "4" {
                    result = self.divide(a, b);
                    if b != 0 {
                        print(f"Result: {a} / {b} = {result}");
                    }
                } elif choice == "5" {
                    result = self.power(a, b);
                    print(f"Result: {a} ** {b} = {result}");
                }
            } else {
                print("Invalid choice! Please select 1-6.");
            }
        }
    }
}

with entry {
    calc = Calculator();
    calc.run();
}