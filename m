Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08554606A330
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 08:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=viSENTOq;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yf5Bm3WG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NkHymjSt2A74ql+qtp6qm2wQIYP7oqyE4Fn6QdjnJNY=; b=viSENTOqWNxvdA
	FkaFKMNRfhCu1doPvGMWpEqtvTES7s1XxCcLLwJJU/IjBJR3frfbqz2FevJdOepbRAwNf8tsyhyXi
	NzZdlYouWFvqaguGNtv0XwS8vcnIE6K0hh3Ek90fQRMyTjKIY6LLtuo2e41r8oPaucfEYUoAH+COm
	QKu/UJw65lICkZ+c116l1YauVYpDuBDmRlgcRl5UNbwjd3ZRfXwoW4yXsKhBKjtHOgyUILHeQ5Cjz
	52fkxW9ApgGWjc7vnLbTFVW8QkmFBjtM1fVWbeVoOcM9dgRddlY/fItSGx6A1rjNzxlmKKoICczRn
	MqJCPce4shGzmc9cUH2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFHx-0000000BY0c-37H3;
	Fri, 06 Nov 2026 08:27:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFHv-0000000BXzb-3cvk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 08:27:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F3E9C608FA;
	Fri,  6 Nov 2026 08:27:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4504D1F00904;
	Fri,  6 Nov 2026 08:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793953626;
	bh=NkHymjSt2A74ql+qtp6qm2wQIYP7oqyE4Fn6QdjnJNY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Yf5Bm3WGc5dQ4GG5EdmbfLnCtI6Gpcq1nTiutBpsriRcd9JvTzKSUMFGEJzSZM+5w
	 YPKZjve7SMVVxRqsy+vuyEJ+CYhnx89ddgslB5zG/x1duHtbD4SOS52l3O1Gc6axEE
	 48piemh3YKxAcWRvDn+XizMpZLjm9QajDqsl8EoX9KTp/BTQh1CnfNx6kTydmNGa33
	 c31nfKOc5wLbD9FPADl4fBjrc4ClSCUNCUpvPU7NCLDGXuTUSI6zU8rDAPqPZPmLhx
	 GIo3oFmYNTfpa+y3vCYHhwlO2pBdTQXnAMpcbzM3nu9yWjzB2Z62PPFIs0hp3HzM8t
	 Obz3sj57yqPdw==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 06 Nov 2026 09:26:45 +0100
Subject: [PATCH v3 2/7] dt-bindings: soc: Describe the BCM6846 Processor
 Monitor Bus
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-xg6846b-bcmbca-xrdp-reset-v3-2-d6adeb71afc9@kernel.org>
References: <20261106-xg6846b-bcmbca-xrdp-reset-v3-0-d6adeb71afc9@kernel.org>
In-Reply-To: <20261106-xg6846b-bcmbca-xrdp-reset-v3-0-d6adeb71afc9@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
 Ulf Hansson <ulfh@kernel.org>, 
 Benjamin Larsson <benjamin.larsson@genexis.eu>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.16.0
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The third generation Power Management Controller (PMC3) accesses SoC
block control and reset registers through the Processor Monitor Bus
(PMB). Describe the BCM6846 PMC and PMB.

Describe the power controller child and all supported power domain IDs,
including the combined XRDP, Runner and WAN domain.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
I considered even just using the PMB but the PMC has more stuff and
it seems natural to let it live in a simple-mfd node.
---
 .../bindings/clock/brcm,bcm6846-pmb-clock.yaml     | 39 ++++++++++
 .../bindings/hwmon/brcm,bcm6846-pmb-pvtmon.yaml    | 42 ++++++++++
 .../devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml  |  5 ++
 .../bindings/power/brcm,bcm6846-pmb-power.yaml     | 44 +++++++++++
 .../bindings/reset/brcm,bcm6846-pmb-reset.yaml     | 31 ++++++++
 .../bindings/soc/bcm/brcm,bcm6846-pmb.yaml         | 90 ++++++++++++++++++++++
 MAINTAINERS                                        |  8 ++
 include/dt-bindings/clock/brcm,bcm6846-pmb.h       | 42 ++++++++++
 include/dt-bindings/power/brcm,bcm6846-pmb.h       | 12 +++
 include/dt-bindings/reset/brcm,bcm6846-pmb.h       | 11 +++
 10 files changed, 324 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/brcm,bcm6846-pmb-clock.yaml b/Documentation/devicetree/bindings/clock/brcm,bcm6846-pmb-clock.yaml
new file mode 100644
index 000000000000..519606522c8b
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/brcm,bcm6846-pmb-clock.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/brcm,bcm6846-pmb-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM6846 PMB clocks
+
+maintainers:
+  - Linus Walleij <linusw@kernel.org>
+
+description:
+  The Processor Monitor Bus (PMB) provides access to the RDP and BIU PLL
+  outputs, the Runner clock, the crystal output, the PVTMON acquisition
+  clock and the clock gates in block power-control zones. Clock indices
+  are defined in dt-bindings/clock/brcm,bcm6846-pmb.h.
+  The PLLs and crystal output use a 50 MHz reference clock.
+  Zone clocks require their associated blocks to be powered.
+
+properties:
+  compatible:
+    const: brcm,bcm6846-pmb-clock
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: ref
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - '#clock-cells'
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/hwmon/brcm,bcm6846-pmb-pvtmon.yaml b/Documentation/devicetree/bindings/hwmon/brcm,bcm6846-pmb-pvtmon.yaml
new file mode 100644
index 000000000000..9bf52cf097a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/brcm,bcm6846-pmb-pvtmon.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/brcm,bcm6846-pmb-pvtmon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM6846 PMB process, voltage and temperature monitor
+
+maintainers:
+  - Linus Walleij <linusw@kernel.org>
+
+description:
+  The process, voltage and temperature monitor (PVTMON) is a child of
+  the Processor Monitor Bus (PMB) controller and uses its indirect
+  register interface. It measures die temperature and seven voltages,
+  including a diagnostic test input.
+
+allOf:
+  - $ref: /schemas/thermal/thermal-sensor.yaml#
+
+properties:
+  compatible:
+    const: brcm,bcm6846-pmb-pvtmon
+
+  clocks:
+    maxItems: 1
+    description: PVTMON acquisition clock
+
+  resets:
+    maxItems: 1
+    description: PVTMON analog-acquisition reset
+
+  '#thermal-sensor-cells':
+    const: 0
+
+required:
+  - compatible
+  - clocks
+  - resets
+  - '#thermal-sensor-cells'
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml b/Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml
index d4c927cabb3f..77fbf92926ab 100644
--- a/Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml
+++ b/Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml
@@ -60,6 +60,11 @@ examples:
             compatible = "brcm,bcm6846-pmb";
             reg = <0x20100 0x200>;
 
+            pmb_power: power-controller {
+                compatible = "brcm,bcm6846-pmb-power";
+                #power-domain-cells = <1>;
+            };
+
             pmb_clk: clock-controller {
                 compatible = "brcm,bcm6846-pmb-clock";
                 clocks = <&osc50m>;
diff --git a/Documentation/devicetree/bindings/power/brcm,bcm6846-pmb-power.yaml b/Documentation/devicetree/bindings/power/brcm,bcm6846-pmb-power.yaml
new file mode 100644
index 000000000000..891eb0f347e6
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/brcm,bcm6846-pmb-power.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/brcm,bcm6846-pmb-power.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM6846 Processor Monitor Bus power controller
+
+maintainers:
+  - Linus Walleij <linusw@kernel.org>
+
+description: |
+  The power controller is a child of the Processor Monitor Bus (PMB)
+  controller and accesses BPCM power zones through the parent regmap.
+  A domain includes all power zones of a block. The XRDP domain groups
+  XRDP, its three Runner cores and WAN, matching the vendor power sequence.
+
+  Domain IDs are defined in dt-bindings/power/brcm,bcm6846-pmb.h:
+    BCM6846_PD_PERIPH: peripheral block (bus 0, device 0, four zones)
+    BCM6846_PD_MEMC: memory controller (bus 1, device 8, one zone)
+    BCM6846_PD_USB20: USB 2.0 (bus 1, device 10, four zones)
+    BCM6846_PD_XRDP: XRDP (bus 1, device 12, three zones), Runner cores
+      (bus 1, devices 14, 15 and 16, one zone each) and WAN
+      (bus 1, device 11, three zones)
+    BCM6846_PD_PCIE0: PCIe 0 (bus 0, device 18, one zone)
+    BCM6846_PD_PCIE1: PCIe 1 (bus 0, device 19, one zone)
+
+  Peripheral and memory domains remain powered because they provide
+  resources required for system operation. CPU and PLL blocks use different
+  register layouts and are outside the scope of this provider.
+
+properties:
+  compatible:
+    const: brcm,bcm6846-pmb-power
+
+  '#power-domain-cells':
+    const: 1
+    description: Power domain ID from dt-bindings/power/brcm,bcm6846-pmb.h
+
+required:
+  - compatible
+  - '#power-domain-cells'
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/reset/brcm,bcm6846-pmb-reset.yaml b/Documentation/devicetree/bindings/reset/brcm,bcm6846-pmb-reset.yaml
new file mode 100644
index 000000000000..d2a85266e36a
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/brcm,bcm6846-pmb-reset.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/brcm,bcm6846-pmb-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM6846 Processor Monitor Bus reset controller
+
+maintainers:
+  - Linus Walleij <linusw@kernel.org>
+
+description:
+  The reset controller is a child of the Processor Monitor Bus (PMB)
+  controller and uses its indirect register interface.
+
+  Each reset specifier identifies a logical reset group, which may span
+  several blocks that must be reset together.
+
+properties:
+  compatible:
+    const: brcm,bcm6846-pmb-reset
+
+  '#reset-cells':
+    const: 1
+    description: Reset group ID from dt-bindings/reset/brcm,bcm6846-pmb.h
+
+required:
+  - compatible
+  - '#reset-cells'
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/soc/bcm/brcm,bcm6846-pmb.yaml b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm6846-pmb.yaml
new file mode 100644
index 000000000000..134a8a676dbd
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm6846-pmb.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/bcm/brcm,bcm6846-pmb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM6846 Processor Monitor Bus
+
+maintainers:
+  - Linus Walleij <linusw@kernel.org>
+
+description:
+  The Processor Monitor Bus (PMB) connects the third generation Power
+  Management Controller (PMC3) to the control registers of miscellaneous
+  independent hardware blocks.
+
+  The controller provides configuration, arbitration and four keyhole
+  interfaces for indirect register access.
+
+  Child nodes describe independent hardware blocks accessed over the PMB.
+  These provide global resources and even resources for each other.
+
+properties:
+  compatible:
+    const: brcm,bcm6846-pmb
+
+  reg:
+    maxItems: 1
+    description: PMB configuration, keyhole and address mapping registers
+
+  power-controller:
+    type: object
+    $ref: /schemas/power/brcm,bcm6846-pmb-power.yaml#
+
+  clock-controller:
+    type: object
+    $ref: /schemas/clock/brcm,bcm6846-pmb-clock.yaml#
+
+  reset-controller:
+    type: object
+    $ref: /schemas/reset/brcm,bcm6846-pmb-reset.yaml#
+
+  hwmon:
+    type: object
+    $ref: /schemas/hwmon/brcm,bcm6846-pmb-pvtmon.yaml#
+
+required:
+  - compatible
+  - reg
+  - power-controller
+  - clock-controller
+  - reset-controller
+  - hwmon
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/brcm,bcm6846-pmb.h>
+    #include <dt-bindings/reset/brcm,bcm6846-pmb.h>
+
+    /* Processor Monitor Bus */
+    bus@ffb20100 {
+        compatible = "brcm,bcm6846-pmb";
+        reg = <0xffb20100 0x200>;
+
+        pmb_power: power-controller {
+            compatible = "brcm,bcm6846-pmb-power";
+            #power-domain-cells = <1>;
+        };
+
+        pmb_clk: clock-controller {
+            compatible = "brcm,bcm6846-pmb-clock";
+            clocks = <&osc50m>;
+            clock-names = "ref";
+            #clock-cells = <1>;
+        };
+
+        pmb_reset: reset-controller {
+            compatible = "brcm,bcm6846-pmb-reset";
+            #reset-cells = <1>;
+        };
+
+        hwmon {
+            compatible = "brcm,bcm6846-pmb-pvtmon";
+            clocks = <&pmb_clk BCM6846_CLK_PVTMON>;
+            resets = <&pmb_reset BCM6846_RESET_PVTMON>;
+            #thermal-sensor-cells = <0>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index f14f9910911c..e11fc5064dc5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5447,7 +5447,15 @@ N:	bcm[9]?6878
 BROADCOM BCMBCA PMC3 PMB DRIVER
 M:	Linus Walleij <linusw@kernel.org>
 S:	Maintained
+F:	Documentation/devicetree/bindings/clock/brcm,bcm6846-pmb-clock.yaml
+F:	Documentation/devicetree/bindings/hwmon/brcm,bcm6846-pmb-pvtmon.yaml
 F:	Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml
+F:	Documentation/devicetree/bindings/power/brcm,bcm6846-pmb-power.yaml
+F:	Documentation/devicetree/bindings/reset/brcm,bcm6846-pmb-reset.yaml
+F:	Documentation/devicetree/bindings/soc/bcm/brcm,bcm6846-pmb.yaml
+F:	include/dt-bindings/clock/brcm,bcm6846-pmb.h
+F:	include/dt-bindings/power/brcm,bcm6846-pmb.h
+F:	include/dt-bindings/reset/brcm,bcm6846-pmb.h
 
 BROADCOM BDC DRIVER
 M:	Justin Chen <justin.chen@broadcom.com>
diff --git a/include/dt-bindings/clock/brcm,bcm6846-pmb.h b/include/dt-bindings/clock/brcm,bcm6846-pmb.h
new file mode 100644
index 000000000000..548a18ed7959
--- /dev/null
+++ b/include/dt-bindings/clock/brcm,bcm6846-pmb.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+#ifndef _DT_BINDINGS_CLOCK_BRCM_BCM6846_PMB_H
+#define _DT_BINDINGS_CLOCK_BRCM_BCM6846_PMB_H
+
+#define BCM6846_CLK_RDPPLL_CH0	0
+#define BCM6846_CLK_RDPPLL_CH1	1
+#define BCM6846_CLK_RDPPLL_CH2	2
+#define BCM6846_CLK_RDPPLL_CH3	3
+#define BCM6846_CLK_RDPPLL_CH4	4
+#define BCM6846_CLK_RDPPLL_CH5	5
+#define BCM6846_CLK_BIUPLL_CH0	6
+#define BCM6846_CLK_BIUPLL_CH1	7
+#define BCM6846_CLK_BIUPLL_CH2	8
+#define BCM6846_CLK_BIUPLL_CH3	9
+#define BCM6846_CLK_BIUPLL_CH4	10
+#define BCM6846_CLK_BIUPLL_CH5	11
+#define BCM6846_CLK_RUNNER	12
+#define BCM6846_CLK_XTAL_OUT	13
+#define BCM6846_CLK_PVTMON	14
+#define BCM6846_CLK_PERIPH_ZONE0	15
+#define BCM6846_CLK_PERIPH_ZONE1	16
+#define BCM6846_CLK_PERIPH_ZONE2	17
+#define BCM6846_CLK_PERIPH_ZONE3	18
+#define BCM6846_CLK_MEMC		19
+#define BCM6846_CLK_USB_ZONE0	20
+#define BCM6846_CLK_USB_ZONE1	21
+#define BCM6846_CLK_USB_ZONE2	22
+#define BCM6846_CLK_USB_ZONE3	23
+#define BCM6846_CLK_WAN_ZONE0	24
+#define BCM6846_CLK_WAN_ZONE1	25
+#define BCM6846_CLK_WAN_ZONE2	26
+#define BCM6846_CLK_XRDP_ZONE0	27
+#define BCM6846_CLK_XRDP_ZONE1	28
+#define BCM6846_CLK_XRDP_ZONE2	29
+#define BCM6846_CLK_RUNNER0	30
+#define BCM6846_CLK_RUNNER1	31
+#define BCM6846_CLK_RUNNER2	32
+#define BCM6846_CLK_PCIE0		33
+#define BCM6846_CLK_PCIE1		34
+#define BCM6846_CLK_BIU		35
+
+#endif
diff --git a/include/dt-bindings/power/brcm,bcm6846-pmb.h b/include/dt-bindings/power/brcm,bcm6846-pmb.h
new file mode 100644
index 000000000000..abdd01c94bc5
--- /dev/null
+++ b/include/dt-bindings/power/brcm,bcm6846-pmb.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+#ifndef _DT_BINDINGS_POWER_BCM6846_PMB_H
+#define _DT_BINDINGS_POWER_BCM6846_PMB_H
+
+#define BCM6846_PD_PERIPH	0
+#define BCM6846_PD_MEMC		1
+#define BCM6846_PD_USB20		2
+#define BCM6846_PD_XRDP		3
+#define BCM6846_PD_PCIE0		4
+#define BCM6846_PD_PCIE1		5
+
+#endif
diff --git a/include/dt-bindings/reset/brcm,bcm6846-pmb.h b/include/dt-bindings/reset/brcm,bcm6846-pmb.h
new file mode 100644
index 000000000000..ce68adb10108
--- /dev/null
+++ b/include/dt-bindings/reset/brcm,bcm6846-pmb.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+#ifndef _DT_BINDINGS_RESET_BRCM_BCM6846_PMB_H
+#define _DT_BINDINGS_RESET_BRCM_BCM6846_PMB_H
+
+/* XRDP packet engine and its three Runner cores. */
+#define BCM6846_RESET_XRDP	0
+
+/* Process, voltage and temperature monitor analog acquisition reset. */
+#define BCM6846_RESET_PVTMON	1
+
+#endif

-- 
2.56.0


