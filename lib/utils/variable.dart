double?hight;
double?width;
bool isPasswordHide = true;

double calculateResponsiveFontSize(double screenWidth) {
  // You can adjust these values based on your design and preferences
  const double baseFontSize = 18.0;
  const double maxWidth = 500.0;

  // Calculate a responsive font size
  return baseFontSize * screenWidth / maxWidth;
}