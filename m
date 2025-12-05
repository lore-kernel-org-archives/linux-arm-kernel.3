Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B8DD116F1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 03:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K9IGhhvh09/PIVE8FZGaGUaKOpFrMLUGBlF8mQupvrs=; b=fIIhPeVpFnEzhf8fiTuDi4MZOV
	EFB497Ozp6inFV9abEG6qnkiBXULiWdVezMnCE37dTZcpoWjCkgy9UpO0LVMmlDrJDoyrqMBe+U7P
	zI6zLU/el+1t4mIGQaBNuHcl99WJafTS7QRHk+kGet6NJehvNA6ykpnJRWrtRdfgRZXwZIZkYtvcf
	HE0FwO+84WMt8HcDo3Pscu5oWExQLO65XlX1mUrGfqX5l5U8gyS7uf8+3tIiER8eI0wEMMaSrd1Fp
	jmQ5kXfGEThFY7hFLUnV+HaH4TzdGw8cQRnkbSVSmN0riLPK6IUMTgwlMB2RjZOZmIsS+zh5ccG/b
	JBnbMwFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRMtw-00000008zXM-2FdR;
	Fri, 05 Dec 2025 03:54:36 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRMtg-00000008zRx-2emt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 03:54:33 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-bb27b422cf2so2629693a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 19:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764906859; x=1765511659; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K9IGhhvh09/PIVE8FZGaGUaKOpFrMLUGBlF8mQupvrs=;
        b=v9MlALrMA2BesTVsA+Xd/OJw7RsvdzKaxRVKnxAnVxYCWp83OAHekATJ3ampXi1cIs
         V0yx/ZcnUFB08KNOFVXZvFtz0SGIbWWUhFnzHCoAoah2g1HqidPaI2e38aQfvLABUEw0
         dd1SzQXV+YQgS17p4M7PNSgO3yk+d63cs7Y1jOc8Geusgwe72Bf7Ouxdt3qaEMa4ZbiV
         anUqpzzv7caWWiUqLG+T8PoNHpliBS+s83FegK55o532tRv/9XADU096T7YwedoN/cv1
         06a5YZYG1wnhXIdZNCwq9QAhWPiLno09FdqQzBbWvmx1YpvWNXWMhK8WSamUtAU2G0SV
         W3gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764906859; x=1765511659;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K9IGhhvh09/PIVE8FZGaGUaKOpFrMLUGBlF8mQupvrs=;
        b=Zhj7zKjckHi7ckEnmCbslFNNa6xSnRHPnL3DQB03eUeePY+AsPuS0ZAN7o5ADD5hZk
         F4KBkCtUEdLV0Qj4pRck64nSeuDSgJxgMeQkvXpfDL1nHY39hjFp+1SN3/5hcTxVOZxa
         cOCN5ysmXvzNvPyLnTT4gGssicmnEet8gGLZviPEcUD9g44sgIKuqpvrS9bYPIPo6Kff
         YPL56yR04COUhTHJClUIht5wuZwY+pKKYmxc/jfGF2gyRJvv6o9iwZX8XKPrMuaWOnP0
         Lyw7hXScljfi3a6OO+vXXMotC8syEyx2Fn1ca+N0TwhiYFFrU+SHVNaUuRJQdx6XDwaG
         lwlA==
X-Forwarded-Encrypted: i=1; AJvYcCXkRGy2+TSpZawvOtvUmkXFWS99EkZP/zjAk0T9UncgezcEron5T4JeSj1PxMd5UXCwggbj9k5Rzw7S6jrrHyEt@lists.infradead.org
X-Gm-Message-State: AOJu0YxCqzDzQ0nnUZPBgIPKypIhyqcTYzuAEzrEohIB1ypGZ9O4QZzH
	TABz+FJuL7oBWx3S1wzamlbvz5wGv30icWCNQMCo30KuW41ZhDE3NAlPMXztNBNd6T5nHZ9KvNY
	YG6BQ3g==
X-Google-Smtp-Source: AGHT+IHJpPLIk0H+cBqi++ALzxQ5eQ6VgFjZGF6TauEmA3BNaoNKC/nHWwqyPRjeswPpZJ68VVj4Ud32D8o=
X-Received: from dybbs18.prod.google.com ([2002:a05:7300:a212:b0:2a2:3f59:eef5])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:d09:b0:2a4:3593:9686
 with SMTP id 5a478bee46e88-2ab92d39d8amr5864583eec.3.1764906859075; Thu, 04
 Dec 2025 19:54:19 -0800 (PST)
Date: Fri, 05 Dec 2025 03:54:11 +0000
In-Reply-To: <20251205-phyb4-v8-0-c59ea80a4458@google.com>
Mime-Version: 1.0
References: <20251205-phyb4-v8-0-c59ea80a4458@google.com>
X-Developer-Key: i=royluo@google.com; a=ed25519; pk=nTq1n8WcJActRWe1s8jdcy+TzpTK4a+IYRCIWvQfq5k=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764906855; l=5759;
 i=royluo@google.com; s=20251120; h=from:subject:message-id;
 bh=ptdeaHvryRd3du/x5tpdu2A1Uhs07EexzpJqndowuTI=; b=q5ohSaGg7OpLG4b4ODFHBEYmeqz1yVI6mZnXTBU2XgYOPQGfz5Ten0zXX12PwvMmv7x03fc6H
 5JSFNmnffTnDAlpSA0UoomGjan0EmjhV5SDd8ay7fdQnshlMwukAKSC
X-Mailer: b4 0.14.2
Message-ID: <20251205-phyb4-v8-1-c59ea80a4458@google.com>
Subject: [PATCH v8 1/2] dt-bindings: phy: google: Add Google Tensor G5 USB PHY
From: Roy Luo <royluo@google.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?utf-8?q?Andr=C3=A9_Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_195420_682633_8E5C8682 
X-CRM114-Status: GOOD (  17.15  )
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

Document the device tree bindings for the USB PHY interfaces integrated
with the DWC3 controller on Google Tensor SoCs, starting with G5
generation (Laguna). The USB PHY on Tensor G5 includes two integrated
Synopsys PHY IPs: the eUSB 2.0 PHY IP and the USB 3.2/DisplayPort combo
PHY IP.

Due to a complete architectural overhaul in the Google Tensor G5, the
existing Samsung/Exynos USB PHY binding for older generations of Google
silicons such as gs101 are no longer compatible, necessitating this new
device tree binding.

Signed-off-by: Roy Luo <royluo@google.com>
---
 .../bindings/phy/google,lga-usb-phy.yaml           | 133 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 134 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml b/Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..427e2e3425f645f40c0813e29d6efe4f62b20609
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
@@ -0,0 +1,133 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2025, Google LLC
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/google,lga-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Tensor Series G5 (Laguna) USB PHY
+
+maintainers:
+  - Roy Luo <royluo@google.com>
+
+description:
+  Describes the USB PHY interfaces integrated with the DWC3 USB controller on
+  Google Tensor SoCs, starting with the G5 generation (laguna).
+  Two specific PHY IPs from Synopsys are integrated, including eUSB 2.0 PHY IP
+  and USB3.2/DisplayPort combo PHY IP.
+
+properties:
+  compatible:
+    const: google,lga-usb-phy
+
+  reg:
+    items:
+      - description: USB3.2/DisplayPort combo PHY core registers.
+      - description: USB3.2/DisplayPort combo PHY Type-C Assist registers.
+      - description: eUSB 2.0 PHY core registers.
+      - description: Top-level wrapper registers for the integrated PHYs.
+
+  reg-names:
+    items:
+      - const: usb3_core
+      - const: usb3_tca
+      - const: usb2_core
+      - const: usbdp_top
+
+  "#phy-cells":
+    description: |
+      The phandle's argument in the PHY specifier selects one of the three
+      following PHY interfaces.
+      - 0 for USB high-speed.
+      - 1 for USB super-speed.
+      - 2 for DisplayPort.
+    const: 1
+
+  clocks:
+    items:
+      - description: USB2 PHY clock.
+      - description: USB2 PHY APB clock.
+      - description: USB3.2/DisplayPort combo PHY clock.
+      - description: USB3.2/DisplayPort combo PHY firmware clock.
+
+  clock-names:
+    items:
+      - const: usb2
+      - const: usb2_apb
+      - const: usb3
+      - const: usb3_fw
+
+  resets:
+    items:
+      - description: USB2 PHY reset.
+      - description: USB2 PHY APB reset.
+      - description: USB3.2/DisplayPort combo PHY reset.
+
+  reset-names:
+    items:
+      - const: usb2
+      - const: usb2_apb
+      - const: usb3
+
+  power-domains:
+    maxItems: 1
+
+  orientation-switch:
+    type: boolean
+    description:
+      Indicates the PHY as a handler of USB Type-C orientation changes
+
+  google,usb-cfg-csr:
+    description:
+      A phandle to a syscon node used to access the USB configuration
+      registers. These registers are the top-level wrapper of the USB
+      subsystem and provide control and status for the integrated USB
+      controller and USB PHY.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to the syscon node.
+          - description: USB2 PHY configuration register offset.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - "#phy-cells"
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - power-domains
+  - orientation-switch
+  - google,usb-cfg-csr
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        usb-phy@c410000 {
+            compatible = "google,lga-usb-phy";
+            reg = <0 0x0c410000 0 0x20000>,
+                  <0 0x0c430000 0 0x1000>,
+                  <0 0x0c440000 0 0x10000>,
+                  <0 0x0c637000 0 0xa0>;
+            reg-names = "usb3_core", "usb3_tca", "usb2_core", "usbdp_top";
+            #phy-cells = <1>;
+            clocks = <&hsion_usb2_phy_clk>, <&hsion_u2phy_apb_clk>,
+                     <&hsion_usb3_phy_clk>, <&hsion_usb3_phy_fw_clk>;
+            clock-names = "usb2", "usb2_apb", "usb3", "usb3_fw";
+            resets = <&hsion_resets_usb2_phy>,
+                     <&hsion_resets_u2phy_apb>,
+                     <&hsion_resets_usb3_phy>;
+            reset-names = "usb2", "usb2_apb", "usb3";
+            power-domains = <&hsio_n_usb_pd>;
+            orientation-switch;
+            google,usb-cfg-csr = <&usb_cfg_csr 0x14>;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 772af0072fff0921000c6fe27c018666c1579e48..27e6f9e20f5e83b861c6a04dededb93b8561715c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10661,6 +10661,7 @@ S:	Maintained
 P:	Documentation/process/maintainer-soc-clean-dts.rst
 C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	drivers/clk/samsung/clk-gs101.c

-- 
2.52.0.223.gf5cc29aaa4-goog


