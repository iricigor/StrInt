Describe "Get-StrIntCube Normal Numbers" {
    It "returns the correct cube for 0" {
        Get-StrIntCube "0" | Should -Be "0"
    }

    It "returns the correct cube for 1" {
        Get-StrIntCube "1" | Should -Be "1"
    }

    It "returns the correct cube for 2" {
        Get-StrIntCube "2" | Should -Be "8"
    }

    It "returns the correct cube for 3" {
        Get-StrIntCube "3" | Should -Be "27"
    }

    It "returns the correct cube for 5" {
        Get-StrIntCube "5" | Should -Be "125"
    }

    It "returns the correct cube for 10" {
        Get-StrIntCube "10" | Should -Be "1000"
    }

    It "returns the correct cube for 12" {
        Get-StrIntCube "12" | Should -Be "1728"
    }

    It "returns the correct cube for large integer" {
        Get-StrIntCube "123456" | Should -Be "1881640295202816"
    }

    It "returns correct cubes for multiple integers" {
        $results = Get-StrIntCube "3", "4", "5"
        $results[0] | Should -Be "27"
        $results[1] | Should -Be "64"
        $results[2] | Should -Be "125"
    }

    It "throws an error when an integer is negative" {
        { Get-StrIntCube "-1" } | Should -Throw
    }

    It "throws an error when an integer is not a number" {
        { Get-StrIntCube "abc" } | Should -Throw
    }
}

Describe "Get-StrIntCube from pipeline" {
    It "returns the correct cube for pipelined input 5" {
        "5" | Get-StrIntCube | Should -Be "125"
    }

    It "returns the correct cubes for multiple pipelined inputs" {
        $results = "2", "3", "4" | Get-StrIntCube
        $results[0] | Should -Be "8"
        $results[1] | Should -Be "27"
        $results[2] | Should -Be "64"
    }

    It "returns the correct cube for large integer from pipeline" {
        "999" | Get-StrIntCube | Should -Be "997002999"
    }

    It "throws an error when pipelined input is not a valid integer" {
        { "abc" | Get-StrIntCube -ea Stop } | Should -Throw
    }

    It "throws an error when pipelined input is negative" {
        { "-5" | Get-StrIntCube -ea Stop } | Should -Throw
    }
}
