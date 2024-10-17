var swiperTheBest = new Swiper('.theBest .swiper-container', {
    spaceBetween: 1,
    slidesPerView: 5,
    loopAdditionalSlides: 30,
    navigation: {
        nextEl: '.theBest .swiper-button-next',
        prevEl: '.theBest .swiper-button-prev',
    },
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
    },
    // autoplay: {
    //   delay: 6000
    // },
 
    breakpoints: {
        300: {
            mousewheel: true,
            keyboard: true,
            slidesPerView: 1,
            spaceBetween: 24,
            allowSlidePrev: true,
            allowSlideNext: true,
            loopedSlides: 1,
        },
        450: {
            slidesPerView: 2,
            spaceBetween: 30,
            loopedSlides: 1,
        },
        1200: {
            slidesPerView: 5,
            spaceBetween: 30,
            loopedSlides: 3,
        },
        1600: {
            slidesPerView: 5,
            spaceBetween: 30,
            loopedSlides: 3,
        }
    },
});
var swiperBrands = new Swiper('.newBrands .swiper-container', {
    spaceBetween: 1,
    slidesPerView: 8,
    loopAdditionalSlides: 30,
    navigation: {
        nextEl: '.newBrands .swiper-button-next',
        prevEl: '.newBrands .swiper-button-prev',
    },
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
    },
    autoplay: {
      delay: 1000
    },
 
    breakpoints: {
        300: {
            mousewheel: true,
            keyboard: true,
            slidesPerView: 2,
            spaceBetween: 24,
            allowSlidePrev: true,
            allowSlideNext: true,
            loopedSlides: 1,
        },
        640: {
            slidesPerView: 4,
            spaceBetween: 30,
            loopedSlides: 1,
        },
        1200: {
            slidesPerView: 8,
            spaceBetween: 10,
            loopedSlides: 3,
        },
        1600: {
            slidesPerView: 8,
            spaceBetween: 30,
            loopedSlides: 3,
        }
    },
});
var swiperTheMostViewed = new Swiper('.theMostViewed .swiper-container', {
    spaceBetween: 1,
    slidesPerView: 5,
    loopAdditionalSlides: 30,
    navigation: {
        nextEl: '.theMostViewed .swiper-button-next',
        prevEl: '.theMostViewed .swiper-button-prev',
    },
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
    },
    // autoplay: {
    //   delay: 6000
    // },
 
    breakpoints: {
        300: {
            mousewheel: true,
            keyboard: true,
            slidesPerView: 1,
            spaceBetween: 24,
            allowSlidePrev: true,
            allowSlideNext: true,
            loopedSlides: 1,
        },
        450: {
            slidesPerView: 2,
            spaceBetween: 30,
            loopedSlides: 1,
        },
        1200: {
            slidesPerView: 6,
            spaceBetween: 10,
            loopedSlides: 3,
        },
        1600: {
            slidesPerView: 6,
            spaceBetween: 10,
            loopedSlides: 3,
        }
    },
});
var arrivedProducts = new Swiper('.arrivedProducts .swiper-container', {
    spaceBetween: 1,
    slidesPerView: 5,
    loopAdditionalSlides: 30,
    navigation: {
        nextEl: '.arrivedProducts .swiper-button-next',
        prevEl: '.arrivedProducts .swiper-button-prev',
    },
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
    },
    // autoplay: {
    //   delay: 6000
    // },
 
    breakpoints: {
        300: {
            mousewheel: true,
            keyboard: true,
            slidesPerView: 1,
            spaceBetween: 24,
            allowSlidePrev: true,
            allowSlideNext: true,
            loopedSlides: 1,
        },
        450: {
            slidesPerView: 2,
            spaceBetween: 30,
            loopedSlides: 1,
        },
        1200: {
            slidesPerView: 6,
            spaceBetween: 10,
            loopedSlides: 3,
        },
        1600: {
            slidesPerView: 6,
            spaceBetween: 10,
            loopedSlides: 3,
        }
    },
});