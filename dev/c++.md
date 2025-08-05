* Constness of pass by value input argument is an implementation detail that is hidden in header file and checked in cpp https://godbolt.org/z/Yvfr78vGo 
* Derived class private method can be accessible if the base class virtual method is public which could break [interface thread safety](https://www.modernescpp.com/index.php/dealing-with-mutation-thread-safe-interface/) : https://godbolt.org/z/cEMb66nTK  
* Static variable of template method: the specialization will hapen per type and each template specialization creates its own static variables https://godbolt.org/z/s88vPxf1W  
* Bind vs lambda [example](https://godbolt.org/z/K8xWPscob): std::bind(&class::method, object, listArgs); //_1: is first parameter passed to callable 
* To include all std library for gcc compiler, add: #include <bits/stdc++.h>	
* STL  

| function    | description                                                                  |
| ----------- | ---------------------------------------------------------------------------- |
| transform   | applies the given function to a range and stores the result in another range |
| min_element | Finds the smallest element in the range [first, last).                       |
| upper_bound | \> first element greater or last                                             |
| lower_bound | \>= first element greater or equal or return last                            |

* Operators  

| Operator    | Implementation example    |
| ----------- | ------------------------- |
| operator==  <br> in class | bool operator==( T const& rhs ) const{<br>return (rhs.m_member == this->m_member) ;} |
| operator== <br> friend    | in class: friend bool operator==( MarketOrderId const& lhs, MarketOrderId const& rhs );<br>Out class: inline bool operator==( MarketOrderId const& lhs, MarketOrderId const& rhs ){<br>return (lhs.m_member == rhs.m_member);} |
| operator<=> | [[nodiscard]] constexpr auto operator<=>(const Blob&) const = default;   |
| operator<<  | #include \<iostream\><br>In class: friend ostream& operator<<(ostream& os, const T& t);<br>Out class: ostream& operator<<(ostream& os, const T& t){<br>os << t.m_1;<br>return os;}   |

* Ctr

| Ctr                      | Implementation example             | Notes                                         |
| ------------------------ | ---------------------------------- | --------------------------------------------- |
| Non copyable / movable   | Blob() = default;<br>~Blob() = default;<br>Blob(const Blob & other) = delete;<br>[nodiscard] Blob & operator=(const Blob & other) = delete;<br>Blob (Blob && other) noexcept = default;<br>[nodiscard] Blob & operator=(Blob && other) noexcept = default; | [special-member-functions](https://www.foonathan.net/2019/02/special-member-functions/) |
| user defined movable ctr | Blob & operator=(Blob && other) { if(this != &other) { delete data_; data_=other.data_; other.data_=nullptr;}}           | in move constructor/assignment invalidate the moved variable to avoid segmentation fault                         |

* Multithreading  

| Feature                        | Implementation example            | Notes                    |
| ------------------------------ | --------------------------------- | ------------------------ |
| async                          | std::future<int> fut = std::async(std::launch::deferred \| std::launch::async, function, arg1, arg2);<br>fut.get(); |                                                                                                                          |
| promise, future, shared_future | [https://onlinegdb.com/CpOECX7Tl](https://onlinegdb.com/CpOECX7Tl) | future.get() will wait till promise.set_value or set_exception()                                                         |
| lock_gard                      | [https://onlinegdb.com/HrDIy_kS4](https://onlinegdb.com/HrDIy_kS4) | simple way of releasing mutex in dtor |
| scoped_lock                    | [https://onlinegdb.com/wFZ2I-TeR](https://onlinegdb.com/wFZ2I-TeR) | locking multiple mutexes without risk of deadlock |
| unique_lock                    | [https://onlinegdb.com/FdySaXeCl](https://onlinegdb.com/FdySaXeCl) | unlock within the scope of the block (which includes use with a condition_variable) and ensure unlock in dtor            |
| shared_mutex, shared_lock      | [https://onlinegdb.com/pJX9gqHSs](https://onlinegdb.com/pJX9gqHSs) | multiple threads reading may have a shared_lock between them and the threads writing may have a unique_lock              |
| latch                          | [https://onlinegdb.com/dOMscs5g60](https://onlinegdb.com/dOMscs5g60) | thread that finished first part will count_down latch and wait, once latch counter reach 0, waiting threads may continue |
| barrier                        |                                   |                          |
| semaphore                      |                                   |                          |
| condition variable             |                                   |                          |
| fetch_add                      | atomic<int> x{0}; x.fetch_add(1);       | prefer the use of fetch_add over ++ to be more explicit about atomicity |

* pragma message

| Compiler | Example                                          |
| -------- | ------------------------------------------------ |
| msvc     | MSVC: #pragma message("Expand of macro: " MACRO) |
| gcc      | GCC: #pragma message "Expand of macro: " MACRO   |