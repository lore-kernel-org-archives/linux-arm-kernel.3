Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8308C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 10:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Gu0GpnSA;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=THx+u7xo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FbypPKsKITOQ/jk6XjCK9FIhBZBfHxhE6jSa8LQnUcU=; b=Gu0GpnSACmCXxP
	jnFkpXPn65SpQd6Bl6dLPlq/+A0DZtTOEPoBnAIjT7aB1wd3RjE1wxJfIn5/zRwrS1EZcZ5Ib0+Ma
	RoJnWFlgEB+cizpiCzEEU8difzdWcQ/JaHZojgGSXB+WjHx/RU1gT59aegF9ZYmq6yP56WNne5LQ0
	iuEhhw4GiSi0Ha966TgE/7REWEtN4KCS139R+LBWTAt/D7+fDciIOUD03pbiDmUqNpeiiEXLPGaSr
	lTZWmb0hh2PYfPZvNkoXX0WNN1EtliQd6IE4x16Cm40/brE13lsMy7+XZ71ZbINlYEjkuKQKKD8cI
	YHJSQpgrAYJi3djVHodA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKCG8-0000000G7Yc-0ZrH;
	Fri, 23 Oct 2026 10:12:24 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKCG0-0000000G7UL-1DKN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 10:12:17 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a1df4c0966so3773295e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 03:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792750335; x=1793355135; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FbypPKsKITOQ/jk6XjCK9FIhBZBfHxhE6jSa8LQnUcU=;
        b=THx+u7xoRrAkZ2qD8KsW5yo/KgfMFMukHRgA0+TRqoMMF1eWNwDREa19vUWij1lThB
         hc/qtvrbfPTNH/FjaOQQzXzjZ8D0M3bqJvvvtgWqXAYPaFU4fvJ3RwkERQJtOCwsenLE
         k0uTHMnQWhTxyHKz17iMmXzUF2i8/Mwh4xUaAN0lSseZCd3NPp0gaNtCEdO1WyxN5/+V
         JOUcnK/VQU8cZRCkGOAas1RDFsAa5ibdSAWLwgFAmj7zkJiQiGWEgVA4i/hXxAdt4gGS
         ExmHXHeSEedPU5Ihh8uDhlEvy/twGf7yd5zDXM9EkozBpdu3ZFsKJp/NbelSbC8jfcE3
         Oyjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750335; x=1793355135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FbypPKsKITOQ/jk6XjCK9FIhBZBfHxhE6jSa8LQnUcU=;
        b=Mm6pYHJlSGpuaSuKFvE3slKJC44XqX34y7dLWCMuIsusOIw1hnAJvfLk/qjlwBYQ/l
         NXLbBI1eOwW2z/AgMK/BlJvyAqlNFqGUmC0K5Jh5g979KgZV0jgZlQk6WRIgWUA7Z7d1
         qIS5uhZRJBpFvCYYgSg0qKd6j5dENnSndy7BUU0iLx7eYEuCxXys34ToqRM2WvfaZ3mk
         sdoSn3fnz7oXtFhWfkYyYSo5PHjPCfJ+fbwTZ5BcIASlG3NvMrKD3sDBGFn1md6k/6nI
         DLaH4C3PEmcoXQIOW6Jvt3ThUpSQaZRmpo1Rraq2EET92yv5BwYoXTHwRRIZqK5ZAPH/
         H6gg==
X-Forwarded-Encrypted: i=1; AKwUvBxdaRg7p88M7YlQma9DydBbcccen4H2jyahvQZAxSdxmIl0uq3dPT6P7YNk7QI7Phbf+7kFH/Q0KscL8uobZrZr@lists.infradead.org
X-Gm-Message-State: AFq9FYK9VGV9YgKkWfjgIBw6eqrPApPH9xkCMTrhOUhsqjSMvxSpuAm+
	gOi7sPNQ7/cEYPeiKTq353sH+Ih0VFVN1DiRcsD3WKvPB1ElbRYSGdhFUSkmy09817I=
X-Gm-Gg: AYBFou3isOzKI/7BY2jXxBH8oCAURv7iFtwGIY8fKkV8u3l2002a05BGN7atnF00CCD
	SCOp/Cxk4s01lER4LEcdzUxZcY1JIMfTjjo+8Fx8THWaiKwVG8GEUo1aKzY0dlgslfSlseBqpYQ
	WFoXq8J3kQqObl99gOpkkGHcG2MPbbc5VOtu4IqFz1Ns93+ZCvv8aVl1bwRJP299s1de++bVYD5
	lOiKf96kw0nr448aV8FNpLur6viAJQ3GjQ+kZxUo2PCnwahgE5UArOloDMn+YhRCTFcwCEqa2cj
	zFKTpf4MqGyDcHGi4FP1kOIE4If+XGxHq1hnz6MBYCaFMxtics416h3n1Uysa83Lruv/hNpKiOX
	ns+gYDpD3fF1sNhNYzh3SlyoMtYiUyH/VJbWYAzKQglI075xBpMhwlM8M/ENy/n37lvcpZFVK9+
	qk4bVTnIuZ+i4srZI0gJDbXBw+z0f2s1B7y6uff+F6Gs1mTO2FxGs5CdaGH8Xv+g26ffilbN5US
	EYEL260/s2k6jakbG/BXVIKS96SX9sv2rDo+vuNYiwO47uFjhRIcKM=
X-Received: by 2002:a05:600c:1389:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4a211cac456mr27965575e9.17.1792750334572;
        Fri, 23 Oct 2026 03:12:14 -0700 (PDT)
Received: from localhost ([82.192.120.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a211ba35d3sm43628645e9.6.2026.10.23.03.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:12:14 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Stanimir Varbanov <svarbanov@suse.de>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Gary Guo <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH RFC 3/4] hwmon: Add driver for Raspberry Pi RP1 fan tachometer
Date: Fri, 23 Oct 2026 12:15:56 +0200
Message-ID: <0d2249a66732bfce38a2260bee08cd1ba4097e51.1792748690.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1792748690.git.andrea.porta@suse.com>
References: <cover.1792748690.git.andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_031216_388885_AA285FCC 
X-CRM114-Status: GOOD (  30.32  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a hardware monitoring driver to support the fan tachometer on the
Raspberry Pi RP1 southbridge, found on the Raspberry Pi 5.

The RP1 PWM controller block contains specific MMIO registers that hold
the current fan speed in RPM. These registers are periodically updated by
the RP1 internal firmware based on the tachometer pulses.

Since the Linux PWM subsystem does not currently offer a framework for
exposing integrated hardware tachometer readings, this driver is
implemented as a standalone hwmon device. It parses the
'raspberrypi,pwm-tachometer' DT property to find the supplier PWM device,
establishes a device link to ensure proper lifecycle management, and uses
RP1-specific PWM functions to retrieve the RPM values.

Provides the standard hwmon sysfs attribute 'fan1_input'.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 Documentation/hwmon/index.rst   |   1 +
 Documentation/hwmon/rp1-fan.rst |  41 ++++++++++
 MAINTAINERS                     |   1 +
 drivers/hwmon/Kconfig           |  11 +++
 drivers/hwmon/Makefile          |   1 +
 drivers/hwmon/rp1-hwmon.c       | 136 ++++++++++++++++++++++++++++++++
 6 files changed, 191 insertions(+)
 create mode 100644 Documentation/hwmon/rp1-fan.rst
 create mode 100644 drivers/hwmon/rp1-hwmon.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 9955a525436ae..e078404a0e08d 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -235,6 +235,7 @@ Hardware Monitoring Kernel Drivers
    q54sj108a2
    qnap-mcu-hwmon
    raspberrypi-hwmon
+   rp1-fan
    sbrmi
    sbtsi_temp
    sch5627
diff --git a/Documentation/hwmon/rp1-fan.rst b/Documentation/hwmon/rp1-fan.rst
new file mode 100644
index 0000000000000..4497b61c0a394
--- /dev/null
+++ b/Documentation/hwmon/rp1-fan.rst
@@ -0,0 +1,41 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+Raspberry Pi RP1 fan tachometer
+=======================================
+
+Supported chips:
+
+ * Raspberry Pi RP1
+
+   Prefix: 'rp1_fan'
+
+   Addresses scanned: -
+
+   Datasheet: not public
+
+Author: Andrea della Porta <andrea.porta@suse.com>
+
+Description
+-----------
+
+The Raspberry Pi RP1 is a multi-function I/O controller (southbridge) used
+on boards such as the Raspberry Pi 5. Among its peripherals, the RP1 includes
+a PWM controller responsible for fan control.
+
+In addition to standard PWM output, the RP1 provides fan speed monitoring
+(tachometer). The tachometer pulse measurement is performed internally by
+firmware running on the RP1 Cortex-M microcontroller core. The computed fan
+speed (RPM) is periodically updated by the firmware directly into dedicated
+MMIO registers located within the RP1 PWM block.
+
+This driver interfaces with the RP1 PWM controller to read these firmware-updated
+registers and exposes the fan speed as standard hwmon sysfs attributes.
+
+Sysfs entries
+-------------
+
+The following attributes are supported.
+
+======================= ========================================================
+fan1_input              fan tachometer speed in RPM (RO)
+======================= ========================================================
diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c9..f66c52e640342 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22819,6 +22819,7 @@ M:	Andrea della Porta <andrea.porta@suse.com>
 S:	Maintained
 F:	arch/arm64/boot/dts/broadcom/rp1*.dts*
 F:	drivers/clk/clk-rp1.c
+F:	drivers/hwmon/rp1-hwmon.c
 F:	drivers/misc/rp1/
 F:	drivers/pinctrl/pinctrl-rp1.c
 
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index fecff8610ea8b..c23dfd5f5055a 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1981,6 +1981,17 @@ config SENSORS_RASPBERRYPI_HWMON
 	  This driver can also be built as a module. If so, the module
 	  will be called raspberrypi-hwmon.
 
+config SENSORS_RP1_FAN
+	tristate "Raspberry Pi RP1 PWM Fan Support"
+	depends on OF
+	depends on PWM_RASPBERRYPI_RP1 || COMPILE_TEST
+	help
+	  If you say yes here you get support for reading the fan tachometer
+	  from Raspberry Pi RP1.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called rp1-hwmon.
+
 config SENSORS_SL28CPLD
 	tristate "Kontron sl28cpld hardware monitoring driver"
 	depends on MFD_SL28CPLD || COMPILE_TEST
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 1229b6b3996d7..54f2bd057a2d8 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -207,6 +207,7 @@ obj-$(CONFIG_SENSORS_PT5161L)	+= pt5161l.o
 obj-$(CONFIG_SENSORS_PWM_FAN)	+= pwm-fan.o
 obj-$(CONFIG_SENSORS_QNAP_MCU_HWMON)	+= qnap-mcu-hwmon.o
 obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)	+= raspberrypi-hwmon.o
+obj-$(CONFIG_SENSORS_RP1_FAN)	+= rp1-hwmon.o
 obj-$(CONFIG_SENSORS_SBTSI)	+= sbtsi_temp.o
 obj-$(CONFIG_SENSORS_SCH56XX_COMMON)+= sch56xx-common.o
 obj-$(CONFIG_SENSORS_SCH5627)	+= sch5627.o
diff --git a/drivers/hwmon/rp1-hwmon.c b/drivers/hwmon/rp1-hwmon.c
new file mode 100644
index 0000000000000..7943eda905dbc
--- /dev/null
+++ b/drivers/hwmon/rp1-hwmon.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Hardware monitoring fan driver for Raspberry Pi RP1
+ */
+
+#include <linux/module.h>
+#include <linux/device.h>
+#include <linux/platform_device.h>
+#include <linux/mod_devicetable.h>
+#include <linux/hwmon.h>
+#include <linux/err.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <soc/bcm2835/raspberrypi-pwm-rp1.h>
+
+struct rp1_fan_data {
+	struct device *pwm_dev;
+};
+
+static int rp1_fan_read(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long *val)
+{
+	struct rp1_fan_data *data = dev_get_drvdata(dev);
+	int rpm;
+
+	if (type == hwmon_fan && attr == hwmon_fan_input) {
+		rpm = rp1_pwm_read_tachometer(data->pwm_dev);
+		if (rpm < 0)
+			return rpm;
+
+		*val = rpm;
+		return 0;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static const struct hwmon_channel_info * const rp1_fan_info[] = {
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
+	NULL
+};
+
+static const struct hwmon_ops rp1_fan_hwmon_ops = {
+	.visible = 0444,
+	.read = rp1_fan_read,
+};
+
+static const struct hwmon_chip_info rp1_fan_chip_info = {
+	.ops = &rp1_fan_hwmon_ops,
+	.info = rp1_fan_info,
+};
+
+static void rp1_fan_put_device(void *data)
+{
+	put_device(data);
+}
+
+static int rp1_fan_probe(struct platform_device *pdev)
+{
+	struct platform_device *pwm_pdev;
+	struct device *dev = &pdev->dev;
+	struct device_node *pwm_node;
+	struct rp1_fan_data *data;
+	struct device_link *link;
+	struct device *hwmon_dev;
+	int ret;
+
+	pwm_node = of_parse_phandle(dev->of_node, "raspberrypi,pwm-tachometer", 0);
+	if (!pwm_node)
+		return dev_err_probe(dev, -ENODEV,
+				     "RP1 PWM node not specified in Device Tree (requires 'raspberrypi,pwm-tachometer')\n");
+
+	if (!of_device_is_available(pwm_node)) {
+		of_node_put(pwm_node);
+		return dev_err_probe(dev, -ENODEV,
+				     "RP1 PWM node is disabled\n");
+	}
+
+	pwm_pdev = of_find_device_by_node(pwm_node);
+	of_node_put(pwm_node);
+	if (!pwm_pdev)
+		return dev_err_probe(dev, -EPROBE_DEFER,
+				     "RP1 PWM platform device not populated yet\n");
+
+	scoped_guard(device, &pwm_pdev->dev) {
+		if (!device_is_bound(&pwm_pdev->dev)) {
+			put_device(&pwm_pdev->dev);
+			return dev_err_probe(dev, -EPROBE_DEFER,
+					     "RP1 PWM driver is not bound yet\n");
+		}
+	}
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data) {
+		put_device(&pwm_pdev->dev);
+		return -ENOMEM;
+	}
+
+	ret = devm_add_action_or_reset(dev, rp1_fan_put_device, &pwm_pdev->dev);
+	if (ret)
+		return ret;
+
+	data->pwm_dev = &pwm_pdev->dev;
+
+	link = device_link_add(dev, &pwm_pdev->dev, DL_FLAG_AUTOREMOVE_CONSUMER);
+	if (!link)
+		return dev_err_probe(dev, -EINVAL,
+				     "Cannot create the device_link to PWM controller\n");
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, "rp1_fan",
+							 data,
+							 &rp1_fan_chip_info,
+							 NULL);
+
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static const struct of_device_id rp1_fan_of_match[] = {
+	{ .compatible = "raspberrypi,rp1-fan" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, rp1_fan_of_match);
+
+static struct platform_driver rp1_fan_driver = {
+	.probe = rp1_fan_probe,
+	.driver = {
+		.name = "rp1-fan",
+		.of_match_table = rp1_fan_of_match,
+	},
+};
+module_platform_driver(rp1_fan_driver);
+
+MODULE_AUTHOR("Andrea della Porta <andrea.porta@suse.com>");
+MODULE_DESCRIPTION("Raspberry Pi RP1 HWMon Fan Driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("RP1_PWM");
-- 
2.35.3


