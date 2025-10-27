Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA4A0CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 16:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=geguZxaeJiqKqJQ0kK8UQgUfhxCEenMLMdjKppCx4hc=; b=DLDNalqlm2Z48suSCL9A932myz
	kbQoZF/PxJZOgud2uryER2CQ4WxvfkRiWSLLPRdCNRj7vpUQMPqyJXYaUrqObBJ5d49EaSH2xslNy
	Dd7XjNlp5byor75Hpa+cR48ddkd0smMevCAR+cSJH+M4Z9svawhFrbbJWQeAs64Fi5quOiXnt29Hr
	LkBML5aL46ICAu+3LQORdTeHS2Q1IYxR49hBwLNjscSEPW38Um36j/i9frpc29VZTwOMlytq/0422
	faPmM1grnRNnKxNF1gTuJwWbwC59zdmZkHSba3r1rjEYmrIIm/q0sdb/wfncTALlAiv7OfLi0Lk40
	gO0xtfjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQPh-0000000EMoJ-0iKi;
	Mon, 27 Oct 2025 16:49:45 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQPR-0000000EMkY-3WhT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 16:49:31 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-b6cdba2663dso3511628a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 09:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761583769; x=1762188569; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=geguZxaeJiqKqJQ0kK8UQgUfhxCEenMLMdjKppCx4hc=;
        b=Y2qWkVS1SGTk15ohuZCGsdv+sVrRWidIgPyGVbAY8m4A+uOhsoHr6m+YnCWjU8veH/
         yecyATmOUmyVi7QaWYdPjlcS1fPQKBjtJN8b7Q6SYjMwkoIOdHM8teTsTiYNfY900RHT
         fQ9nVBvPZZHj107TgnrWWRGzSTY6yFpFGfAPltj8lORb9UCE7rAk67F9zVDKY/AfoNVz
         UH7krKrN6mew8GyfEPAsd6Upu0GjR1y1S1d6gB4dIGsYyCXF+yVIAv4t+CApAMOi9MV7
         HirfKHoMgf31/wJZmIEfEpN1DFZPpX1e2A38DjackJwyh/QIFXbOcYGnfwhcIZ6Oi0nM
         getw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761583769; x=1762188569;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=geguZxaeJiqKqJQ0kK8UQgUfhxCEenMLMdjKppCx4hc=;
        b=cIgBpadpMPZaBvz+PH8W3sra3a+WFSqMGTEyaXcf/bwZOmaIBQ3F/p673VitemT7aZ
         QuzePQ+pFbiDhfTSjMSPpojzLUqPrD8UUWfVMHJjJRqsIHiefGhngvu5c27btfZq44aa
         +cRKso8itIMW9TI80f62Bvoxstu116OoXjFeKx/r0LYhynPxqJ01lBHdP06BgdIRnQ14
         iJLiSTZUSd7eyQsXmUF2Ji+A8o3MAC7m3A+LMc2wZ9xQSU1er8Mf48vR3TkPRhCvXd4u
         GLxq41aQ4mmJ5IK8Zva9JcOUtozfhivyksU5qNenIL7TOrv7zbrhTAc8eiuBuT4IXmXp
         L1bQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMTEoU5fmQdVWsAtw26Q8pe0mIitA/s2FaqNQ6Hi9SHbgBwfhh1mHOUMpAlw2GFjI+rl9dL0mUPUjqAiJ3qbFC@lists.infradead.org
X-Gm-Message-State: AOJu0Yzd0/f1E3dYt3PkK0FcYKBy8YAiom2Ii21ogOaOG48iaLpPuPWK
	hZTS++WSqI8ZZaadP5nd2/Ypnq9vcta+lWVPhJ46IUet/kigNgzopDf1EEey2w==
X-Gm-Gg: ASbGncvalM/hrrOyjuNuQBKKPVc/dSq1vpPEhiw/Y4hHnr2AdTKQotagc3qRm1koOeR
	jL4Jmym+uQRRcErc5U471Cg3p03VCD3ozX7iU5UasGMG7euRe0qvGWAUEGgxaGelZR6IegBpjXB
	w1OQtcVH0Y1P6wmudjmBdKL0FJ2wUyNt7Loh+a/qSeTWz/Uhz4d+GFir3GFF0PH9aNAxxBnoVd3
	wgRY5GLtL9oOPYd//EfZdxDnY+wGieHLtJTE0GnVQ7qQmrzDuek/jRVGzVHLbwV3+Qx5LqWs1vB
	luMdCN1ZFp+xbuZ5wUiZut8tkYxXGgCg6BCRoCqWNOhLLhN96LLpA12CTqjMMqaeNvJyqFYvAtm
	yok5NdG27k8UH5jE8yPnebbN/06Z1pzgbUG6YVA1t6PNYYz5zXiu5IZzJRZA0WdUSoePKv3Sy02
	X616WQguVmYtLFyYnpai9H
X-Google-Smtp-Source: AGHT+IFsZhMXjDA3rdE7firYijUNXcnLWPPnTnb2rv5dx73e9it+zwX4W3UIHnIxK9VNAzx0q7dU+A==
X-Received: by 2002:a17:902:cecb:b0:26d:72f8:8d0a with SMTP id d9443c01a7336-294cb368bd0mr6638925ad.12.1761583768299;
        Mon, 27 Oct 2025 09:49:28 -0700 (PDT)
Received: from Black-Pearl.localdomain ([27.7.191.116])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-29498cf358fsm86581925ad.20.2025.10.27.09.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 09:49:27 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Mon, 27 Oct 2025 16:46:16 +0000
Subject: [PATCH v2] dt-bindings: mmc: socionext,milbeaut-m10v-sdhci-3.0:
 convert to DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-milbeaut-v2-1-9e1954ff7708@gmail.com>
X-B4-Tracking: v=1; b=H4sIANeh/2gC/0XMywqDMBCF4VeRWTclMxqFrvoe4iKNEx3wUhIbW
 sR3b+qmy/9w+HaIHIQj3IodAieJsi456FKAG+0ysJI+N5Amow1Vapbpwfa1KeM01U3emRzk+zO
 wl/dJtV3uUeK2hs8pJ/ytJ4Kayj+SUKEqufK+bhC17e/DbGW6unWG7jiOLz8RU8qgAAAA
X-Change-ID: 20250524-milbeaut-5c0267202e2c
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taichi Sugaya <sugaya.taichi@socionext.com>, 
 Takao Orito <orito.takao@socionext.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_094929_897097_BBCB02FA 
X-CRM114-Status: GOOD (  18.32  )
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

Convert SOCIONEXT Milbeaut SDHCI controller binding to YAML format.
Add a new property "voltage-ranges" to resolve dt_check errors.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
Changes in v2:
- Change the description for the property "voltage-ranges".
- Link to v1: https://lore.kernel.org/r/20251023-milbeaut-v1-1-3e4ff67110ad@gmail.com
---
 .../devicetree/bindings/mmc/sdhci-milbeaut.txt     | 30 --------
 .../mmc/socionext,milbeaut-m10v-sdhci-3.0.yaml     | 79 ++++++++++++++++++++++
 2 files changed, 79 insertions(+), 30 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-milbeaut.txt b/Documentation/devicetree/bindings/mmc/sdhci-milbeaut.txt
deleted file mode 100644
index 627ee89c125b..000000000000
--- a/Documentation/devicetree/bindings/mmc/sdhci-milbeaut.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-* SOCIONEXT Milbeaut SDHCI controller
-
-This file documents differences between the core properties in mmc.txt
-and the properties used by the sdhci_milbeaut driver.
-
-Required properties:
-- compatible: "socionext,milbeaut-m10v-sdhci-3.0"
-- clocks: Must contain an entry for each entry in clock-names. It is a
-  list of phandles and clock-specifier pairs.
-  See ../clocks/clock-bindings.txt for details.
-- clock-names: Should contain the following two entries:
-	"iface" - clock used for sdhci interface
-	"core"  - core clock for sdhci controller
-
-Optional properties:
-- fujitsu,cmd-dat-delay-select: boolean property indicating that this host
-  requires the CMD_DAT_DELAY control to be enabled.
-
-Example:
-	sdhci3: mmc@1b010000 {
-		compatible = "socionext,milbeaut-m10v-sdhci-3.0";
-		reg = <0x1b010000 0x10000>;
-		interrupts = <0 265 0x4>;
-		voltage-ranges = <3300 3300>;
-		bus-width = <4>;
-		clocks = <&clk 7>, <&ahb_clk>;
-		clock-names = "core", "iface";
-		cap-sdio-irq;
-		fujitsu,cmd-dat-delay-select;
-	};
diff --git a/Documentation/devicetree/bindings/mmc/socionext,milbeaut-m10v-sdhci-3.0.yaml b/Documentation/devicetree/bindings/mmc/socionext,milbeaut-m10v-sdhci-3.0.yaml
new file mode 100644
index 000000000000..2ba53626a959
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/socionext,milbeaut-m10v-sdhci-3.0.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/socionext,milbeaut-m10v-sdhci-3.0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SOCIONEXT Milbeaut SDHCI controller
+
+maintainers:
+  - Taichi Sugaya <sugaya.taichi@socionext.com>
+  - Takao Orito <orito.takao@socionext.com>
+
+description:
+  The SOCIONEXT Milbeaut SDHCI controller is a specialized SD Host
+  Controller found in some of Socionext's Milbeaut image processing SoCs.
+  It features a dedicated "bridge controller." This bridge controller
+  implements special functions like reset control, clock management for
+  various SDR modes (SDR12, SDR25, SDR50) and physical pin property settings.
+
+allOf:
+  - $ref: sdhci-common.yaml#
+
+properties:
+  compatible:
+    const: socionext,milbeaut-m10v-sdhci-3.0
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+
+  fujitsu,cmd-dat-delay-select:
+    description:
+      Its presence indicates that the controller requires a specific command
+      and data line delay selection mechanism for proper operation, particularly
+      when dealing with high-speed SD/eMMC modes.
+    type: boolean
+
+  voltage-ranges:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    items:
+      items:
+        - description: minimum slot voltage (mV).
+        - description: maximum slot voltage (mV).
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    mmc@1b010000 {
+        compatible = "socionext,milbeaut-m10v-sdhci-3.0";
+        reg = <0x1b010000 0x10000>;
+        interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
+        voltage-ranges = <3300 3300>;
+        bus-width = <4>;
+        clocks = <&clk 7>, <&ahb_clk>;
+        clock-names = "core", "iface";
+        cap-sdio-irq;
+        fujitsu,cmd-dat-delay-select;
+    };
+...

---
base-commit: 7bac2c97af4078d7a627500c9bcdd5b033f97718
change-id: 20250524-milbeaut-5c0267202e2c

Best regards,
-- 
Charan Pedumuru <charan.pedumuru@gmail.com>


