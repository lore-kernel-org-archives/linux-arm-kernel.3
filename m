Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3973C7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 23:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=byJPrCHf6giAb360kl2C62a9VTaGkIRY65ltid6z7nk=; b=NMuhigTx6z16Y2OEBOZnHKHydj
	Xf+0mv4Vg0E6lncYRHhtPEiKbZRa9KV7Cg2nk7TutoAYD6pxI0uq+ihPojxj5/dXxIS02ynrqmPKR
	ofAc9rWT8S1S3SQ5Lfyu3B1Cm0yBd7SSctRuP1k0gNDkb/OBCb3KuGoy64GzZPP6wTA5S0xGS0s+H
	aI04hW7cgjtOpWcTfNNqTJSoypE9vh4vnre5uSkkUcH9kO05z6XcfuahSm95GoBEh5pD9Iczuci7W
	WWWEUugVe0p2gU3Rbfst4DoQeghmBmTSwpH+xrkpQHe71dyudjNeDyACeTtKap8ZoNx+N6oPware8
	KiMOa4AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUvuu-0000000D2ww-3ExG;
	Thu, 26 Jun 2025 23:22:04 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUu4c-0000000Cp78-15rf;
	Thu, 26 Jun 2025 21:23:59 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-450cf214200so11258745e9.1;
        Thu, 26 Jun 2025 14:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750973037; x=1751577837; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=byJPrCHf6giAb360kl2C62a9VTaGkIRY65ltid6z7nk=;
        b=fv9futayx8XcC0rt3yigPifvlW3FqZS89fhMm7j7H1UPBnYQp1WY1KPlxBAiPLlEv5
         WOr9JXGOdsSPDWnSqcLydknwVtUJ/9zizB0Qas4EPW425Wks462/GeR8/AvaB7VcgQ4z
         9N1DG2ddeG850fz4kPB4akZq9g27DfVD+WBzlS3LrntP0chDTDWGep0uM//cC+F85z1H
         Qj5rVK5DcM81GoCciMPwP4YGC2oVr8/zZvX1TWMK/tA8tJ03bkEg5icdiyVBph3ak278
         MLmVWBxhyAIa5uZWBwvvCcW70yCGuSrQzrSOlr61JO+lo04Y+IyTsLeZ1YE9VHW78IWC
         Of+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750973037; x=1751577837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=byJPrCHf6giAb360kl2C62a9VTaGkIRY65ltid6z7nk=;
        b=rww3ln9OKO6RnA/oep/opqWg2Lt3Lbb8BY4SmsulYyQcHVHw3/ZBm2oYsW9q8z/cWY
         8uJhV1cZIH88aPmT+nDj1RB0JGyzgfaQO09dBGHVSvpNBAX5tOG9Xji28bd7B4zoFT3d
         EefCaKxgtH7eBU50IUGAMMwuL/pvAZavzpkBEYkb08IhZk0Fc1Nu9srtycmm0B4yok9Z
         s92tM1LU5+CJluh/SGMbXhwVjmU4f6SsuoinjWW05jCItAchU6CL28h8tDpBiaqNZxMM
         0mthnmeRaJ7lpT5A2FzYxZ52801nzoQSkLA2ilzYU1HZHSEc8eK5BqlQ3ytvMtyAzpd5
         Sdrw==
X-Forwarded-Encrypted: i=1; AJvYcCVE16HUNkZBoiz2Wn0P03vOjVHcmKf9su3Gy2bApaqQPcbnnUrKTLFDJGHkkD9mMcCNWz/o8t16K+fKmFQ4bHoa@lists.infradead.org, AJvYcCWF/iPOVSjvZOVjkPjHDm8uF2rRqvov1u7O4l4NzQuJo6VxnaE3VBYyuaJWPpRgQfWvw8S/Ioq9EASw+4bIcVk=@lists.infradead.org
X-Gm-Message-State: AOJu0YypPWquxeEx0x95nqdLd7JM5yZIRFR08PurXbdZ08sXtnJnBSXX
	xpjPhCN2i+Zbpgzk1a4uz0pDheSApHMZ+ADwCyn7eXSZ3+k/0V4EJpz+
X-Gm-Gg: ASbGncvdQr5POFyG4wFuqb26ZqP3Kk9SpSq2T4ikPgTtgc9gCoqUxGbkDcmGRHIx1nc
	HKXY7WrrsC9txjSUYjaM6SZWCOFdUvfqKKoZEYPXoxK28EEdrp8PkMcOgoYR714GJ6GRKeYnjU6
	dGstzCanzwPz85i5bKdJuiyHEO09Zmc7dEbxj3SW9B0fyurOWDry2msNydm4JaMxcnZnPCK8vLB
	/pRHyxlSEdP7PJKrErW+0Mlq9TjLIfzFygbFS28/IEn2W1mhzUwRAgnb0Oi7K6mpK0okPulhDVZ
	XH1GZxQUl6oddiA97TeOySPxvJ4MWMK92ISvC8Y+IGWl9+qbLi0aM0JFCVecsWPd4xB7d63IYQx
	Ukshcd/P86yBLl1feh7AUC/sLvR30P8E=
X-Google-Smtp-Source: AGHT+IFMKGhyUMwSflKNYjaX0uu+JQoU7F+CyOs9Nm9VBop3WcpxumqKUUQB9vAKBq2BHW02dlZyBQ==
X-Received: by 2002:a05:600c:1d18:b0:444:34c7:3ed9 with SMTP id 5b1f17b1804b1-4538ee7995emr7407535e9.26.1750973036440;
        Thu, 26 Jun 2025 14:23:56 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-453835798acsm57186475e9.10.2025.06.26.14.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 14:23:56 -0700 (PDT)
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
	Srinivas Kandagatla <srini@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Simon Horman <horms@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [net-next PATCH v15 03/12] dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch
Date: Thu, 26 Jun 2025 23:23:02 +0200
Message-ID: <20250626212321.28114-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250626212321.28114-1-ansuelsmth@gmail.com>
References: <20250626212321.28114-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_142358_301650_C57A0580 
X-CRM114-Status: GOOD (  14.31  )
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
2.48.1


