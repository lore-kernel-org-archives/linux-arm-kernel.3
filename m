Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A07DCD6E6B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 08:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+dqfuCJbs+O/ElOdUAzqup4cvk+s5X6t24No/bT+PNI=; b=kOMsBoA8YQHncri/d7EWgRgWfn
	cJR3NcY1B9Yq+gEW2LNm4HGATFCWH2uNzwTlw3KBZnvx/djGk6STw7KEFgs5pHQFRcSbjg3TO2FU0
	H/nMVzn5MYvHf7ucF33PPfdUsLGyOVSNXr5q57W8qwmwWluewKvlTW6HX4gawycZQKZBM1BKPs1gX
	X9eV7At5gv49vthV+6TT8lmyye29d1KlHwmYixivZWXm+R75l2DN1pSa8gU+kU/I/s56e0j3ki53P
	yZNanYxY6FVn4riVJtzLUCrqZJ2f+wKRuxO6G9dk1paFcZ3doRUvDkK4eLJSHdXXvRge8FUrHGu0h
	G5lMo1jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhAU-0000000EcbI-24l0;
	Wed, 03 Jun 2026 08:41:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhAP-0000000EcUV-08Ff;
	Wed, 03 Jun 2026 08:41:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+dqfuCJbs+O/ElOdUAzqup4cvk+s5X6t24No/bT+PNI=; b=HBcOB36RbFz/8Z7IUB/9geVH3k
	gP/eXn+qf2bgdk2NY1EVPOXummlfUNzMSLoXqy3gN9QhLLAwLvJZ1ZxC93e8kMK8ittef5kiGuVFl
	POC7wHpvFHrLM52Kd1csLqghx/XB23i2aMkmElgD+ZhjIfXF56M+P2r187JQhTUd6x6ZIP0IigH5P
	NdrwtaCROtgD0Lnq8lqWuYX5ACVpldfIt0RWyzEO4Moq444bRYnzeBSp18lX86nK90MRQ8lzsIytX
	zygvOdYukvzyGxCr2QAOifDzh7JgfOxJ1G9p25+5oYdEZYsEKwYTFHdohkPhxsFZ23SMfp+aPdqdC
	5Qqow5Gg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUhAK-0000000Bbj5-3wSD;
	Wed, 03 Jun 2026 08:41:35 +0000
X-UUID: 031a28f45f2811f1afed4741b24580c9-20260603
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=+dqfuCJbs+O/ElOdUAzqup4cvk+s5X6t24No/bT+PNI=;
	b=H3U5hZ3nmXT9vxRPC/XM3oHNBx24y9+aiewZ6F363vH3OwTzbfSaizDeBqJq8IbhYYUMnUFzUB/isrxxnUCgTEavuWhq20VTvqYMwDHU4QcfmlVI/tmzEJlYXHj5yXIcH6EhdnxCWOk2Q1hcSmhcMAl9Vx3BiNQ27h3/h2uMG+k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:5c0b499e-e4e6-4820-81c5-b72d8eaf38cf,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:b7b62e8f-2d9b-4560-8147-1122f58e041c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|136|836|865|888|898,TC:-5,
	Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,C
	OL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 031a28f45f2811f1afed4741b24580c9-20260603
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1314942365; Wed, 03 Jun 2026 01:41:28 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Jun 2026 16:41:25 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 3 Jun 2026 16:41:23 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Ricardo Ribalda <ribalda@chromium.org>,
	Kees Cook <kees@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>,
	Haoxiang Li <haoxiang_li2024@163.com>, Fei Shao <fshao@chromium.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>, Sebastian Fricke
	<sebastian.fricke@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>, Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>, Irui Wang <irui.wang@mediatek.com>, Fan Wu
	<fanwu01@zju.edu.cn>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Kyrie Wu <kyrie.wu@mediatek.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>, Tzung-Bi Shih
	<tzungbi@kernel.org>, Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH v5 12/14] media: mediatek: vcodec: add decoder compatible to support mt8196
Date: Wed, 3 Jun 2026 16:40:42 +0800
Message-ID: <20260603084045.17488-13-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260603084045.17488-1-kyrie.wu@mediatek.com>
References: <20260603084045.17488-1-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_094133_420683_3ADEA415 
X-CRM114-Status: GOOD (  12.74  )
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

From: Yunfei Dong <yunfei.dong@mediatek.com>

MT8196 is lat single core architecture. Support its compatible and
use `mtk_lat_sig_core_pdata` to initialize platform data.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c   | 6 ++++++
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h   | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
index 68759db6f8d1..bee6e057b0a7 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
@@ -347,6 +347,8 @@ static void mtk_vcodec_dec_get_chip_name(struct mtk_vcodec_dec_dev *vdec_dev)
 		vdec_dev->chip_name = MTK_VDEC_MT8186;
 	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8188-vcodec-dec"))
 		vdec_dev->chip_name = MTK_VDEC_MT8188;
+	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8196-vcodec-dec"))
+		vdec_dev->chip_name = MTK_VDEC_MT8196;
 	else
 		vdec_dev->chip_name = MTK_VDEC_INVAL;
 }
@@ -573,6 +575,10 @@ static const struct of_device_id mtk_vcodec_match[] = {
 		.compatible = "mediatek,mt8188-vcodec-dec",
 		.data = &mtk_lat_sig_core_pdata,
 	},
+	{
+		.compatible = "mediatek,mt8196-vcodec-dec",
+		.data = &mtk_lat_sig_core_pdata,
+	},
 	{},
 };
 
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
index 15e437323af5..53d1708b012b 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -29,6 +29,7 @@ enum mtk_vcodec_dec_chip_name {
 	MTK_VDEC_MT8188 = 8188,
 	MTK_VDEC_MT8192 = 8192,
 	MTK_VDEC_MT8195 = 8195,
+	MTK_VDEC_MT8196 = 8196,
 };
 
 /*
-- 
2.45.2


