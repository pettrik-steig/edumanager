/*
 * Copyright (c) 2026 Pettrik Steig
 *
 * Co-Author: OpenAI Codex 5.x
 * Co-Author: OpenAI ChatGPT 5.x
 *
 * Project: EduManager 2026
 *
 * This file is part of EduManager.
 *
 * This program is free software: you can redistribute it and/or modify it under
 * the terms of the GNU Affero General Public License version 3 as published by
 * the Free Software Foundation.
 *
 * SPDX-License-Identifier: AGPL-3.0-only
 */

package de.alex.edumanager.app;

public final class Main {

    private Main() {
    }

    public static void main(String[] args) throws InterruptedException {
        System.out.println("EduManager 2026");

        for (int step = 1; step <= 5; step++) {
            System.out.println("Startup check " + step + "/5");
            Thread.sleep(250);
        }
    }
}
