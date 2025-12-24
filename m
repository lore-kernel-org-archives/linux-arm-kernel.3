Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 221FBE74908
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 03:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NiZxc43IjHBA+/wzLD458ncrHI4s1rgsJ+lbgDIgSAE=; b=Nun1pW+mZEn4ffAdv7Revp6Mw5
	0d5TPMuT1ppXlZMbRMlrMLSpJmAAy4z4ij0gnshmc5L3JydTV1KZBogmLuLzzFnaAMTkoURAaKpL0
	tkG6QHdzQU9qZor0NjSxYpiifQCSnjPClOA7LRuVfGyHazyM4cZcOPHieFe4SlRoPsc6M8T3yLAKk
	bbJ2iKTRq4TUUMQ0pk2Qqw/wAiAKiRsOqmleWnak7J6xcIaIAgVq841pdZvOvgwanfExNXajdjBNy
	ivfDFyoOxfaPfjV1S67XODK/zqMBmiM8rW4zf2uO9hh59EHdjbrZ7Ztp2xXNoYT2YymQmNCo5PNMf
	mfVUnhGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYFNv-0000000GLvx-1NRs;
	Wed, 24 Dec 2025 03:17:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYFNp-0000000GLs0-23ZT;
	Wed, 24 Dec 2025 03:17:54 +0000
X-UUID: 1ed72c34e07711f09f706fa2197c6ceb-20251223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=NiZxc43IjHBA+/wzLD458ncrHI4s1rgsJ+lbgDIgSAE=;
	b=Z5MS1C76NWCkF79p8xWHdTrknhmgBXhNSWYUxQ7SF/XywUE818p9UF+Ud8Yc7JzupX6Dpuoc9OwvdW4+zNh/IQ53sMGnGQRr0Zr4xes4zwURFCz4qiRu5CZPCAhP4XNshfwj42gaqMp/YjiKML1fmQsGjqoMbLoDNID1eMtYLow=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:ee7fe61a-2e2a-421f-9ac6-51f0f6024b0e,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:5047765,CLOUDID:bcc01b03-1fa9-44eb-b231-4afc61466396,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1ed72c34e07711f09f706fa2197c6ceb-20251223
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jianhua.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 64247801; Tue, 23 Dec 2025 20:17:47 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 24 Dec 2025 11:17:44 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 24 Dec 2025 11:17:43 +0800
From: Jianhua Lin <jianhua.lin@mediatek.com>
To: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, Jianhua Lin <jianhua.lin@mediatek.com>
Subject: [PATCH v2 1/4] arm64: dts: mt8188: update JPEG encoder/decoder compatible
Date: Wed, 24 Dec 2025 11:17:18 +0800
Message-ID: <20251224031721.9942-2-jianhua.lin@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20251224031721.9942-1-jianhua.lin@mediatek.com>
References: <20251224031721.9942-1-jianhua.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_191753_536001_371DF1AA 
X-CRM114-Status: UNSURE (   9.16  )
X-CRM114-Notice: Please train this message.
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

The JPEG encoder and decoder of MT8188 share the same architecture
and features as those of MT8189, both use a 34-bit iova
address-space (16GB) and a single clock configuration.

Previously, MT8188 was incorrectly defined alongside SoCs with 32-bit
iova address-space (4GB), such as "mediatek,mt2701-jpgdec" and
"mediatek,mtk-jpgenc". This mismatch results in an ABI break,
as MT8188 cannot function correctly under the 32-bit iova
address-space (4GB) configuration.

Therefore, MT8188 needs to inherit from MT8189.
Update "mediatek,mtk-jpgenc" to "mediatek,mt8189-jpgenc",
update "mediatek,mt2701-jpgdec" to "mediatek,mt8189-jpgdec".

Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 90c388f1890f..ff9a774f5911 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -2846,7 +2846,7 @@ video_encoder: video-encoder@1a020000 {
 		};
 
 		jpeg_encoder: jpeg-encoder@1a030000 {
-			compatible = "mediatek,mt8188-jpgenc", "mediatek,mtk-jpgenc";
+			compatible = "mediatek,mt8188-jpgenc", "mediatek,mt8189-jpgenc";
 			reg = <0 0x1a030000 0 0x10000>;
 			clocks = <&vencsys CLK_VENC1_JPGENC>;
 			clock-names = "jpgenc";
@@ -2859,11 +2859,10 @@ jpeg_encoder: jpeg-encoder@1a030000 {
 		};
 
 		jpeg_decoder: jpeg-decoder@1a040000 {
-			compatible = "mediatek,mt8188-jpgdec", "mediatek,mt2701-jpgdec";
+			compatible = "mediatek,mt8188-jpgdec", "mediatek,mt8189-jpgdec";
 			reg = <0 0x1a040000 0 0x10000>;
-			clocks = <&vencsys CLK_VENC1_LARB>,
-				 <&vencsys CLK_VENC1_JPGDEC>;
-			clock-names = "jpgdec-smi", "jpgdec";
+			clocks = <&vencsys CLK_VENC1_JPGDEC>;
+			clock-names = "jpgdec";
 			interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH 0>;
 			iommus = <&vdo_iommu M4U_PORT_L19_JPGDEC_WDMA_0>,
 				 <&vdo_iommu M4U_PORT_L19_JPGDEC_BSDMA_0>,
-- 
2.45.2


