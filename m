Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE6FCA9EBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 08:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SsG06u82TMYa9yllME0z33TPKKwAQOW1whz1Eqh4/uo=; b=WjDt6LDg/4xuHN/Q3Z/vp/ownn
	rK42iT4mAb1qmYVD1AF8sKCXu7ydgFPhxOgVHumU8hX7ReIFJ0njd2HhUZWdqwHSH+1q8OMtYD//w
	Jxy65RkLUHyQtANGR7B3anKh585xohOT5AbUyeLs49sXmJC1q1hQMrA6W7A97aF/aoe71iPaDnLtT
	9zz0tcinDMPgGJNADtUJoKH8HTJeNdKQVSKYHFocsMfdqzQRMypCCc6AcxFE3umQNE7kuq3l5wHv3
	G8MOn5pIm41Dpw/QCYd01N4DIHZzFqxzt7Pd/RT2+VVfp+8JeXmUaeNXV8SpE8IYd7as+X7pxiFjP
	cY2zXBPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFSZs-00000007gZH-30Am;
	Sat, 10 Oct 2026 08:37:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFSZY-00000007g4R-0f6O;
	Sat, 10 Oct 2026 08:36:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=SsG06u82TMYa9yllME0z33TPKKwAQOW1whz1Eqh4/uo=; b=Br5cLwc8sREYSSKtCdEIYmeir4
	+suMGncCSUkzLF0GBRUUJiN4olob8yjaaps9kC9/HP4Wf1HRAas4fTcPV1cShx4thsqKxYmszPEYq
	+bMI+8p/Wt9hGbsEH6z3SNpM9xVBPUJ5RqE9Bg4EgX8uARhPOigdxdk1kCcsdvq/BCSfgwyLB1QA3
	s7vJPeYPZ3RG/3vCorgFvM91S5Or24XyKKRq1C840JdIWbMNdbJitTQ9VjuShknDX88Q7fIlNFlnK
	OamMckf5bfNCeCa16MubpB8vOArJ8/1Xoe/FZJI/7Fj/1J6bIM8ifIVlhNp56fEgtV8ohNJ6akfhp
	2pMfJwKA==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xFSZT-0000000Bwto-1qaT;
	Sat, 10 Oct 2026 08:36:51 +0000
X-UUID: b4e8b538c48511f1afed4741b24580c9-20261010
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=SsG06u82TMYa9yllME0z33TPKKwAQOW1whz1Eqh4/uo=;
	b=pBxZPZ3XahaeUlO3ik5t1ee1BuqkLhIYONfOBuoJnEjp3PCpv0Y6Wcr4Nm3TMau0No2NfRzHIgo8eRHrzXKPbZhWhxYZZMtvEossz/kE6ai1DX3HRnVLOU1LtbK03MMGLDWBhks0d1lP4GLnY0YhEqvV/kXIk/L/ydwXkgJVoho=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:13ca233f-c5fe-4ee0-9d6d-e13a7955d5c2,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:291e20b,CLOUDID:36b22e95-3103-4fdb-b79c-08de0e281a5d,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b4e8b538c48511f1afed4741b24580c9-20261010
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2115146904; Sat, 10 Oct 2026 01:36:37 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 10 Oct 2026 16:36:34 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sat, 10 Oct 2026 16:36:33 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Ricardo Ribalda
	<ribalda@chromium.org>, Kees Cook <kees@kernel.org>, Hans Verkuil
	<hverkuil+cisco@kernel.org>, Fei Shao <fshao@chromium.org>, Haoxiang Li
	<haoxiang_li2024@163.com>, Chen-Yu Tsai <wenst@chromium.org>, Laurent
 Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Tomasz Figa
	<tfiga@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, Benjamin
 Gaignard <benjamin.gaignard@collabora.com>, Qianfeng Rong
	<rongqianfeng@vivo.com>, Irui Wang <irui.wang@mediatek.com>, Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>, Fan Wu <fanwu01@zju.edu.cn>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v8 11/14] media: mediatek: vcodec: support 36bit iova address
Date: Sat, 10 Oct 2026 16:36:10 +0800
Message-ID: <39514b1b5a96ac44d11e2b352a6bf70503128913.1791619743.git.kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791619742.git.kyrie.wu@mediatek.com>
References: <cover.1791619742.git.kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_093648_621970_0F5FEA95 
X-CRM114-Status: GOOD (  12.93  )
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

Need to set dma mask to support 36bit iova address for decoder
hardware can use 36bit address to decode for mt8196.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c  | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
index 0d27adbf..4d65c102 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
@@ -392,6 +392,13 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 	dma_set_max_seg_size(&pdev->dev, UINT_MAX);
+	if (dev->chip_name == MTK_VDEC_MT8196) {
+		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(36));
+		if (ret) {
+			dev_err(&pdev->dev, "Failed to enable 36-bit DMA: %d\n", ret);
+			return ret;
+		}
+	}
 
 	dev->fw_handler = mtk_vcodec_fw_select(dev, DECODER, dev->fw_init);
 	if (IS_ERR(dev->fw_handler))

