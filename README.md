# Become
Website deployed at https://limitless-lake-66848.herokuapp.com


1. What is race condition?
- It is when there are more than 2 process that try to access a shared resources and try to change them at the same time.
2. What is a thread-safe function?
- A thread that functions correctly when it is run simultaneously even when it tries to change the same data.
3. What is the difference between thread and process?
- Usually thread run in a shared memory place but process run in different memory place. Process can create thread.
4. Explain what is Blue-green Deployment, Canary release, A/B testing?
-  Blue-green deployment is a method of deployment where you have 2 environment blue and green. If the blue is live, you update your latest changes to green and after everything is okay, you switch to the green environment, hence making it the live environment.
- Canary release is where you release a certain feature on a subset of user. Example you may want to release your feature to US user only. When it is stable you can then release to the rest of the world.
- A/B testing is a way to test which variant has the desired output. Example, If you want to know which color can generate the most amount of click on a button, you can split the web, half showing blue, half showing red, then you can measure which sets of user click the button more often.
5. Explain the difference between layout, painting and compositing.
- When a browser render it goes thorught these 3 stages.
- Layout is when the browser decide how much spaces the UI takes and where to put them.
- Painting is when the browser start filling the pixels. Painting can be done in multiple layers.
- Since the parts of the page were drawn into potentially multiple layers they need to be drawn to the screen in the correct order so that the page renders correctly.
6. What’s the difference between “resetting” and “normalizing” CSS? (i). Which would you choose, and why?
- Resetting reset the css of the browser, user need to defined all the css again.
- Normalize preserves useful defaults rather than "unstyling" everything. It also tries to standardize different browser as well.
- It depends entirely on the project. You can use both if you want.
7. What are the advantages/disadvantages of using CSS preprocessors? (i). Describe what you like and dislike about the CSS preprocessors you have used.
- CSS preprocessors help to fix some of the disadvantages of using pure css and add additional function such as mixin, nesting selector, inheritance selector.
- I dont use any CSS preprocessors.
8. What is the difference between class selector and ID selector?
- ID is used for 1 elements. Class can be used by more than 1.
9. How does inheritance work in CSS?
- When no value for an inherited property has been specified on an element, the element gets the computed value of that property on its parent element.
10. Describe the difference between a cookie, sessionStorage and localStorage.
- Local storage store data with no expiry date.
- The sessionStorage object stores data only for a session, meaning that the data is stored until the browser (or tab) is closed.
- Stores data that has to be sent back to the server with subsequent requests. Its expiration varies based on the type and the expiration duration can be set from either server-side or client-side (normally from server-side).
11. Describe the difference between <script>, <script async> and <script defer>
  - <script> means that the script will be fetch 1 by 1.
  - async means that the script will be fetch in parallel.
  - defer is to indicate to a browser that the script is meant to be executed after the document has been parsed, but before firing DOMContentLoaded
12. How is Docker different from other container technologies?'
  - Never use Docker but I heard that it is easy to deploy than other.
13. What is Kubernetes, how does it work?
  -  Kubernetes is an open-source container-orchestration system for automating application deployment, scaling, and management.
14. How does garbage collector work?
  - garbage collector will try to find data objects in a program that are not in used anymore in the future, it will try to reclaim the memory to be used in other places.
15. What is an integration test?
  - When you separate modules are combine and tested together.
16. Explain Database Transactions
  -  A logical unit that is independently executed for data retrieval or updates.
17. What is a deadlock?
  - A situation in which two or more transactions are waiting for one another to give up locks.
18. Explain the difference between Inheritance vs Composition
  - Inheritance derives one class from another
  - Composition defines a class as the sum of its parts
19. What are microservices, explain how it could be used when developing applications?
  - Technique where instead of you deploy into 1 service, you separate it into multiple services. Example is Login and Bill can be it's own service instead of monolithic app. 
20. What are some common web security flaws and how do you guard against it?
  - Cross-Site Request Forgery
  - By using a secret cookie that is unique to each form.
  - SQL Injection
  - By not running user input directly to the SQL Query.
