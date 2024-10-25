Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E34A1D149EE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 20:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jrGPYiQVrR1mRwXfSLHdF++IDgBP/SolJ9GIk6NTtsk=; b=JJOuijz9t1YNFxN7vpff+4vFKV
	U3wObG1gO+ZZwDJ6/94z4wZjdzGZoYWNU8V9kaBgKlqAaaMbTuvwTJrharSIOPMHpKTJMCe/yoiKm
	OBY9U8F3SiE03xrCjfAWzyKLGczLVKHrzh3NkX8yCM5ovxwuUjPEIyaOSTXTLy2Im6wtA7mBtUYw1
	vwiJt/F8MSOfrQIY0xQWaGu5YxpR6BpJQ+WCjzuz7y/PdirI9AqOJ7JZ2mssTNuK+I9fcd2BjToHi
	n+fvNkR89JA6SND17HZEIXZ5Ap5qD7FbrQewcS04ihF8K7POSeicZZNgWASLouD76rLqE/qtHyHBN
	lhB6NOKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Qg1-000000054uU-3Qay;
	Fri, 25 Oct 2024 20:12:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4QH8-000000052Jl-2C0c;
	Fri, 25 Oct 2024 19:47:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=jrGPYiQVrR1mRwXfSLHdF++IDgBP/SolJ9GIk6NTtsk=; b=c8FiDd0ke0+6xZIS3fAQ8tRIwb
	TF6MZG7YypyEXtRDAwkPcxkdq040HwZguGTM7G6WEwJnB8gl5HAmQEnAvEawmnszsZssqNuLzE5uO
	bF0p/HzDxNS14cIZifA8qhCnHnN1jHbnxekMt26NDmWpBpWA3IRCEbO9W8vj+815x486DC9y53UQ+
	eO4H0u27dwsZGIxw1tFy+3yrV5k7gRva0amdPbwn1rPiZqLTmGdyrCdnj4XFWFOkG2gRcsUaPYG3b
	OQqQPZNOIBQilXN6jIx+1BQA1Iz03dYahSv5eeN9ovykmO0VyNMouj0knWBaku4fnKqDqG4g42Rw1
	GkVzwMPg==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4QGs-000000093Yu-0ckz;
	Fri, 25 Oct 2024 19:47:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729885578;
	bh=Y20wuHcunjSHNH2lvGmo0duSBcWHshdPVJCm96/MJWk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XA3f1BOxjZQzKihOQ5/lKl5uNMehsUMPCC17wk23yjR0Wkl2ubgqxG/lYj+8qMmKL
	 rWkt5JenztqPzdRq43WZGAlf6i8DzZN5KV/vi+lCke6TpjWcvSZdoNx12A8tggKIG9
	 t3896nMc3GECQayVzzcJ+PWfVfU68cLhHuiU1cMGFs4I1Jd2IK7gDyEXjtqDjPYlZ3
	 X3dhcYbaqNNWq1KpIywA55yN72LCsakpOazsN615dG436TLK8vuxDf/XWRkcJCdXt+
	 qnxUrEKhOqOuvv/M6mO88IlcOhkpySKDizpmbwaKXG+uRufUyDBPrLIQHV/FKj6D7w
	 Bd4L3+HnOKFMA==
Received: from [192.168.1.54] (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D7CC917E3757;
	Fri, 25 Oct 2024 21:46:16 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 25 Oct 2024 15:45:40 -0400
Subject: [PATCH RFC v2 5/5] selftest: gpio: Add a new set-get config test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241025-kselftest-gpio-set-get-config-v2-5-040d748840bb@collabora.com>
References: <20241025-kselftest-gpio-set-get-config-v2-0-040d748840bb@collabora.com>
In-Reply-To: <20241025-kselftest-gpio-set-get-config-v2-0-040d748840bb@collabora.com>
To: Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bamvor Jian Zhang <bamv2005@gmail.com>, Shuah Khan <shuah@kernel.org>
Cc: kernel@collabora.com, linux-mediatek@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 kernelci@lists.linux.dev, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_204658_950612_9BA5A816 
X-CRM114-Status: GOOD (  18.89  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add a new kselftest that sets a configuration to a GPIO line and then
gets it back to verify that it was correctly carried out by the driver.

Setting a configuration is done through the GPIO uAPI, but retrieving it
is done through the debugfs interface since that is the only place where
it can be retrieved from userspace.

The test reads the test plan from a YAML file, which includes the chips
and pin settings to set and validate.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 tools/testing/selftests/gpio/Makefile              |   2 +-
 .../gpio-set-get-config-example-test-plan.yaml     |  15 ++
 .../testing/selftests/gpio/gpio-set-get-config.py  | 183 +++++++++++++++++++++
 3 files changed, 199 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/gpio/Makefile b/tools/testing/selftests/gpio/Makefile
index e0884390447dcfffe4ca0b4fa0f1669463bb669c..bdfeb0c9aaddc436df77ada1d5ac0c80890960a7 100644
--- a/tools/testing/selftests/gpio/Makefile
+++ b/tools/testing/selftests/gpio/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-TEST_PROGS := gpio-mockup.sh gpio-sim.sh
+TEST_PROGS := gpio-mockup.sh gpio-sim.sh gpio-set-get-config.py
 TEST_FILES := gpio-mockup-sysfs.sh
 TEST_GEN_PROGS_EXTENDED := gpio-mockup-cdev gpio-chip-info gpio-line-name
 CFLAGS += -O2 -g -Wall $(KHDR_INCLUDES)
diff --git a/tools/testing/selftests/gpio/gpio-set-get-config-example-test-plan.yaml b/tools/testing/selftests/gpio/gpio-set-get-config-example-test-plan.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..3b749be3c8dcf6822b7531424a6b1f8fca840a65
--- /dev/null
+++ b/tools/testing/selftests/gpio/gpio-set-get-config-example-test-plan.yaml
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0
+# Top-level contains a list of the GPIO chips that will be tested. Each one is
+# chosen based on the GPIO chip's info label.
+- label: "gpiochip_device_label"
+  # For each GPIO chip, multiple pin configurations can be tested, which are
+  # listed under 'tests'
+  tests:
+  # pin indicates the pin number to test
+  - pin: 34
+    # bias can be 'pull-up', 'pull-down', 'disabled'
+    bias: "pull-up"
+  - pin: 34
+    bias: "pull-down"
+  - pin: 34
+    bias: "disabled"
diff --git a/tools/testing/selftests/gpio/gpio-set-get-config.py b/tools/testing/selftests/gpio/gpio-set-get-config.py
new file mode 100755
index 0000000000000000000000000000000000000000..6f1444c8d46bcfc226f414520b74f4a59725854f
--- /dev/null
+++ b/tools/testing/selftests/gpio/gpio-set-get-config.py
@@ -0,0 +1,183 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2024 Collabora Ltd
+
+#
+# This test validates GPIO pin configuration. It takes a test plan in YAML (see
+# gpio-set-get-config-example-test-plan.yaml) and sets and gets back each pin
+# configuration described in the plan and checks that they match in order to
+# validate that they are being applied correctly.
+#
+# When the file name for the test plan is not provided through --test-plan, it
+# will be guessed based on the platform ID (DT compatible or DMI).
+#
+
+import time
+import os
+import sys
+import argparse
+import re
+import subprocess
+import glob
+import signal
+
+import yaml
+
+# Allow ksft module to be imported from different directory
+this_dir = os.path.dirname(os.path.realpath(__file__))
+sys.path.append(os.path.join(this_dir, "../kselftest/"))
+
+import ksft
+
+
+def config_pin(chip_dev, pin_config):
+    flags = []
+    if pin_config.get("bias"):
+        flags += f"-b {pin_config['bias']}".split()
+    flags += ["-w", chip_dev, str(pin_config["pin"])]
+    gpio_mockup_cdev_path = os.path.join(this_dir, "gpio-mockup-cdev")
+    return subprocess.Popen([gpio_mockup_cdev_path] + flags)
+
+
+def get_bias_debugfs(chip_debugfs_path, pin):
+    with open(os.path.join(chip_debugfs_path, "pinconf-pins")) as f:
+        for l in f:
+            m = re.match(rf"pin {pin}.*bias (?P<bias>(pull )?\w+)", l)
+            if m:
+                return m.group("bias")
+
+
+def check_config_pin(chip, chip_debugfs_dir, pin_config):
+    test_passed = True
+
+    if pin_config.get("bias"):
+        bias = get_bias_debugfs(chip_debugfs_dir, pin_config["pin"])
+        # Convert "pull up" / "pull down" to "pull-up" / "pull-down"
+        bias = bias.replace(" ", "-")
+        if bias != pin_config["bias"]:
+            ksft.print_msg(
+                f"Bias doesn't match: Expected {pin_config['bias']}, read {bias}."
+            )
+            test_passed = False
+
+    ksft.test_result(
+        test_passed,
+        f"{chip['label']}.{pin_config['pin']}.{pin_config['bias']}",
+    )
+
+
+def get_devfs_chip_file(chip_dict):
+    gpio_chip_info_path = os.path.join(this_dir, 'gpio-chip-info')
+    for f in glob.glob("/dev/gpiochip*"):
+        proc = subprocess.run(
+            f"{gpio_chip_info_path} {f} label".split(), capture_output=True, text=True
+        )
+        if proc.returncode:
+            ksft.print_msg(f"Error opening gpio device {f}: {proc.returncode}")
+            ksft.exit_fail()
+
+        if chip_dict["label"] in proc.stdout:
+            return f
+
+
+def get_debugfs_chip_dir(chip):
+    pinctrl_debugfs = "/sys/kernel/debug/pinctrl/"
+
+    for name in os.listdir(pinctrl_debugfs):
+        if chip["label"] in name:
+            return os.path.join(pinctrl_debugfs, name)
+
+
+def run_test(test_plan_filename):
+    ksft.print_msg(f"Using test plan file: {test_plan_filename}")
+
+    with open(test_plan_filename) as f:
+        plan = yaml.safe_load(f)
+
+    num_tests = 0
+    for chip in plan:
+        num_tests += len(chip["tests"])
+
+    ksft.set_plan(num_tests)
+
+    for chip in plan:
+        chip_dev = get_devfs_chip_file(chip)
+        if not chip_dev:
+            ksft.print_msg("Couldn't find /dev file for GPIO chip")
+            ksft.exit_fail()
+        chip_debugfs_dir = get_debugfs_chip_dir(chip)
+        if not chip_debugfs_dir:
+            ksft.print_msg("Couldn't find pinctrl folder in debugfs for GPIO chip")
+            ksft.exit_fail()
+        for pin_config in chip["tests"]:
+            proc = config_pin(chip_dev, pin_config)
+            time.sleep(0.1)  # Give driver some time to update pin
+            check_config_pin(chip, chip_debugfs_dir, pin_config)
+            proc.send_signal(signal.SIGTERM)
+            proc.wait()
+
+
+def get_possible_test_plan_filenames():
+    filenames = []
+
+    dt_board_compatible_file = "/proc/device-tree/compatible"
+    if os.path.exists(dt_board_compatible_file):
+        with open(dt_board_compatible_file) as f:
+            for line in f:
+                compatibles = [compat for compat in line.split("\0") if compat]
+                filenames.extend(compatibles)
+    else:
+        dmi_id_dir = "/sys/devices/virtual/dmi/id"
+        vendor_dmi_file = os.path.join(dmi_id_dir, "sys_vendor")
+        product_dmi_file = os.path.join(dmi_id_dir, "product_name")
+
+        with open(vendor_dmi_file) as f:
+            vendor = f.read().replace("\n", "")
+        with open(product_dmi_file) as f:
+            product = f.read().replace("\n", "")
+
+        filenames = [vendor + "," + product]
+
+    return filenames
+
+
+def get_test_plan_filename(test_plan_dir):
+    chosen_test_plan_filename = ""
+    full_test_plan_paths = [
+        os.path.join(test_plan_dir, f + ".yaml")
+        for f in get_possible_test_plan_filenames()
+    ]
+    for path in full_test_plan_paths:
+        if os.path.exists(path):
+            chosen_test_plan_filename = path
+            break
+
+    if not chosen_test_plan_filename:
+        tried_paths = ",".join(["'" + p + "'" for p in full_test_plan_paths])
+        ksft.print_msg(f"No matching test plan file found (tried {tried_paths})")
+        ksft.print_cnts()
+        sys.exit(4)
+
+    return chosen_test_plan_filename
+
+
+parser = argparse.ArgumentParser()
+parser.add_argument(
+    "--test-plan-dir", default=".", help="Directory containing the test plan files"
+)
+parser.add_argument("--test-plan", help="Test plan file to use")
+args = parser.parse_args()
+
+ksft.print_header()
+
+if args.test_plan:
+    test_plan_filename = os.path.join(args.test_plan_dir, args.test_plan)
+    if not os.path.exists(test_plan_filename):
+        ksft.print_msg(f"Test plan file not found: {test_plan_filename}")
+        ksft.exit_fail()
+else:
+    test_plan_filename = get_test_plan_filename(args.test_plan_dir)
+
+run_test(test_plan_filename)
+
+ksft.finished()

-- 
2.47.0


