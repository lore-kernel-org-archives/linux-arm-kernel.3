Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B447C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 14:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VfQs6YbhwqfM6PYKkvxJkzuYRlp2q84IA/pI/kYb9Fs=; b=cRglkyrUWC7azz9Nu/sTlp7L0X
	YOxqDapNT8XKbZEjwiCnuScS/bn8XYa0qTFj1JR8MqIBB/KobrtK9opL9oPxI2LJuKUjNfN0bsnvt
	Fc6Qu2T6wIyoDDpSpjTGumds64VN0ERaea7jVpx8QKyertD78nF4jDLzp7e1ZlYbXoX1Xaurghw/v
	gT2QCDtc34Zxfn8jMvVcWMDoB6t171hA4Mr3NBHtu4XHtLqf1oIgji6G9jkcytX0q3cYS+0RgyPYf
	ftk1P8ovkDdaKnVhxRtyBcY60Ee2WCUojOVu4DjuZ56Z3J/F5HhpAB3WrbpGO6vr5bAdcEdpVSyTk
	kfxPTjIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wewB8-00000002KzW-1ZG4;
	Wed, 01 Jul 2026 14:44:42 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wewB5-00000002Kyv-3aig;
	Wed, 01 Jul 2026 14:44:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782917077;
	bh=tZpKvDZlB9soTN2cRNYslYLJsX+eIX7hVXfQ9nGwd0A=;
	h=From:Date:Subject:To:Cc:From;
	b=ahvtcu2+VeacQEEnG2Z9NQn0diy7la11Hcl2KEf2sgGq/j7HRTT4rHKdXgCTfZetO
	 ja4hjssoV/1uQNj8/yX55ylPiD5W5nOOkTf71xbEQqBb2FgVUne9If6kpJ4iWaXYeC
	 AJNwpQD+BoSKmG3gzoyBkMQxZBuw3b1PAQhOoJkpzOj+DTbR1wyq37Xt90Br6Kf8w9
	 ZIVKKrxf2mncfR3cg9GVV29PD7S40/g/zdpNIJ7vfevy4t0+oV71egPLCYj4cbeZNA
	 VI/nByVlEnM6ygC3Rr1azb8cMlcqYrVD8qRtw/HXO/0Vvv+YMUzH6T190OkHareIU1
	 860VNJn2/KtqQ==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BD83517E010F;
	Wed,  1 Jul 2026 16:44:36 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 01 Jul 2026 16:44:26 +0200
Subject: [PATCH] dt-bindings: mmc: mtk-sd: Document extra clocks for MT8189
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-mt8189-mmc-dt-bindings-fix-v1-1-e75f241a275b@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNQQ6DIBAAv0L23E3ABop+pfEgsLV7AFvAxsT49
 xI9zhxmdiiUmQoMYodMPy68pAbqJsC/pzQTcmgMneyMfEiFsVple4zRY6joOAVOc8EXb9i87r3
 VQTsDLfDJ1PQZf44XZ/qu7VEvCW4qhH6JkesgEm0Vz4+5SxiP4w+tXqFVnQAAAA==
X-Change-ID: 20260701-mt8189-mmc-dt-bindings-fix-18959c85d5b6
To: Chaotian Jing <chaotian.jing@mediatek.com>, 
 Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Wenbin Mei <wenbin.mei@mediatek.com>
Cc: kernel@collabora.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782917076; l=2496;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=tZpKvDZlB9soTN2cRNYslYLJsX+eIX7hVXfQ9nGwd0A=;
 b=jpUjw2cMbJ5XQ8Hgo+osXrEb0d7+wM28LWJl7HBta3RRWAk5YSnysdJl0DTb/Q6tKUOTeYHEs
 8v0hP9nJkNiBkEMG/qS3JbXHVtsOMi6E/HTv6eAiPBuLkCprOb3JYiy
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_074440_051906_B30222D2 
X-CRM114-Status: GOOD (  10.26  )
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

MT8189 SoC MMC Controller IP has 4 additional clocks.
Describe them in the dt-bindings for this SoC.

Fixes: 7514f64780a4 ("dt-bindings: mmc: mtk-sd: Add support for MT8189 SoC")
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
The patch is based on linux-next tree (tag: next-20260630) and has
been tested on Mediatek Genio 520-EVK (MT8371) and 720-EVK (MT8391)
boards with board hardware enablement patch series.

Additional note:
There is currently no use of "mediatek,mt8189-mmc" compatible in
Mediatek board devicetrees.
---
 Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 29 ++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index eb3755bdfdf7..a4d032224dce 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -193,7 +193,6 @@ allOf:
             - mediatek,mt8183-mmc
             - mediatek,mt8186-mmc
             - mediatek,mt8188-mmc
-            - mediatek,mt8189-mmc
             - mediatek,mt8195-mmc
             - mediatek,mt8196-mmc
             - mediatek,mt8516-mmc
@@ -348,6 +347,34 @@ allOf:
             - const: axi_cg
             - const: ahb_cg
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8189-mmc
+    then:
+      properties:
+        clocks:
+          minItems: 6
+          items:
+            - description: source clock
+            - description: HCLK which used for host
+            - description: independent source clock gate
+            - description: bus clock used for internal register access
+            - description: peripheral bus clock gate
+            - description: AXI bus clock gate
+            - description: crypto clock used for data encrypt/decrypt (optional)
+        clock-names:
+          minItems: 6
+          items:
+            - const: source
+            - const: hclk
+            - const: source_cg
+            - const: bus_clk
+            - const: pclk_cg
+            - const: axi_cg
+            - const: crypto
+
 unevaluatedProperties: false
 
 examples:

---
base-commit: ba7c57499e5999aeae8dd4f954eb2600589d80aa
change-id: 20260701-mt8189-mmc-dt-bindings-fix-18959c85d5b6

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


