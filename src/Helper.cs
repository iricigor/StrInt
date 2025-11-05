using System;

namespace StrInt
{
    public static class Helper {

        public static void AlignTwoNumbers(ref string num1, ref string num2) {
            // Make sure both input strings have the same number of digits
            while (num1.Length < num2.Length)
            {
                num1 = "0" + num1;
            }
            while (num2.Length < num1.Length)
            {
                num2 = "0" + num2;
            }
        }
        public static string AddTwoNumbers(string num1, string num2)
        {
            string result = "";

            AlignTwoNumbers(ref num1, ref num2);

            // Initialize carry to zero
            int carry = 0;

            // Process the numbers digit by digit, starting from the rightmost digit
            for (int i = num1.Length - 1; i >= 0; i--)
            {
                int sum = int.Parse(num1[i].ToString()) + int.Parse(num2[i].ToString()) + carry;
                carry = sum / 10;
                result = (sum % 10).ToString() + result;
            }

            // Add the remaining carry if there is any
            if (carry > 0)
            {
                result = carry.ToString() + result;
            }

            return result;
        }

        public static string MultiplyTwoNumbers(string num1, string num2)
        {
            // Initialize variables to store the lengths of the strings and the result
            int lengthA = num1.Length;
            int lengthB = num2.Length;
            int resultLength = lengthA + lengthB;
            int[] result = new int[resultLength];

            // Initialize variables to store the current digits of the strings
            int digitA, digitB;

            // Iterate through the digits of the strings from least significant to most significant
            for (int i = 0; i < lengthA; i++)
            {
                digitA = num1[lengthA - 1 - i] - '0';
                int carry = 0;

                // Multiply the current digit of string a by each digit of string b, and add the result to the appropriate position in the result array
                for (int j = 0; j < lengthB; j++)
                {
                    digitB = num2[lengthB - 1 - j] - '0';
                    int multiplication = digitA * digitB + carry + result[resultLength - 1 - i - j];
                    result[resultLength - 1 - i - j] = multiplication % 10;
                    carry = multiplication / 10;
                }

                // Add the carry value to the next position in the result array if it is non-zero
                if (carry > 0)
                {
                    result[resultLength - i - lengthB - 1] += carry;
                }
            }

            // Convert the result array to a string and remove any leading zeros
            string returnValue = new string(Array.ConvertAll(result, x => (char)(x + '0'))).TrimStart('0');
            return returnValue == "" ? "0" : returnValue;
        }

        public static string Fibonacci(string n)
        {
            // Check if the input string is "0" or "1"
            if (n == "0" || n == "1")
            {
                return n;
            }

            // Initialize variables for the previous two Fibonacci numbers and the current index
            string prevPrev = "0";
            string prev = "1";
            string current = "";
            string i = "1";

            // Loop until the current index is greater than the input value
            while (i.CompareTo(n) != 0)
            {
                // Calculate the current Fibonacci number using the AddTwoNumbers method
                current = AddTwoNumbers(prevPrev, prev);

                // Update the previous two Fibonacci numbers and the current index
                prevPrev = prev;
                prev = current;
                i = AddTwoNumbers(i, "1");
            }

            return current;
        }

        public static string SquareNumber(string num)
        {
            // Calculate the square of a number by multiplying it by itself
            return MultiplyTwoNumbers(num, num);
        }

    }
}
