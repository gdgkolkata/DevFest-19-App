
List select = [true,false,false,false,false,false,false];

int findLastVisited(){
  for(int i=0;i<select.length;i++){
    if(select[i]==true){
      return i;
    }
  }
}
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