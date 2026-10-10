Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6129CA9EBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 08:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RU2VHzQr3s5TQpLpX0+Pi/srJNAx0aHZ1GUCXSfJ9lc=; b=te/EnQi7ZnGWL20QA+uJ6o70SX
	VoqYcN+VAduWRlGYp4+7PCrHMnGsxD4XGpRo/KS2tqoypgBmUXWGUYlnVtTh/Li1i4VhQY1x2+b8B
	E08T58bdY0M1mmTlYtDiHRigXKcz7yKrn1gm7FvZHoen6dKiIwsBKk1FVlwurrrt7yYFp6u7GbA3J
	trUbh/oRvdV3TEyq9KXXN7K0cfzHLUhvp/obs4j3BzDuykA0n/15wsjGFh8BzDsud6urk/PjT+gQh
	O1IVh04Wg2gLydVERQkRoqhzd1ZVNeNVxCBcIXixDQ7YzrfDZaFm4hYGGltMEHAWrwrBvKR7txMaE
	dfLBwFPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFS7o-00000007df9-1Tkl;
	Sat, 10 Oct 2026 08:08:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFS7X-00000007dI1-1HPo;
	Sat, 10 Oct 2026 08:07:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RU2VHzQr3s5TQpLpX0+Pi/srJNAx0aHZ1GUCXSfJ9lc=; b=f9QUdDGKgPKY/8A5cdE/VCAp+8
	tF/Eqc0nEEF814Ltkf214qcXQ+26KvzFqF5oIEbciGe5R99KzEKrQ8TjNMAwBgt3M9/ZYYSZFyvnm
	lBw8mBCUssvqvygIslEx5hKMqzwD7G3jnvwosObigH57UHV6KSWtb3J/gSBKx4uV2uOKndPu7uPyy
	Va2tptGnUeFx1zr6S7vjn+TVZCS76NOC1fgw4oEBGRwxIR4MjMHDGWCilRctacVN464IN0Fxf+pVg
	rYxADKOLYB+9EuEs6wm+WdHWjANLdU9DmGCGA09TKCcD5UkmFg5oSOpVAq9ECdNjmJXOGj+X+T9rh
	5WVotKhg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xFS7U-0000000BvVe-0op9;
	Sat, 10 Oct 2026 08:07:54 +0000
X-UUID: a55de1b4c48111f1acbe4559397dec65-20261010
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=RU2VHzQr3s5TQpLpX0+Pi/srJNAx0aHZ1GUCXSfJ9lc=;
	b=uNQMQenVi390mBxVNz3XWB/2QorMGAjVTKvEE7aIU4uiY1BWVsOyNcaX/MpykikuyKnFxcKdFAPMTKe8uckjOhJRhVuVUzBSpHRPuwFtoXaf9EG5jPBR4MT8G7qjm9soMNGZTdtn9XiSw9IHKbimD4CAjijKU5guPNHGm14Uskg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:0d7b0b73-a29e-4a48-8cd0-5c7db81a7d7c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:291e20b,CLOUDID:59feecb8-514b-419b-be8a-53f1868a3ee6,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a55de1b4c48111f1acbe4559397dec65-20261010
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1410924402; Sat, 10 Oct 2026 01:07:32 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 10 Oct 2026 16:07:31 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sat, 10 Oct 2026 16:07:30 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Bin Liu <bin.liu@mediatek.com>,
	kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>, Hans Verkuil
	<hverkuil@kernel.org>, irui wang <irui.wang@mediatek.com>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Kyrie Wu <kyrie.wu@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v18 09/13] media: dt-bindings: mediatek,jpeg: Add mediatek, mt8196-jpgdec compatible
Date: Sat, 10 Oct 2026 16:07:13 +0800
Message-ID: <016a61397c01b8745622ff54f1e27b5209b3f34d.1791614327.git.kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791614327.git.kyrie.wu@mediatek.com>
References: <cover.1791614327.git.kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_090752_723364_B1631703 
X-CRM114-Status: GOOD (  12.31  )
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

Compared to the previous generation IC, the MT8196 uses SMMU
instead of IOMMU and supports features such as dynamic voltage
and frequency scaling. Therefore, add "mediatek,mt8196-jpgdec"
compatible to the binding document.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/media/mediatek,mt8195-jpegdec.yaml           | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
index e5448c6..28a9a9b 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
@@ -14,7 +14,9 @@ description:
 
 properties:
   compatible:
-    const: mediatek,mt8195-jpgdec
+    enum:
+      - mediatek,mt8195-jpgdec
+      - mediatek,mt8196-jpgdec
 
   power-domains:
     maxItems: 1
@@ -44,7 +46,9 @@ patternProperties:
 
     properties:
       compatible:
-        const: mediatek,mt8195-jpgdec-hw
+        enum:
+          - mediatek,mt8195-jpgdec-hw
+          - mediatek,mt8196-jpgdec-hw
 
       reg:
         maxItems: 1
-- 
2.51.0.windows.2


