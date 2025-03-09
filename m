Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17613C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 17:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Ct+nLBWlOvgUgLvId9aYXXOn9pzyLYiT5kel7HrrGs=; b=jxyQoFYxpfPxoz67qMyJDgdJoh
	8LHp/9aml5Tvm9qretS3DxorEZXdWLmLMOb6FWLI4HEes2ht0+AmIKCl7xp420D0Ld7dZkegK2wDB
	6G3h/aETNwNH9bFvUn6miyFH+QSRRdGjAi3Fj09gfbArbZ7fDXRY9jCQkcxFtO+SBNdJwYB09vv2/
	AZqlPaGfxLuCm/+CilTRLs7PNAfzeMUWzHJq0NNQQpC6iK+P4QimquNeUdmFbiysR8oyQU20rOgQg
	2XpXyhs/3yVl9blsxuHpHBCnQ66jgxfFiyo7IpaVfkS1GpJMGLePXTSaLouQcNqmJukjsiTON2ZnQ
	nW7UO+ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trKXl-00000000rDj-2Nmi;
	Sun, 09 Mar 2025 17:34:29 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trKRM-00000000ppw-3Urd;
	Sun, 09 Mar 2025 17:27:54 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso19963485e9.0;
        Sun, 09 Mar 2025 10:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741541271; x=1742146071; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Ct+nLBWlOvgUgLvId9aYXXOn9pzyLYiT5kel7HrrGs=;
        b=Dd6ZC7kwZZBW1A4/8sjWzSdI5MXgJvoSaXgQdIY7vL6H+y1oxw4p6hDTsfw8Ytm6VU
         OivTn1tWYEO2TNVPTpRyJdfuoQTbf8WGo6KTvt004B2HcbevWulUqZV8fvNFiY70BuPP
         xvygWgFhIyixKmRj1qjgsVxJuhfSbuyDjyb4RmMTJ/zFFpQOScP97jnEFB5wnex9gfof
         5hezXYmO92Al/vsk1X2rEaPAxpbvyZyjeAkwdlcQBLfNalSJgAPag78DxhnbR08Kn76V
         sdeAWrFZjUDV52ki4+Mzv6HjP5Vdd87PUav0VjDZA6RG9vjfddmguF3cNN5AH2KrWAkM
         poXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741541271; x=1742146071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Ct+nLBWlOvgUgLvId9aYXXOn9pzyLYiT5kel7HrrGs=;
        b=LGb075d0oWUk2VRWZUc7unGQ97vAO6lwLRzi97133GWY8ytoq7Y4pnh9QXkqCY5K+b
         8jRIeePDL0AHA5C2TrJ59J3+kqwk6G+Pv9KvmIdmy4lvXVguHW3X3GGGPR9me5q26gxz
         QXDOuMlBM8LBr0bEAfG6YvqFLA5+A4aOhEAAYx6qBJUTCcUFoYSpFtu2LR172BvVkiKr
         84XtXtr8TzWSuAdAZyEHZtNtpWyWigItiYQgm1hrylwuEz8owYvYauJyZUGe1DaMapF7
         S+htEfdYDPLO/RrtDkMSvbfmxW3WeIn+y9eoYdFUdFWbm2Yy/S2fzXswyc07oldPX2Vv
         Cmug==
X-Forwarded-Encrypted: i=1; AJvYcCVMmhybgocmiaZhiLe73EDxe/tz4wQeYFqTNBDSaa64OoRmWG5Sdl9vpCXH70ISWsMRTCj7zZVLFAIA283cHLM=@lists.infradead.org, AJvYcCWgcYLVFzrFsWTHm7iKdSH9gAE9jFZhdXjevmMUAcyP9x+9c+ZdeT1BCvuAktBzarKp7hWbapefYpVBuwBHAv+a@lists.infradead.org
X-Gm-Message-State: AOJu0YzlprcktMRdO510KBQHsFY3pyqXCckviv5njsUDkv573OLzx2m1
	FQ0looZ0TGuU7xXS1bAgum8lVkoHLfmOnKtYL2IAZXlRKbE7WhR2
X-Gm-Gg: ASbGncs7C+/EGWGT0POPm2c2LFDHCjFwJ5BZzi4+lAqYABjRCifwlRE9oWpcFmBKPcd
	Qk7zRjX31v8aVMtLM4qOtgIcamwPEc+25pbBRQnlvdoMmxXowM9KdIoWryZkKuK+FSBazEuE6R3
	D0RvqrPAX9c1s5oHGG1wOWDmhRymrxXcDa4pnDVBKlmW8qe9M2fE8vATfHZx+T9wnD463XwUT5I
	3e421bU9Dpn5TfwALHmelwgJZIQ0ny52l1YRnsQ2IX98z788gkaHpMdnG0+pXU2VJWgK5XSWNMI
	br8QielLhX9ovZ+EAze6ynY140f9IPSaxwM+VKIn6ya6+cFUmUQODRhoJU+WPT1s+QcZsxuk/9m
	xC2ze0ib3AVs9mg==
X-Google-Smtp-Source: AGHT+IE9KwI0NQaw6bpM/y6LBoMaIMedmrg0FquztdYIwmh9PZB6VNNmJkRIVYkZk60l2A3A+lIkeA==
X-Received: by 2002:a05:600c:5120:b0:43c:f85d:1245 with SMTP id 5b1f17b1804b1-43cf85d1427mr6009195e9.17.1741541270763;
        Sun, 09 Mar 2025 10:27:50 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3912bfdfddcsm12564875f8f.35.2025.03.09.10.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 10:27:50 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	upstream@airoha.com
Subject: [net-next PATCH v12 03/13] dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch
Date: Sun,  9 Mar 2025 18:26:48 +0100
Message-ID: <20250309172717.9067-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309172717.9067-1-ansuelsmth@gmail.com>
References: <20250309172717.9067-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_102752_871864_81963B60 
X-CRM114-Status: GOOD (  18.44  )
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

Document support for Airoha AN8855 5-port Gigabit Switch.

It does expose the 5 Internal PHYs on the MDIO bus and each port
can access the Switch register space by configurting the PHY page.

Each internal PHY might require calibration with the fused EFUSE on
the switch exposed by the Airoha AN8855 SoC NVMEM.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../net/dsa/airoha,an8855-switch.yaml         | 105 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 106 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml

diff --git a/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
new file mode 100644
index 000000000000..63bcbebd6a29
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/dsa/airoha,an8855-switch.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Gigabit Switch
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  Airoha AN8855 is a 5-port Gigabit Switch.
+
+  It does expose the 5 Internal PHYs on the MDIO bus and each port
+  can access the Switch register space by configurting the PHY page.
+
+  Each internal PHY might require calibration with the fused EFUSE on
+  the switch exposed by the Airoha AN8855 SoC NVMEM.
+
+$ref: dsa.yaml#
+
+properties:
+  compatible:
+    const: airoha,an8855-switch
+
+  reset-gpios:
+    description:
+      GPIO to be used to reset the whole device
+    maxItems: 1
+
+  airoha,ext-surge:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Calibrate the internal PHY with the calibration values stored in EFUSE
+      for the r50Ohm values.
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    ethernet-switch {
+        compatible = "airoha,an8855-switch";
+        reset-gpios = <&pio 39 0>;
+
+        airoha,ext-surge;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                label = "lan1";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy1>;
+            };
+
+            port@1 {
+                reg = <1>;
+                label = "lan2";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy2>;
+            };
+
+            port@2 {
+                reg = <2>;
+                label = "lan3";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy3>;
+            };
+
+            port@3 {
+                reg = <3>;
+                label = "lan4";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy4>;
+            };
+
+            port@4 {
+                reg = <4>;
+                label = "wan";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy5>;
+            };
+
+            port@5 {
+                reg = <5>;
+                label = "cpu";
+                ethernet = <&gmac0>;
+                phy-mode = "2500base-x";
+
+                fixed-link {
+                    speed = <2500>;
+                    full-duplex;
+                    pause;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 1e8055b5e162..696ad8465ea8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -726,6 +726,7 @@ L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 L:	netdev@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
+F:	Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
 F:	Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
 
 AIROHA ETHERNET DRIVER
-- 
2.48.1


