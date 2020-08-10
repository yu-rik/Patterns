import UIKit

// класс для того чтоб можно было идентифицировать акаунт с которым работаем
class Account {
    var accountName: String
    var balance: Int
    
    init(accountName: String, balance: Int) {
        self.accountName = accountName
        self.balance = balance
    }
}
//протокол комманд
protocol Command {
    func execute() //выполнение команд
    var isComplete: Bool {get set} //для слежения выполнения команд
}
//--------------------------------------------------
class Deposit: Command {
    private var account: Account //для работы с Акаунтом
    private var amount: Int // сумма добавления
    
    init(account: Account, amount: Int) {
        self.account = account
        self.amount = amount
    }
    
    func execute() {
        account.balance += amount
        isComplete = true
    }
    var isComplete: Bool = false //транзакция по умолчанию не закончена
}

class Withdraw: Command {
    private var account: Account //для работы с Акаунтом
    private var amount: Int // сумма снятия
    
    init(account: Account, amount: Int) {
        self.account = account
        self.amount = amount
    }
    
    func execute() {
        // проверка количества денег для осуществления транзакции
        if account.balance >= amount{
            account.balance -= amount
            isComplete = true
        } else {
            print("Your account has not enough funds")
        }
    }
    var isComplete: Bool = false //транзакция по умолчанию не закончена
}
//------------------------------------------------------------------

//Менеджер по транзакциям
class TransactionManager {
    //создаем Синглетон
    static let shared = TransactionManager()
    private init(){}
    //переменная массива команд(вывод средств или ввод)
    private var transactions: [Command] = []
    
    //свойство для отображения незаконченных операций
    var pendingTransaction: [Command] {
        get{
            return self.transactions.filter{$0.isComplete == false}
        }
    }
    
    //метод -добавления команды в массив
    func addTransaction(command: Command) {
        transactions.append(command)
    }
    
    //метод вызова функции выполнения транзакций
    func processingTransaction() {
        //фильтрация команд в массиве transactions и если в свойстве элемента массива есть false - выполняется execute
        transactions.filter {$0.isComplete == false}.forEach{$0.execute()}
    }
}
//создаю аккаунт
let nosachenko = Account(accountName: "Yurik Nosachenko", balance: 10000)

//обращение к сингелтону
let trManagerForNosachenko = TransactionManager.shared

trManagerForNosachenko.addTransaction(command: Deposit(account: nosachenko, amount: 5000))
trManagerForNosachenko.addTransaction(command: Withdraw(account: nosachenko, amount: 2000))
trManagerForNosachenko.pendingTransaction
nosachenko.balance
trManagerForNosachenko.processingTransaction()
nosachenko.balance


