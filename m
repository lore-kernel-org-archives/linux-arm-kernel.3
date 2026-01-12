Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C08AC9EC66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 10:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2S8QoD+nAVfBD+btYxoEeVM+/hE0CQqqhO0ZYPFytuQ=; b=p1cACZQWxn1/3w1igfY2gCAmhF
	CDl4ZpbyCDWVM9XlCnFW7KBomv6HYF6XlllzPZo6C+0AKwmOCoUKRGKpnQ/jRiQLQZwUne3//Rnum
	QG+NueiZmS3bhcmXolH+jYjpxEyXQ/+isP3QaCWFIVcz89jWQiGkkjC1bymZN4n8/T/YxJ6rEW+ly
	S5GSL3xyQrDybCw37vVUnkD8YWN2hC8zaiRBUUVyjE210aF2EN5fL8wK0/1QOanPLbuBfDPb4ga2m
	aS+r2ho6dt16wi12KHytOS0jAnn7IaFwFUld4TeystD31rZ3jEOGlneQGV+lgLuEtn6owDrrr5Jrs
	7Z2piRYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfFAn-00000005Ak4-2Y4b;
	Mon, 12 Jan 2026 10:29:21 +0000
Received: from mail-m49202.qiye.163.com ([45.254.49.202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfFAl-00000005AhD-0jHX;
	Mon, 12 Jan 2026 10:29:20 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3053af59b;
	Mon, 12 Jan 2026 18:29:15 +0800 (GMT+08:00)
From: Joseph Chen <chenjh@rock-chips.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Joseph Chen <chenjh@rock-chips.com>
Subject: [PATCH v2 1/3] dt-bindings: mfd: Add rk801 binding
Date: Mon, 12 Jan 2026 18:28:47 +0800
Message-Id: <20260112102849.1479-2-chenjh@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260112102849.1479-1-chenjh@rock-chips.com>
References: <20260112102849.1479-1-chenjh@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9bb1c0b75c09d2kunm68a7e29c4d1f74
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ09NT1ZPHR9CTk1IGEpCHU9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=FPX4FJWavNUpJAAehClhWMukbAQy4g2X5HyAS0t6eVRa+D3QV5XjmkFCZX/hKEggFuFhmNAvh6Ni1TxKuYjYuFaVKBrJihjgwattb0GI6QzDNjEWvrDgXO1NyVTcXY4jiscvht+63I2a2D4XbvsU1mhuXpTHViqnsCAsDneFa6I=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=2S8QoD+nAVfBD+btYxoEeVM+/hE0CQqqhO0ZYPFytuQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_022919_446118_CA8A93EF 
X-CRM114-Status: GOOD (  12.78  )
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

Add DT binding document for Rockchip's RK801 PMIC

Signed-off-by: Joseph Chen <chenjh@rock-chips.com>
---
 .../bindings/mfd/rockchip,rk801.yaml          | 197 ++++++++++++++++++
 1 file changed, 197 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml

diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
new file mode 100644
index 00000000000..7c71447200b
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
@@ -0,0 +1,197 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/rockchip,rk801.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RK801 Power Management Integrated Circuit
+
+maintainers:
+  - Joseph Chen <chenjh@rock-chips.com>
+
+description: |
+  Rockchip RK801 series PMIC. This device consists of an i2c controlled MFD
+  that includes multiple switchable regulators.
+
+properties:
+  compatible:
+    enum:
+      - rockchip,rk801
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  system-power-controller:
+    type: boolean
+    description:
+      Telling whether or not this PMIC is controlling the system power.
+
+  wakeup-source:
+    type: boolean
+    description:
+      Device can be used as a wakeup source.
+
+  vcc1-supply:
+    description:
+      The input supply for dcdc1.
+
+  vcc2-supply:
+    description:
+      The input supply for dcdc2.
+
+  vcc3-supply:
+    description:
+      The input supply for dcdc3.
+
+  vcc4-supply:
+    description:
+      The input supply for dcdc4.
+
+  vcc5-supply:
+    description:
+      The input supply for ldo1.
+
+  vcc6-supply:
+    description:
+      The input supply for ldo2.
+
+  vcc7-supply:
+    description:
+      The input supply for switch.
+
+  regulators:
+    type: object
+    patternProperties:
+      "^(dcdc[1-4]|ldo[1-2]|switch)$":
+        type: object
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/pinctrl/rockchip.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        rk801: pmic@27 {
+            compatible = "rockchip,rk801";
+            reg = <0x27>;
+            interrupt-parent = <&gpio0>;
+            interrupts = <RK_PC0 IRQ_TYPE_LEVEL_LOW>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&pmic_int_l>;
+            system-power-controller;
+            wakeup-source;
+
+            vcc1-supply = <&vcc_sys>;
+            vcc2-supply = <&vcc_sys>;
+            vcc3-supply = <&vcc_sys>;
+            vcc4-supply = <&vcc_sys>;
+            vcc5-supply = <&vcc3v3_sys>;
+            vcc6-supply = <&vcc3v3_sys>;
+            vcc7-supply = <&vcc3v3_sys>;
+
+            regulators {
+                vdd_cpu: dcdc1 {
+                    regulator-name = "vdd_cpu";
+                    regulator-min-microvolt = <500000>;
+                    regulator-max-microvolt = <1500000>;
+                    regulator-initial-mode = <0x1>;
+                    regulator-boot-on;
+                    regulator-always-on;
+                    regulator-state-mem {
+                        regulator-mode = <0x2>;
+                        regulator-off-in-suspend;
+                        regulator-suspend-microvolt = <950000>;
+                    };
+                };
+
+                vcc3v3_sys: dcdc2 {
+                    regulator-name = "vcc3v3_sys";
+                    regulator-min-microvolt = <3300000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-initial-mode = <0x1>;
+                    regulator-boot-on;
+                    regulator-always-on;
+                    regulator-state-mem {
+                        regulator-mode = <0x2>;
+                        regulator-on-in-suspend;
+                        regulator-suspend-microvolt = <3300000>;
+                    };
+                };
+
+                vcc_ddr: dcdc3 {
+                    regulator-name = "vcc_ddr";
+                    regulator-boot-on;
+                    regulator-always-on;
+                    regulator-state-mem {
+                        regulator-mode = <0x2>;
+                        regulator-on-in-suspend;
+                    };
+                };
+
+                vdd_logic: dcdc4 {
+                    regulator-name = "vdd_logic";
+                    regulator-min-microvolt = <500000>;
+                    regulator-max-microvolt = <1500000>;
+                    regulator-initial-mode = <0x1>;
+                    regulator-boot-on;
+                    regulator-always-on;
+                    regulator-state-mem {
+                        regulator-mode = <0x2>;
+                        regulator-off-in-suspend;
+                        regulator-suspend-microvolt = <900000>;
+                    };
+                };
+
+                vdd0v9_sys: ldo1 {
+                    regulator-name = "vdd0v9_sys";
+                    regulator-min-microvolt = <900000>;
+                    regulator-max-microvolt = <900000>;
+                    regulator-boot-on;
+                    regulator-always-on;
+                    regulator-state-mem {
+                        regulator-off-in-suspend;
+                        regulator-suspend-microvolt = <900000>;
+                    };
+                };
+
+                vcc_1v8: ldo2 {
+                    regulator-name = "vcc_1v8";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+                    regulator-boot-on;
+                    regulator-always-on;
+                    regulator-state-mem {
+                        regulator-off-in-suspend;
+                        regulator-suspend-microvolt = <1800000>;
+                    };
+                };
+
+                vcc_3v3: switch {
+                    regulator-name = "vcc_3v3";
+                    regulator-boot-on;
+                    regulator-always-on;
+                    regulator-state-mem {
+                        regulator-off-in-suspend;
+                        regulator-suspend-microvolt = <3300000>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.25.1


