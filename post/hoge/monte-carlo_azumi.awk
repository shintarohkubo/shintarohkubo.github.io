#!/usr/bin/awk

BEGIN{
    type_num = 11
    for (i=1; i<=type_num; i++){
        for (j=1; j<=type_num; j++){
            arr[i][j] = 0
        }
    }
}
{
    TYPE[NR] = $3
}
END{
    for (line = NR; line >= 1; line--){
        if (line == NR){
            before = TYPE[line]
        } else {
            after = TYPE[line]
            arr[before][after] += 1
            before = after
        }
    }
#    for (i=1; i<=type_num; i++){
#        for (j=1; j<=type_num; j++){
#            print i, j, arr[i][j]
#        }
#    }


    srand()
    step = 0
    start = 1
    for (step=1; step<=10; step++){
        num = 0
        for (j=1; j<=type_num; j++){
            num += arr[start][j]
        }
        val = rand() * num

        score = 0
        for (j=1; j<=type_num; j++){
            score += arr[start][j]
#            print step, j, arr[start][j], val, score
            if (val < score){
                start = j
                break
            }
        }
        print step, start
    }
}
