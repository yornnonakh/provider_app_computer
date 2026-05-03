class Payment {
   String image;
   String name;

   Payment({
    required this.image,
    required this.name
   });
}

List<Payment> payment=[
   Payment(image: "https://play-lh.googleusercontent.com/WU6sZMD1UspzwqYnlACtmN60rckp8hoINSgsR21mKLJBbsHPwXtzwvOocpjC7FcO1g=w240-h480-rw", name: "ABA"),
   Payment(image: "https://play-lh.googleusercontent.com/weU8O2dHEQffcEyHeK11qTUMS-AQvlHW1IolQDM1XLuZN0ggl6Zr9kUwBqHwXr7i5T0", name: "ACELIDA"),
   Payment(image: "https://play-lh.googleusercontent.com/IwZLaZnWhlINs7AoIg7m7qNR-JNLInrme1xtrXkYoNxWwdTlWZozZnIligkyjUhiO0Q5", name: "Chip Mong Bank")
];