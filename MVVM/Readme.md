
MVVM System Architecture

-> The idea is that what the view controller should do and should only do, is to display the views.
-> No fetching, no calculating, just displaying.
-> And the View-Model doing all of the other stuff like fetching the user, going to background anbd then alerting the view controller what has changed.
-> So, the view controller can act accordingly and display all of it's views.


Definition :-
MVVM adds one component to the MVC model, namely something called the “ViewModel” or “view model”.
It can be a class or struct but is generally a class so that references of the same instance can be passed around in your code. The ViewModel sits between the view controller and Model.

        1. M for “Model” – This is a structure that stores domain-specific information (data) in the simplest of formats. We leave it to a ViewModel to transform the raw “2125514701” into something like “(212) 551-4701” or “212-551-4701” or “212.551.4701”. The View/view controller can then display the phone number representation it gets from the ViewModel. If dealing with say, dialing a number internationally, we would leave those details to the ViewModel.
        
        2. V for "View" - The view is the structure, layout, and appearance of what a user sees on the screen.
        
        3. VM for “ViewModel” – This is the new piece that I would add to MVC if I were king for a day. The ViewModel sits between the Model and View/view controller. The ViewModel converts data in the model into human readable format that can be presented in the View by the view controller. The ViewModel could also handle updates that users make to data presented by the View/view controller, perhaps using a property observer or something like key-value observing (KVO). Updates to View data would not go directly to the Model, rather they would be triggered by the view controller talking to the ViewModel which would then talk to the Model.
        
        
        In Summary :
        
        1. The View/view controller presents Model data to the user and may allow updates to that Model data. The View/view controller does not talk directly to the Model. The View/view controller can only talk to the Model indirectly through the ViewModel.
        
        2. The View can only communicate with the view controller. In the UI, app data is provided to the view controller for display by the View solely by the ViewModel, and any changes made to data in the View must be passed to the view controller which solely communicates with the ViewModel.
        
        3. The ViewModel is the intermediary between the View/view controller and Model. It is a single conduit, a gatekeeper, through which data flows from the Model to the View/view controller and vice versa.
        
        4. The Model is soley a data structure meant for storing domain/app-specific information. Only the ViewModel talks to the Model. Only the ViewModel talks to the View/view controller.


In this project, 
i. We are creating one class i.e. "RootViewModel".
ii. RootViewModel class save, fetching and provide user data to controller class.
iii. The controller only displays views. 
