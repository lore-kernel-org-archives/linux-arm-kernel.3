Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FE6C98314
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 07:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XvieWIY+i1AST9RqXpJ7/z/MULbKFfSbxYmjedMqeuo=; b=E4oLXMIQ3Zd/9JOSAOifTgHDFg
	QhJu1WF+XXXNwSN4H5w7lyt7ESBeK7VrlknZFszm13xlU5NYgkYsu/TunbGeqzAwSD7l5JabZgowZ
	C/Z4Nb1PduU50CQw6ljbGieOmhsx5RKvBAj4k+yYmHcRsy4xafWqNd8g4GrIea+YVI0JkjCWRuCvu
	8m+bR71pYYcQp8LGeRK8rD2PwmCiPkHHU4l6GTeE27XXyg3qu1jXnREd5e3ySgzs92RZq34V2wWH/
	ROVbVqnpm2JhkbIj5DWv1yTMlkpkwGqd1c2nX8O/x2BKd0KK02GBqCfCslMrfuOATQKwtt4G8PBMl
	prlbnyTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9doZ-0000000AGzR-1ScX;
	Thu, 24 Sep 2026 07:24:19 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9doX-0000000AGxb-1Xkz;
	Thu, 24 Sep 2026 07:24:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790234654;
	bh=9V9vHNIqjj/P3V/WD9pUW9DZXjV8gTIAVkCblvj1Xq4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iUeeeNxGlLxhJrNz6Ckmi6E+lHfIUobG+yTsZBzxrQZ9X7ui2pdlMglCZAwsJCeSa
	 ZqamKT9HAvUOOwFyFCosYeeQ+MKRaVpKD2lQsHChA4KstkHHN6HK91BMgzA/+eqaaa
	 RnVXiXOfS9yNv2cj0H069w2XsByFnfTx21qFehHW8Dclew1qeCNsZ1HDGvyQPsnPaK
	 dsF/eSembWhWj3IBQvb5B1SyXgueVcl2bW+4tbnnv9MKuGSEZWzwHuu2J2hvig9LY/
	 pZcmQccO2196W/2LyboQEyffS1hyGLimnrtZPJw3hoJ+hB4LMxaZ52GW63C9AC3BsK
	 mEG71nyujNusA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 01F0E17E01D1;
	Thu, 24 Sep 2026 09:24:13 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 24 Sep 2026 09:23:24 +0200
Subject: [PATCH net-next v2 1/7] dt-bindings: net: mediatek-dwmac: add
 support for MT8189 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-dwmac-mediatek-mt8189-v2-1-430bd74d5ef9@collabora.com>
References: <20260924-dwmac-mediatek-mt8189-v2-0-430bd74d5ef9@collabora.com>
In-Reply-To: <20260924-dwmac-mediatek-mt8189-v2-0-430bd74d5ef9@collabora.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Biao Huang <biao.huang@mediatek.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: kernel@collabora.com, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790234653; l=4693;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=9V9vHNIqjj/P3V/WD9pUW9DZXjV8gTIAVkCblvj1Xq4=;
 b=fGUZW/haDY37KjFlxcP6MBiJCPKTi48kpDtrvwtppr+sq9WcagdmC+gADaBPpSVMtHy8U1rND
 MR3cKuN5i+SDiXrPB7CuiqLLxyAyf6TYDOQl67cQgtplj9Af+1YvBKe
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_002417_565074_304DB9BE 
X-CRM114-Status: GOOD (  10.52  )
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

Add new compatible string and clock definitions for the Ethernet MAC
IP found in MT8189 SoC.

Also, update "mediatek,rx-delay-ps" and "mediatek,tx-delay-ps" property
description to add MT8189 RX/TX delay stage divider values, as they
differ from existing supported SoC.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 .../devicetree/bindings/net/mediatek-dwmac.yaml    | 87 +++++++++++++++-------
 1 file changed, 60 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
index 3aab21b8e8de..6624dff015f0 100644
--- a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
@@ -20,13 +20,11 @@ select:
         enum:
           - mediatek,mt2712-gmac
           - mediatek,mt8188-gmac
+          - mediatek,mt8189-gmac
           - mediatek,mt8195-gmac
   required:
     - compatible
 
-allOf:
-  - $ref: snps,dwmac.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -36,6 +34,7 @@ properties:
           - const: snps,dwmac-4.20a
       - items:
           - enum:
+              - mediatek,mt8189-gmac
               - mediatek,mt8195-gmac
           - const: snps,dwmac-5.10a
       - items:
@@ -44,26 +43,6 @@ properties:
           - const: mediatek,mt8195-gmac
           - const: snps,dwmac-5.10a
 
-  clocks:
-    minItems: 5
-    items:
-      - description: AXI clock
-      - description: APB clock
-      - description: MAC Main clock
-      - description: PTP clock
-      - description: RMII reference clock provided by MAC
-      - description: MAC clock gate
-
-  clock-names:
-    minItems: 5
-    items:
-      - const: axi
-      - const: apb
-      - const: mac_main
-      - const: ptp_ref
-      - const: rmii_internal
-      - const: mac_cg
-
   interrupts:
     maxItems: 1
 
@@ -86,8 +65,10 @@ properties:
       or will round down. Range 0~31*170.
       For MT2712 RMII/MII interface, Allowed value need to be a multiple of 550,
       or will round down. Range 0~31*550.
-      For MT8188/MT8195 RGMII/RMII/MII interface, Allowed value need to be a multiple of 290,
-      or will round down. Range 0~31*290.
+      For MT8188/MT8195 RGMII/RMII/MII interface, Allowed value need to be a
+      multiple of 290, or will round down. Range 0~31*290.
+      For MT8189 RGMII/RMII/MII interface, Allowed value need to
+      be a multiple of 180, or will round down. Range 0~31*180.
 
   mediatek,rx-delay-ps:
     description:
@@ -96,8 +77,10 @@ properties:
       or will round down. Range 0~31*170.
       For MT2712 RMII/MII interface, Allowed value need to be a multiple of 550,
       or will round down. Range 0~31*550.
-      For MT8188/MT8195 RGMII/RMII/MII interface, Allowed value need to be a multiple
-      of 290, or will round down. Range 0~31*290.
+      For MT8188/MT8195 RGMII/RMII/MII interface, Allowed value need to be a
+      multiple of 290, or will round down. Range 0~31*290.
+      For MT8189 RGMII/RMII/MII interface, Allowed value need to
+      be a multiple of 180, or will round down. Range 0~31*180.
 
   mediatek,rmii-rxc:
     type: boolean
@@ -147,6 +130,56 @@ required:
   - phy-mode
   - mediatek,pericfg
 
+allOf:
+  - $ref: snps,dwmac.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt2712-gmac
+              - mediatek,mt8188-gmac
+              - mediatek,mt8195-gmac
+    then:
+      properties:
+        clocks:
+          minItems: 5
+          items:
+            - description: AXI clock
+            - description: APB clock
+            - description: MAC Main clock
+            - description: PTP clock
+            - description: RMII reference clock provided by MAC
+            - description: MAC clock gate
+
+        clock-names:
+          minItems: 5
+          items:
+            - const: axi
+            - const: apb
+            - const: mac_main
+            - const: ptp_ref
+            - const: rmii_internal
+            - const: mac_cg
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8189-gmac
+    then:
+      properties:
+        clocks:
+          items:
+            - description: MAC Main clock
+            - description: PTP clock
+
+        clock-names:
+          items:
+            - const: mac_main
+            - const: ptp_ref
+
 unevaluatedProperties: false
 
 examples:

-- 
2.55.0


