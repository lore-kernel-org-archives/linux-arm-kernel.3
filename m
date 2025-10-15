Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39BCCCD19D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 15:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ypAJifpYCRhmQMW3bob1DRJS8hXzqWQbLb5zyCmiaC0=; b=SkiIpr7J8KEx0YyYrWNAXQSngf
	mzAOIgyewnQODE0TynLetZyub4Kt6VrefHXueUNTrL5qL7RcDX2tCmVmeUGFvbTMesXkGvkft6G5O
	S/7eMtS4A+yXcyScxWyzDJztwjExHdfsPTZrBW2tFoMFWJoWEMHEZr698yrelblFyltgc/XrLlmcB
	usrT/z+mCfgE1hcRXkhqlKpm2iRl7FRwLYyJsBOcSo3/50T8mRzMlFIOuBclnFHw1CzWWb7YTetvN
	akPo73mjknu0JaG3ZfvCj7RA3mGiz2fYZrNpf3PRrD4naQZGFvmtwK2ku8pklTG6dhC2ZxBTscovs
	oOERxRdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v93cq-0000000289V-43fN;
	Wed, 15 Oct 2025 15:41:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v93ck-0000000283i-0uCj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 15:41:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A630E492DE;
	Wed, 15 Oct 2025 15:41:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 724D1C4CEFB;
	Wed, 15 Oct 2025 15:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760542869;
	bh=z/OSrLCIdtmRJvitAMSoC1V/ZcKkiBQ7+CQlgJR3nQ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CWEUMbZ7FkIaiyoh13AUuwttA8tD/Rb7mB6L1upR6nEj5AvQzsFbMn3Zu6BC1ieMg
	 NjOBlWmjyDytBDeqwLWEn8o6CJp8KlSXZRcXJ5aI2Slb8FnWXVcmHE5nCM/TUNVTEF
	 gAjm6cOg+0nrncu/Sdq6tnv4Kin0R7mYfiEv2tMaNHQWmL4vXGxxqmmVXHnr7GadNu
	 LkTG2XLNPnWy4bhHW99Yy96R8yHSdi+MxZ97iRluGZdgoYKvQonXWNXwjf0U7n/Sre
	 4eBFw/JjJ1qd7whJx+LBbCBmJdpUG/hlsb0W0gWKrntlURy6hM4P/Sok08E3DHqYpl
	 gQCs024IdKOVA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68A63CCD194;
	Wed, 15 Oct 2025 15:41:09 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Wed, 15 Oct 2025 15:40:41 +0000
Subject: [PATCH usb-next v2 1/5] dt-bindings: usb: Add Apple dwc3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-b4-aplpe-dwc3-v2-1-cbd65a2d511a@kernel.org>
References: <20251015-b4-aplpe-dwc3-v2-0-cbd65a2d511a@kernel.org>
In-Reply-To: <20251015-b4-aplpe-dwc3-v2-0-cbd65a2d511a@kernel.org>
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3194; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=z/OSrLCIdtmRJvitAMSoC1V/ZcKkiBQ7+CQlgJR3nQ4=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8b7A70WgSbmX7V3HjZ/Jrxpq6XVobuLPLzehC258XnnT
 u2EJc8EO0pZGMQ4GGTFFFm277c3ffLwjeDSTZfew8xhZQIZwsDFKQATcc1gZLh7w3j77f+bWsWq
 nazmfpN0Oxn+6bd4uPHh8wczS1eHTp/MyHD2YWH2Fqkr4iU1offTi5/s903c9+Pr3UWBb0OTz3Q
 rhLECAA==
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_084110_310233_A96277AF 
X-CRM114-Status: GOOD (  11.80  )
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

Apple Silicon uses Synopsys DesignWare dwc3 based USB controllers for
their Type-C ports.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sven Peter <sven@kernel.org>
---
 .../devicetree/bindings/usb/apple,dwc3.yaml        | 80 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 81 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/apple,dwc3.yaml b/Documentation/devicetree/bindings/usb/apple,dwc3.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..f70c33f32c5d6172224c524fe8e7218071eb4e9b
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/apple,dwc3.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple Silicon DWC3 USB controller
+
+maintainers:
+  - Sven Peter <sven@kernel.org>
+
+description:
+  Apple Silicon SoCs use a Synopsys DesignWare DWC3 based controller for each of
+  their Type-C ports.
+
+allOf:
+  - $ref: snps,dwc3-common.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - apple,t6000-dwc3
+              - apple,t6020-dwc3
+              - apple,t8112-dwc3
+          - const: apple,t8103-dwc3
+      - const: apple,t8103-dwc3
+
+  reg:
+    items:
+      - description: Core DWC3 region
+      - description: Apple-specific DWC3 region
+
+  reg-names:
+    items:
+      - const: dwc3-core
+      - const: dwc3-apple
+
+  interrupts:
+    maxItems: 1
+
+  iommus:
+    maxItems: 2
+
+  resets:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - iommus
+  - resets
+  - power-domains
+  - usb-role-switch
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/apple-aic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    usb@82280000 {
+      compatible = "apple,t8103-dwc3";
+      reg = <0x82280000 0xcd00>, <0x8228cd00 0x3200>;
+      reg-names = "dwc3-core", "dwc3-apple";
+      interrupts = <AIC_IRQ 777 IRQ_TYPE_LEVEL_HIGH>;
+      iommus = <&dwc3_0_dart_0 0>, <&dwc3_0_dart_1 1>;
+
+      power-domains = <&ps_atc0_usb>;
+      resets = <&atcphy0>;
+
+      usb-role-switch;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 46126ce2f968e4f9260263f1574ee29f5ff0de1c..fa238b5371b9c5942dc89ec4fa6b1d28e2d4dda3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2437,6 +2437,7 @@ F:	Documentation/devicetree/bindings/power/reset/apple,smc-reboot.yaml
 F:	Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
 F:	Documentation/devicetree/bindings/spi/apple,spi.yaml
 F:	Documentation/devicetree/bindings/spmi/apple,spmi.yaml
+F:	Documentation/devicetree/bindings/usb/apple,dwc3.yaml
 F:	Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
 F:	arch/arm64/boot/dts/apple/
 F:	drivers/bluetooth/hci_bcm4377.c

-- 
2.34.1



