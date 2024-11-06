Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3BCD59F41
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 15:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TxZUEYefO8cHk0O3pZ6pSrkyLEtM/cjRFYGqJjEkBSc=; b=RDlFSjNPCU5WYf5q1ngf0uBd54
	PGqxJA8j0DGTLxXcHtFh9J7Q4GgpKrTJQtzjcHHthK8firejFPh2nbaF7Qjg8lWtl+oOEBWHz0yU6
	rZncUUtsTf8Lgyi+6IvMJzjETFxQi8RdVlgLnin9ozAwzLhX2icmCOhtApi87uy1XJ+KFmPi20OC9
	D4BigohghDO/Yet7P4jovuyA/1C38hJIVEBz3F0I3Uay13Or3pqH5wu0BpliPlMrkK8qYl1UmzJc2
	zSV13HgEdMhT+IKmnq6Ne0X/uOOzqbtpWlLziMccEpoKQvrK3wW94av2VHXPOnEcxNjsCnajT+KT3
	iEKcUOqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8i4n-00000003qGk-32XY;
	Wed, 06 Nov 2024 15:36:09 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8i0Z-00000003pJy-2pwa;
	Wed, 06 Nov 2024 15:31:49 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a9a0c7abaa6so801545166b.2;
        Wed, 06 Nov 2024 07:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730907105; x=1731511905; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TxZUEYefO8cHk0O3pZ6pSrkyLEtM/cjRFYGqJjEkBSc=;
        b=AU+glQXAXWfXYQFEtrGoXZWdvP/m8bUQstqWRlsgkfDVthvAN061jqy1DmSSQHaFRX
         Q+j0q0kC7pRcmdZIqKFu+pqDrmMEGiCfl4Wn+g6otxCeBFAQ1g925RAMn0wisPHjesy/
         kwGc/giNNJ8P78CINwLj/EkhHGPRUy9cj/7LF1zqESSw/wJl3eF4hVDO4nAUl1l1Ie7t
         rnA6Lq68B+giWn62zSIG7PS1L5QqldWztECYL4SEmP0EsQb0J8a7gpyBGACwMDGnKZT2
         8q+OT8mc2hgcx3N8X/pHNkOub66KcMob8BeYVAwUejz/bAujEykXwCnkAv1/Dp4MTtGW
         YgXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730907105; x=1731511905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TxZUEYefO8cHk0O3pZ6pSrkyLEtM/cjRFYGqJjEkBSc=;
        b=dl0QvgyziBvn98JyUWSQp2p1IyADsv4yir8ut5GxEufuyQjur0+Ni9RRli7eQAD5aY
         JRjpOOtwGrJTAl/Z+TBKFrtNBU9oQITpWDOQ3H0OS3YE3xIfDMjX1brn2GoGRlO3oVgj
         X6aB8PFjjifTJzmD2F/DWaJYZJwa4RP4FVJdeLDkAGQh4uhVtVjXwyoGIT5EpP4gzqzS
         QwYW6IVhD1lSwGtJqoStfIAqyLiG7RjqyiUk4+/YxNb6T9XYa5UWV85GetmNMUvUgonh
         B0HMy4rcqNnjpXtLX7NB39EtgPUlf/4EEHxJe2T9itqNbC8ww8o5grfEJ4xCBejX3BRY
         7TLw==
X-Forwarded-Encrypted: i=1; AJvYcCXewlgUi4OUJXpe9dT+QvEZbV9wwTg1WrahFtah33mrKbnDcZ8pLdYriohBFYVqL+ewosBpcQOf+FPKXkK+RPLZZg==@lists.infradead.org, AJvYcCXvHqbrEa0PFGQLW9GHT9hZGuuxeFt/GHvLppG6tYOKDEhuFcwLfs4x2s9JMGKjSh5NyypWJbt8bItAPTTn@lists.infradead.org
X-Gm-Message-State: AOJu0YwstJ0QDrKeHSeOcybPYA1MfN+P3Kvr8nNOqIaRFU79qdE6aMFj
	gKmLo6lHJDmZnVI4NhH2zIMYS73HFgngvAmPqxE2qwYarp8Sy6WjSwi1zg==
X-Google-Smtp-Source: AGHT+IF0ZzyBdcVslRwOSTjEHqwVoJnmjkaO24ZdQOt67CgbkGTe+T3MfKCDKsQIMoe5M16dlGZRtg==
X-Received: by 2002:a17:906:6a12:b0:a9a:1778:7024 with SMTP id a640c23a62f3a-a9e65576989mr2245715566b.20.1730907105078;
        Wed, 06 Nov 2024 07:31:45 -0800 (PST)
Received: from ivaylo-T580.. (miroral.stz.ddns.bulsat.com. [91.139.249.115])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb17cecd7sm302227066b.100.2024.11.06.07.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 07:31:44 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: clock: actions,owl-cmu: convert to YAML
Date: Wed,  6 Nov 2024 17:31:41 +0200
Message-ID: <20241106153141.375389-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_073147_740314_4EA3637C 
X-CRM114-Status: GOOD (  19.78  )
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
v2: drop address and size cells from example
---
 .../bindings/clock/actions,owl-cmu.txt        | 52 -----------------
 .../bindings/clock/actions,owl-cmu.yaml       | 57 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 58 insertions(+), 53 deletions(-)
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
index 000000000..3504f70eb
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/actions,owl-cmu.yaml
@@ -0,0 +1,57 @@
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
+    cmu: clock-controller@e0160000 {
+       compatible = "actions,s900-cmu";
+       reg = <0xe0160000 0x1000>;
+       clocks = <&hosc>, <&losc>;
+       #clock-cells = <1>;
+       #reset-cells = <1>;
+     };
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


