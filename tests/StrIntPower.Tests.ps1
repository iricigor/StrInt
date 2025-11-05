Describe "Get-StrIntPower Normal Numbers" {
    It "returns 1 when exponent is 0" {
        Get-StrIntPower "5" "0" | Should -Be "1"
    }

    It "returns the same number when exponent is 1" {
        Get-StrIntPower "7" "1" | Should -Be "7"
    }

    It "returns the correct result for 2^2" {
        Get-StrIntPower "2" "2" | Should -Be "4"
    }

    It "returns the correct result for 2^3" {
        Get-StrIntPower "2" "3" | Should -Be "8"
    }

    It "returns the correct result for 2^8" {
        Get-StrIntPower "2" "8" | Should -Be "256"
    }

    It "returns the correct result for 3^4" {
        Get-StrIntPower "3" "4" | Should -Be "81"
    }

    It "returns the correct result for 5^3" {
        Get-StrIntPower "5" "3" | Should -Be "125"
    }

    It "returns the correct result for 10^5" {
        Get-StrIntPower "10" "5" | Should -Be "100000"
    }

    It "returns the correct result for large base and exponent" {
        Get-StrIntPower "12" "10" | Should -Be "61917364224"
    }

    It "returns the correct result for 0^5" {
        Get-StrIntPower "0" "5" | Should -Be "0"
    }

    It "returns correct powers for multiple integers" {
        $results = Get-StrIntPower "2", "3", "4" "2"
        $results[0] | Should -Be "4"
        $results[1] | Should -Be "9"
        $results[2] | Should -Be "16"
    }

    It "throws an error when base is negative" {
        { Get-StrIntPower "-2" "3" } | Should -Throw
    }

    It "throws an error when exponent is negative" {
        { Get-StrIntPower "2" "-3" } | Should -Throw
    }

    It "throws an error when base is not a number" {
        { Get-StrIntPower "abc" "2" } | Should -Throw
    }

    It "throws an error when exponent is not a number" {
        { Get-StrIntPower "2" "xyz" } | Should -Throw
    }
}

Describe "Get-StrIntPower from pipeline" {
    It "returns the correct power for pipelined input 5^2" {
        "5" | Get-StrIntPower -Exponent "2" | Should -Be "25"
    }

    It "returns the correct powers for multiple pipelined inputs" {
        $results = "2", "3", "4" | Get-StrIntPower -Exponent "3"
        $results[0] | Should -Be "8"
        $results[1] | Should -Be "27"
        $results[2] | Should -Be "64"
    }

    It "returns the correct power for large base from pipeline" {
        "10" | Get-StrIntPower -Exponent "10" | Should -Be "10000000000"
    }

    It "throws an error when pipelined input is not a valid integer" {
        { "abc" | Get-StrIntPower -Exponent "2" -ea Stop } | Should -Throw
    }

    It "throws an error when pipelined input is negative" {
        { "-5" | Get-StrIntPower -Exponent "2" -ea Stop } | Should -Throw
    }
}
