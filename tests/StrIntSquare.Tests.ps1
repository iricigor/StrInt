Describe "Get-StrIntSquare Normal Numbers" {
    It "returns the correct square for 0" {
        Get-StrIntSquare "0" | Should -Be "0"
    }

    It "returns the correct square for 1" {
        Get-StrIntSquare "1" | Should -Be "1"
    }

    It "returns the correct square for 2" {
        Get-StrIntSquare "2" | Should -Be "4"
    }

    It "returns the correct square for 5" {
        Get-StrIntSquare "5" | Should -Be "25"
    }

    It "returns the correct square for 10" {
        Get-StrIntSquare "10" | Should -Be "100"
    }

    It "returns the correct square for 14651 (result contains 14651 in the middle)" {
        Get-StrIntSquare "14651" | Should -Be "214651801"
    }

    It "returns the correct square for large integer" {
        Get-StrIntSquare "12345678901234567890" | Should -Be "152415787532388367501905199875019052100"
    }

    It "returns correct squares for multiple integers" {
        $results = Get-StrIntSquare "3", "4", "5"
        $results[0] | Should -Be "9"
        $results[1] | Should -Be "16"
        $results[2] | Should -Be "25"
    }

    It "throws an error when an integer is negative" {
        { Get-StrIntSquare "-1" } | Should -Throw
    }

    It "throws an error when an integer is not a number" {
        { Get-StrIntSquare "abc" } | Should -Throw
    }
}

Describe "Get-StrIntSquare from pipeline" {
    It "returns the correct square for pipelined input 5" {
        "5" | Get-StrIntSquare | Should -Be "25"
    }

    It "returns the correct squares for multiple pipelined inputs" {
        $results = "2", "3", "4" | Get-StrIntSquare
        $results[0] | Should -Be "4"
        $results[1] | Should -Be "9"
        $results[2] | Should -Be "16"
    }

    It "returns the correct square for large integer from pipeline" {
        "999999999" | Get-StrIntSquare | Should -Be "999999998000000001"
    }

    It "throws an error when pipelined input is not a valid integer" {
        { "abc" | Get-StrIntSquare -ea Stop } | Should -Throw
    }

    It "throws an error when pipelined input is negative" {
        { "-5" | Get-StrIntSquare -ea Stop } | Should -Throw
    }
}
