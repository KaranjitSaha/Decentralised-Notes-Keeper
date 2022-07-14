import List "mo:base/List";
import Debug "mo:base/Debug";

actor DKeeper{
  type Note={
    title:Text;
    content:Text;
  };

  stable var notes: List.List<Note> = List.nil<Note>();

  //Create operation of CRUD
  public func createNote(titleText:Text, contentText:Text){
    let newNote:Note = {
      title = titleText;
      content = contentText;
    };

    notes:=List.push(newNote, notes);
    Debug.print(debug_show(notes));
  };

  // Read operation of CRUD
  public query func readNotes() : async [Note] {
    return List.toArray(notes);
  };

  public func removeNote(id:Nat) {
    var list1 =  List.take(notes,id);
    var list2 = List.drop(notes,id+1);
    notes := List.append(list1,list2);
    // Debug.print(debug_show(notes));
  };

};