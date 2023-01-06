Describe "Get-StrIntSum Normal Numbers" {
    It "returns the correct sum for two integers" {
        Get-StrIntSum "1", "2" | Should -Be "3"
    }

    It "returns the correct sum for three integers" {
        Get-StrIntSum "1", "2", "3" | Should -Be "6"
    }

    It "returns the correct sum for large integers" {
        Get-StrIntSum "12345678901234567890", "98765432109876543210" | Should -Be "111111111011111111100"
    }

    It "returns the correct sum for integers with different numbers of digits" {
        Get-StrIntSum "123", "456", "789" | Should -Be "1368"
    }

    It "returns the correct sum when one of the integers is 0" {
        Get-StrIntSum "1", "0" | Should -Be "1"
    }

    It "returns the correct sum when multiple integers are 0" {
        Get-StrIntSum "0", "0", "0" | Should -Be "0"
    }

    It "throws an error when an integer is negative" {
        { Get-StrIntSum "1", "-1" } | Should -Throw
    }

    It "throws an error when an integer is not a number" {
        { Get-StrIntSum "1", "abc" } | Should -Throw
    }

    Describe "Get-StrIntSum from pipeline" {
        It "returns the correct sum for two integers" {
            "1", "2" | Get-StrIntSum | Should -Be "3"
        }

        It "returns the correct sum for three integers" {
            "1", "2", "3" | Get-StrIntSum | Should -Be "6"
        }

        It "returns the correct sum for large integers" {
            "12345678901234567890", "98765432109876543210" | Get-StrIntSum | Should -Be "111111111011111111100"
        }

        It "returns the correct sum for integers with different numbers of digits" {
            "123", "456", "789" | Get-StrIntSum | Should -Be "1368"
        }

        It "returns the correct sum when one of the integers is 0" {
            "1", "0" | Get-StrIntSum | Should -Be "1"
        }

        It "returns the correct sum when multiple integers are 0" {
            "0", "0", "0" | Get-StrIntSum | Should -Be "0"
        }

        It "throws an error when an integer is not a number" {
            { "1", "abc" | Get-StrIntSum -ea Stop } | Should -Throw
        }

        It "throws an error when an integer is negative" {
            { "1", "-1" | Get-StrIntSum -ea Stop } | Should -Throw
        }
    }
}

