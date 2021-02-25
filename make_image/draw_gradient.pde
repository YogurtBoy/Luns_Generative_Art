/* //<>//
int num_lines = 6; 
 int[] midpoint_x_coords = new int[num_lines];
 int[] midpoint_y_coords = new int[num_lines];
 float[] line_angles = new float[num_lines];
 int[] line_lengths = new int[num_lines];
 */

float endpoint_distance_a = 0;
float endpoint_distance_b = 0;
float max_distance_to_line = 0;
float distance_to_line = image_width;
float temp_distance = image_width;
float distance_2norm = 0;
float temp_d_num, temp_d_den;
float[] end_x_a = new float[num_lines];
float[] end_y_a = new float[num_lines];
float[] end_x_b = new float[num_lines];
float[] end_y_b = new float[num_lines];



// Construct the lines
for (int kk = 0; kk < num_lines; kk++) {
  end_x_a[kk] = (float)midpoint_x_coords[kk] - cos(radians(line_angles[kk]))*((float)line_lengths[kk])/2;
  end_x_b[kk] = (float)midpoint_x_coords[kk] + cos(radians(line_angles[kk]))*((float)line_lengths[kk])/2;
  end_y_a[kk] = (float)midpoint_x_coords[kk] - sin(radians(line_angles[kk]))*((float)line_lengths[kk])/2;
  end_y_b[kk] = (float)midpoint_x_coords[kk] + sin(radians(line_angles[kk]))*((float)line_lengths[kk])/2;
  line(end_x_a[kk], end_y_a[kk], end_x_b[kk], end_y_b[kk]);
}

//noSmooth();  // Disables antialiasing/smoothing

//float v_tint = 0;
//float h_tint = 0;
//float v_d_tint = 255/((float)image_width);
//float h_d_tint = 255/((float)image_length);
float r_amount = 0;
float g_amount = 0;
float b_amount = 0;

float tint_portion_x = 0;
float tint_portion_y = 0;

for (int ii = 0; ii < image_length; ii++) {
  tint_portion_y = (float)ii/((float)image_length);

  for (int jj = 0; jj < image_width; jj++) {
    tint_portion_x = ((float)jj)/((float)image_width);

    // Find the shortest distance to any line
    temp_distance = image_width;
    distance_to_line = image_width;
    for (int kk = 0; kk < num_lines; kk++) {
      temp_d_num = abs((end_x_b[kk] - end_x_a[kk])*(end_y_a[kk] - ii) - (end_x_a[kk] - jj)*(end_y_b[kk] - end_y_a[kk]));
      temp_d_den = sqrt(sq(end_x_a[kk] - end_x_b[kk]) + sq(end_y_a[kk] - end_y_b[kk]));
      temp_distance = temp_d_num/temp_d_den;

      endpoint_distance_a = sqrt(sq(end_x_a[kk] - (float)jj) + sq(end_y_a[kk] - (float)ii));
      endpoint_distance_b = sqrt(sq(end_x_b[kk] - (float)jj) + sq(end_y_b[kk] - (float)ii));
      if (endpoint_distance_a > distance_to_line && endpoint_distance_b > distance_to_line) {
        if (endpoint_distance_a > endpoint_distance_b) {  //<>//
          temp_distance = endpoint_distance_b;
        } else {
          temp_distance = endpoint_distance_a;
        }
      }

      if (temp_distance < distance_to_line) {
        distance_to_line = temp_distance;
      }
    }
    if (temp_distance > max_distance_to_line) {
      max_distance_to_line = temp_distance;
    }
    //r_amount = 255 - (distance_to_line/max_distance_to_line)*255;
    r_amount = 255/(distance_to_line/max_distance_to_line + 1) - 100;

    stroke((int)r_amount, 15, 60);   // Sets color, (R, G, B) 
    point(jj, ii);    // Draws a point, (x, y)
  }
}

save("firstcut.tif");
