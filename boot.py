import time
import datetime
import 通用上层工具 as MyUtils
import 截图 as MyScreen
import MyKeyBoard

class State(object):
    # 关卡序号
    # 阵营、识别子弹间隔、启动exist间隔、重启选择关卡、
    # 超时时间尺度、散热次数、识别结束标志时间间隔

    def __init__(self):
        self.index=None
        self.actor=None
        self.startInterVal=None
        self.existInterVal=None
        self.overTime=None
        self.detectExistTime=None

    #从工业区选择
    def reboot(self):
        pass

    # 关卡迭代,重新选择,如从1到2
    def init(self):
        for i in range(20):
            MyKeyBoard.doubleClick(538,147)
            time.sleep(0.5)
        time.sleep(2)
        self.reboot()

    def start(self):
        MyUtils.logLink(str(self.index))
        time.sleep(1)
        MyUtils.choseActor(self.actor)

        time.sleep(self.startInterVal)

        # 伺机启动按键精灵,跳上热水器
        load_success_symbol = MyUtils.load_success()
        if True == load_success_symbol:
            MyKeyBoard.withCtrl_Alt("m")
            time.sleep(self.existInterVal)

        else:
            MyUtils.logWrite("掉线")
            MyUtils.updateStateNum(self.index,1)
            # global nums
            # nums += 1
            MyScreen.exception()
            time.sleep(2)
            MyUtils.reboot_fight()
            self.reboot()

class State1(State):
    def __init__(self):
        self.index=1
        self.actor='f'
        self.startInterVal=15
        self.existInterVal=130
        self.overTime=3.5
        self.detectExistTime = 7
    def reboot(self):
        MyUtils.chose_1()

class State2(State):
    def __init__(self):
        self.index=2
        self.actor='l'
        self.startInterVal=14
        self.existInterVal=150
        self.overTime=4
        self.detectExistTime = 7
    def reboot(self):
        MyUtils.chose_2()
    def start(self):
        MyUtils.logLink(str(self.index))
        time.sleep(1)
        MyUtils.choseActor(self.actor)

        time.sleep(self.startInterVal)

        # 伺机启动按键精灵,跳上热水器
        load_success_symbol = MyUtils.load_success()
        if True == load_success_symbol:
            time.sleep(0.5)
            if False==MyUtils.state2Front_Back():
                MyKeyBoard.mouseMove(1500, 0)
                time.sleep(0.2)
                MyKeyBoard.mouseMove(1500, 0)
            MyKeyBoard.withCtrl_Alt("m")

            time.sleep(self.existInterVal)


        else:
            MyUtils.logWrite("掉线")
            MyUtils.updateStateNum(self.index, 1)
            MyScreen.exception()
            time.sleep(2)
            MyUtils.reboot_fight()
            self.reboot()

class State3(State):
    def __init__(self):
        self.index=3
        self.actor='f'
        self.startInterVal=15
        self.existInterVal=220
        self.overTime=5.2
        self.detectExistTime = 10
    def reboot(self):
        MyUtils.chose_3()

class State7(State):
    def __init__(self):
        self.index=7
        self.actor='l'
        self.startInterVal=15
        self.existInterVal=200
        self.overTime=4.5
        self.detectExistTime = 7
    def reboot(self):
        MyUtils.chose_7()

    def start(self):
        MyUtils.logLink(str(self.index))
        time.sleep(1)
        MyUtils.choseActor(self.actor)

        time.sleep(self.startInterVal)

        # 伺机启动按键精灵,跳上热水器
        load_success_symbol = MyUtils.load_success()
        if True == load_success_symbol:

            MyKeyBoard.withCtrl_Alt("m")
            time.sleep(5)
            list0 = MyScreen.hsv()
            time.sleep(10)
            checkTime = datetime.datetime.now()

            print(list0)

            while  datetime.datetime.now() <= checkTime + datetime.timedelta(seconds=20):

                list1 = MyScreen.hsv()
                # print(list1)
                for j in range(3):
                    if abs((int)(list0[j]) - (int)(list1[j])) > 10:
                        print("扣血了")
                        MyUtils.overTime()  # 扣血和超时等价
                        break
            time.sleep(self.existInterVal-35)


        else:
            MyUtils.logWrite("掉线")
            MyUtils.updateStateNum(self.index, 1)
            MyScreen.exception()
            time.sleep(2)
            MyUtils.reboot_fight()
            self.reboot()

class State42(State):
    def __init__(self):
        self.index=42
        self.actor='l'
        self.startInterVal=8
        self.existInterVal=60
        self.overTime=4.5
        self.detectExistTime = 15
    def reboot(self):
        MyUtils.choose42()



def getCurState():
    '''
    该函数顺序读取config文件,返回当前需要刷的关卡对象
    @return:
    '''
    if (int)(MyUtils.getStateNum(1))>0:
        return State1()
    elif (int)(MyUtils.getStateNum(2))>0:
        return State2()
    elif (int)(MyUtils.getStateNum(3))>0:
        return State3()
    elif (int)(MyUtils.getStateNum(7))>0:
        return State7()
    elif (int)(MyUtils.getStateNum(42))>0:
        return State42()
if __name__=='__main__':

    publicDelay=(int)(MyUtils.getConfig("time","publicDelay"))
    relaxDelay=(int)(MyUtils.getConfig("time","relaxDelay"))
    pre=State()
    relaxTime = datetime.datetime.now()+ datetime.timedelta(minutes=relaxDelay)

    delayBoot=MyUtils.prepare()
    if delayBoot:
        MyUtils.bootFight()

    while True:
        cur=getCurState()
        if pre.index!=cur.index:
            cur.init()
        time.sleep(publicDelay)
        startTime=datetime.datetime.now()
        endTime = startTime + datetime.timedelta(minutes=cur.overTime)
        MyUtils.logWrite(str(cur.index)+":   "+str(startTime))
        cur.start()

        exit_symbol = MyScreen.exit_screenshot()

        exitFlag,startClose,relaxTime=MyUtils.detectExit(cur.detectExistTime, relaxTime, endTime)

        if exitFlag:
            #正常结束，关卡--
            MyUtils.updateStateNum(cur.index,-1)
        else:
            # 超时，关卡数不变
            MyUtils.reboot_fight()
            cur.reboot()


        # 更新当前关卡数量
        num = MyUtils.getStateNum(cur.index)
        pre=cur

        #定时关闭
        if startClose==1:
            MyUtils.closeGame()
            MyKeyBoard.relax(10)
            MyUtils.wifiUnConnect()
            MyUtils.delay(375)
            MyUtils.bootFight()
            cur.reboot()

        elif startClose==2:
            MyUtils.closeGame()
            MyUtils.resetConfig()
            MyKeyBoard.relax(20)
            MyUtils.wifiUnConnect()
            MyUtils.delay(25)
            MyUtils.bootFight()
            cur=getCurState()
            cur.reboot()


        else:
            pass


