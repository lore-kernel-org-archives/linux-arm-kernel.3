Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EDE3C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 07:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j+wS3VO76uiWIMKpgH/YayG/py8IuihOzEQEPls+nPs=; b=DtGGw+zKxIPXJ3jE06tqiJ3ejV
	1IxJZQ1MjAAk5ylgXl2sZveD4VN8vLbvmjLMukvvqsUHGqBHTzoWonLp20NMzhkCSK72BUlnwduHL
	H9ncABrzurzNyyeu381uiJQJPemTVYswcknyGEZ1DjMwnb06WS+EoEnog575GnT4g4xyl4Kcaefwi
	3CzErJmq97hWexhy00hGd3dxjOpSYNVdx8CIF+waMJ025G3GexR1Fi6No9Ni+wYosbmav2W44wIaX
	WWhEDlaF2QOJCHd0/p96rrhPfMY57t0+6iAk6GZEWd3aLvdwMoFKEh2vRthzChu4TatuFjoXmAA6D
	2DYFOV+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA1d6-0000000BxNg-3sp9;
	Wed, 30 Apr 2025 07:13:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA1XR-0000000BwSr-0a4M
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Apr 2025 07:07:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=j+wS3VO76uiWIMKpgH/YayG/py8IuihOzEQEPls+nPs=; b=IsDT+D6frd9faTlCJH1PEP4ENc
	W1EElxTmx7tCCSzp7Qi0aiRMdv0Wk9M67aYW8MiZF5xLm76+qIBszZoMbIgEIt4+p2rvJ99+kWNCR
	uePO8Th8UpqFRIGgrseb+ihZ7JL2xWVGLyIa5sHIIbP59H2EO6NJapHKvtSYTZu1ZKV34geXQYuUJ
	S43PSi8XCxbMzaJnvDB0caODFVmypzIqfnEIvSSp0x+ZCU6aX4WBuecF6lazyN31xYL/QfzjJHJQi
	MB5Uj3t79ZSMjTnaCfld95gOjpeIW8exGhsna4qhd/i/OCnxNAoawZ1Ypc0g5bdXNPGIXbp13kHn4
	lo/P8R1Q==;
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uA1XK-0000000DiNn-3rY4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 07:07:22 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5edc07c777eso8672459a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 00:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745996835; x=1746601635; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j+wS3VO76uiWIMKpgH/YayG/py8IuihOzEQEPls+nPs=;
        b=SSnWbrGRS4UPJwYMqSE3Q2AbA+AlQP57HBYLiJ+TZdoputqJB98VseD/+1OBsi301B
         k0FInlabWGGX0bXiv6L+QJg8Y5mBEDgIORXkq1BPyh5gPCknsHbZbDUL6ZZ1ikzWwvZb
         qCR7q3V7BxLRWN42NY4h7BlxdXgfP2cno9jJvPdRMtmSg470KBlrZ+y5gwceK7MtJgT0
         Hjc54QjprF5Ftt0BNM6+ai3rNhJhiYCEsN6BfnLVpAZrlOVKZLzea5VgIJ6YR/6o5TyQ
         0uujbF5rcLjvWGqhNBAwoc9Z2TspWELjB2ULchtTqQTYO1+lewNR8yITXNIY0wyz3SP7
         Mcuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745996835; x=1746601635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j+wS3VO76uiWIMKpgH/YayG/py8IuihOzEQEPls+nPs=;
        b=tNOLPBNHwW4M9eYrxpjsS0gdFBCpfXdZnDEXb3eBB1Fqfvhsv0hZKUEdKGOPQCw7Ic
         60l4Egsur+RuTteAx2tjvwIEJa3x7SyRBDqKiiZ6o5qa3FfA4HH1pdSmf6td9yoKOZsi
         t6fLf1vRYUkLSzqrawfpsbJqcbmHhiWkCpr6ZxITHNkOBtn2WNcEiTHQDpWmLJI+vw+E
         zlcVU1vHG0vguQ/K8o5KHhKMiZg2+q62yrvg3Chrfs4xtZVQ751jBVFi2jZ9Igc2sE7O
         7wF59GacmXf+eODCNKyruuwYNexlQa6QVQ3tbgA+lsKGgFMAxoLqi4kudbGaWUZ/wuuN
         q+Gw==
X-Forwarded-Encrypted: i=1; AJvYcCX/7u0BvBlSSrOy4x1N6ewLk+huhAYSLpoWWliDe0+TDxJn+g7Tvlp67sJ5Fl3/Dz0OkOPLpO9GgPD5SCJFanRa@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1W/fDt2HwmTghyV6Jyu/J2za39F3vKSx+a66rtRoiYCgImfof
	6y9c/krrUdv/F28qQw+9Dr1edfB8jyIFbRWrTHD7ZW0ROHv3J3Xt
X-Gm-Gg: ASbGncs1w4lbddGhZufrNYleyhnSwgFHfuCpt/gJu9A3QeFySfWVNx50Ovy3L7psOqR
	uhdd3pR7u96H/lZS6lGz9AU8bQ88RL1XJcn0kVNDcLtr6X+D1h1m4B6uUdKK3R9B44au0stiVAp
	ACbF7qQITd00VcfMG9a1Q2E5JNF/hZVH/FUwVgTdZy+E9IrtnQl/DmGzKLbhrcQ6xDY2zQ30r+m
	ePFwoI65oC+vzLjJpsLSpVmdLZu2Hbv/Ia/HfUhTU6JU4wy4n4XsU4ARExvLDlDhYIbzebO02GN
	ZRCvuyXE7herCZuPv8mr9ivgJGVFtfRirzrQdJ/fuk7GdCqQ6ivF6Qr5xkHNGvBU3yNERL+VVkF
	oyir+54jGtDg=
X-Google-Smtp-Source: AGHT+IF8YcdVIQsW+av/zWPED4/GHseUdFL2jDaJFueKLvx4eO70MR2lAPoD1hagrMkiNDrWXsCT1g==
X-Received: by 2002:a05:6402:1ed1:b0:5f7:2ac6:c280 with SMTP id 4fb4d7f45d1cf-5f89bf16568mr1538686a12.25.1745996835194;
        Wed, 30 Apr 2025 00:07:15 -0700 (PDT)
Received: from hex.my.domain (83.8.121.197.ipv4.supernova.orange.pl. [83.8.121.197])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7013fec3csm8334314a12.19.2025.04.30.00.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 00:07:14 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Wed, 30 Apr 2025 09:07:05 +0200
Subject: [PATCH v8 1/9] dt-bindings: mfd: brcm,bcm59056: Convert to YAML
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-bcm59054-v8-1-e4cf638169a4@gmail.com>
References: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
In-Reply-To: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Stanislav Jakubek <stano.jakubek@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745996831; l=6215;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=ju68suXj1FdMPTHt/69qtVE6zoVM1v0L/Oo4fVZxJiY=;
 b=sEbrd2fyF3UCVeEPTC6UFVUrpDMVxzLCz1y+D4iZMYb+dYiNCqah1008aGiiefT6H9jkjbRM2
 FxqL/0feelDATxscPAhgncK14jjYc5mLyd1cZZq1JBzO6XNVlXQ9qjA
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_080719_684055_CC8DFE2A 
X-CRM114-Status: GOOD (  18.68  )
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

Convert devicetree bindings for the Broadcom BCM59056 PMU MFD from
TXT to YAML format. This patch does not change any functionality;
the bindings remain the same.

The bindings have been split into two parts: the MFD binding and
a separate binding for the regulator node, to simplify the addition
of other models later (which have different regulators).

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v6:
- Replace mfd/brcm,bcm590xx.yaml with mfd/brcm,bcm59056.yaml

Changes in v5:
- Replace mfd/brcm,bcm59056.yaml with mfd/brcm,bcm590xx.yaml in
  regulator binding description

Changes in v4:
- Made $ref use full schema path
- Cleaned up example
- Dropped regulator name list comment
- Changed description of regulator binding to mention BCM59056
  explicitly
- Changed "Power Management IC" to "Power Management Unit" to match
  official Broadcom naming
- Renamed mfd/brcm,bcm59056.yaml to mfd/brcm,bcm590xx.yaml

Changes in v3:
- Moved regulator node to separate binding
- Removed quotes around compatibles/vbus property
- Style fixes for example
---
 .../devicetree/bindings/mfd/brcm,bcm59056.txt      | 39 ----------------
 .../devicetree/bindings/mfd/brcm,bcm59056.yaml     | 54 ++++++++++++++++++++++
 .../bindings/regulator/brcm,bcm59056.yaml          | 51 ++++++++++++++++++++
 3 files changed, 105 insertions(+), 39 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/brcm,bcm59056.txt b/Documentation/devicetree/bindings/mfd/brcm,bcm59056.txt
deleted file mode 100644
index be51a15e05f926913b3a473648d977b25f1a2fbc..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/mfd/brcm,bcm59056.txt
+++ /dev/null
@@ -1,39 +0,0 @@
--------------------------------
-BCM590xx Power Management Units
--------------------------------
-
-Required properties:
-- compatible: "brcm,bcm59056"
-- reg: I2C slave address
-- interrupts: interrupt for the PMU. Generic interrupt client node bindings
-  are described in interrupt-controller/interrupts.txt
-
-------------------
-Voltage Regulators
-------------------
-
-Optional child nodes:
-- regulators: container node for regulators following the generic
-  regulator binding in regulator/regulator.txt
-
-  The valid regulator node names for BCM59056 are:
-  	rfldo, camldo1, camldo2, simldo1, simldo2, sdldo, sdxldo,
-	mmcldo1, mmcldo2, audldo, micldo, usbldo, vibldo,
-	csr, iosr1, iosr2, msr, sdsr1, sdsr2, vsr,
-	gpldo1, gpldo2, gpldo3, gpldo4, gpldo5, gpldo6,
-	vbus
-
-Example:
-	pmu: bcm59056@8 {
-		compatible = "brcm,bcm59056";
-		reg = <0x08>;
-		interrupts = <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
-		regulators {
-			rfldo_reg: rfldo {
-				regulator-min-microvolt = <1200000>;
-				regulator-max-microvolt = <3300000>;
-			};
-
-			...
-		};
-	};
diff --git a/Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml b/Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..b387ef9885c3ac524e0782545dbca9c0e81a556c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/brcm,bcm59056.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM590xx Power Management Units
+
+maintainers:
+  - Artur Weber <aweber.kernel@gmail.com>
+
+properties:
+  compatible:
+    const: brcm,bcm59056
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  regulators:
+    type: object
+    $ref: /schemas/regulator/brcm,bcm59056.yaml#
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@8 {
+            compatible = "brcm,bcm59056";
+            reg = <0x08>;
+            interrupts = <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
+
+            regulators {
+                rfldo {
+                    regulator-min-microvolt = <1200000>;
+                    regulator-max-microvolt = <3300000>;
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/regulator/brcm,bcm59056.yaml b/Documentation/devicetree/bindings/regulator/brcm,bcm59056.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..7a5e36394d216232e0a2070fb20d09dcc1ea8056
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/brcm,bcm59056.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/brcm,bcm59056.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM59056 Power Management Unit regulators
+
+description: |
+  This is a part of device tree bindings for the BCM59056 power
+  management unit.
+
+  See Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml for
+  additional information and example.
+
+maintainers:
+  - Artur Weber <aweber.kernel@gmail.com>
+
+patternProperties:
+  "^(cam|sim|mmc)ldo[1-2]$":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+
+  "^(rf|sd|sdx|aud|mic|usb|vib)ldo$":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+
+  "^(c|m|v)sr$":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+
+  "^(io|sd)sr[1-2]$":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+
+  "^gpldo[1-6]$":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+
+properties:
+  vbus:
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+
+additionalProperties: false

-- 
2.49.0


