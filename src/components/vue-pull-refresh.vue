<template>
    <div class="pull-down-container">
        <div class="pull-down-header" v-bind:style="{'top': pullDown.height + 'px'}">
            <font-awesome-icon size="xl" icon="spinner" class="pull-down-content--icon" v-bind:class="iconClass" />
        </div>
        <slot></slot>
    </div>
</template>

<script>
     // status of pull down
    const STATUS_ERROR = -1;
    const STATUS_START = 0;
    const STATUS_READY = 1;
    const STATUS_REFRESH = 2;
    // // labels of pull down
    // const LABELS = ['数据异常', '下拉刷新数据', '松开刷新数据', '数据刷新中...'];
    const ANIMATION = 'top .2s ease';
    export default {
        props: {
            onRefresh: {
                type: Function
            },
            config: {
                type: Object,
                default: function() {
                    return {};
                }
            }
        },
        data() {
            return {
                pullDown: {
                    status: 0,
                    height: -40,
                    msg: ''
                },
                canPull: false
            };
        },
        computed: {
          
        },
        mounted() {
            this.$nextTick(() => {
                var el = this.$el;
                var pullDownHeader = el.querySelector('.pull-down-header');
                var icon = pullDownHeader.querySelector('.pull-down-content--icon');
                // set default pullDownHeight
                var config = {} 
                config.pullDownHeader =  80

                var touchPosition = {
                    start: 0,
                    distance: 0
                };

                let resetPullDown = (pullDown, withAnimation) => {
                    if (withAnimation) {
                        pullDownHeader.style.transition = ANIMATION;
                    }
                    pullDown.height = -40;
                    pullDown.status = STATUS_START;
                    icon.classList.add('stop')
                };
    

                el.addEventListener('touchstart', e =>{
                    if(el.scrollTop == 0){
                        this.canPull = true
                    }else{
                        this.canPull = false
                    }
                    touchPosition.start = e.touches.item(0).pageY
                })


                el.addEventListener('touchmove', e => {
                    if (!this.canPull) {
                        return;
                    }
                    var distance = e.touches.item(0).pageY - touchPosition.start;
                    // limit the height of pull down to 180
                    distance = distance > 180 ? 180 : distance;
                    // prevent native scroll
                    if (distance > 0) {
                        el.style.overflow = 'hidden';
                    }
                    // update touchPosition and the height of pull down
                    touchPosition.distance = distance;
                    this.pullDown.height = distance;
                    /**
                     * if distance is bigger than the height of pull down
                     * set the status of pull down to STATUS_READY
                     */
                    if (distance > this.config.pullDownHeight) {
                        this.pullDown.status = STATUS_READY;
                    } else {
                        /**
                         * else set the status of pull down to STATUS_START
                         * and rotate the icon based on distance
                         */
                        this.pullDown.status = STATUS_START;
                    }
                });

                el.addEventListener('touchend', () => {
                    this.canPull = false;
                    el.style.overflowY = 'auto';
                    pullDownHeader.style.transition = ANIMATION;
                    
                    // if distance is bigger than 60
                    if (touchPosition.distance - el.scrollTop > config.pullDownHeader) {
                        el.scrollTop = 0;
                        this.pullDown.height = this.config.pullDownHeight;
                        this.pullDown.status = STATUS_REFRESH;
                        // trigger refresh callback
                        if (this.onRefresh && typeof this.onRefresh === 'function') {
                            icon.classList.add('active')
                            var res = this.onRefresh();
                            // if onRefresh return promise
                            if (res && res.then && typeof res.then === 'function') {
                                res.then(() => {
                                    resetPullDown(this.pullDown, true);
                                }, error => {
                                    // show error and hide the pull down after 1 second
                                    if (typeof error !== 'string') {
                                        error = false;
                                    }
                                    this.pullDown.msg = error || this.customLabels[0];
                                    this.pullDown.status = STATUS_ERROR;
                                    setTimeout(() => {
                                        resetPullDown(this.pullDown, true);
                                    }, 1000);
                                });
                            } else {
                                resetPullDown(this.pullDown);
                            }
                        } else {
                            resetPullDown(this.pullDown);
                            console.warn('please use :on-refresh to pass onRefresh callback');
                        }
                    } else {
                        resetPullDown(this.pullDown);
                    }
                    // reset touchPosition
                    touchPosition.distance = 0;
                    touchPosition.start = 0;
                });

            });
        }
    };
</script>

<style lang="css">
.pull-down-container {
    height: 100%;
    max-height: 100%;
    position: relative;
    overflow-y: auto;
}

.pull-down-header {
    position: absolute;
    z-index: 1000;
    top: -40px;
    right: 50%;
    transform: translateX(50%);
}

.pull-down-content--icon {
    color: red;
    width: 100%;
}

.pull-down-content--icon.active {
    animation: rotate 2s infinite;
    animation-timing-function: linear;
}

@keyframes rotate {
    from {
        transform: rotate(0deg);
    }

    to {
        transform: rotate(360deg);
    }
}
</style>