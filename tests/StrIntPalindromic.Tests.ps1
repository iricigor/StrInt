Describe "Get-StrIntPalindromic Normal Numbers" {
    It "returns true for palindromic single digit 0" {
        Get-StrIntPalindromic "0" | Should -Be $true
    }

    It "returns true for palindromic single digit 1" {
        Get-StrIntPalindromic "1" | Should -Be $true
    }

    It "returns true for palindromic single digit 9" {
        Get-StrIntPalindromic "9" | Should -Be $true
    }

    It "returns true for palindromic two digit number 11" {
        Get-StrIntPalindromic "11" | Should -Be $true
    }

    It "returns true for palindromic two digit number 22" {
        Get-StrIntPalindromic "22" | Should -Be $true
    }

    It "returns false for non-palindromic two digit number 12" {
        Get-StrIntPalindromic "12" | Should -Be $false
    }

    It "returns true for palindromic three digit number 121" {
        Get-StrIntPalindromic "121" | Should -Be $true
    }

    It "returns true for palindromic three digit number 111" {
        Get-StrIntPalindromic "111" | Should -Be $true
    }

    It "returns false for non-palindromic three digit number 123" {
        Get-StrIntPalindromic "123" | Should -Be $false
    }

    It "returns true for palindromic four digit number 1221" {
        Get-StrIntPalindromic "1221" | Should -Be $true
    }

    It "returns true for palindromic five digit number 12321" {
        Get-StrIntPalindromic "12321" | Should -Be $true
    }

    It "returns false for non-palindromic five digit number 12345" {
        Get-StrIntPalindromic "12345" | Should -Be $false
    }

    It "returns true for palindromic large number 123454321" {
        Get-StrIntPalindromic "123454321" | Should -Be $true
    }

    It "returns true for palindromic very large number" {
        Get-StrIntPalindromic "12345678987654321" | Should -Be $true
    }

    It "returns false for non-palindromic very large number" {
        Get-StrIntPalindromic "12345678901234567890" | Should -Be $false
    }

    It "returns correct results for multiple numbers" {
        $results = Get-StrIntPalindromic "121", "123", "1221"
        $results[0] | Should -Be $true
        $results[1] | Should -Be $false
        $results[2] | Should -Be $true
    }

    It "throws an error when an integer is negative" {
        { Get-StrIntPalindromic "-1" } | Should -Throw
    }

    It "throws an error when an integer is not a number" {
        { Get-StrIntPalindromic "abc" } | Should -Throw
    }
}

Describe "Get-StrIntPalindromic from pipeline" {
    It "returns true for pipelined palindromic input 121" {
        "121" | Get-StrIntPalindromic | Should -Be $true
    }

    It "returns false for pipelined non-palindromic input 123" {
        "123" | Get-StrIntPalindromic | Should -Be $false
    }

    It "returns correct results for multiple pipelined inputs" {
        $results = "11", "12", "121" | Get-StrIntPalindromic
        $results[0] | Should -Be $true
        $results[1] | Should -Be $false
        $results[2] | Should -Be $true
    }

    It "returns true for palindromic large number from pipeline" {
        "123454321" | Get-StrIntPalindromic | Should -Be $true
    }

    It "throws an error when pipelined input is not a valid integer" {
        { "abc" | Get-StrIntPalindromic -ea Stop } | Should -Throw
    }

    It "throws an error when pipelined input is negative" {
        { "-5" | Get-StrIntPalindromic -ea Stop } | Should -Throw
    }
}

Describe "Get-StrIntPalindromic interesting patterns" {
    It "returns true for square of 11 (121)" {
        $square = Get-StrIntSquare "11"
        Get-StrIntPalindromic $square | Should -Be $true
    }

    It "returns true for square of 111 (12321)" {
        $square = Get-StrIntSquare "111"
        Get-StrIntPalindromic $square | Should -Be $true
    }

    It "returns true for square of 1111 (1234321)" {
        $square = Get-StrIntSquare "1111"
        Get-StrIntPalindromic $square | Should -Be $true
    }
}
