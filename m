Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07866CA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 14:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qHtRCUPvWXQ2yKooMmNb9exSBswbRUWe3oTXiQdMuLc=; b=FR2O6kjBxAbtSKha6YcgV2DWh9
	MHf5XZ3Ya2Ti+9p4sklJ/5W683FahRjoMnF7DlOiA8C/d8LGlrzzWOJ9XLppxRhe4ju2WC9lXBDG9
	zq4o9IourUQibaIyadIYtkv0sF46Ep5lY3kzGnEFzYHI3MKdxhj9FhH5sFoRAbRCpzdkNZi+kopJG
	FsiSpaLzDOVN5Jtf8OfHBXAyw6WjpuNz6AfrQkNz15ceAnzEDcEigIxgbriZwUJF8pM/hSa6Brt47
	j8ZMDcTMyBord4FzwpibmpwTZ+87bitn9goIUmVxmdeOTL6JikaKPlrsUwAyfBQ1nX+z14gYqyspz
	Sl8S9Ntg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD0ia-0000000Dbgs-425D;
	Sat, 03 Oct 2026 14:28:04 +0000
Received: from mail.nozomi.space ([139.162.184.125])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD0iS-0000000Dbaa-3ZxG;
	Sat, 03 Oct 2026 14:28:00 +0000
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nozomi.space;
	s=mail; t=1791037667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qHtRCUPvWXQ2yKooMmNb9exSBswbRUWe3oTXiQdMuLc=;
	b=OCqZvUmvM9XDHFgAv769vRfqlJvRSjZQZ9Kws/01r9BMoy6Wj6qR3pkdDrV+lYAOTmeQb7
	DlHDxfVmO5ZMvUvsmh26gsXRIO5vg9otO76Ze+vai0cpFgOmD6og18VTLzM6g8SNabw1p9
	5np73+NOsj5GJRyNJX8Z2vyCo7+hYI/c36sRbVwdr3bEYvCe1Rnh9hjWFDa97k9Z+sX8Sa
	bPDdSykGsQbam/rPTZKvFTf6gL201GSRF4yiBPfMDHPsgjASV31YKKvLJfpWTwH8gKoKEN
	eaZo6DqnuGIHMrDBF5bVPjMmBa/3nm3o6xM64suXh7BSwBETDS/tk8ta7SmoFw==
To: linux-input@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Allen Lin <allencl_lin@hotmail.com>,
	Tylor Yang <tylor_yang@himax.corp-partner.google.com>,
	Felix Kaechele <felix@kaechele.ca>,
	Douglas Anderson <dianders@chromium.org>,
	=?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
Subject: [PATCH v5 1/6] dt-bindings: input: Add Himax HX83102J touchscreen
Date: Sat,  3 Oct 2026 16:27:36 +0200
Message-ID: <20261003142741.48634-2-michal@nozomi.space>
In-Reply-To: <20261003142741.48634-1-michal@nozomi.space>
References: <20261003142741.48634-1-michal@nozomi.space>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_072757_759467_454EA57D 
X-CRM114-Status: GOOD (  15.50  )
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

From: Allen_Lin <allencl_lin@hotmail.com>

Add the binding for the touch function of the Himax HX83102J, a touch
and display driver integrated (TDDI) controller. The touch function is
connected over SPI and shares the analog supplies and the reset of the
display function, so it is powered and reset together with the panel
and has to follow it.

Signed-off-by: Allen_Lin <allencl_lin@hotmail.com>
[michal@nozomi.space: rename ddreset-gpios to display-reset-gpios,
 describe the shared supplies and the display reset, take over
 maintainership, drop Rob's Reviewed-by because of these changes]
Signed-off-by: Michał Kopeć <michal@nozomi.space>
---
 .../input/touchscreen/himax,hx83102j.yaml     | 98 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/himax,hx83102j.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/himax,hx83102j.yaml b/Documentation/devicetree/bindings/input/touchscreen/himax,hx83102j.yaml
new file mode 100644
index 0000000000000..c9f229bf9ca7b
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/himax,hx83102j.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Himax hx83102j touchscreen
+
+maintainers:
+  - Michał Kopeć <michal@nozomi.space>
+
+description:
+  The Himax HX83102J is a touch and display driver integrated (TDDI)
+  controller. Its touch function is connected over SPI and reports HID
+  packets. The display and touch functions share the analog supplies and
+  the display reset, so the touch function is powered and reset together
+  with the panel it is part of.
+
+allOf:
+  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: himax,hx83102j
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  vccd-supply:
+    description: Digital I/O supply of the touch function.
+
+  vsn-supply:
+    description: Negative analog supply, shared with the display function.
+
+  vsp-supply:
+    description: Positive analog supply, shared with the display function.
+
+  display-reset-gpios:
+    maxItems: 1
+    description:
+      Reset of the display function, usually driven by the panel. Asserting
+      it also resets the touch function.
+
+  spi-cpha: true
+
+  spi-cpol: true
+
+  spi-max-frequency: true
+
+  panel: true
+
+  firmware-name:
+    description: Specify the file name for firmware loading.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - reset-gpios
+  - panel
+  - vccd-supply
+  - vsn-supply
+  - vsp-supply
+  - display-reset-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      ap_ts: touchscreen@0 {
+        compatible = "himax,hx83102j";
+        reg = <0>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&touch_int0 &touch_reset>;
+        reset-gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
+        spi-cpha;
+        spi-cpol;
+        interrupt-parent = <&gpio1>;
+        interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
+        panel = <&panel>;
+        vccd-supply = <&regulator>;
+        vsn-supply = <&regulator>;
+        vsp-supply = <&regulator>;
+        display-reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 72294ddfa5b75..e209f0d44fa73 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11729,6 +11729,12 @@ W:	http://www.highpoint-tech.com
 F:	Documentation/scsi/hptiop.rst
 F:	drivers/scsi/hptiop.c
 
+HIMAX HID TOUCHSCREEN
+M:	Michał Kopeć <michal@nozomi.space>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/input/touchscreen/himax,hx83102j.yaml
+
 HIMAX HX83112B TOUCHSCREEN SUPPORT
 M:	Job Noorman <job@noorman.info>
 L:	linux-input@vger.kernel.org
-- 
2.55.0


