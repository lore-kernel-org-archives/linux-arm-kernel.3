Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32835CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 10:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RY1B5PGth1HDzyREfmQnSh0t0AVmKWYqZ2eVNQma6QQ=; b=yeZe9Uv/AViu5mWMTIFUsG8LoC
	W1nddxL1jwISnZcZSiexnpespRw0zLLOvZ53tDAz45JCuiF2JTxctu0mq+tNCcD8615m9UPgx1eeE
	ejEAAnnDTnOntj7yzgi4baw7IEeBD6/Um2dWXdt7iMbM8/+hcyyUJERUxCNrkbpuAYu5D6LIQupD0
	yErwN1jaIkgjKAZgmKTl9n6aJI5h+Z9RSwGaOVSGLITnYeqqq0CNCGlwM2FSxxKuE53oO6bHD4di7
	Nl9zbDYrqyMxUMHsSv6hHaFeq4/r4yUqnhpGYQcy1rRiEDfdqi5ZTFw2W+6jKRr/POcZ7q9Rk7pOk
	dy3dQzJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfEN-00000002ddI-40Fw;
	Fri, 16 Oct 2026 10:32:07 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfEH-00000002dXL-1b24;
	Fri, 16 Oct 2026 10:32:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792146719;
	bh=5BkvMGlNIRk2HVuZp13oDa8M5C0P6F5Yd6VHasdpSJA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RmZL789IHp9arOZo9+Xg94LA7Y1vyju+tRCeqS4ba+NZyFJSCRRALNSMwrQjvJwsG
	 2VIWVRg0tvbxcc3QFnMeyb5j73ru9T2FYntnR6zBLazZametPpJ1rVmk/ron4BPB0b
	 XGIkXzqStYq+2pK/d7vrwGJc6gdNN1x2kNNp6qnhlMZHY0dAKgH40GYhB0s6OGTQBS
	 yQFBekLE82RzRJdn7NDQ2mcKsAP6ZdjV6fQ6moBPEtHOTLWhjEBtb/v1w9o+9HGaoF
	 7cUd1Aqn7DuTkpOFlebnNr/wJTp1XPW6DQocrSMMhGoYjhi5kLcRsdeMEaCbxEQ5aW
	 QcBCEP6dTQd6g==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9B09B17E07F0;
	Fri, 16 Oct 2026 12:31:58 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 16 Oct 2026 12:31:06 +0200
Subject: [PATCH net-next v3 2/9] dt-bindings: net: mediatek-dwmac: add
 support for MT8189 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-dwmac-mediatek-mt8189-v3-2-25daf2bbcf35@collabora.com>
References: <20261016-dwmac-mediatek-mt8189-v3-0-25daf2bbcf35@collabora.com>
In-Reply-To: <20261016-dwmac-mediatek-mt8189-v3-0-25daf2bbcf35@collabora.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Biao Huang <biao.huang@mediatek.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Eric Dumazet <edumazet@kernel.org>, Eric Dumazet <edumazet@kernel.org>
Cc: kernel@collabora.com, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792146716; l=4747;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=5BkvMGlNIRk2HVuZp13oDa8M5C0P6F5Yd6VHasdpSJA=;
 b=K7T3PnKZ5UF4wN7SdPvwsk+6r5BP9Nb31dD5hSGAnNxKanpVKLVihMjy3UTGt2eLJnMb6rtEQ
 1qnWbnBCVMHAR02btcezuN7peZstK5rQbT7WF7VByOAGV+KyFv8BKHn
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_033201_576708_7F6CC6CF 
X-CRM114-Status: GOOD (  13.44  )
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

Regarding the required clocks, the MT8189 datasheets list in the
paragraph related to this IP clocks the mac main and ptp reference
clocks as the ones to turn on.

No specific peripheral clock for Ethernet MAC is described in the SoC
clock list.  But at the same time, the Ethernet MAC block diagram,
present in the datasheets, shows this IP is interconnected to the rest
of SoC with AXI and APB interfaces (and in MT8188 datasheet too).
There is no APB related clock, that is specific to the IP in MT8189,
contrary to MT8188 or MT8195 that have one. But since it is on an APB
bus (likely shared between multiple IPs), then there is a bus clock for
peripheral access. Describing the IP having it makes sense, same thing
for AXI too, so the clock lists for this compatible are reflecting
that.

Also, don't allow mediatek,rmii-clk-from-mac property for MT8189
compatible.

Finally, update "mediatek,rx-delay-ps" and "mediatek,tx-delay-ps" property
description to add MT8189 RX/TX delay stage divider values, as they
differ from existing supported SoC.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 .../devicetree/bindings/net/mediatek-dwmac.yaml    | 54 ++++++++++++++++++----
 1 file changed, 45 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
index 14f9683f20fe..6acfe104ef09 100644
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
@@ -45,7 +44,7 @@ properties:
           - const: snps,dwmac-5.10a
 
   clocks:
-    minItems: 5
+    minItems: 4
     items:
       - description: AXI clock
       - description: APB clock
@@ -55,7 +54,7 @@ properties:
       - description: MAC clock gate
 
   clock-names:
-    minItems: 5
+    minItems: 4
     items:
       - const: axi
       - const: apb
@@ -86,8 +85,10 @@ properties:
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
@@ -96,8 +97,10 @@ properties:
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
@@ -147,6 +150,39 @@ required:
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
+
+        clock-names:
+          minItems: 5
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
+          maxItems: 4
+        clock-names:
+          maxItems: 4
+
+        mediatek,rmii-clk-from-mac: false
+
 unevaluatedProperties: false
 
 examples:

-- 
2.56.0


