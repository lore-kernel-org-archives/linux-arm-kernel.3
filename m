Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8155CCA464
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 12:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2oAmGIlpdPl2AN1PftE2Ur8HmShgIa7sf5IdyJU07Fw=; b=Ua8c0qeDlXt96MBvI8yoqyKuWS
	9nSdlPBh02aepdlecgXBAu5Hdwqmiq8Er+znEZrEOtBr+8sgrekLm0kA55Mt1FF/Nnp+FXvBfdxvV
	Bo+1EAg6UMGkPVgrtyHyso1npybLcCU9/3NMAs7KtF5SEDKy4XBCdn5A/mZd/LVLojt7cVIMvYfJz
	UR+lmC2GFHjNj/SJnLUPD80t9rAr5JL/W+tLxf9DcpgMX/ZIVoM5bJBNZrRLg4iSx9V6qpLahdXqz
	8Ch4YQ7hF3NPBbHjrmChAxQMx6FJKHrlNRfEz1FKQWx4lEWEelzEt8OVHZas1RRBc8IQEjoVn+hxu
	VSk0xxow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHh8C-00000002tNp-2cIv;
	Fri, 16 Oct 2026 12:33:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHh85-00000002t9S-0R5H;
	Fri, 16 Oct 2026 12:33:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=2oAmGIlpdPl2AN1PftE2Ur8HmShgIa7sf5IdyJU07Fw=; b=QIHxeSZXwnrhLLqXgDeDkaBsB7
	YO1grsSfaEHq1QEGtR7kPqpqlRr1bUT5A+0sx5YhVTEy1VHJxYNtylUweYs0/de7/m3K7KboIaXSl
	Kn+dH4TQimH5ft9jJZF5Jm4VfaGPlEWMXxqDRCXtOwZvuSk12jHBrUPGlvKdg+Kuj63eaa+FaIJSO
	m+qoDhzqBXhRLn2GVRZHpVC2lnAeM/LvQW8ut9MNEB8rPDNNTvqGc6XzSQyLn/B7yn/uZXE2NOMVK
	eUH+GKpylkqENWWvtbvTymmqWVXiI4NJh+BZljZsmYGsrlT+yUpKjk8rrTmXNwkH7EIgp/0VOmbn+
	z1LGyFVw==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHh7x-00000001U9O-13St;
	Fri, 16 Oct 2026 12:33:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792154014;
	bh=m5hJfIrVYgzyNoAPyhFPMGOJ7BJWLS/eKC+SWXbrdVE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dVEfJGNWzq86haeY9ndZyivAyUvzSqrI57+Ovmd8GZceHLiUa/R4V3STE4rK0Vq0b
	 gHXr96h2dv1eudtBhGCb1PR3A7GPDnEGmhOsXOUq4XWPZooem0J030HOp4M51o5i7J
	 nKV7tIaSjq2z9dTztaLeRseclDh4iXv/zyi2k0jsZ0H2TFNaQXQmsJHc8ntN1h+iI+
	 HsDXkC/Ez2fpXqtzcR1KltZHWeZ5r8wzufH/EiIKoZqTAy8MivPlmaRMEP6v2zjMCH
	 hABCcc8W8mnnEg+ZiZJylgON7BfHpI07DbPYpTn58CsBTzb0hHw0tKTUYTYz+zO4Qi
	 EqHu4CwSMdIRQ==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 29B6217E1509;
	Fri, 16 Oct 2026 14:33:33 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 16 Oct 2026 14:32:55 +0200
Subject: [PATCH v14 03/23] dt-bindings: ufs: mediatek,ufs: Add mt8196
 variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-mt8196-ufs-v14-3-e8d565e0cd45@collabora.com>
References: <20261016-mt8196-ufs-v14-0-e8d565e0cd45@collabora.com>
In-Reply-To: <20261016-mt8196-ufs-v14-0-e8d565e0cd45@collabora.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Peter Wang <peter.wang@mediatek.com>, 
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Stanley Jhu <chu.stanley@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <mkp@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792154009; l=2540;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=Fu9MfrHRxOqGq0SuEgCjBQkvUm2tW9NvFGGI8VG1HyQ=;
 b=1/2z1sYlEqYqWvUjCr1bFKPYOg+fGPuR+qxM0EZDMaRkQhteiSyfOGvcrTpF7IuvlDPu870EN
 gSReGPSA1l+BxbjNpGO5YlgIZ6KdbTvprRO2e3se/wH9KohmybDbpTY
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_133341_976236_8A9B4855 
X-CRM114-Status: GOOD (  11.72  )
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
It is therefore not compatible with the MT8195. It also have an additional
0.9V supply pin (AVDD09_UFS_1), that is specific to this SoC, thus not
currently described in the binding.

Add a compatible for this SoC and new property for the additional supply,
and modify the binding correspondingly.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Reviewed-by: Chaotian Jing <chaotian.jing@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 .../devicetree/bindings/ufs/mediatek,ufs.yaml       | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
index 945cb986b06b..99181ec9dda0 100644
--- a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
@@ -16,6 +16,7 @@ properties:
       - mediatek,mt8183-ufshci
       - mediatek,mt8192-ufshci
       - mediatek,mt8195-ufshci
+      - mediatek,mt8196-ufshci
 
   clocks:
     minItems: 1
@@ -60,6 +61,9 @@ properties:
   avdd09-supply:
     description: Phandle to the 0.9V supply powering the AVDD09_UFS pin
 
+  avdd09-1-supply:
+    description: Phandle to the 0.9V supply powering the AVDD09_UFS_1 pin
+
   avdd12-supply:
     description: Phandle to the 1.2V supply powering the AVDD12_UFS pin
 
@@ -104,6 +108,7 @@ allOf:
         clock-names:
           items:
             - const: main
+        avdd09-1-supply: false
         avdd12-ckbuf-supply: false
   - if:
       properties:
@@ -119,6 +124,7 @@ allOf:
           minItems: 3
           maxItems: 3
         avdd09-supply: false
+        avdd09-1-supply: false
   - if:
       properties:
         compatible:
@@ -131,6 +137,21 @@ allOf:
         clock-names:
           minItems: 10
         avdd09-supply: false
+        avdd09-1-supply: false
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

-- 
2.56.0


