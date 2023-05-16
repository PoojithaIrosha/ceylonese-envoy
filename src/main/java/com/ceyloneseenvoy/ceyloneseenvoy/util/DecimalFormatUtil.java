package com.ceyloneseenvoy.ceyloneseenvoy.util;

import java.text.DecimalFormat;
import java.text.NumberFormat;

public class DecimalFormatUtil {

    private final static DecimalFormatUtil instance = new DecimalFormatUtil();
    private final NumberFormat numberFormat = new DecimalFormat();

    private DecimalFormatUtil() {
        numberFormat.setMaximumFractionDigits(2);
        numberFormat.setMinimumFractionDigits(2);
    }

    public static DecimalFormatUtil getInstance() {
        return instance;
    }

    public String format(double value) {
        return numberFormat.format(value);
    }

}
