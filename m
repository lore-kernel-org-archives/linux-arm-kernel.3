Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C71BBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 03:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y33sl6LlKQwmsMxpToD1qauD4dOYyjLtnlR4y1Y+rgA=; b=LN9IZu0nWvx7OmioHWAPPLI0M1
	xy4zdHG+0LWiEYBLxu3+CjYbiy3VoywMHqOnIGnBnn+6mZ3JkffNtEmysdg0D8H3TcKznxiAXzQS7
	jlzQSY0H+NKTLt0R7i71vyYjDjsaGWwCOk3V6JrxDQQ0Av/1/RRxIqAeVrpLPbWUFpw69h29gOzvf
	V4Tbv6PwgV2P7ytfUm8EWnWpmovSH6FYhFWPcPFkgUcOs0reBWBHakihj+j3gGtetEfZIRjQMtIRq
	UuTOPASlLFv+FXf21iK/gAyD2vNoAyMvySKc7H+MLREkvXcmW/JeAsNt6L/wYqTASk0B5Rx+LgdBA
	Iq4Dt+Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whfQN-00000000tWd-3uv2;
	Thu, 09 Jul 2026 03:27:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whfQM-00000000tVC-1WAO;
	Thu, 09 Jul 2026 03:27:43 +0000
X-UUID: 21ef83527b4611f1acbe4559397dec65-20260708
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=y33sl6LlKQwmsMxpToD1qauD4dOYyjLtnlR4y1Y+rgA=;
	b=U9jxRMqmqZc8Kze8lYxPq+B72oLntXH22eAqf9PyA+Z9K/ESLCaf64iuTktu6sDAYl8XyVYgUtnxAG6Z43VcHVzrbMhQIt/F33mnT3pgNo/zED/W5dnbbU8oikHkrCMcPv3r4Vgp4YB52o2q9a9C+mdJyxactmzEy/VF7/YArDU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:ec071874-6396-4516-8560-9511f9577827,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:3cf1e618-ab14-4403-9336-76696324c5a8,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 21ef83527b4611f1acbe4559397dec65-20260708
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <jianhua.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1218157964; Wed, 08 Jul 2026 20:27:37 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 9 Jul 2026 11:27:35 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 9 Jul 2026 11:27:35 +0800
From: Jianhua Lin <jianhua.lin@mediatek.com>
To: <nicolas@ndufresne.ca>, <mchehab@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, Jianhua Lin <jianhua.lin@mediatek.com>
Subject: [PATCH v9 3/3] media: mediatek: jpeg: add compatible for MT8189 SoC
Date: Thu, 9 Jul 2026 11:26:56 +0800
Message-ID: <20260709032657.25730-4-jianhua.lin@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260709032657.25730-1-jianhua.lin@mediatek.com>
References: <20260709032657.25730-1-jianhua.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_202742_413822_533E1BE9 
X-CRM114-Status: GOOD (  11.23  )
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

Compared to the previous generation ICs, the MT8189 uses a 34-bit IOVA
address space (16GB) and requires a single clock configuration.

Therefore, add new compatible strings ("mediatek,mt8189-jpgenc" and
"mediatek,mt8189-jpgdec") along with their specific driver data to
support the JPEG encoder and decoder of the MT8189 SoC.

Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
---
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index d147ec483081..14f2991a4053 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1868,6 +1868,10 @@ static struct clk_bulk_data mt8173_jpeg_dec_clocks[] = {
 	{ .id = "jpgdec" },
 };
 
+static struct clk_bulk_data mtk_jpeg_dec_clocks[] = {
+	{ .id = "jpgdec" },
+};
+
 static const struct mtk_jpeg_variant mt8173_jpeg_drvdata = {
 	.clks = mt8173_jpeg_dec_clocks,
 	.num_clks = ARRAY_SIZE(mt8173_jpeg_dec_clocks),
@@ -1899,6 +1903,38 @@ static const struct mtk_jpeg_variant mtk_jpeg_drvdata = {
 	.multi_core = false,
 };
 
+static const struct mtk_jpeg_variant mtk8189_jpegenc_drvdata = {
+	.clks = mtk_jpeg_clocks,
+	.num_clks = ARRAY_SIZE(mtk_jpeg_clocks),
+	.formats = mtk_jpeg_enc_formats,
+	.num_formats = MTK_JPEG_ENC_NUM_FORMATS,
+	.qops = &mtk_jpeg_enc_qops,
+	.irq_handler = mtk_jpeg_enc_irq,
+	.hw_reset = mtk_jpeg_enc_reset,
+	.m2m_ops = &mtk_jpeg_enc_m2m_ops,
+	.dev_name = "mtk-jpeg-enc",
+	.ioctl_ops = &mtk_jpeg_enc_ioctl_ops,
+	.out_q_default_fourcc = V4L2_PIX_FMT_YUYV,
+	.cap_q_default_fourcc = V4L2_PIX_FMT_JPEG,
+	.support_34bit = true,
+};
+
+static const struct mtk_jpeg_variant mtk8189_jpegdec_drvdata = {
+	.clks = mtk_jpeg_dec_clocks,
+	.num_clks = ARRAY_SIZE(mtk_jpeg_dec_clocks),
+	.formats = mtk_jpeg_dec_formats,
+	.num_formats = MTK_JPEG_DEC_NUM_FORMATS,
+	.qops = &mtk_jpeg_dec_qops,
+	.irq_handler = mtk_jpeg_dec_irq,
+	.hw_reset = mtk_jpeg_dec_reset,
+	.m2m_ops = &mtk_jpeg_dec_m2m_ops,
+	.dev_name = "mtk-jpeg-dec",
+	.ioctl_ops = &mtk_jpeg_dec_ioctl_ops,
+	.out_q_default_fourcc = V4L2_PIX_FMT_JPEG,
+	.cap_q_default_fourcc = V4L2_PIX_FMT_YUV420M,
+	.support_34bit = true,
+};
+
 static struct mtk_jpeg_variant mtk8195_jpegenc_drvdata = {
 	.formats = mtk_jpeg_enc_formats,
 	.num_formats = MTK_JPEG_ENC_NUM_FORMATS,
@@ -1938,6 +1974,14 @@ static const struct of_device_id mtk_jpeg_match[] = {
 		.compatible = "mediatek,mtk-jpgenc",
 		.data = &mtk_jpeg_drvdata,
 	},
+	{
+		.compatible = "mediatek,mt8189-jpgenc",
+		.data = &mtk8189_jpegenc_drvdata,
+	},
+	{
+		.compatible = "mediatek,mt8189-jpgdec",
+		.data = &mtk8189_jpegdec_drvdata,
+	},
 	{
 		.compatible = "mediatek,mt8195-jpgenc",
 		.data = &mtk8195_jpegenc_drvdata,
-- 
2.45.2


