Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94FAFC98311
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 20:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWoyChkF8PBA93YfN7WK6+qy/EfUiqZ/evixTMMcgfA=; b=P67A5h/o2e2tFY68V7W9qYXvhB
	Y+xd3S+0uzB4yNXewvcxHE7DwBQGEtnlcitmvlhD5NRDclIVEu/b1VrKqLi+FiqJYvyuPZMP4Uvbj
	fmtluPkq1AmhlOoC18INf2ADoQTrpiccQ4qiNdynO7g67Pm6DUhc1b5w/zl18huR41MzVphrTo5y3
	9JRCAug1lrckkvlNnnIKbGh8lGxRslZze3NcVqST6lBbKEUzUPkG40dUj9J/cjBMEZdckQrih8Ngj
	6+H+JbWl26EErg2dafvumQdD1LVxaiinSG++mDJZ+R+eKV1bj1sUGJaXYA7FSalwVgpQpz96Wcm1c
	DUjMfieg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Tsi-00000009VS9-1fxE;
	Wed, 23 Sep 2026 20:47:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Tsf-00000009VQq-2j5W
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 20:47:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=XWoyChkF8PBA93YfN7WK6+qy/EfUiqZ/evixTMMcgfA=; b=N6bEI+7azGnLbZdvadQiuItP2D
	uWSHQCOvbPclDYKH0uRXAohgRBo3OTEn6RE1ZonnHsOGKZIQesg/MfYJ6OphwVpZ8jpc+ImtTXTfi
	fhJynifi8ZU63HuqgWedpYJwlxYdqaPmb6jvu/1SB15us4RmeUNjq+yCM4ELptyIqSganmDlUqYAr
	o2bJUkDiONYwpclZZr6uQ4ySgvvgse5rfXSG6QDmMuciyZlHH6P97Dh71TvQYybwe6LGaZS1LoNsN
	qPgWA6MLWpnSBcwSDNpe/z2gKeaU+SrrCVoTxOtvK1dXhAGao3pn4K+IfGZz4WEzuodFA+RD2MZKf
	wwU6Z3pQ==;
Received: from mail-wr2-x11.google.com ([2a00:1450:4864:30::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9TsZ-0000000FGlb-0IjO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 20:47:51 +0000
Received: by mail-wr2-x11.google.com with SMTP id ffacd0b85a97d-4843c3ee4cfso840438f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 13:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790196465; x=1790801265; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XWoyChkF8PBA93YfN7WK6+qy/EfUiqZ/evixTMMcgfA=;
        b=Sy2y/FCWRuD3JmtM2Vw+GBS8czGbc2qrdIL68xMAHDIz6r42itjyyauE0RdAEmALS5
         XmkOB6R42nXJWdSX+8QGTimm1SVLbt0eMOSVLTJaqwGsNGJYXkvtSd+LJvMtWwHHs9R8
         OmDrnRmdyHyD7svC7WLccRfoBJrL6517REKOmyg+JMj0fhuSLIazMxKaH4CuLdpLLuE4
         E5FS0mw+qIzxS1HCGNc+BOTRQdga7n54fUcaES3RXDZEWIDBMWRCORCD0Mrd6BspvNh0
         wZIDqRQmTBS1+svHp1Rtl+GNvkpySnmK2+TYRZoBdDr5Vrnj9PmWAaa1A4kcPWi4BSNL
         TFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790196465; x=1790801265;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XWoyChkF8PBA93YfN7WK6+qy/EfUiqZ/evixTMMcgfA=;
        b=dzCT6jwbKnGaYb5aeGSNGY5Elcr7wXGvLvAe0WQ9od1u1o6rvkOS9OmAOrAp3QTqPO
         zVwUdk5i12elulI6joJCXf01CHiSv+F6UK1gIKWOpKESnzPTOs6K4ltFFZ6ZYSdKFAgI
         3usKdFSFJSCjQErQ4Eo7inftI5H/8IVLffcoKED5Do13CzrIwXTp983LnuZsHyUj+BPS
         6qjiHVVzKlNJhIsosHfZB11U9aKMk6Ph0uAchJyI5h8fniPUHzBTWIi5v1Jxk74NQg/I
         KKq/aR7jeoK4vH5SlB0n/NUFYsrHPBbUUcsnFL+RbgRH72A4AmMXu0bH0KsjvvUfMkJ0
         95XQ==
X-Forwarded-Encrypted: i=1; AKwUvByqk2Uq2URpnuhVA0NSUd3rWp6p9qdpQp0EhSz0e0Hlse6jVQrUWgksfBYGKiiTNqezmIEYi624IfB1/yfW1DH5@lists.infradead.org
X-Gm-Message-State: AFuF++n2dNLQLvqbab3yJGQ7/E4blkNp7pL6QLBXs/oiv7/JpFxjvlwO
	hdfpyAPi5WOtcH2DdtCTV3YmgCmcjKSDxG19+VUm1/DgC32r/zfu2Wiq3y+1kPGmAok=
X-Gm-Gg: AYBFou0bqY/YukpD7QGArVcZdl3o9sJ0ywarnwfq/LcjehNLu5XVCE12lKXfMXTGupz
	ZxtBeoJaslY8AWyj0kRXCP+mnlJgPFrA+r2ktlYFUJcyO+hMKnhV1MgRB5Jex6Vvef9WYSVuXA1
	6sbBkQElYmhQgb7Va9KnL4zGHlltoUWMbvRoK4SUzyM259CXyXRN6i62pdZNCnoJnrkQ3UHovii
	LSJ1Yq+bxjwXa6TuqZx5Uj4F84PVv+8zazbvJz2DD7mbz8fpdEwhB3oO+CYQag0o/7+LImRYPT0
	Xu7xZUias4i0CjI3Yw162GeJv/ErF1PY3sYnN6gQAkTjARRR03SBZ8IdfRArQU3EpyY7a6l3Koi
	2tK2rmKLCYjB1/peVB9VIWR8FUGTqELfPQGzFi3DnIyw+UQgWJPB9nJj5p4ZKrlJwqewQxBkgxQ
	6RFi9lZOIi28H+/zyjoSmerCrrMURhFF43JVXloXYuBwR0yI/K+GYDm3SoM0Fc92cEMWwayZQ/Y
	Ve9UBRLaj0RIYMO8Q==
X-Received: by 2002:a05:6000:25c2:b0:487:2354:d9d5 with SMTP id ffacd0b85a97d-488717240c7mr464443f8f.55.1790196464768;
        Wed, 23 Sep 2026 13:47:44 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c500sm9316780f8f.19.2026.09.23.13.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:47:43 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 23 Sep 2026 22:47:31 +0200
Subject: [PATCH net-next v3 1/5] dt-bindings: net: sun8i-emac: Add A733
 GMAC210 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-allwinner-a733-gmac-support-v3-1-15735155a789@baylibre.com>
References: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
In-Reply-To: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Andre Przywara <andre.przywara@arm.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6760; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=2Rk7dcj1EIntxo1C/ioN2dfS7ZxOV+D+YaH7GClK4Vk=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlbrN5qaUf77BN3bJwfJC++VkBvYaWMbYWR1afZ6mJr4
 ja++vSso4SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABPZupHhxz517jN7T5x3alB1
 N9/pM2vPwZOyh00kIpz4098WTOzczMgwY17a0wPyxufk71jW3GtatmaK+xmGP3+FGRsu27j4yvX
 xAwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_214748_621549_AC0647F3 
X-CRM114-Status: GOOD (  14.42  )
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

The A733 GMAC210 is a DesignWare MAC 5.20 close to the A523 GMAC200, with
the following differences:

 * The glue configuration registers are a dedicated MMIO region of the
   controller instead of a syscon register, so a second reg entry replaces
   the syscon phandle.
 * The DMA channels and the LPI event have their own interrupt lines.
 * A PTP reference clock and an AHB reset are needed.
 * Unlike the A523, the controller does not appear to belong to a power
   domain.
 * The TX clock delay field is 5 bits wide and both TX and RX delays use a
   180ps step, allowing up to 5580ps.

Add the new compatible and describe those differences. Declare the internal
delay properties at the top level and keep their limits per compatible.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/net/allwinner,sun8i-a83t-emac.yaml    | 142 ++++++++++++++++++---
 1 file changed, 126 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
index 323a669fa982..a4e0d9b760fe 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
@@ -22,6 +22,7 @@ select:
           - allwinner,sun8i-v3s-emac
           - allwinner,sun50i-a64-emac
           - allwinner,sun55i-a523-gmac200
+          - allwinner,sun60i-a733-gmac210
   required:
     - compatible
 
@@ -44,25 +45,38 @@ properties:
       - items:
           - const: allwinner,sun55i-a523-gmac200
           - const: snps,dwmac-4.20a
+      - items:
+          - const: allwinner,sun60i-a733-gmac210
+          - const: snps,dwmac-5.20
 
   reg:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: MAC controller registers
+      - description: Glue configuration registers
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    maxItems: 4
 
   interrupt-names:
-    const: macirq
+    minItems: 1
+    items:
+      - const: macirq
+      - const: eth_lpi
+      - const: tx-queue-0
+      - const: rx-queue-0
 
   clocks:
     minItems: 1
-    maxItems: 2
+    maxItems: 3
 
   clock-names:
     minItems: 1
     items:
       - const: stmmaceth
       - const: mbus
+      - const: ptp_ref
 
   phy-supply:
     description: PHY regulator
@@ -76,6 +90,18 @@ properties:
       Phandle to the device containing the EMAC or GMAC clock
       register
 
+  tx-internal-delay-ps:
+    default: 0
+    minimum: 0
+    description:
+      Internal RGMII PHY TX clock delay chain value in ps.
+
+  rx-internal-delay-ps:
+    default: 0
+    minimum: 0
+    description:
+      Internal RGMII PHY RX clock delay chain value in ps.
+
 required:
   - compatible
   - reg
@@ -87,7 +113,6 @@ required:
   - reset-names
   - phy-handle
   - phy-mode
-  - syscon
 
 allOf:
   - $ref: snps,dwmac.yaml#
@@ -215,6 +240,34 @@ allOf:
             - mdio-parent-bus
             - mdio@1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun8i-a83t-emac
+              - allwinner,sun8i-h3-emac
+              - allwinner,sun8i-r40-gmac
+              - allwinner,sun8i-v3s-emac
+              - allwinner,sun50i-a64-emac
+    then:
+      properties:
+        reg:
+          maxItems: 1
+        interrupts:
+          maxItems: 1
+        interrupt-names:
+          maxItems: 1
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
+        power-domains: false
+        tx-internal-delay-ps: false
+        rx-internal-delay-ps: false
+      required:
+        - syscon
+
   - if:
       properties:
         compatible:
@@ -222,32 +275,60 @@ allOf:
             const: allwinner,sun55i-a523-gmac200
     then:
       properties:
+        reg:
+          maxItems: 1
+        interrupts:
+          maxItems: 1
+        interrupt-names:
+          maxItems: 1
         clocks:
           minItems: 2
+          maxItems: 2
         clock-names:
           minItems: 2
+          maxItems: 2
+        resets:
+          maxItems: 1
+        reset-names:
+          maxItems: 1
         tx-internal-delay-ps:
-          default: 0
-          minimum: 0
           maximum: 700
           multipleOf: 100
-          description:
-            External RGMII PHY TX clock delay chain value in ps.
         rx-internal-delay-ps:
-          default: 0
-          minimum: 0
           maximum: 3100
           multipleOf: 100
-          description:
-            External RGMII PHY TX clock delay chain value in ps.
       required:
         - power-domains
-    else:
+        - syscon
+
+  - if:
       properties:
+        compatible:
+          contains:
+            const: allwinner,sun60i-a733-gmac210
+    then:
+      properties:
+        reg:
+          minItems: 2
+        interrupts:
+          minItems: 4
+        interrupt-names:
+          minItems: 4
         clocks:
-          maxItems: 1
+          minItems: 3
         clock-names:
-          maxItems: 1
+          minItems: 3
+        resets:
+          minItems: 2
+        reset-names:
+          minItems: 2
+        tx-internal-delay-ps:
+          maximum: 5580
+          multipleOf: 180
+        rx-internal-delay-ps:
+          maximum: 5580
+          multipleOf: 180
+        syscon: false
         power-domains: false
 
 unevaluatedProperties: false
@@ -412,4 +493,33 @@ examples:
             };
         };
     };
+
+  - |
+    ethernet@4510000 {
+        compatible = "allwinner,sun60i-a733-gmac210",
+                     "snps,dwmac-5.20";
+        reg = <0x04510000 0x8000>,
+              <0x04518000 0x1000>;
+        clocks = <&ccu 58>, <&ccu 59>, <&ccu 60>;
+        clock-names = "stmmaceth", "mbus", "ptp_ref";
+        resets = <&ccu 30>, <&ccu 31>;
+        reset-names = "stmmaceth", "ahb";
+        interrupts = <0 175 4>, <0 179 4>, <0 176 4>, <0 177 4>;
+        interrupt-names = "macirq", "eth_lpi", "tx-queue-0", "rx-queue-0";
+        pinctrl-names = "default";
+        pinctrl-0 = <&rgmii1_pins>;
+        phy-handle = <&ext_rgmii_phy_2>;
+        phy-mode = "rgmii-id";
+        snps,fixed-burst;
+
+        mdio {
+            compatible = "snps,dwmac-mdio";
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ext_rgmii_phy_2: ethernet-phy@1 {
+                reg = <1>;
+            };
+        };
+    };
 ...

-- 
2.53.0


