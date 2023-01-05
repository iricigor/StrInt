Describe "Get-StrIntProduct" {
    It "returns the correct product for two integers" {
        $product = Get-StrIntProduct "123", "456"
        $product | Should -Be "56088"
    }

    It "returns the correct product for three integers" {
        $product = Get-StrIntProduct "123", "456", "789"
        $product | Should -Be "44253432"
    }

    It "returns the correct product for large integers" {
        $product = Get-StrIntProduct "987654321098765432109876543210", "123456789987654321123456789987654321"
        $product | Should -Be "121932632100289590121932632100167657367899710409878067367899710410"
    }

    It "returns the correct product for a single integer" {
        $product = Get-StrIntProduct "123456789987654321123456789987654321"
        $product | Should -Be "123456789987654321123456789987654321"
    }

    It "returns 0 when one input is 0" {
        $product = Get-StrIntProduct "123", "0"
        $product | Should -Be "0"
    }

    It "returns 0 when all inputs are 0" {
        $product = Get-StrIntProduct "0", "0"
        $product | Should -Be "0"
    }

    It "throws an error when an input is not a valid integer" {
        { Get-StrIntProduct "123", "abc" } | Should -Throw
    }

    It "throws an error when all inputs are not valid integers" {
        { Get-StrIntProduct "abc", "def" } | Should -Throw
    }

    It "returns the correct product when input is passed through the pipeline" {
        "123", "456" | Get-StrIntProduct |
        Should -Be "56088"
    }

    It "returns the correct product when multiple inputs are passed through the pipeline" {
        "123", "456", "789" | Get-StrIntProduct |
        Should -Be "44253432"
    }
}