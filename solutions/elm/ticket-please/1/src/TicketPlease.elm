module TicketPlease exposing (..)

import TicketPleaseSupport exposing (Status(..), Ticket(..), User(..))


emptyComment : ( User, String ) -> Bool
emptyComment ( _, comment ) =
    comment == ""


numberOfCreatorComments : Ticket -> Int
numberOfCreatorComments (Ticket { comments, createdBy }) =
    let 
        (creator, _) = createdBy
    in
    List.length (List.filter (\(user, _) -> user == creator) comments)


assignedToDevTeam : Ticket -> Bool
assignedToDevTeam (Ticket { assignedTo }) =
    case assignedTo of
        Just (User "Alice") -> True
        Just (User "Bob") -> True
        Just (User "Charlie") -> True
        _ -> False


assignTicketTo : User -> Ticket -> Ticket
assignTicketTo user (Ticket ticket) =
    case ticket.status of
        New -> Ticket { ticket | assignedTo = Just user, status = InProgress }
        Archived -> Ticket ticket
        _ -> Ticket { ticket | assignedTo = Just user }

