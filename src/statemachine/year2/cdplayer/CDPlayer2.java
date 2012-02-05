package statemachine.year2.cdplayer;

import javax.swing.JLabel;

import statemachine.year2.framework.GraphicalMachine;
import statemachine.year1.cdplayer.CDPlayer1.ControlGUI;

public class CDPlayer2 extends GraphicalMachine {

    /**
     * Create GUI and then activate robot server functionality
     */
    public static void main(String argv[]) {
        new CDPlayer2();
    }
    
    public CDPlayer2() {
        super(new ControlGUI(),new CDPlayerMachine(),ControlGUI.POWER_ON_COMMAND);
    }

    @Override
    public void update() {
        ((JLabel)gui.getComponent("state")).setText(machine.getState().toString());
        ((JLabel)gui.getComponent("track")).setText(new Integer(((CDPlayerMachine)machine).getTrack()).toString());
    }

}
