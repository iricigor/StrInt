Describe "Get-StrIntFactorial Normal Numbers" {
    It "returns 1 for factorial of 0" {
        Get-StrIntFactorial "0" | Should -Be "1"
    }

    It "returns 1 for factorial of 1" {
        Get-StrIntFactorial "1" | Should -Be "1"
    }

    It "returns 2 for factorial of 2" {
        Get-StrIntFactorial "2" | Should -Be "2"
    }

    It "returns 6 for factorial of 3" {
        Get-StrIntFactorial "3" | Should -Be "6"
    }

    It "returns 24 for factorial of 4" {
        Get-StrIntFactorial "4" | Should -Be "24"
    }

    It "returns 120 for factorial of 5" {
        Get-StrIntFactorial "5" | Should -Be "120"
    }

    It "returns 720 for factorial of 6" {
        Get-StrIntFactorial "6" | Should -Be "720"
    }

    It "returns 3628800 for factorial of 10" {
        Get-StrIntFactorial "10" | Should -Be "3628800"
    }

    It "returns correct factorial for 20" {
        Get-StrIntFactorial "20" | Should -Be "2432902008176640000"
    }

    # Each of these factorials has exactly as many digits as the input number
    It "returns correct factorial for 22 (result has exactly 22 digits)" {
        Get-StrIntFactorial "22" | Should -Be "1124000727777607680000"
    }

    It "returns correct factorial for 23 (result has exactly 23 digits)" {
        Get-StrIntFactorial "23" | Should -Be "25852016738884976640000"
    }

    It "returns correct factorial for 24 (result has exactly 24 digits)" {
        Get-StrIntFactorial "24" | Should -Be "620448401733239439360000"
    }

    It "returns correct factorial for large number 50" {
        Get-StrIntFactorial "50" | Should -Be "30414093201713378043612608166064768844377641568960512000000000000"
    }

    It "returns correct factorials for multiple integers" {
        $results = Get-StrIntFactorial "3", "4", "5"
        $results[0] | Should -Be "6"
        $results[1] | Should -Be "24"
        $results[2] | Should -Be "120"
    }

    It "throws an error when an integer is negative" {
        { Get-StrIntFactorial "-1" } | Should -Throw
    }

    It "throws an error when an integer is not a number" {
        { Get-StrIntFactorial "abc" } | Should -Throw
    }
}

Describe "Get-StrIntFactorial from pipeline" {
    It "returns the correct factorial for pipelined input 5" {
        "5" | Get-StrIntFactorial | Should -Be "120"
    }

    It "returns the correct factorials for multiple pipelined inputs" {
        $results = "2", "3", "4" | Get-StrIntFactorial
        $results[0] | Should -Be "2"
        $results[1] | Should -Be "6"
        $results[2] | Should -Be "24"
    }

    It "returns the correct factorial for large number from pipeline" {
        "15" | Get-StrIntFactorial | Should -Be "1307674368000"
    }

    It "throws an error when pipelined input is not a valid integer" {
        { "abc" | Get-StrIntFactorial -ea Stop } | Should -Throw
    }

    It "throws an error when pipelined input is negative" {
        { "-5" | Get-StrIntFactorial -ea Stop } | Should -Throw
    }

    It "accepts mixed types as input" {
        Get-StrIntFactorial 3, "4" | Should -Be "6", "24"
    }

    It "accepts range as pipelined input" {
        0..4 | Get-StrIntFactorial | Should -Be "1", "1", "2", "6", "24"
    }
}
