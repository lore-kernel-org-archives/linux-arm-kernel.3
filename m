Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C278AC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 13:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C2M2nugFCuwY4305/DjYiqJCN7yy++YJP3XiyKABLKg=; b=dmc61ckPlExiRZ8rjvAdyBV+fs
	MCzLqLbV057CXAxtNN7vu3A5T6zFAjEwcFfHgr7qM1zm+vbc+hPo2xa5FsjGWewI3S+Z+hqNxZIDs
	kIItqN7IJCy9bjtYaPbr5hEWzp/rOPsb2mlHgFnuvl8AHVI3VhoW3zudDdJTqePIyPQFnHS521ufn
	oYT4N9GQBAzfYaGEEB3dCShsG578IxbgRpvY2Uj5xSDNGvyToCK+DzBamdhGjoePs8MfbgZATSg9J
	cMWD0GGUaEGEPxkJUHjhxrHl4dOQ6wTtz066JWDrKUulVeb/S7e92J1Am1qjRbWqy2a8oefCd+wfc
	VQcAebrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnde7-00000007T8w-1Aju;
	Thu, 27 Feb 2025 13:09:47 +0000
Received: from relmlor1.renesas.com ([210.160.252.171] helo=relmlie5.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tncxD-00000007MIo-2ARM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 12:25:28 +0000
X-CSE-ConnectionGUID: RG252z/3SoibSevHGW7hiw==
X-CSE-MsgGUID: VrzK82oZROymALWu3JMMtg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 27 Feb 2025 21:25:27 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.68])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id CF66C4004CF4;
	Thu, 27 Feb 2025 21:25:19 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: john.madieu.xa@bp.renesas.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: john.madieu@gmail.com,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	biju.das.jz@bp.renesas.com
Subject: [PATCH v2 3/7] dt-bindings: thermal: r9a09g047-tsu: Document the TSU unit
Date: Thu, 27 Feb 2025 13:24:39 +0100
Message-ID: <20250227122453.30480-4-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250227122453.30480-1-john.madieu.xa@bp.renesas.com>
References: <20250227122453.30480-1-john.madieu.xa@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_042527_663021_A3C3F2D3 
X-CRM114-Status: GOOD (  13.35  )
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

The Renesas RZ/G3E SoC includes a Thermal Sensor Unit (TSU) block designed
to measure the junction temperature. The device provides real-time temperature
measurements for thermal management, utilizing a single dedicated channel
(channel 1) for temperature sensing.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
v1 -> v2:
 * Fix reg property specifier to get rid of yamlint warnings
 * Fix IRQ name to reflect TSU expectations

 .../thermal/renesas,r9a09g047-tsu.yaml        | 123 ++++++++++++++++++
 1 file changed, 123 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.yaml

diff --git a/Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.yaml b/Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.yaml
new file mode 100644
index 000000000000..e786561ddbe3
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/renesas,r9a09g047-tsu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/G3E Temperature Sensor Unit (TSU)
+
+maintainers:
+  - John Madieu <john.madieu.xa@bp.renesas.com>
+
+description:
+  The Temperature Sensor Unit (TSU) is an integrated thermal sensor that
+  monitors the chip temperature on the Renesas RZ/G3E SoC. The TSU provides
+  real-time temperature measurements for thermal management.
+
+properties:
+  compatible:
+    const: renesas,r9a09g047-tsu
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  interrupts:
+    description: |
+      Interrupt specifiers for the TSU:
+      - S12TSUADI1: Conversion complete interrupt signal (pulse)
+      - S12TSUADCMPI1: Comparison result interrupt signal (level)
+
+  interrupt-names:
+    items:
+      - const: adi
+      - const: adcmpi
+
+  "#thermal-sensor-cells":
+    const: 0
+
+  renesas,tsu-calibration-sys:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      Phandle to the system controller (sys) that contains the TSU
+      calibration values used for temperature calculations.
+
+  renesas,tsu-operating-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    description: |
+      TSU operating mode:
+      0: Mode 0 - Conversion started by software
+      1: Mode 1 - Conversion started by ELC trigger
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - resets
+  - power-domains
+  - interrupts
+  - interrupt-names
+  - "#thermal-sensor-cells"
+  - renesas,tsu-operating-mode
+  - renesas,tsu-calibration-sys
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/renesas,r9a09g047-cpg.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    tsu: thermal@14002000 {
+        compatible = "renesas,r9a09g047-tsu";
+        reg = <0x14002000 0x1000>;
+        clocks = <&cpg CPG_MOD 0x10a>;
+        resets = <&cpg 0xf8>;
+        power-domains = <&cpg>;
+        interrupts = <GIC_SPI 250 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "adi", "adcmpi";
+        #thermal-sensor-cells = <0>;
+        renesas,tsu-operating-mode = <0>;
+        renesas,tsu-calibration-sys = <&sys>;
+    };
+
+    thermal-zones {
+        cpu-thermal {
+            polling-delay = <1000>;
+            polling-delay-passive = <250>;
+            thermal-sensors = <&tsu>;
+
+            cooling-maps {
+                map0 {
+                    trip = <&target>;
+                    cooling-device = <&cpu0 0 3>, <&cpu1 0 3>,
+                                     <&cpu2 0 3>, <&cpu3 0 3>;
+                    contribution = <1024>;
+                };
+            };
+
+            trips {
+                target: trip-point {
+                    temperature = <95000>;
+                    hysteresis = <1000>;
+                    type = "passive";
+                };
+
+                sensor_crit: sensor-crit {
+                    temperature = <120000>;
+                    hysteresis = <1000>;
+                    type = "critical";
+                };
+            };
+        };
+    };
-- 
2.25.1


