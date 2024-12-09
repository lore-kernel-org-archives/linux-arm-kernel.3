Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2673E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 13:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E5/ugt/9XE90UyHiKgp0iBuGenILsWdEY81dJF1Vh10=; b=Ta8/wCpUHTXNH1ewxPPpLyFuyV
	SRuQzzZjMOwGkYjRRh8QWY+WUusrpeR55LGLqdZPPOfRn+rTH/ucCmXhpoBv6AIgkfZdFeEzcHlER
	/Lf4NHLDueZpDebG9LaIbUNo+1XvNnSZGQIZiAwaPVefe4Lxl1WQHd/lUhdu4YYw/YW5IeR2ZTjJg
	z1Fe+zMzqEm0tWUCmAEiOHeZvzqvxG12lTDPkh+bP2twLAY55MX5dE0AwYCg8+Ft3pXgIkAN+dpn+
	zjnm2TB2L3xzINN+oB3v85jt9XQVPNORRPpZlLnF6oGMQZsG9H92xnHKC0P9h32cM4RPYCvi95N/D
	JUB1oH+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKeA7-0000000854s-2UlU;
	Mon, 09 Dec 2024 13:50:59 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKe55-000000083Yp-0uMO;
	Mon, 09 Dec 2024 13:45:48 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-434e406a547so14525645e9.3;
        Mon, 09 Dec 2024 05:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733751945; x=1734356745; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E5/ugt/9XE90UyHiKgp0iBuGenILsWdEY81dJF1Vh10=;
        b=H+nNE3huzyDqQhWpG/FloxJU8YQRwKSniSXd1NUgSrarNBSnvyKQqvxgfnQxU1k179
         PxJjpBnaKNKHbV0LtYeASsNI+RBVBykBy5SDzKTSQf3z0b4oAzt+LViYcmsodYN3LDJx
         dcSkdgwe8ot5s47qqTYTE6rjqZ+hqEKIzTeHhMbufTbJcUWHUcUKPRtDUhjxuWDmO6ln
         qrQrmS7SN4XGIRQO/BBdGXa4JeZllKj6PoDebedFAZcvS7BGQbKyyGCXvPnfJ3o2x7jV
         HhNvopmJkQXPO2RDeU2zxcxAc7/TgIRS1cPAirONVtRdTdp9DrUlcwOvntYVE6PdOJbG
         nNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733751945; x=1734356745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E5/ugt/9XE90UyHiKgp0iBuGenILsWdEY81dJF1Vh10=;
        b=q/E1qz73AcTLVqufEZfcLZa+81T5A2QfjMg8GdI5sLC3dxPUkNTIeiQg1k9LJPIHHK
         Xz/QCxNLqCzKcMf2zUT4muCkugxFtpM7wNCAOxZNSi7s1+NOe7N0mDrmJ73eeMUjbk97
         TOhW4tyY16r6KeifSW9lMedC+f6CILQ8O+TYdVKWzuYZFrjM1dRnzbw0IwNTJxhjk++j
         S1panQXw2dbogDcmX/Uk3BmHpbDGbW9qurKycbwSqLOCdlbuN6R9/Up4LUTrv8hi069I
         6HC8h3mT7HTUkXDrgHx7sr0toxjGiXVNNzYPmDK6ks41v6T7OZOAoNVB5pYWnAdMaSgt
         0XBA==
X-Forwarded-Encrypted: i=1; AJvYcCU3CH4xRE/EtWlKMaNjgod//eaQhnYlFDKeSlat65cRz97NLBI3Hqi3Dnli0UWKmv3ohjNLWHoNFi1GGqtCdq7r@lists.infradead.org, AJvYcCURMBCHKzBpwzvE7k/4dkxUjysMlVXr3wLP5XEsEQFxWcKAdusUmLFItLpv3MMAKwogRku0o7KP/uuFLKlxEMo=@lists.infradead.org
X-Gm-Message-State: AOJu0YyEwOiTFgTUFgZfGJ+oshiJtHiOHahkCNZf/rutllcGddC799D6
	oYePuWH25ZnNF93A2Zmpel3XB93YcbDEgFB4K4qvi9MPDVRapRUK
X-Gm-Gg: ASbGnctf0XROSRhZ8A8phvsz065p+I93kOcn4IV9E1esSlx8DYHZQruH9vMjCF6eRHv
	ez3V43iaIfVo0i57UG14lXrDNfmtxhOmInmzdr3b/MLrYZYSznElVPjlxsq5NeWYnF1VqqPEytt
	avXkrfMjW4C7XKFuJVYTj+PQFQIDOskJ07DRpu6vz80dX9gTDxn9wuEfLyXiUthVqtmKfo4W9gu
	otJsNUK4khPiqSAKCjVeE/wRZH2LZtwoAuJtrNPh/vezNT3mMgzrIHNfohbv4ewtWKp5Dn9KMrI
	DBhhRPz4epLdeOov55s=
X-Google-Smtp-Source: AGHT+IF/955Q0D6SrPHDdoA+/thmeKnCFK3cnvuQRnU3hcvQnrMJ24EeH75EZrWkH637CHTgU5ylrA==
X-Received: by 2002:a05:600c:4447:b0:431:5863:4240 with SMTP id 5b1f17b1804b1-434fffa2a31mr4483995e9.24.1733751945340;
        Mon, 09 Dec 2024 05:45:45 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-434f30bceadsm62705135e9.41.2024.12.09.05.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 05:45:44 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: [net-next PATCH v11 4/9] dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
Date: Mon,  9 Dec 2024 14:44:21 +0100
Message-ID: <20241209134459.27110-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241209134459.27110-1-ansuelsmth@gmail.com>
References: <20241209134459.27110-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_054547_255120_3E38D5BD 
X-CRM114-Status: GOOD (  16.67  )
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

Document support for Airoha AN8855 Switch SoC. This SoC expose various
peripherals like an Ethernet Switch, a NVMEM provider and Ethernet PHYs.

It does also support i2c and timers but those are not currently
supported/used.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/mfd/airoha,an8855-mfd.yaml       | 178 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 179 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855-mfd.yaml

diff --git a/Documentation/devicetree/bindings/mfd/airoha,an8855-mfd.yaml b/Documentation/devicetree/bindings/mfd/airoha,an8855-mfd.yaml
new file mode 100644
index 000000000000..9ad03499fabb
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/airoha,an8855-mfd.yaml
@@ -0,0 +1,178 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/airoha,an8855-mfd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Switch SoC
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  Airoha AN8855 Switch is a SoC that expose various peripherals like an
+  Ethernet Switch, a NVMEM provider and Ethernet PHYs.
+
+  It does also support i2c and timers but those are not currently
+  supported/used.
+
+properties:
+  compatible:
+    const: airoha,an8855-mfd
+
+  reg:
+    maxItems: 1
+
+  efuse:
+    type: object
+    $ref: /schemas/nvmem/airoha,an8855-efuse.yaml
+    description:
+      EFUSE exposed by the Airoha AN8855 Switch. This child node definition
+      should follow the bindings specified in
+      Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
+
+  ethernet-switch:
+    type: object
+    $ref: /schemas/net/dsa/airoha,an8855-switch.yaml
+    description:
+      Switch exposed by the Airoha AN8855 Switch. This child node definition
+      should follow the bindings specified in
+      Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
+
+  mdio:
+    type: object
+    $ref: /schemas/net/airoha,an8855-mdio.yaml
+    description:
+      MDIO exposed by the Airoha AN8855 Switch. This child node definition
+      should follow the bindings specified in
+      Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        mfd@1 {
+            compatible = "airoha,an8855-mfd";
+            reg = <1>;
+
+            efuse {
+                compatible = "airoha,an8855-efuse";
+
+                #nvmem-cell-cells = <0>;
+
+                nvmem-layout {
+                    compatible = "fixed-layout";
+                    #address-cells = <1>;
+                    #size-cells = <1>;
+
+                    shift_sel_port0_tx_a: shift-sel-port0-tx-a@c {
+                       reg = <0xc 0x4>;
+                    };
+
+                    shift_sel_port0_tx_b: shift-sel-port0-tx-b@10 {
+                        reg = <0x10 0x4>;
+                    };
+
+                    shift_sel_port0_tx_c: shift-sel-port0-tx-c@14 {
+                        reg = <0x14 0x4>;
+                    };
+
+                    shift_sel_port0_tx_d: shift-sel-port0-tx-d@18 {
+                       reg = <0x18 0x4>;
+                    };
+
+                    shift_sel_port1_tx_a: shift-sel-port1-tx-a@1c {
+                        reg = <0x1c 0x4>;
+                    };
+
+                    shift_sel_port1_tx_b: shift-sel-port1-tx-b@20 {
+                        reg = <0x20 0x4>;
+                    };
+
+                    shift_sel_port1_tx_c: shift-sel-port1-tx-c@24 {
+                       reg = <0x24 0x4>;
+                    };
+
+                    shift_sel_port1_tx_d: shift-sel-port1-tx-d@28 {
+                        reg = <0x28 0x4>;
+                    };
+                };
+            };
+
+            ethernet-switch {
+                compatible = "airoha,an8855-switch";
+
+                reset-gpios = <&pio 39 0>;
+
+                airoha,ext-surge;
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+                        label = "lan1";
+                        phy-mode = "internal";
+                        phy-handle = <&internal_phy1>;
+                    };
+
+                    port@1 {
+                        reg = <1>;
+                        label = "lan2";
+                        phy-mode = "internal";
+                        phy-handle = <&internal_phy2>;
+                    };
+
+                    port@5 {
+                        reg = <5>;
+                        label = "cpu";
+                        ethernet = <&gmac0>;
+                        phy-mode = "2500base-x";
+
+                        fixed-link {
+                            speed = <2500>;
+                            full-duplex;
+                            pause;
+                        };
+                    };
+                };
+            };
+
+            mdio {
+                compatible = "airoha,an8855-mdio";
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                internal_phy1: phy@1 {
+                  reg = <1>;
+
+                  nvmem-cells = <&shift_sel_port0_tx_a>,
+                      <&shift_sel_port0_tx_b>,
+                      <&shift_sel_port0_tx_c>,
+                      <&shift_sel_port0_tx_d>;
+                  nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+                };
+
+                internal_phy2: phy@2 {
+                  reg = <2>;
+
+                  nvmem-cells = <&shift_sel_port1_tx_a>,
+                      <&shift_sel_port1_tx_b>,
+                      <&shift_sel_port1_tx_c>,
+                      <&shift_sel_port1_tx_d>;
+                  nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index fd37e829fab5..f3e3f6938824 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -717,6 +717,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 L:	netdev@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/airoha,an8855-mfd.yaml
 F:	Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
 F:	Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
 F:	Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
-- 
2.45.2


