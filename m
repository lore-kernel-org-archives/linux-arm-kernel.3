Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE71DE6F08D
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 12:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nLWzptnhbAYcuwHkPTV5EYcOi52RjfwzuyiUdLBphLI=; b=ybihEAX96XTwIjgjg7sr2tBXy2
	pQb6592wDA813CF3x/gZX2maAPtVjjk3x+iizcNJmUptYcc/Ovdla207pc379Is4v6C5KSrni6IEb
	Vzmsm8EzUArBIGBUgcYC3vsXn7f2qkBuV5C7kDeAqmCFCTdU5Z232ELfEjjZ2ZP3JmEZYvmV5qEB4
	uHHQy+1o3QIBOlO/TNW4TUD24LN20a9Cja4XIVCMuDR+q8LPb551Qovao1Z2xaOXVCsxRrE1op/6X
	fjoHo2kpd/xiKxIF3tHZF9pR8Q+bSPAe43qYkGIkAYA+fy6wtN71WYKbk2mrUO7oj1zrKOMknQiqy
	EBawBFtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Zqp-0000000BPM7-2JX4;
	Sun, 03 Nov 2024 12:37:03 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Zp9-0000000BPFg-0WD9;
	Sun, 03 Nov 2024 12:35:20 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a9a68480164so513215666b.3;
        Sun, 03 Nov 2024 04:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730637317; x=1731242117; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nLWzptnhbAYcuwHkPTV5EYcOi52RjfwzuyiUdLBphLI=;
        b=F71faSNdK77w1FbCPOZ3FwRYe40GKwAMdCwLMiiv3OkhUbuEusjROI+ESZACVPshUl
         W8Srxdhf9D/+GdkwVzSXBIXpnaAQoEnHwx9tBbkKPKpnpkIIQtQEHafoFYxFChEc7bJF
         K3HNDC4hUUwW91y50cZu7G40yQ5I5SEV33gVLNTVPJf5v0JR2A9bDrUTxofCm67aujG3
         ZPD/uIErUkH0YIj1qN9Yo/AKUys1RKVVuanDcXm1ue3jSjuvds8bzGXRmdZ/4xR7WIeg
         GQfoYBrwamTEZIjtvdUtJ/aaZdBloUoorBRxP/j71jR8h0Hq65MJOywdEQZauTQEDedg
         T85w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730637317; x=1731242117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nLWzptnhbAYcuwHkPTV5EYcOi52RjfwzuyiUdLBphLI=;
        b=IuNFouCyPo/RZ4gHK4x49a8TuS1SymtcAVf+y42/tqclj4gRSzk+vR4mLwXeKZqlG/
         BFLeYWn7xHLteBwKGdrS4xfPmYjlpFr3Bpy1h/lG0qiDo6neaYPRj6MC+/ZawkDhJqRb
         3oekHDaN446hgALnwPF7E5ObkXJBpHOHVtiSLYJ9VAvQLMrHHQv/yRVL3zts5ix9U2+R
         tENmVeO52ydKgT8RjUbqFIea+vGfK3mG4j+ZNwdFvd1XuRnwx5e11Lr9KBJoBF0YIh0d
         AzFIc/foTEN5UEyC4k8zT/MhZFIQNKJJ6Vb5peOxm3+EciJAWQrLl+y3be6xQYOC1Rot
         1mhw==
X-Forwarded-Encrypted: i=1; AJvYcCWXlaBewehmcPYnxCJzeDnY+Ir3HY4or1gOyahfh9x2iTbNooYGNjtI0JgDKGt9ncjWb/rViW5ezk56ZpBYnHDE@lists.infradead.org
X-Gm-Message-State: AOJu0YyBRsjKErUE8SM6kpNWWrrjLguW7lOmWQi8lnsJotgbRt8tIxZH
	aLVv/8uMEIIYoNzhrz6H9vQONaGOKuwQVIQd6gYLWmUpWcDFkDHB
X-Google-Smtp-Source: AGHT+IHXfkrHb7besGkh4Nbcj39gl2gY+KXPI9aF9iT7CR5AegIJ0eV9DFkX1G+cTTqp04nuc7chCg==
X-Received: by 2002:a17:907:7f9f:b0:a9a:be:37f8 with SMTP id a640c23a62f3a-a9de61675a4mr3072270166b.43.1730637317039;
        Sun, 03 Nov 2024 04:35:17 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e566797a7sm418754866b.190.2024.11.03.04.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 04:35:16 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: linux-actions@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: timer: actions,owl-timer: convert to YAML
Date: Sun,  3 Nov 2024 14:35:11 +0200
Message-ID: <20241103123513.2890107-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_043519_195658_6AD5EBAB 
X-CRM114-Status: GOOD (  18.04  )
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

Convert the Actions Semi Owl timer bindings to DT schema.

Changes during conversion:
 - Add a description
 - Add "clocks" as a required property, since the driver searches for it
 - Correct the given example according to owl-s500.dtsi

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
v2: update commit message to be accurate (Krzysztof)
v2: don't preserve formatting in the description (Krzysztof)
v2: add allOf:if:then block constraining per variant (Krzysztof)
v2: add a blank line after additionalProperties (Krzysztof)
---
 .../bindings/timer/actions,owl-timer.txt      |  21 ----
 .../bindings/timer/actions,owl-timer.yaml     | 107 ++++++++++++++++++
 MAINTAINERS                                   |   2 +-
 3 files changed, 108 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/actions,owl-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/actions,owl-timer.yaml

diff --git a/Documentation/devicetree/bindings/timer/actions,owl-timer.txt b/Documentation/devicetree/bindings/timer/actions,owl-timer.txt
deleted file mode 100644
index 977054f87..000000000
--- a/Documentation/devicetree/bindings/timer/actions,owl-timer.txt
+++ /dev/null
@@ -1,21 +0,0 @@
-Actions Semi Owl Timer
-
-Required properties:
-- compatible      :  "actions,s500-timer" for S500
-                     "actions,s700-timer" for S700
-                     "actions,s900-timer" for S900
-- reg             :  Offset and length of the register set for the device.
-- interrupts      :  Should contain the interrupts.
-- interrupt-names :  Valid names are: "2hz0", "2hz1",
-                                      "timer0", "timer1", "timer2", "timer3"
-                     See ../resource-names.txt
-
-Example:
-
-		timer@b0168000 {
-			compatible = "actions,s500-timer";
-			reg = <0xb0168000 0x100>;
-			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
-			             <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "timer0", "timer1";
-		};
diff --git a/Documentation/devicetree/bindings/timer/actions,owl-timer.yaml b/Documentation/devicetree/bindings/timer/actions,owl-timer.yaml
new file mode 100644
index 000000000..646c554a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/actions,owl-timer.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/actions,owl-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Actions Semi Owl timer
+
+maintainers:
+  - Andreas Färber <afaerber@suse.de>
+
+description:
+  Actions Semi Owl SoCs provide 32bit and 2Hz timers.
+  The 32bit timers support dynamic irq, as well as one-shot mode.
+
+properties:
+  compatible:
+    enum:
+      - actions,s500-timer
+      - actions,s700-timer
+      - actions,s900-timer
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    maxItems: 6
+
+  interrupt-names:
+    minItems: 1
+    maxItems: 6
+    items:
+      enum:
+        - 2hz0
+        - 2hz1
+        - timer0
+        - timer1
+        - timer2
+        - timer3
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+  - interrupts
+  - interrupt-names
+  - reg
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - actions,s500-timer
+    then:
+      properties:
+        interrupts:
+          minItems: 4
+          maxItems: 4
+        interrupt-names:
+          items:
+            - const: 2hz0
+            - const: 2hz1
+            - const: timer0
+            - const: timer1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - actions,s700-timer
+              - actions,s900-timer
+    then:
+      properties:
+        interrupts:
+          minItems: 1
+          maxItems: 1
+        interrupt-names:
+          items:
+            - const: timer1
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    soc {
+      #address-cells = <1>;
+      #size-cells = <1>;
+      timer@b0168000 {
+        compatible = "actions,s500-timer";
+        reg = <0xb0168000 0x100>;
+        clocks = <&hosc>;
+        interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "2hz0", "2hz1", "timer0", "timer1";
+      };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 5f34d168b..76ea65128 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2024,7 +2024,7 @@ F:	Documentation/devicetree/bindings/mmc/owl-mmc.yaml
 F:	Documentation/devicetree/bindings/net/actions,owl-emac.yaml
 F:	Documentation/devicetree/bindings/pinctrl/actions,*
 F:	Documentation/devicetree/bindings/power/actions,owl-sps.txt
-F:	Documentation/devicetree/bindings/timer/actions,owl-timer.txt
+F:	Documentation/devicetree/bindings/timer/actions,owl-timer.yaml
 F:	arch/arm/boot/dts/actions/
 F:	arch/arm/mach-actions/
 F:	arch/arm64/boot/dts/actions/
-- 
2.43.0


