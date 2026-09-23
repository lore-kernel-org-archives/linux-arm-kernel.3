Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07BDC98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 06:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4hFDy2VVoz7RTyWjulrvxuTdYcehFGuSNRNctvS4gQE=; b=UEp7kDOFXzR8DfRdc4kWdfGvm4
	TVDS4k2TeHZI+TCoLG2mn0v1O37a632OuwxS8cEY5Eq0IX/+rj49I3iWuzJsOKi6vXvfq8BaVc/gL
	b2XMB5JEOPGIrnVwDkJAErkLqxsT8HrwMs+7q/X82kXFb0R1DddSuCiVlFqI0Ul1cc/vPpSVtjVQs
	S0myji8yYv8rPPy7Pir6/ohYF2StlHpBV4Hmat09FaDMFLG5M1+JrfyjGMI/Z3QNxlZlXwdrmgiHc
	ELzorY4BWnsAB41FDhdHbnn8emBNeKKgZKPFcsH8MwQrc6wJ8wZqwpoPsDesF3bplA87LDA2DyZyP
	289s5wwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9GSs-00000007GwW-3vRP;
	Wed, 23 Sep 2026 06:28:22 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9GSp-00000007GvV-47UP;
	Wed, 23 Sep 2026 06:28:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=4h
	FDy2VVoz7RTyWjulrvxuTdYcehFGuSNRNctvS4gQE=; b=eqdKrPguK5Usl/D905
	qSORraqtnH9L2jyVnz0R4yrWWfYo+zono7VwU6QQabHk2Hrb+ByS28gDaRsEgTgs
	/X7a54u2Bad2DOi3HkRxgTBZ/yqEtz4rtNkybmGnKNGMhCyCb7U3LvDKcQfxlWsP
	TjCdJwLRvRVdMhrez5bXaStiQ=
Received: from chaosheng-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3n95rcbNqvBgRAQ--.5203S2;
	Wed, 23 Sep 2026 14:27:57 +0800 (CST)
From: Quchaosheng <quchaosheng000406@163.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	quchaosheng000406@163.com
Subject: [PATCH v3] dt-bindings: mfd: Convert rk805 pinctrl to DT schema
Date: Wed, 23 Sep 2026 14:27:46 +0800
Message-ID: <20260923062746.516666-1-quchaosheng000406@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3n95rcbNqvBgRAQ--.5203S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxuw47tr48KFWkAFyxJw15twb_yoWxWw4DpF
	W3AFZ3Jrn2gF4fuw4Utw18C34fWan7Ar47G3WDGryIqa15uryjvr15Kw1rZF98GrW8Za4a
	vrsrWryDXwnrCw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUjfOrUUUUU=
X-CM-SenderInfo: xtxfxtprvkv0bjqqikiqw6il2tof0z/xtbC5A3+dGqzcW2tHgAA3V
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_232820_267737_026AB742 
X-CRM114-Status: GOOD (  21.42  )
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

pinctrl-rk805.txt describes the pinmux controller that is part of the
Rockchip RK805 PMIC. The PMIC itself is already described by
rockchip,rk805.yaml, so the pinmux part belongs there as well: the
pinctrl node is a child of the PMIC node, not a separate device.

Fold the pinmux description into rockchip,rk805.yaml and drop the
standalone text binding.

While doing so, add the missing '-pins$' child node schema. The
rockchip,rk805.yaml schema ends with 'additionalProperties: false' but did
not describe the pin configuration child nodes at all, so a valid pinmux
node like the one shown in pinctrl-rk805.txt was rejected:

    pmic@18 (rockchip,rk805): 'rk805-default-pins' does not match any of
    the regexes: '^pinctrl-[0-9]+$'

The pin configuration nodes require 'pins'; without it a node that names
no pin is accepted silently, while the text binding it replaces listed
'pins' as required. The RK805 exposes two output-only GPIOs, so 'pins' is
an enum of gpio0 and gpio1 and a typo such as "gpio2" is caught.

The example regains the gpio-controller and #gpio-cells lines that the
text binding's example had.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20260923034245.396417-1-quchaosheng000406@163.com?part=1
Assisted-by: LLM
Signed-off-by: Quchaosheng <quchaosheng000406@163.com>
---
Changes in v3:
- Capitalize the summary phrase. dt-bindings: mfd: titles are capitalized
  after the subsystem prefix (Add 61, Convert 20 against convert 6).
- Add gpio-controller and #gpio-cells to the example, which the text
  binding's example had and the conversion dropped.
- gpio-controller and #gpio-cells are deliberately *not* added to the
  required list. rv1108-evb, rv1108-elgin-r1 and rk3328-a1 do not set
  them, so requiring them breaks three in-tree boards:

    rv1108-evb.dtb: pmic@18 (rockchip,rk805): 'gpio-controller' is a required property

  No rk8xx PMIC schema requires the pair, and gpio.yaml already enforces
  that they appear together ("'#gpio-cells' is a dependency of
  'gpio-controller'"). The pinctrl driver calls devm_gpiochip_add_data()
  unconditionally, so the property is not what makes the GPIO controller
  work either.

Changes in v2:
- Require 'pins' in the pin configuration nodes. Without it a node that
  names no pin passes validation, while the text binding listed 'pins'
  as required.
---
 .../bindings/mfd/rockchip,rk805.yaml          | 38 ++++++++++-
 .../bindings/pinctrl/pinctrl-rk805.txt        | 63 -------------------
 2 files changed, 37 insertions(+), 64 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-rk805.txt

diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
index da2391530c16..681a90a265c0 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
@@ -86,6 +86,34 @@ properties:
         unevaluatedProperties: false
     unevaluatedProperties: false
 
+patternProperties:
+  '-pins$':
+    type: object
+    description:
+      The RK805 has two output-only GPIOs which can be muxed to the GPIO
+      function and driven low or high at boot.
+    additionalProperties: false
+
+    properties:
+      pins:
+        description:
+          List of GPIO pins to configure.
+        items:
+          enum: [gpio0, gpio1]
+        minItems: 1
+        maxItems: 2
+
+      function:
+        description:
+          The RK805 only supports the GPIO function.
+        enum: [gpio]
+
+      output-low: true
+      output-high: true
+
+    required:
+      - pins
+
 allOf:
   - if:
       properties:
@@ -125,9 +153,11 @@ examples:
             interrupt-parent = <&gpio2>;
             interrupts = <RK_PA6 IRQ_TYPE_LEVEL_LOW>;
             pinctrl-names = "default";
-            pinctrl-0 = <&pmic_int_l>;
+            pinctrl-0 = <&pmic_int_l>, <&rk805_default>;
             rockchip,system-power-controller;
             wakeup-source;
+            gpio-controller;
+            #gpio-cells = <2>;
             #clock-cells = <0>;
 
             vcc1-supply = <&vcc_sys>;
@@ -137,6 +167,12 @@ examples:
             vcc5-supply = <&vcc_io>;
             vcc6-supply = <&vcc_io>;
 
+            rk805_default: rk805-default-pins {
+                pins = "gpio0", "gpio1";
+                function = "gpio";
+                output-high;
+            };
+
             regulators {
                 vdd_logic: DCDC_REG1 {
                     regulator-name = "vdd_logic";
diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-rk805.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-rk805.txt
deleted file mode 100644
index 6ad49e51c72e..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-rk805.txt
+++ /dev/null
@@ -1,63 +0,0 @@
-Pincontrol driver for RK805 Power management IC.
-
-RK805 has 2 pins which can be configured as GPIO output only.
-
-Please refer file <devicetree/bindings/pinctrl/pinctrl-bindings.txt>
-for details of the common pinctrl bindings used by client devices,
-including the meaning of the phrase "pin configuration node".
-
-Optional Pinmux properties:
---------------------------
-Following properties are required if default setting of pins are required
-at boot.
-- pinctrl-names: A pinctrl state named per <pinctrl-bindings.txt>.
-- pinctrl[0...n]: Properties to contain the phandle for pinctrl states per
-		<pinctrl-bindings.txt>.
-
-The pin configurations are defined as child of the pinctrl states node. Each
-sub-node have following properties:
-
-Required properties:
-------------------
-- #gpio-cells: Should be two. The first cell is the pin number and the
-  second is the GPIO flags.
-
-- gpio-controller: Marks the device node as a GPIO controller.
-
-- pins: List of pins. Valid values of pins properties are: gpio0, gpio1.
-
-First 2 properties must be added in the RK805 PMIC node, documented in
-Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
-
-Optional properties:
--------------------
-Following are optional properties defined as pinmux DT binding document
-<pinctrl-bindings.txt>. Absence of properties will leave the configuration
-on default.
-	function,
-	output-low,
-	output-high.
-
-Valid values for function properties are: gpio.
-
-There are also not customised properties for any GPIO.
-
-Example:
---------
-rk805: rk805@18 {
-	compatible = "rockchip,rk805";
-	...
-	gpio-controller;
-	#gpio-cells = <2>;
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pmic_int_l>, <&rk805_default>;
-
-	rk805_default: pinmux {
-		gpio01 {
-			pins = "gpio0", "gpio1";
-			function = "gpio";
-			output-high;
-		};
-	};
-};
-- 
2.43.0


