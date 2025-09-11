Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 519A2CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 13:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PzHcQ/oRDwg8w8+eycKtwGCbh/9deoJe9kKuhzidedQ=; b=EFm0QvmqcBNDzI6Sjb0Ut0+bDQ
	BEXFH8re1DkeVZok7Lsm2adHXVS4QXrAXCsMgJAIFCdHIpyFGhJDSwwCo28N/MZRv7vbvEHbynNlI
	axj5umJSdwX1aaTx6btEgDwe2K8zf1uI6v47bKfDAERqLYM24tuDZ1NPSQFzyUZjnWZHUos3f3zX0
	DlRx+70k7/iLS58RaSO6Aurn5jqP/0oOo75i3vrTElm8b4K0VZLue+Ez+q15oeUOgRIXD/2yVYcPb
	pswC/hcLPhfD0sfLnec2Y6CsUWOwLAPLOnTRgcrt0KKhGQq74Zm0P5oHEobY/IrGI6RZQQyJ7sWXS
	QgcYbwew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhWt-00000003HWF-0otE;
	Thu, 11 Sep 2025 13:40:03 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhWp-00000003HSX-3frR;
	Thu, 11 Sep 2025 13:40:01 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-45df7ca2955so3610685e9.3;
        Thu, 11 Sep 2025 06:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757597998; x=1758202798; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PzHcQ/oRDwg8w8+eycKtwGCbh/9deoJe9kKuhzidedQ=;
        b=e4mahVZJVe92KCBVdlIeoIemblsNgJfixbBjzofdXRXx6NuvUyMC4RA+6YSyBDsaqc
         nBPAdhKJNG5J4BqDyR11bAAduRLkAzMvuVPGfmWh4oyLpm2QqMJ8FJmdEngeOQjMTEuU
         9Rl+GARLovu7pcWr4vN50f4EgGPSMYiTZEXJWXTQC3hOzUetNHkvYyzHUpIYbhgtrEu2
         XZ9NWL5sjBif2cJH1CNL4Xf9XUlgFUcebij7s506n2QixeBEqra9g63T/6KKrYyLUcjE
         nY6EWgiMtkLISs8EVnXJovHi1pYFjFHRMhTY1ZUO7ucxESkbwTeyy/oc5j0vAvasc7gj
         e9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757597998; x=1758202798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PzHcQ/oRDwg8w8+eycKtwGCbh/9deoJe9kKuhzidedQ=;
        b=t3BRn/IxwKW0oi8o4CV0sXgw7Mv4IuWa0JKNGODwCPqIf3OX7A5LL1Dvmgl3FJcys+
         q4XRw4hGOxPeGxLqjwpjqQeCu2lLDE4rALdwyUdVWW7dXd8291u60o6+eCjN29HO3AFi
         hW44uIlc2jLaFo2LzW5ccCA1uAqqJlVvi962nM1jQVM93PRgnU9J5sijzNzOB1W7Pdnf
         JwChRDOVrGde2WcSGdceWloBM9E9oDcEhGCLGsa0LDHm35/J06/WvlcNqVf+76TkkoqL
         yfsjoEFeXDd3suC4RedsaBPHy0cpHpgAVa19A/Mb8xezSeKougz3GwFr7wGEM/bfC54y
         UK6A==
X-Forwarded-Encrypted: i=1; AJvYcCVjRNVeqLmE9EXCZ3NE6G9I/wlGhl078YX5Dh5uSjB8U0EFUNcGmyiXAhbzhCLnNfB1J6vQV+BcCZgqKFrxawQ=@lists.infradead.org, AJvYcCWAFHMtGoUBcjcCYCs5PSF6XxKywo50H3qwbrt3xhJVHAFu5RPlkhmZFujzomn9ppiaW6wQR5ATnY6vZABj6HKO@lists.infradead.org
X-Gm-Message-State: AOJu0Yysvfg9r0v3qLpSBKtaYDdO+kFBnM7d1QDuy9RkSP5MO9plLDRt
	uU/CHW7Auf2dfS8AW2aU9Wp3vx3TlBbrA7L0KNXJimZZXejBI9kni7oA
X-Gm-Gg: ASbGncuH5n5rXVUsicClwxqs3nFr7DgMIbem4X8jZSlGBaydvmysJ6HzyA2poDioLzS
	gj6nAQS/v5+NC7QfbocW5t6qhKIImAL9xHHA8L5VRvUnIZk1scmNljqjHjRfVOe238z4Ccke/kE
	KtuLUAx58pgcQJJTHhifaX9ndYAvRwTCiRwGm8RndQn2NHYhNIjn3ZwDaKB1w1HuIVXlHnMmsnV
	JAsTOU8B9A05EDRIpCybmINwzwDBvlwmVPNnEkrG0KBUgytYAfc75uS0BzjMdBK2WRV+WEWxR8z
	9QbzMENRz/lbv7PfyQPTQ4cYnMWou02qXWR0wnYEx/KXXS8vW9zUwNur5ygmwzNCXWnq3Z7qUnI
	heV4xSdxF++mO6NeOYocq9RXfVpdWAWGGbYDf5jT85C71fS2sP8zCMTaCVDm9FFlvTI3Njek=
X-Google-Smtp-Source: AGHT+IHt78OUtg6Hm5nCYAHA3ij739YiNjPPViAgVLSIcJz1QECNiFuOyCXUze29kLC2iFDge+11tQ==
X-Received: by 2002:a05:6000:4211:b0:3e5:d2f1:403d with SMTP id ffacd0b85a97d-3e6440ef05fmr18685724f8f.36.1757597997739;
        Thu, 11 Sep 2025 06:39:57 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45e037d741asm23413475e9.23.2025.09.11.06.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 06:39:57 -0700 (PDT)
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
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [net-next PATCH v17 1/8] dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch
Date: Thu, 11 Sep 2025 15:39:16 +0200
Message-ID: <20250911133929.30874-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250911133929.30874-1-ansuelsmth@gmail.com>
References: <20250911133929.30874-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_063959_959698_07A991B8 
X-CRM114-Status: GOOD (  14.08  )
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

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../net/dsa/airoha,an8855-switch.yaml         | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml

diff --git a/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
new file mode 100644
index 000000000000..fbb9219fadae
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
@@ -0,0 +1,86 @@
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
+$ref: dsa.yaml#/$defs/ethernet-ports
+
+properties:
+  compatible:
+    const: airoha,an8855-switch
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    ethernet-switch {
+        compatible = "airoha,an8855-switch";
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
-- 
2.51.0


