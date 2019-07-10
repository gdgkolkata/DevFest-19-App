
// This list is for the drawer flags
List select = [true,false,false,false,false,false,false];

// Put the flag up for the position passed in the drawer
void selection(int pos){
    for(int i =0; i<select.length;i++){
      if(i == pos){
        select[i] = true;
      }
      else{
        select[i] = false;
      }
    }
  }