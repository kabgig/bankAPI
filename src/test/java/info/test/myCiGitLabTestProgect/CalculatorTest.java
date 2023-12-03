package info.test.myCiGitLabTestProgect;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class CalculatorTest {

    //Создаем объект класса калькулятор
    Calculator calculator = new Calculator();

    //здесь мы создаем тестовый метод, который будет тестировать метод sum(int x, int y)
    @Test
    public void sum() {
        int actual = 25;

//здесь мы проверяем, что при сложении чисел 10 и 15 тестируемый метод вернет 25
        assertEquals(calculator.sum(10, 15), actual);
    }

    @Test
    public void multiplication() {
        int actual = 30;
//убеждаемся, что тестируемый метод при перемножении чисел 5 и 6 вернет 30
        assertEquals(calculator.multiplication(5, 6), actual);
    }
}