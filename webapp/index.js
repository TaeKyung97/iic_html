// 문서의 모든 콘텐츠가 로드된 후 스크립트를 실행합니다.
document.addEventListener('DOMContentLoaded', function() {
    // 통계 숫자 카운터 애니메이션을 초기화합니다.
    initStatCounters();
    // 부드러운 스크롤 기능을 초기화합니다.
    initSmoothScroll();
});

/**
 * 통계 숫자 카운터 애니메이션 기능
 * 화면에 통계 섹션이 나타나면 숫자가 0부터 목표 숫자까지 증가하는 애니메이션을 실행합니다.
 */
function initStatCounters() {
    // .stat-number 클래스를 가진 모든 요소를 선택합니다.
    const counters = document.querySelectorAll('.stat-number');
    
    // 애니메이션 속도를 조절하기 위한 값입니다.
    const animationDuration = 1000; // 초

    // IntersectionObserver를 사용하여 요소가 화면에 보이는지 감지합니다.
    const observer = new IntersectionObserver((entries, observer) => {
        entries.forEach(entry => {
            // 요소가 화면에 나타나면 애니메이션을 시작합니다.
            if (entry.isIntersecting) {
                const counter = entry.target;
                const target = +counter.getAttribute('data-target');
                
                let startTime = null;

                // 애니메이션을 처리하는 함수입니다.
                const animate = (currentTime) => {
                    if (startTime === null) {
                        startTime = currentTime;
                    }
                    const progress = currentTime - startTime;
                    const currentValue = Math.min(Math.floor(progress / animationDuration * target), target);
                    
                    counter.innerText = currentValue;

                    // 목표 숫자에 도달할 때까지 애니메이션을 반복합니다.
                    if (progress < animationDuration) {
                        requestAnimationFrame(animate);
                    } else {
                        counter.innerText = target; // 최종 숫자를 정확하게 설정합니다.
                    }
                };

                requestAnimationFrame(animate);
                
                // 한 번 실행된 후에는 더 이상 관찰하지 않도록 설정합니다.
                observer.unobserve(counter);
            }
        });
    }, {
        threshold: 0.5 // 요소가 50% 보일 때 애니메이션을 시작합니다.
    });

    // 각 카운터 요소를 관찰 대상으로 추가합니다.
    counters.forEach(counter => {
        observer.observe(counter);
    });
}

/**
 * 부드러운 스크롤 기능
 * 네비게이션 링크를 클릭했을 때 해당 섹션으로 부드럽게 이동합니다.
 */
function initSmoothScroll() {
    // href 속성이 '#'으로 시작하는 모든 링크를 선택합니다.
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault(); // 기본 동작(점프)을 막습니다.

            const targetId = this.getAttribute('href');
            const targetElement = document.querySelector(targetId);

            if (targetElement) {
                // 헤더의 높이를 고려하여 스크롤 위치를 조정합니다.
                const headerOffset = 80; // 헤더 높이만큼의 여백
                const elementPosition = targetElement.getBoundingClientRect().top;
                const offsetPosition = elementPosition + window.pageYOffset - headerOffset;

                // 부드러운 스크롤을 실행합니다.
                window.scrollTo({
                    top: offsetPosition,
                    behavior: "smooth"
                });
            }
        });
    });
}

