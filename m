Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07906C54FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 09:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VrbdI+3O7VLWBBQ52j1XvamMGa6q3GEz3oZsQ8NPzcE=; b=FBVNPNZkm52Zql3bpGDaRAXXJe
	lADRp4Hc7mNCXZyRIeCQIdRUtZMFB9E9aosivarSRjSwA4okyJW/V8kZgW8zRT4Dd9wM4UubYwe88
	QsSdWcRWqheCO9lVhjxpELdcT6AJ+xbeAn+PorArPR98e25bZ3pAwDerctwOui+9bJ1fTaofjClgz
	rNsSxqPLxzvSUgUU3a170dMenj1D+a4V85tUm2+CmrU34fJIUXX5tPycIBlq3KxxDAvTZFEZMoK/E
	DDKVHaPro04sGvMDRJqG0zeBM2YpO3Mc+T64kluRGQFFLvb19ARrTYuYR0wPnnbmAPTPdZZuGi3Ja
	W+QM3UhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNPW-0000000A3sh-1OO7;
	Thu, 30 Jul 2026 09:50:42 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNOs-0000000A3O7-31qW;
	Thu, 30 Jul 2026 09:50:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785404999;
	bh=LVYx9mhcDnPo1tnQ6sCMS9IkMWbpCEPCVQ9iCPF5BsY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PAr6flNgMi5dPMolQpCD00qLwCRk9IvffKK56YBoY1lNWpIoBKT28JCthckpnJ4xR
	 CvGO8F6OixEiDbVcgIOMJLGOso+sgXv1QwZf/K7qxiOnt5MT3DHUvWG3KsIxY357aN
	 0OIpN1WSElGrRHSy7jZZSEkDjfCFW1csilV2MKWmNy5y6yIqDS+kKhxwRFFDXIdnyt
	 Ffu9EHt9b693szff+getPvJte6HIzt2TRwndpenNtd0VMLXB7cc86h2yghpJU9+m7q
	 eZRKNf569078fuCTtTjEtxeANWuxU6MQwhiINmBFQYa/sqy7DT0BzXwUECZnBDQGJd
	 SdIrE0lSRJ37w==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8A88117E0700;
	Thu, 30 Jul 2026 11:49:58 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 30 Jul 2026 11:48:59 +0200
Subject: [PATCH v10 03/26] dt-bindings: ufs: mediatek,ufs: Add mt8196
 variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-mt8196-ufs-v10-3-bc5ecef202dc@collabora.com>
References: <20260730-mt8196-ufs-v10-0-bc5ecef202dc@collabora.com>
In-Reply-To: <20260730-mt8196-ufs-v10-0-bc5ecef202dc@collabora.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Peter Wang <peter.wang@mediatek.com>, 
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@sandisk.com>, Bart Van Assche <bvanassche@acm.org>, 
 Stanley Jhu <chu.stanley@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785404993; l=2995;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=vXbgbbA/ReyeJVMGYyefCg84nGPa42OXg9cLzrvqrGk=;
 b=FD71VCnaCRD9uOjvl0KtqwkgTo+W+SzgO8ZZIcNasugmRBBS4KA4/SXJsQI6B6a49ZatoJrMK
 P4v//IZ0okRBETzfUV9h7TTkwtfacSru4bR3pfSZAwuNYDjun48jUhk
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_025004_103140_356FD736 
X-CRM114-Status: GOOD (  11.04  )
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

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

The MediaTek MT8196 SoC's UFS controller uses a different set of supplies.
It is therefore not compatible with the MT8195.

While it does have a AVDD09_UFS_1 pin in addition to the AVDD09_UFS pin,
it appears that these two pins are commoned together, as the board
schematic I have access to uses the same supply for both, and the
downstream driver does not distinguish between the two supplies either.

Add a compatible for it, and modify the binding correspondingly.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 .../devicetree/bindings/ufs/mediatek,ufs.yaml      | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
index e7e360c59ba5..70164e4e54c5 100644
--- a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
@@ -16,6 +16,7 @@ properties:
       - mediatek,mt8183-ufshci
       - mediatek,mt8192-ufshci
       - mediatek,mt8195-ufshci
+      - mediatek,mt8196-ufshci
 
   clocks:
     minItems: 1
@@ -131,6 +132,20 @@ allOf:
         clock-names:
           minItems: 10
         avdd09-supply: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8196-ufshci
+    then:
+      properties:
+        clocks:
+          minItems: 10
+        clock-names:
+          minItems: 10
+        avdd18-supply: false
+      required:
+        - operating-points-v2
 
 examples:
   - |
@@ -177,3 +192,33 @@ examples:
 
         mediatek,ufs-disable-mcq;
     };
+  - |
+    #include <dt-bindings/reset/mediatek,mt8196-resets.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    ufshci@16810000 {
+        compatible = "mediatek,mt8196-ufshci";
+        reg = <0x16810000 0x2a00>;
+        interrupts = <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>;
+
+        clocks = <&ufs_ao_clk 6>, <&ufs_ao_clk 7>, <&clk26m>, <&ufs_ao_clk 3>,
+                 <&clk26m>, <&ufs_ao_clk 4>, <&ufs_ao_clk 0>,
+                 <&topckgen 7>, <&ufs_ao_clk 1>, <&ufs_ao_clk 2>;
+        clock-names = "main", "aes", "tick", "unipro_sysclk",
+                      "unipro_tick", "unipro_mp_bclk", "tx_symbol",
+                      "mem_sub", "rx_symbol0", "rx_symbol1";
+
+        operating-points-v2 = <&ufs_opp_table>;
+
+        phys = <&ufsphy>;
+
+        avdd09-supply = <&mt6363_vsram_modem>;
+        vcc-supply = <&mt6363_vemc>;
+        vccq-supply = <&mt6363_vufs12>;
+
+        resets = <&ufs_ao_clk MT8196_UFSAO_RST1_UFS_UNIPRO>,
+                 <&ufs_ao_clk MT8196_UFSAO_RST1_UFS_CRYPTO>,
+                 <&ufs_ao_clk MT8196_UFSAO_RST1_UFSHCI>;
+        reset-names = "unipro", "crypto", "hci";
+        mediatek,ufs-disable-mcq;
+    };

-- 
2.55.0


