Describe "Get-StrIntFibonacci" {
    It "calculates the correct Fibonacci number for input 0" {
        Get-StrIntFibonacci "0" | Should -Be "0"
    }
    It "calculates the correct Fibonacci number for input 1" {
        Get-StrIntFibonacci "1" | Should -Be "1"
    }
    It "calculates the correct Fibonacci number for input 2" {
        Get-StrIntFibonacci "2" | Should -Be "1"
    }
    It "calculates the correct Fibonacci number for input 5" {
        Get-StrIntFibonacci "5" | Should -Be "5"
    }
    It "calculates the correct Fibonacci number for input 10" {
        Get-StrIntFibonacci "10" | Should -Be "55"
    }
    It "calculates the correct Fibonacci number for input 200" {
        Get-StrIntFibonacci "200" | Should -Be "280571172992510140037611932413038677189525"
    }
}

Describe "Get-StrIntFibonacci Invalid Values" {
    It "throws an exception for input -1" {
        { Get-StrIntFibonacci "-1" } | Should -Throw
    }
    It "throws an exception for input 'abc'" {
        { Get-StrIntFibonacci "abc" } | Should -Throw
    }
}

Describe "Get-StrIntFibonacci Pipeline Input" {
    It "calculates the correct Fibonacci number for pipelined input 5" {
        "5" | Get-StrIntFibonacci | Should -Be "5"
    }
    It "calculates the correct Fibonacci number for pipelined input 10" {
        "10" | Get-StrIntFibonacci | Should -Be "55"
    }
    It "calculates the correct Fibonacci number for multiple pipelined inputs" {
        "5", "10" | Get-StrIntFibonacci | Should -Be "5", "55"
    }
    It "calculates the correct Fibonacci number for array as pipelined input" {
        3..7 | Get-StrIntFibonacci | Should -Be "2", "3", "5", "8", "13"
    }
}
