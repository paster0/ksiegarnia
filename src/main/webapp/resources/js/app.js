
var app = angular.module('app', []);






/*
 
angular.module('app')
.controller('BookController', function () {
    this.name = 'tekst';
    
});


app.controller('ClickController', function() {
    this.header = "Header przed zmianami";
    this.changeHeader = function() {
        this.header = this.input;
    }
    
    this.headerClick = function() 
    {
        this.header = this.header.toUpperCase();
    }
});

app.controller('HrefController', function() {
    this.movies = [
        'b-Cr0EWwaTk',
        'zg79C7XM1Xs'
    ];
    this.imgSrc = 'http://javastart.pl/theme/genesis/pix/javastart.png';
});

app.controller('KeyController', function() {
    this.up = 0;
    this.down = 0;
    this.press = 0;
    this.keyDown = function() {
        this.down++;
    }
    this.keyUp = function() {
        this.up++;
    }
    this.keyPress = function() {
        this.press++;
    }
});

app.controller('ChangeController', function() {
    this.header = 'Odznaczony';
    this.changeState = function() {
        this.header = this.checkbox? 'Zaznaczony' : 'Odznaczony';
    }
});

app.controller('ShowHideController', function() {
   
    
});



app.controller('RepeatController', function() {
    function Person(firstName, lastName) {
        this.firstName = firstName;
        this.lastName = lastName;
    }
    this.people = [
        new Person('Jan', 'Kowalski'),
        new Person('Ania', 'Abacka'),
        new Person('Wojtek', 'Nowak')
    ];
    this.changeH1Style = function() {
        this.h1style = {'color': 'red'};
    }
    this.even = 'parzyste';
    this.odd = 'nieparzyste';
});



app.value('appName', 'Java Book Store');
app.constant('appVersion', '0.1');
 
app.factory('Book', function() {
    return function Book(title, author, isbn) {
        this.title = title;
        this.author = author;
        this.isbn = isbn;
    }
});
 
app.service('bookService', function(Book) {
    this.books = [
        new Book('Henryk Sienkiewicz', 'Krzyżacy', '123456789'),
        new Book('Adam Mickiewicz', 'Dziady', "1324354657"),
        new Book('Maria Konopnicka', 'Dym', "9786756453")
    ];
    this.saveBook = function(book) {
        this.books.push(book);
    }
});
 
app.controller('BookController', function (Book, bookService, appName, appVersion) {
    this.appName = appName;
    this.version = appVersion;
    this.books = bookService.books;
    this.addBook = function(book) {
        BookService.saveBook(new Book(book.title, book.author, book.isbn));
    }
});
*/ 
