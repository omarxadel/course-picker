<?php
    include "config.php";
    
    if(isset($_POST)){
        $page = $_POST['page'];
        $limit = $_POST['limit'];
        $query = "";
        $start = ($page - 1) * $limit;
        $output = '';
        
        if(isset($_POST['query'])){
            $query = $_POST['query'];
            $count_res = $conn->query("SELECT COUNT(*) FROM course, professor, department WHERE course.professor_id = professor.professor_id AND course.department_id = department.department_id AND ((REPLACE(course.course_name, ' ', '') OR REPLACE(course.course_description, ' ', '') LIKE REPLACE('%$query%', ' ', '')) OR (REPLACE(professor.professor_name, ' ', '') LIKE REPLACE('%$query%', ' ', '')) OR (REPLACE(department.department_name, ' ', '') LIKE REPLACE('%$query%', ' ', '')))");
            $total_data = ($count_res->fetch_row())[0];
            $search_query = "SELECT course.course_name, course.course_description, professor.professor_name, department.department_name FROM course, professor, department WHERE course.professor_id = professor.professor_id AND course.department_id = department.department_id AND ((REPLACE(course.course_name, ' ', '') OR REPLACE(course.course_description, ' ', '') LIKE REPLACE('%$query%', ' ', '')) OR (REPLACE(professor.professor_name, ' ', '') LIKE REPLACE('%$query%', ' ', '')) OR (REPLACE(department.department_name, ' ', '') LIKE REPLACE('%$query%', ' ', ''))) LIMIT {$start},{$limit}";
            if ($result = $conn->query($search_query)) {
                if( $result->num_rows > 0)
                {   
                    for ($row_no = 0; $row_no <= $result->num_rows - 1; $row_no++) {
                        $result->data_seek($row_no);
                        $row = $result->fetch_assoc();
                        $output .= '
                        <div class="card mb-3">
                        <div class="card-body">
                          <h4 class="card-title text-primary">'.$row['course_name'].'</h4>
                          <p class="card-text" style="margin-bottom: 0.5rem;">'.$row['course_description'].'</p>
                          <span class="form-text text-muted" style="font-size: 0.85rem">'.$row['professor_name'].', '.$row['department_name'].'</span>
                        </div>
                      </div>
                        ';
                    }
                }
                else
                {
                    $output .= '
                        <h5 class="text-center my-4 text-secondary">No data found</h5>
                    ';
                    echo $output;
                    return;
                }
                $result->close();
            }
        }
        else{
            $count_res = $conn->query("SELECT COUNT(*) FROM course");
            $total_data = ($count_res->fetch_row())[0];
    
            if ($result = $conn->query("SELECT course.course_name, course.course_description, professor.professor_name, department.department_name FROM course, professor, department WHERE course.professor_id = professor.professor_id AND course.department_id = department.department_id LIMIT {$start}, {$limit}")) {
                if( $result->num_rows > 0)
                {
                    for ($row_no = 0; $row_no <= $result->num_rows - 1; $row_no++) {
                        $result->data_seek($row_no);
                        $row = $result->fetch_assoc();
                        $output .= '
                        <div class="card mb-3">
                        <div class="card-body">
                          <h4 class="card-title text-primary">'.$row['course_name'].'</h4>
                          <p class="card-text" style="margin-bottom: 0.5rem;">'.$row['course_description'].'</p>
                          <span class="form-text text-muted" style="font-size: 0.85rem">'.$row['professor_name'].', '.$row['department_name'].'</span>
                        </div>
                      </div>
                        ';
                    }
                }
                else
                {
                    $output .= '
                    <tr>
                        <td colspan="2" align="center">No Data Found</td>
                    </tr>
                    ';
                }
            }
            $result->close();
        }
        $output .= '
        <div align="center">
        <ul class="pagination justify-content-center">
        ';                           
        $total_links = ceil($total_data/$limit);   
        if($page != 1) {
            $prev_page = $page-1;
            $output .= '<li class="page-item"><a onclick="load_data('.$prev_page.', '.$limit.', \''.$query.'\')" class="page-link" href="#">Previous</a></li>';
        }
        for ($i = 1 ; $i <= $total_links ; $i++){
            if($page == $i){
                $output .= '<li class="page-item active">
                <a class="page-link" href="#">'.$i.'</a>
                </li>
                ';
            }
            else{
                $output .= '<li class="page-item"><a onclick="load_data('.$i.', '.$limit.', \''.$query.'\')" class="page-link" href="#">'.$i.'</a></li>';
            }
        }
        if($page != $total_links) {
            $page++;
            $output .= '<li class="page-item"><a onclick="load_data('.$page.', '.$limit.', \''.$query.'\')" class="page-link" href="#">Next</a></li>';
        }
        $output .= '
        </ul>
        </div>
        ';
        echo $output;
    }
?>