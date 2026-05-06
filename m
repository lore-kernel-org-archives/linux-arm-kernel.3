Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE25CD3439
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 19:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2TwfVpezC0RgzGnR+5kZnlGfJY7eOd+0GsSEocGvqOw=; b=vkWdrVeRjfqti0up/2J6ZbtJad
	QG/MvuorG9HU8qpG3k7+BacuOno96ENLuDBTlcUg99xny+dIyADj6lpik7JsdMksnKJcXAQkZJsp1
	9fuu5t4Hb4/+Eoz+dmWhUedI1EHTRHIiE5tl++rUvjMFreSThLo1OCQmXJ4l9pvuXxgzSJexsbFBL
	MAXkFfATMFYx95ODc+4Tqt3rgQ1ZxwqMl4kna989PMlsbgJ/YaN+oW4IL5PrV8UmIlK5cNMxsVcP8
	ozWBt1z6I7SjuSJuNbwwZK8UCsIVbon2ID+OcQQW0mpyid0/e7ZKYQ1a3yixw33vPa5DpfQ2UiDCU
	WlBwJ8OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKi0i-00000001t9W-0AUF;
	Wed, 06 May 2026 19:34:20 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKi0f-00000001t7F-3DXC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 19:34:17 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-44e1860558fso62039f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 12:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778096056; x=1778700856; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2TwfVpezC0RgzGnR+5kZnlGfJY7eOd+0GsSEocGvqOw=;
        b=OHFZx3Og6cMR7SntE4ahbl8F+MOMgwM4zUXNWwfYEJYxiM6mktfOlADRIijIrtZMlX
         7EcF/KnYWFtqtQRu1RukXrKsiNZtRr7AEdrJsU//oNvOTPD97gj8Ozd+6H3Qx9iSiBV4
         ooH30ijlU+U5Q68Og0Z+8XoM0UkmDsxQcmPR5Pg5VNmCGUoJZkF8EjLiA86tJL0ShKf1
         ZW0QpN1FGAxFkopVC6EcKg+pXEIN1DkSjKLKeY2swUxqBxEEObwFf3crakFyRNfGowCX
         2FxfbcQdZKHOv8TfXhCj7NLpy6V7ZsQSRKtSuwGmB5jUC2TmHw6G5c0TF12rD0zxjkRh
         ppLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778096056; x=1778700856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2TwfVpezC0RgzGnR+5kZnlGfJY7eOd+0GsSEocGvqOw=;
        b=eaTdKuuiAiyUIiTCCKt5fUG5rwll/Hh8AMRW/rmqPMN48RgI/WEBKs5GdcXTnfKwnC
         N+HWkSWromwqJye95mUDz+oCgie4SHF/S9AhvyOq5fgIgRSBVqS7J/skxL2bj/DGQ9oI
         NuRzh7O5nV6JNhgKJJfOGr2dlFJp5c5PSu4fcvN/+RpD0zmAYpQbDhErtr3+NMnmPGFG
         XYMSWNA8GcWiOic4NQDSeL3z2VMGYYt3eJ1LRr/x/K53bX9y9yYeH3Y/cZGUMMI8Tog5
         okfIl+ydmihzASqtcUQWDcvYXRvoibFnDFZP5XNQzuXYESELYT37s1gLDkoavaMY7Rlc
         glhA==
X-Forwarded-Encrypted: i=1; AFNElJ89GRjDcqIydcLRc7VTR0genJD6Oe3gTE3UEoJvuiDuiqTZK/mYl4snQUdr3DlcBOAdqP4PQNLTlG2KAUvePPyz@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8Qi12UEbR3CpH8jtAMmzb8lIl1enguzVNHkK5+OqyyquMSZyu
	EcY3XiVhFJYH0o35Ya/WUK1fSmjTaHrQaI+xK5vmHuNynNOQc/7vhCkQ
X-Gm-Gg: AeBDieuN557fe4D24X3lxz2qEmRzf/uJqCW6JP3u1fgP0nyHft5gIod5OJ/1nv4cKj3
	1ksCIgSicikneslVdh8sUtlVaryy6cjkyDgIRvfhGJ8Wa7dyXbxYgwJjy5mQ86YKQqmmRl+MRxA
	S49HqE1qoLDHBXXvMCPy900Gw30or/tNCptOCjh68tjuU+rcccDed5C8RFdq3fKUhvqndtYchai
	WTg1iqp9f7o4/p9wubz0JKAVmK0mZC7o9xqW2YzHZzJj3VW722c5G7oQp9z0PIInAGcOZmRHrGu
	sSVOUsK/PmesUAtUfnYGlpFMg/NYv1fWxLLdrdc8gG8RKc24gVCdho22W8/d1PSM6n7aafWqgyk
	4nxBebsrpuHGoSdYhtGjOon52uRZL/HTaNV3u4HHqURlCcXX4MdgeppnmF5h5H9In4L1kKUJzWb
	dWa3Op4Ufptu8wYeztx4aWE1Oq8pfRb++wEFD66GPnAQcXrhnuPk9tyw==
X-Received: by 2002:a5d:64c5:0:b0:44f:e969:7c15 with SMTP id ffacd0b85a97d-4515b057230mr7847306f8f.3.1778096055787;
        Wed, 06 May 2026 12:34:15 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960022sm14895673f8f.26.2026.05.06.12.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 12:34:14 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Wed, 06 May 2026 22:33:22 +0300
Subject: [PATCH v8 5/6] ARM: dts: zte: Add D-Link DWR-932M support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260506-send-v8-5-f1bdf3243b34@gmail.com>
References: <20260506-send-v8-0-f1bdf3243b34@gmail.com>
In-Reply-To: <20260506-send-v8-0-f1bdf3243b34@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 soc@lists.linux.dev, linux-serial@vger.kernel.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6258;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=ZEiGjns9U3m5yLy5ZGIrzh9lkgRuFhlASuJcbgwcHG4=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp+5eW50hKxRO8dpnpiZhOIbme+bBLcMDB5Z4pD
 68aGL1N/RKJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCafuXlhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKIRg//QILi13hbd/g+oKBM9CrIz48opa08edK
 eynSCWwkLGmgS0HgG6qHvJHqMAGYp3qgiBrR7Wb1K17qn8I1V7F4e3hl1BzJ7jQtLLa3PRIoTvd
 yWSoRrGB5QX/KQbgXKz3LjRHO30p322S8gcOGHS79wXkyFFBCgd9gr7yq1+gNoYglYFBVKqnTXJ
 XD2yydPl3CISqTCmUyb8Bt/79mnxTfkglyOTspUgtozjhv0x3lS66eWDjaoX9YLvjhfibt8SYi9
 N/fSYr+g5fcDBAxnXF6uBu2vW2UxJmW0QVfqXv3MJ6OBd/hsiNQMtdMioJbqVJbevov0FbAK7HS
 kVrVUhAdP/RPhnvFI55A3JaeB16WwJeEOAWQRouZSH3qJ0vD+g37bSEy1J67COB5Kof74fVlbyW
 ImeSc3RtCP9qoCfM3KAEjtjUoil35Fk0+YZosLVlSewLq8+qnZIcXJPo1JmAFs7AOq4vZbGnGvb
 gqHA2ICt53ecx1Y+5kcj0Ix688OBSKK87ubS/SZhT7ScpMOB6cBJ4Ki8mdS5qqpuC6AAHWdtbP8
 +CX2LqOLBFI9tYUM5/KMto2NldJJyJt3qQlmvbOpKQ6BnOr5uYEtQNP8uuW9cqwKbQ42WYAIrKf
 gjifXCvmPDvLmvGSNKUdoL8evzHo48fiC1xHdyZ9aoHfihznv82o=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_123417_845831_62652B58 
X-CRM114-Status: GOOD (  24.52  )
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

This adds base DT definition for zx297520v3 and one board that consumes it.

The stock kernel does not use the armv7 timer, but it seems to work
fine. The board has other board-specific timers that would need a driver
and I see no reason to bother with them since the arm standard timer
works.

The caveat is the non-standard GIC setup needed to handle the timer's
level-low PPI. This is the responsibility of the boot loader and
documented in Documentation/arch/arm/zte/zx297520v3.rst.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---

Changes in
v8: Remove redundant label, use "arm,pl011" for uart0 and 2 too.
v6: Squash board + timer + uart patches into one
v5: Prepend the SoC name in the device specific DTS filename.
v4:
  Declare all uarts
  Remove the UART aliases for now. I can revisit this when I get my
  hands on a board that exposes two UARTs.
---
 MAINTAINERS                                        |   1 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/zte/Makefile                     |   3 +
 arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts |  22 +++++
 arch/arm/boot/dts/zte/zx297520v3.dtsi              | 103 +++++++++++++++++++++
 5 files changed, 130 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 697287d1b372..b0b774aace55 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3776,6 +3776,7 @@ ARM/ZTE ZX29 SOC SUPPORT
 M:	Stefan Dösinger <stefandoesinger@gmail.com>
 F:	Documentation/arch/arm/zte/
 F:	Documentation/devicetree/bindings/arm/zte.yaml
+F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
 
 ARM/ZYNQ ARCHITECTURE
diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index efe38eb25301..28fba538d552 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -39,3 +39,4 @@ subdir-y += unisoc
 subdir-y += vt8500
 subdir-y += xen
 subdir-y += xilinx
+subdir-y += zte
diff --git a/arch/arm/boot/dts/zte/Makefile b/arch/arm/boot/dts/zte/Makefile
new file mode 100644
index 000000000000..f052cfbd636c
--- /dev/null
+++ b/arch/arm/boot/dts/zte/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+dtb-$(CONFIG_SOC_ZX297520V3) += \
+	zx297520v3-dlink-dwr932m.dtb
diff --git a/arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts b/arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts
new file mode 100644
index 000000000000..1700f46aba86
--- /dev/null
+++ b/arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026 Stefan Dösinger <stefandoesinger@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "zx297520v3.dtsi"
+
+/ {
+	model = "D-Link DWR-932M";
+	compatible = "dlink,dwr932m", "zte,zx297520v3";
+
+	memory@20000000 {
+		device_type = "memory";
+		reg = <0x20000000 0x04000000>;
+	};
+};
+
+&uart1 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
new file mode 100644
index 000000000000..a16c30a164bb
--- /dev/null
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026 Stefan Dösinger <stefandoesinger@gmail.com>
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0>;
+		};
+	};
+
+	/* Base bus clock and default for the UART. It will be replaced once a clock driver has
+	 * been added.
+	 */
+	uartclk: uartclk-26000000 {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <26000000>;
+	};
+
+	timer {
+		compatible = "arm,armv7-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+		clock-frequency = <26000000>;
+		interrupt-parent = <&gic>;
+		/* I don't think uboot sets CNTVOFF and the stock kernel doesn't use the
+		 * arm timer at all. Since this is a single CPU system I don't think it
+		 * really matters that the offset is random though.
+		 */
+		arm,cpu-registers-not-fw-configured;
+	};
+
+	soc {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "simple-bus";
+		interrupt-parent = <&gic>;
+		ranges;
+
+		/* The GIC has a non-standard way of configuring ints between level-low/level
+		 * high or rising edge/falling edge at 0xf2202070 and onwards. See AP_INT_MODE_BASE
+		 * and AP_PPI_MODE_REG in the ZTE kernel, although the offsets in the kernel source
+		 * seem wrong.
+		 *
+		 * Everything defaults to active-high/rising edge, but the timer is active-low. We
+		 * currently rely on the boot loader to change timer IRQs to active-low for us for
+		 * now.
+		 */
+		gic: interrupt-controller@f2000000 {
+			compatible = "arm,gic-v3";
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0xf2000000 0x10000>,
+			      <0xf2040000 0x20000>;
+		};
+
+		uart0: serial@131000 {
+			compatible = "arm,pl011", "arm,primecell";
+			arm,primecell-periphid = <0x0018c011>;
+			reg = <0x00131000 0x1000>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&uartclk>, <&uartclk>;
+			clock-names = "uartclk", "apb_pclk";
+			status = "disabled";
+		};
+
+		uart1: serial@1408000 {
+			compatible = "arm,pl011", "arm,primecell";
+			arm,primecell-periphid = <0x0018c011>;
+			reg = <0x01408000 0x1000>;
+			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&uartclk>, <&uartclk>;
+			clock-names = "uartclk", "apb_pclk";
+			status = "disabled";
+		};
+
+		uart2: serial@140d000 {
+			compatible = "arm,pl011", "arm,primecell";
+			arm,primecell-periphid = <0x0018c011>;
+			reg = <0x0140d000 0x1000>;
+			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&uartclk>, <&uartclk>;
+			clock-names = "uartclk", "apb_pclk";
+			status = "disabled";
+		};
+	};
+};

-- 
2.53.0


