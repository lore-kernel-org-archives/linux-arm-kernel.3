Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B520FEC0F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 19:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Itu45DKmsPB5+bFts834kAEPp0swPEbwWn1hCj9DneM=; b=qkVoZwvCsEbRvfR6VM68tH7rw7
	63UA3juST+E83XQXanWOaS0HO47EZMXqIzJlm3G3kh9Z/KCed8eicDive4uKQDzS08vhakx7LyeGa
	1SUHccZJkFeKbB0n0Ahvi+L35DAJJkBVvyYUlwnHjYCPd2MD3KhLxw6xFOYARUKIAOgTjOwESV4w4
	tl217Ton4p5d9R2yoPwSwdeIkH0h+fzP2vPcrYunw/gN6NMoRxxY0ZflxGTgiOw0HljDd8QsYksyH
	+sgMdZTQ5ptF19+iRoJbFKryTONuKD9mYEFXt9bK/swWWg/Rf+jdbYJK/rf+3O4cfgMX8tt+wwR79
	+IjWVtcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w57N8-000000028z1-0e9c;
	Tue, 24 Mar 2026 19:25:02 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w57N0-000000028uF-43Fy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 19:24:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 069D5C5809E;
	Tue, 24 Mar 2026 19:25:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 996D3601A0;
	Tue, 24 Mar 2026 19:24:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 12C8710451148;
	Tue, 24 Mar 2026 20:24:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774380290; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Itu45DKmsPB5+bFts834kAEPp0swPEbwWn1hCj9DneM=;
	b=lpQw40npMMscsn3vCvyrQlBbpb1hBjZSFwux9kT66/LsRWWHqpr0XcVNMkDFOvtmwYU0zH
	DG1Bj2HWATvDACsRW5C46v/rayxg+TxO3sSnm3W6rhz83ywVeip3P/Wi9C6vz0HlRve+7e
	OvPI21CEpsCha7Ww3NzGflH5j8rpRdSJ2REPI+LQ8lqUUJCsiZ2Az8e6jo6T7SJw7TEBa5
	P/uqg2Wotd0MtOBFdISQEQ3gQsmg2CiZG52QZjYWq2JYsx6bAHxaP+GWRA/gDCNoXHaWos
	QXu/V3+azb5tHqgnYN/Nmxj/9Q4NjpMGrmXb6cmKSQtxu5ggofQO6M1VCaaLHA==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Date: Tue, 24 Mar 2026 20:24:28 +0100
Subject: [PATCH v4 2/5] dt-bindings: mfd: Add AAEON embedded controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260324-dev-b4-aaeon-mcu-driver-v4-2-afb011df4794@bootlin.com>
References: <20260324-dev-b4-aaeon-mcu-driver-v4-0-afb011df4794@bootlin.com>
In-Reply-To: <20260324-dev-b4-aaeon-mcu-driver-v4-0-afb011df4794@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 =?utf-8?q?J=C3=A9r=C3=A9mie_Dautheribes?= <jeremie.dautheribes@bootlin.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3300;
 i=thomas.perrot@bootlin.com; h=from:subject:message-id;
 bh=4XZ/GuRMSAxFpp6yNg37Xy4r5DlcogaXd4BVSSY4Jtk=;
 b=owEB7QES/pANAwAKAZ/ACwVx/grtAcsmYgBpwuT26ZHgMy+LO0/qS7k6hZDVs65qpqulluV4i
 uDTcAOxZauJAbMEAAEKAB0WIQSHQHfGpqMKIwOoEiGfwAsFcf4K7QUCacLk9gAKCRCfwAsFcf4K
 7WyzC/9XUeZ8SfJHrvqkj2PGtah72qGoDJH+pZ4GLNJxXxml9jr7LCOXdYu6rAUoCV0iVPA4EmA
 u0b9z/xLmuhP97B6DFnrS93XjoIXnQIfBni51l29ZlSRShOrlqywIGoEGfAH9alSIWXNe1kWytp
 IPvwjEXKwJcxdUngHEW9DYQ1fhqmCQ/s3XHvkTtBWEjd83Oh/6HeLSLn+Rlbbp/ATwGyvcyeATn
 kdCv01uADRwL8dIWhya/47ZWUsJH8EIQ+KXeFDOPUQyknJIjYZNpGvtp/ZJEag2RF8lE9iounxI
 8QKeh2rMAUfgRMMzDX+toO7zKeQO4182V67IOCDcu/39mrPqcXK7ki00RUmo8yOhsIuDh8yxpVf
 vtZdgS6fegAPhMpgLZsPKtKakZJyFXt3kW2806XLtm2T93PyuiNVGu+S7C80EvVE0EW3s+1Cv2V
 vl9jPdVLR4srKMb7Sup6uIJxJt/hO2dtiHzTSeAjyW2WDUBWYdwgxmSW+cBdCAxey45U4=
X-Developer-Key: i=thomas.perrot@bootlin.com; a=openpgp;
 fpr=874077C6A6A30A2303A812219FC00B0571FE0AED
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_122455_150957_901A2051 
X-CRM114-Status: GOOD (  13.66  )
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

Add device tree binding documentation for the AAEON embedded controller
(MCU). This microcontroller is found on AAEON embedded boards, it is
connected via I2C and  and provides a GPIO control and watchdog timer.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
---
 .../bindings/mfd/aaeon,srg-imx8p-mcu.yaml          | 67 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 ++
 2 files changed, 73 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/aaeon,srg-imx8p-mcu.yaml b/Documentation/devicetree/bindings/mfd/aaeon,srg-imx8p-mcu.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..4895028e72eb3ac2376b61ed9c06549b42da66d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/aaeon,srg-imx8p-mcu.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/aaeon,srg-imx8p-mcu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AAEON Embedded Controller
+
+maintainers:
+  - Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
+  - Thomas Perrot <thomas.perrot@bootlin.com>
+
+description:
+  AAEON embeds a microcontroller on Standard RISC Gateway with ARM i.MX8M Plus
+  Quad-Core boards providing GPIO control and watchdog timer.
+
+  This MCU is connected via I2C bus.
+
+  Its GPIO controller provides 7 GPOs and 12 GPIOs.
+
+  Its watchdog has a fixed maximum hardware heartbeat of 25 seconds and supports
+  a timeout of 240 seconds through automatic pinging.
+  The timeout is not programmable and cannot be changed via device tree properties.
+
+properties:
+  compatible:
+    const: aaeon,srg-imx8p-mcu
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-line-names:
+    minItems: 1
+    maxItems: 19
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      embedded-controller@62 {
+        compatible = "aaeon,srg-imx8p-mcu";
+        reg = <0x62>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-line-names = "gpo-1", "gpo-2", "gpo-3", "gpo-4",
+                  "gpo-5", "gpo-6", "gpo-7",
+                  "gpio-1", "gpio-2", "gpio-3", "gpio-4",
+                  "gpio-5", "gpio-6", "gpio-7", "gpio-8",
+                  "gpio-9", "gpio-10", "gpio-11", "gpio-12";
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index c9e416ba74c64e90629c0b7d7941f879c9ac589e..ea9d55f76f3509c7f6ba6d1bc86ca2e2e71aa954 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -186,6 +186,12 @@ W:	http://www.adaptec.com/
 F:	Documentation/scsi/aacraid.rst
 F:	drivers/scsi/aacraid/
 
+AAEON SRG-IMX8P CONTROLLER MFD DRIVER
+M:	Thomas Perrot <thomas.perrot@bootlin.com>
+R:	Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/aaeon,srg-imx8p-mcu.yaml
+
 AAEON UPBOARD FPGA MFD DRIVER
 M:	Thomas Richard <thomas.richard@bootlin.com>
 S:	Maintained

-- 
2.53.0


