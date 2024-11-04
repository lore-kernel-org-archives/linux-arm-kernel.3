Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3C5D132DF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 15:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d/3LogGj4xkkr4o1UTB8qXkiTCCsI8G7HemaQt+AbGo=; b=j/26Y00SECi4L/5h0cXf9J3NsY
	ScIVJ0ED8ORNBSf7bdFatkMDwxIgjlT8U/diK/CABXKuqbLytiddKGUkGWleFdrsIPDh1n2JxbQSd
	bEc1sNtxebytyn66SgpACh6K9kXYFdLSHS1RsawyoNsxmKm1jJzrLBE+U9qALw0FC6cG6I6iyUqZT
	HDFVxnuPNgxihE1HYdbramMeQdTLTey0FyKRhn2ujKjubgePLCNz8vM5mXv9HQGAN8E34HSyEynOD
	akKY7zg18RHpSq29m3MY+BEzqMH31dCPMa16e6XaR2q/O8s75SIOzRycNmSDRzdlnF6GjCn+sfFu2
	gxjA3Hjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7zAk-0000000EEV3-2Ua5;
	Mon, 04 Nov 2024 15:39:18 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7z34-0000000EDJp-0ki5;
	Mon, 04 Nov 2024 15:31:23 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a9a68480164so689611166b.3;
        Mon, 04 Nov 2024 07:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730734279; x=1731339079; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d/3LogGj4xkkr4o1UTB8qXkiTCCsI8G7HemaQt+AbGo=;
        b=XWT5Os3Aq/xYzIN2goHtmmroS68PTF5hCN6TTIXgNxUcYttCwhS7MEinD0/qOhcv8p
         Ht+0k8Fa9Ws10D3m0FDLFiCjMkMtYsVIguk0UnFRc8CZTIgzcbTIzaZhWh0v2H/tP/7/
         YGkXRzgcOy2RThhkPV35tEwVfsSzDpAskt7bIPQ1xcfygKx/oSd2HAPUN86zyqA//obU
         DyrceUI7d0xXocAAR8kMUvqcQXTPOt4J9FOaGRx6OaZ9KPbFmmlpZ5viWBzRWxgzBrUR
         sHDE0fDBnXUTxbALJmMMy23IkgQ/f1m6yvxaV/z5I3Y/RVh2xwaOg9lBZJvnGv6pGU+t
         4wpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730734279; x=1731339079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d/3LogGj4xkkr4o1UTB8qXkiTCCsI8G7HemaQt+AbGo=;
        b=xI00xCaE6ogwIdM+qwTY2W51D8ng2zvR8bKDReB9ZxTdehd20MSVQ0W1Z4C5PO/XC1
         xPosG/CAkNB7fcB2kYDaJcJDx25I+IpAbwYsavs2DlhTW9+43H+q7WrCNZgZVx65UR6T
         66iOtcnsbOWyvwGOBzlp5/dIwdqu6yxUQkz9q/Eoy0hDEPn/qyelFZgHHUDKhX6IpWc+
         EAjn27F/cyr1X8lsCMh5vgn7qa7v+RErz7gXdHhnI4JmXZexuGyhsqyWgmi9upj2sDfa
         ZL5vJTRBEtLy9+XM5J7uBSDgTg7Yq5h8elDiXVINuWeWmTSar7Ldexf3DhqfgrJwfQ5C
         USOQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1Icm0at+d2/gdPXfWkZKHW3Gm5Y1E6S/5FceXcYiyV+/PSAz5Ly26qKR5wmn7M6jdUVK45DioCZaL/T7kZ7Sq@lists.infradead.org
X-Gm-Message-State: AOJu0YxQNyCJO6ZjGM/Hx/op2FkWEpX7hVSjV6FFLizLF2L9++Ybrvrz
	AO2PXNl0Yh4585LBqKw70UwQhDZ66/tNdDjerp6DRFSgDOUCl67H2djVgg==
X-Google-Smtp-Source: AGHT+IGRcKbIwGQbBQLPAesO3IxNhJ0Y1eyNVqxLs9jLYjV9pVflKzinTtL7MsseoMNKn2MXv+3bkA==
X-Received: by 2002:a17:907:7f0e:b0:a9a:9df:5580 with SMTP id a640c23a62f3a-a9de5ce6778mr3147777866b.19.1730734279190;
        Mon, 04 Nov 2024 07:31:19 -0800 (PST)
Received: from ivaylo-T580.. (miroral.stz.ddns.bulsat.com. [91.139.249.115])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e56649363sm559817166b.184.2024.11.04.07.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 07:31:18 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: linux-actions@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] dt-bindings: clock: actions,owl-cmu: convert to YAML
Date: Mon,  4 Nov 2024 17:31:08 +0200
Message-ID: <20241104153108.3053932-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_073122_307139_AE6D037E 
X-CRM114-Status: GOOD (  20.54  )
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

Convert the Actions Semi Owl CMU bindings to DT schema.

Changes during conversion:
 - Since all Actions Semi Owl SoCs utilize the internal low frequency
   oscillator as a parent for some clocks, require it.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../bindings/clock/actions,owl-cmu.txt        | 52 ----------------
 .../bindings/clock/actions,owl-cmu.yaml       | 61 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 62 insertions(+), 53 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/actions,owl-cmu.txt
 create mode 100644 Documentation/devicetree/bindings/clock/actions,owl-cmu.yaml

diff --git a/Documentation/devicetree/bindings/clock/actions,owl-cmu.txt b/Documentation/devicetree/bindings/clock/actions,owl-cmu.txt
deleted file mode 100644
index d19885b7c..000000000
--- a/Documentation/devicetree/bindings/clock/actions,owl-cmu.txt
+++ /dev/null
@@ -1,52 +0,0 @@
-* Actions Semi Owl Clock Management Unit (CMU)
-
-The Actions Semi Owl Clock Management Unit generates and supplies clock
-to various controllers within the SoC. The clock binding described here is
-applicable to S900, S700 and S500 SoC's.
-
-Required Properties:
-
-- compatible: should be one of the following,
-	"actions,s900-cmu"
-	"actions,s700-cmu"
-	"actions,s500-cmu"
-- reg: physical base address of the controller and length of memory mapped
-  region.
-- clocks: Reference to the parent clocks ("hosc", "losc")
-- #clock-cells: should be 1.
-- #reset-cells: should be 1.
-
-Each clock is assigned an identifier, and client nodes can use this identifier
-to specify the clock which they consume.
-
-All available clocks are defined as preprocessor macros in corresponding
-dt-bindings/clock/actions,s900-cmu.h or actions,s700-cmu.h or
-actions,s500-cmu.h header and can be used in device tree sources.
-
-External clocks:
-
-The hosc clock used as input for the plls is generated outside the SoC. It is
-expected that it is defined using standard clock bindings as "hosc".
-
-Actions Semi S900 CMU also requires one more clock:
- - "losc" - internal low frequency oscillator
-
-Example: Clock Management Unit node:
-
-        cmu: clock-controller@e0160000 {
-                compatible = "actions,s900-cmu";
-                reg = <0x0 0xe0160000 0x0 0x1000>;
-                clocks = <&hosc>, <&losc>;
-                #clock-cells = <1>;
-                #reset-cells = <1>;
-        };
-
-Example: UART controller node that consumes clock generated by the clock
-management unit:
-
-        uart: serial@e012a000 {
-                compatible = "actions,s900-uart", "actions,owl-uart";
-                reg = <0x0 0xe012a000 0x0 0x2000>;
-                interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
-                clocks = <&cmu CLK_UART5>;
-        };
diff --git a/Documentation/devicetree/bindings/clock/actions,owl-cmu.yaml b/Documentation/devicetree/bindings/clock/actions,owl-cmu.yaml
new file mode 100644
index 000000000..e9c0dfb94
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/actions,owl-cmu.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/actions,owl-cmu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Actions Semi Owl Clock Management Unit (CMU)
+
+maintainers:
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+
+description: |
+  The Actions Semi Owl Clock Management Unit generates and supplies clock
+  to various controllers within the SoC.
+
+  All available clocks are defined as preprocessor macros in
+  include/dt-bindings/clock/ headers.
+
+properties:
+  compatible:
+    enum:
+      - actions,s500-cmu
+      - actions,s700-cmu
+      - actions,s900-cmu
+
+  clocks:
+    items:
+      - description: Host oscillator source
+      - description: Internal low frequency oscillator source
+
+  "#clock-cells":
+    const: 1
+
+  reg:
+    maxItems: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - "#clock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        cmu: clock-controller@e0160000 {
+          compatible = "actions,s900-cmu";
+          reg = <0x0 0xe0160000 0x0 0x1000>;
+          clocks = <&hosc>, <&losc>;
+          #clock-cells = <1>;
+          #reset-cells = <1>;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 420d06d37..652c9822a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2016,7 +2016,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-actions@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/arm/actions.yaml
-F:	Documentation/devicetree/bindings/clock/actions,owl-cmu.txt
+F:	Documentation/devicetree/bindings/clock/actions,owl-cmu.yaml
 F:	Documentation/devicetree/bindings/dma/owl-dma.yaml
 F:	Documentation/devicetree/bindings/i2c/i2c-owl.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/actions,owl-sirq.yaml
-- 
2.43.0


