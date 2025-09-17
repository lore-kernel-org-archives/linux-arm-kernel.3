Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D739ACAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 17:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DZ7uQi5cxQHOXkQDe6VhQxBES2ZLWQv48Ugxkx+pjHE=; b=ssD8BgjYS942+IA0dfoQDMjDyx
	fNuciFq1oqMpTbyq8LlaJpDKxK9aYjkdcb2dKHs8Nxtopr+TzgyeyUqlShJIaSbBD6LxRY7VXDskz
	RLyibW2TjGQB3ybr3neCt0D/wwxakVOP8U2dZBpYjST94kgvXbOjvTVzPckE2sQWWJHqAcGCSgitD
	qUKn/bXP5JkP+BnxMJUCMpdJc0xlc5KDCvIjAeVVhRM6DDO8tl/0di7LEsF0C7fx2qKZChm3YcyJv
	JsE21lKQKi0itbnTRRORnX5gmcdXa2eJeYwvcQy62CVE2s2iK8Lvi0MRl38t8qzzbZ/9bjKhFTT+3
	28EXHOYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvYO-0000000DOWU-2skD;
	Wed, 17 Sep 2025 17:02:48 +0000
Received: from relmlor1.renesas.com ([210.160.252.171] helo=relmlie5.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvYI-0000000DOS8-2xxr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 17:02:44 +0000
X-CSE-ConnectionGUID: eyWncZA4RLiDJjAMgMijAw==
X-CSE-MsgGUID: 1Rhq3pxARFGjXwNTYTkTpQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 18 Sep 2025 02:02:41 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.24.0.45])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id CD9D14009A35;
	Thu, 18 Sep 2025 02:02:35 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: conor+dt@kernel.org,
	daniel.lezcano@linaro.org,
	geert+renesas@glider.be,
	krzk+dt@kernel.org,
	lukasz.luba@arm.com,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	robh@kernel.org,
	rui.zhang@intel.com,
	sboyd@kernel.org,
	will@kernel.org
Cc: biju.das.jz@bp.renesas.com,
	catalin.marinas@arm.com,
	devicetree@vger.kernel.org,
	john.madieu@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	p.zabel@pengutronix.de,
	rafael@kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v9 1/4] dt-bindings: thermal: r9a09g047-tsu: Document the TSU unit
Date: Wed, 17 Sep 2025 19:01:55 +0200
Message-ID: <20250917170202.197929-2-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917170202.197929-1-john.madieu.xa@bp.renesas.com>
References: <20250917170202.197929-1-john.madieu.xa@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_100242_860759_1DD7C3AA 
X-CRM114-Status: GOOD (  13.48  )
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
to measure the junction temperature. The device provides real-time
temperature measurements for thermal management, utilizing a single
dedicated channel (channel 1) for temperature sensing.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v1 -> v2:
 * Fixes reg property specifier to get rid of yamlint warnings
 * Fixes IRQ name to reflect TSU expectations

v2 -> v3:
 * Removees useless 'renesas,tsu-operating-mode' property 

v3 -> v4:
 * Fixes commit message
 * Fixes interrupt description
 * Removes trip point definition

v5: no changes
v6: no changes
v7: Adds documentation for 'renesas,tsu-trim' and removes Rb tag from Krzysztof
    due to this change

v8: Address Rob's comments (about node naming and line wrapping) and collect
    Rb tag

v9: No changes

 .../thermal/renesas,r9a09g047-tsu.yaml        | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.yaml

diff --git a/Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.yaml b/Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.yaml
new file mode 100644
index 000000000000..8d3f3c24f0f2
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.yaml
@@ -0,0 +1,87 @@
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
+    items:
+      - description: Conversion complete interrupt signal (pulse)
+      - description: Comparison result interrupt signal (level)
+
+  interrupt-names:
+    items:
+      - const: adi
+      - const: adcmpi
+
+  "#thermal-sensor-cells":
+    const: 0
+
+  renesas,tsu-trim:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to system controller
+          - description: offset of trim registers
+    description:
+      Phandle and offset to the system controller containing the TSU
+      calibration trim values. The offset points to the first trim register
+      (OTPTSU1TRMVAL0), with the second trim register (OTPTSU1TRMVAL1) located
+      at offset + 4.
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
+  - renesas,tsu-trim
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/renesas,r9a09g047-cpg.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    thermal-sensor@14002000 {
+        compatible = "renesas,r9a09g047-tsu";
+        reg = <0x14002000 0x1000>;
+        clocks = <&cpg CPG_MOD 0x10a>;
+        resets = <&cpg 0xf8>;
+        power-domains = <&cpg>;
+        interrupts = <GIC_SPI 250 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "adi", "adcmpi";
+        #thermal-sensor-cells = <0>;
+        renesas,tsu-trim = <&sys 0x330>;
+    };
-- 
2.25.1


