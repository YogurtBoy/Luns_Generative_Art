/*
// Box dimensions:
int width_box_a = 400;
int length_box_a = 200;
int width_box_b = width_box_a + 100;
//int length_box_b = 2*length_box_a;
int length_box_b = width_box_b;


background(174);
//rect(50, 150, 400, 200);
*/

int image_width = 800;
int image_length = 800;
size(800, 800);


// Initialize arrays for random lines
int num_lines = 6; 
int[] midpoint_x_coords = new int[num_lines];
int[] midpoint_y_coords = new int[num_lines];
float[] line_angles = new float[num_lines];
int[] line_lengths = new int[num_lines];

// Generate random lines: (x, y) of midpoint, the slope (line_angles), and the length
for(int ii = 0; ii < num_lines; ii++) {
  midpoint_x_coords[ii] = (int)(random((float)image_width) + 1);
  midpoint_y_coords[ii] = (int)(random((float)image_length) + 1);
  line_angles[ii] = random(360) + 1;
  line_lengths[ii] = (int)(random((float)image_length) + 1);
}



/*
// Draw lines randomly between points
for(int ii = 0; ii < num_lines; ii++) {
  temp_cos = cos(radians(line_angles[ii]));
  temp_sin = sin(radians(line_angles[ii]));
  print(temp_cos);
  x_second = point_x_coords[ii] + (int)(temp_cos*line_lengths[ii]);
  y_second = point_y_coords[ii] + (int)(temp_sin*line_lengths[ii]);

  line(point_x_coords[ii], point_y_coords[ii], x_second, y_second);
}

*/
