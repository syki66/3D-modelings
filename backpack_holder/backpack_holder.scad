for (i = [-300:300]){
    singleLayer([0, -0.0001*i*i, i*0.1]);
}

module singleLayer (array) {
    translate(array)
        linear_extrude(height=0.1){
            union(){
                    offset(2)offset(-2)
                        polygon([[0,0],[0,170],[10,170],[10,90],[20,80],[30,75],[40,70],[80,70], [90,72], [100, 74], [100, 64], [90, 62], [80,60], [10,60],[10,0], [0,0]]);
            }    
        }
}
