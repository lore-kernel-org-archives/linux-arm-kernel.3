Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89B0C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 15:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rX6u7Aq9/0JxECxj/aZ/tionNKvV2Dc5J4XYWqn2DZk=; b=cKXrgtJlhf2z7OnTqTrOeQYwBr
	WiQjwxwS2GOjbvki9afWCO5BTQByskxqQIC9k7myTG1rMlGIhT98KwPkw5GWYU94BMNMOH/vLujqq
	k7iHPtoH2A/+CY27dszl53hu/F2T6mN5jDgU+4qqBrVh+f8qSA8gN8EZWAwaJMzKUaR7xBpyqkkDa
	UpYSfy14GqWDs2Qe+WA+3dsQh3V0i1k12WFzAdNdqxeBzDr3feOCOgn8yODgXA0yPaOwiBssiNIaT
	VXcX0DFmcP0kwtpJXNaGku53Sh4XSrpw75XW3WY8jUvHK7IEJM4rlZJEDcMy9x8xXOjBMbUP6eLFT
	eS180Zsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNCkl-0000000Fvv1-2asX;
	Thu, 05 Jun 2025 15:43:39 +0000
Received: from smtp-42aa.mail.infomaniak.ch ([84.16.66.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNCiY-0000000FvYX-1deu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 15:41:24 +0000
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bCpZl743dztGn;
	Thu,  5 Jun 2025 17:41:19 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4bCpZl1zQJzpLP;
	Thu,  5 Jun 2025 17:41:19 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Thu, 05 Jun 2025 17:41:06 +0200
Subject: [PATCH v2 1/4] dt-bindings: mfd: rk806: allow to customize PMIC
 reset mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-rk8xx-rst-fun-v2-1-143d190596dd@cherry.de>
References: <20250605-rk8xx-rst-fun-v2-0-143d190596dd@cherry.de>
In-Reply-To: <20250605-rk8xx-rst-fun-v2-0-143d190596dd@cherry.de>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>, 
 Daniel Semkowicz <dse@thaumatec.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_084122_587719_F4D5142C 
X-CRM114-Status: GOOD (  18.43  )
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

From: Quentin Schulz <quentin.schulz@cherry.de>

The RK806 PMIC allows to configure its reset/restart behavior whenever
the PMIC is reset either programmatically or via some external pins
(e.g. PWRCTRL or RESETB).

The following modes exist:
 - 0 (RK806_RESTART) restart PMU,
 - 1 (RK806_RESET) reset all power off reset registers and force
   state to switch to ACTIVE mode,
 - 2 (RK806_RESET_NOTIFY) same as RK806_RESET and also pull
   RESETB pin down for 5ms,

For example, some hardware may require a full restart
(RK806_RESTART mode) in order to function properly as regulators
are shortly interrupted in this mode.

This is the case for RK3588 Jaguar and RK3588 Tiger which have a
companion microcontroller running on an independent power supply and
monitoring the PMIC power rail to know the state of the main system.
When it detects a restart, it resets its own IPs exposed to the main
system as if to simulate its own reset. Failing to perform this fake
reset of the microcontroller may break things (e.g. watchdog not
automatically disabled, buzzer still running until manually disabled,
leftover configuration from previous main system state, etc...).

Some other systems may be depending on the power rails to not be
interrupted even for a small amount of time[1].

This allows to specify how the PMIC should perform on the hardware level
and may differ between harwdare designs, so a DT property seems
warranted. I unfortunately do not see how this could be made generic
enough to make it a non-vendor property.

[1] https://lore.kernel.org/linux-rockchip/2577051.irdbgypaU6@workhorse/
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 .../devicetree/bindings/mfd/rockchip,rk806.yaml    | 23 ++++++++++++++++++++++
 include/dt-bindings/mfd/rockchip,rk8xx.h           | 17 ++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
index 3c2b06629b75ea94f90712470bf14ed7fc16d68d..c555b5956cea9f594d80ebd3b27e8489e520d97d 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
@@ -31,6 +31,29 @@ properties:
 
   system-power-controller: true
 
+  rockchip,reset-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2]
+    description:
+      Mode to use when a reset of the PMIC is triggered.
+
+      The reset can be triggered either programmatically, via one of
+      the PWRCTRL pins (provided additional configuration) or
+      asserting RESETB pin low.
+
+      The following modes are supported (see also
+      include/dt-bindings/mfd/rockchip,rk8xx.h)
+
+      - 0 (RK806_RESTART) restart PMU,
+      - 1 (RK806_RESET) reset all power off reset registers and force
+        state to switch to ACTIVE mode,
+      - 2 (RK806_RESET_NOTIFY) same as RK806_RESET and also pull
+        RESETB pin down for 5ms,
+
+      For example, some hardware may require a full restart
+      (RK806_RESTART mode) in order to function properly as regulators
+      are shortly interrupted in this mode.
+
   vcc1-supply:
     description:
       The input supply for dcdc-reg1.
diff --git a/include/dt-bindings/mfd/rockchip,rk8xx.h b/include/dt-bindings/mfd/rockchip,rk8xx.h
new file mode 100644
index 0000000000000000000000000000000000000000..f058ed1ca661185f79738a358aa2d4f04539c590
--- /dev/null
+++ b/include/dt-bindings/mfd/rockchip,rk8xx.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Device Tree defines for Rockchip RK8xx PMICs
+ *
+ * Copyright 2025 Cherry Embedded Solutions GmbH
+ *
+ * Author: Quentin Schulz <quentin.schulz@cherry.de>
+ */
+
+#ifndef _DT_BINDINGS_MFD_ROCKCHIP_RK8XX_H
+#define _DT_BINDINGS_MFD_ROCKCHIP_RK8XX_H
+
+#define RK806_RESTART		0
+#define RK806_RESET		1
+#define RK806_RESET_NOTIFY	2
+
+#endif

-- 
2.49.0


