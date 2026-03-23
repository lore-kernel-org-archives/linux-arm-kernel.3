Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D66EC01C0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 10:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oyXu0gtjiBhx9nuUYM0Mf+9SNK/PonIri6dLaS9aeOY=; b=BB9tZsvZLpA+qfzSuIiZ4V4jlQ
	3kHQMcDfN9xo4EBMB4T5dzo5VNz6WIwHUFooywsaSkiLsVGtxhUu7fjiSxiqgmqVHOR6V0iO83abb
	VibV9787t0PdEkCHAq3I8MZe9CyLcx8B8qO9nBDf8wq63dXOtWIC0+Ytx9OOkoT7srq2j96q5O0g9
	3fpmXpQDyipRXBSvtqUZSCfc1I9FAsNNjDBBQ7TLY+bp7ZW3f1jalqFhwkB/hkY0vNoko5JyFkPEJ
	MRhbOeoL6fnXYsL/o26j/vAQ0aP80ViU4mmwLJFWiEpOwItSh5x8kJRD9b43MpPCNapqj8HOtEWAp
	6UxHRf/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cMO-0000000GTax-4BhC;
	Mon, 23 Mar 2026 10:18:13 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cMK-0000000GTZc-2cYS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 10:18:09 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-824c9da9928so4360514b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 03:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774261088; x=1774865888; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oyXu0gtjiBhx9nuUYM0Mf+9SNK/PonIri6dLaS9aeOY=;
        b=R6Q357otScHm7qliN4thCqSpoqBR8QrKA+GBesvdIeSkxfvkGdXdEAcw8OVu5Se8z0
         5yHy0RmeW1FQTfPU2imlYaqeV+qevolDyGGguTx3nCD6lRJ7Imk+G2Cj3cbvY/tjThkO
         iL1MVHQVo6pRVz9VePk+RGxre/asgDA0cT9+fJ8ToKeCtfLbNZFOOUPjzxzPp4VhpHfJ
         uLRrxDEtM+iztDadSsC0VDwbVW8AdO2wvSelflsVlq4eGMvjUtk+AQcv1a69ZF3MDg4K
         v3Ir+D+csKdZaPGwyESli4PkckyIJYFHXvstSxulqj+BxPJjX9CAI8vJsMSfMiR5hEyG
         yejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261088; x=1774865888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oyXu0gtjiBhx9nuUYM0Mf+9SNK/PonIri6dLaS9aeOY=;
        b=ddDnyyUA9lTV8WN8wcIA8Bj3GRhpSGb3QmE/qgyYOGCRpQLE3/Zlup8fKUNEF7XRji
         bkDwdigHkZ/KPBtOj6KyvPwUjyrxEFcKsO16mV2gy0mcOSF80MDQCxdo68FD8Ol1/pYg
         hlv01xmLbxKjl2JXZBs6sLggibS37/iy0jFyjlmlF7lT3wdI3izXyHaauofkm2ji7aAZ
         vLOa9E+DGhPOxNqmZ62kVI/Cioe68hm8y4fdRW046ZBzPmIOx1rhq6iS9T3QH6FnTA8k
         xbSXDX5QdcXEYIdVZvIcx6BLCMYGA6nka9ebfozQLGPwna3rr2fTCVP8m9B7N0qqx/U+
         daDw==
X-Forwarded-Encrypted: i=1; AJvYcCU5Xs6pBZSsEbnOp10+YCj7VDIcSG5ywDzYHWK6PBcOjbL9czfk2yZoS3LMqSMbl5iYccMMSNN3bpysEzzwBPFk@lists.infradead.org
X-Gm-Message-State: AOJu0Yzqc8o4ZDr5X9E7AsvKsjq3Bj4dAJh4FEcDK7HIH3ZptHBq9/U0
	FhNMz+8etV4g1uYgTbXMdAMNDASBRzjDCxih4xGS8tnwVidc0fQOBNea
X-Gm-Gg: ATEYQzziANxAGWIiKyzdvYWx+uV2KtiISIrJlpswJk93tw4qBu0iDhMnZ4ybonNv0u8
	VxjM25YrzgWfh1sV23eceWoEPMa4Ei1BCGCfOfY2PD33CjzDk6Q6mP6KKwbDF+vACFnlFJ2ELg2
	58G+tm9yR7ckFBiX8vTT/peL6UhwPGP+tMdnYNHYf6OayH4JPrEwah9Z1s1oub+H/+X2ioVTC2U
	V+1lbpU0gynMYtiU0z08tnJV790jW89Tv5fieU+iC0O5aCws/Sf44XyLb1laG7OXS4fLCjs856t
	LseIzhZE0SrKkHIgbr+IjrfqhXJPLtQXQJYB05Arg39Kh1VK0V1VmGkZ13ExHcWHGv1bMEo+yfi
	gdDNEG0XMd5ohTfItEPwJsWMwLzTdiS33oIW9NwduMZcsfHq3jPPLDr3wKwJHl4BFfBUsbzSr4h
	8gabKDAdFxukjYmiSQYQlR9EopCgExeHIuyTAde99fyF/HxZ4wHUjicm6A+jSWaolY1f00qV2Qh
	plUcGpg1VTC+Zjl7q3E8To=
X-Received: by 2002:a05:6a00:1c83:b0:829:9f46:280d with SMTP id d2e1a72fcca58-82a8c23fb65mr8571011b3a.1.1774261088009;
        Mon, 23 Mar 2026 03:18:08 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b04220d9asm8630779b3a.60.2026.03.23.03.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:18:07 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	richardcochran@gmail.com
Cc: alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	peppe.cavallaro@st.com,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH net-next v15 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton MA35 family GMAC
Date: Mon, 23 Mar 2026 18:17:54 +0800
Message-ID: <20260323101756.81849-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323101756.81849-1-a0987203069@gmail.com>
References: <20260323101756.81849-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_031808_667608_21217CB9 
X-CRM114-Status: GOOD (  16.00  )
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

Create initial schema for Nuvoton MA35 family Gigabit MAC.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 140 ++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 2 files changed, 141 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
new file mode 100644
index 000000000000..ab18702e53f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
@@ -0,0 +1,140 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton DWMAC glue layer controller
+
+maintainers:
+  - Joey Lu <yclu4@nuvoton.com>
+
+description:
+  Nuvoton 10/100/1000Mbps Gigabit Ethernet MAC Controller is based on
+  Synopsys DesignWare MAC (version 3.73a).
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - nuvoton,ma35d1-dwmac
+  required:
+    - compatible
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: nuvoton,ma35d1-dwmac
+      - const: snps,dwmac-3.70a
+
+  reg:
+    maxItems: 1
+    description:
+      Register range should be one of the GMAC interface.
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: MAC clock
+      - description: PTP clock
+
+  clock-names:
+    items:
+      - const: stmmaceth
+      - const: ptp_ref
+
+  nuvoton,sys:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to access syscon registers.
+          - description: GMAC interface ID.
+            enum:
+              - 0
+              - 1
+    description:
+      A phandle to the syscon with one argument that configures system registers
+      for MA35D1's two GMACs. The argument specifies the GMAC interface ID.
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: stmmaceth
+
+  phy-mode:
+    enum:
+      - rmii
+      - rgmii
+      - rgmii-id
+      - rgmii-txid
+      - rgmii-rxid
+
+  tx-internal-delay-ps:
+    default: 0
+    minimum: 0
+    maximum: 2000
+    description:
+      RGMII TX path delay used only when PHY operates in RGMII mode with
+      internal delay (phy-mode is 'rgmii-id' or 'rgmii-txid') in pico-seconds.
+      Allowed values are from 0 to 2000.
+
+  rx-internal-delay-ps:
+    default: 0
+    minimum: 0
+    maximum: 2000
+    description:
+      RGMII RX path delay used only when PHY operates in RGMII mode with
+      internal delay (phy-mode is 'rgmii-id' or 'rgmii-rxid') in pico-seconds.
+      Allowed values are from 0 to 2000.
+
+required:
+  - clocks
+  - clock-names
+  - nuvoton,sys
+  - resets
+  - reset-names
+  - phy-mode
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+    ethernet@40120000 {
+        compatible = "nuvoton,ma35d1-dwmac", "snps,dwmac-3.70a";
+        reg = <0x40120000 0x10000>;
+        interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "macirq";
+        clocks = <&clk EMAC0_GATE>, <&clk EPLL_DIV8>;
+        clock-names = "stmmaceth", "ptp_ref";
+
+        nuvoton,sys = <&sys 0>;
+        resets = <&sys MA35D1_RESET_GMAC0>;
+        reset-names = "stmmaceth";
+        snps,multicast-filter-bins = <0>;
+        snps,perfect-filter-entries = <8>;
+        rx-fifo-depth = <4096>;
+        tx-fifo-depth = <2048>;
+
+        phy-mode = "rgmii-id";
+        phy-handle = <&eth_phy0>;
+        mdio {
+            compatible = "snps,dwmac-mdio";
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            eth_phy0: ethernet-phy@0 {
+                reg = <0>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 98ebb6276bc6..c25903c74484 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -69,6 +69,7 @@ properties:
         - ingenic,x2000-mac
         - loongson,ls2k-dwmac
         - loongson,ls7a-dwmac
+        - nuvoton,ma35d1-dwmac
         - nxp,s32g2-dwmac
         - qcom,qcs404-ethqos
         - qcom,sa8775p-ethqos
-- 
2.43.0


