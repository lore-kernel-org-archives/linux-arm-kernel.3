Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F9BC98306
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 02:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sf1pQlbMbiIrjnz8/66tGMCRdtP6utc4O8nw4rUQzS8=; b=i7qlp1Az40WH0BNTjJt+gbRiIF
	qYjRsG49ja7VuPXf7BJfXsST2YUTBecE4qS8ktNqzQpXoJDTpIQxhfzEEISimtEaKrY+X2xYjPbnK
	Jmrp0e9yFNyRhUkMB1uWa+zWEqig4/w1gux4DRbuI8gADPHNPaZ9Mv/qAQK2VyQW2D4h/bWQ6sVVM
	Rxrfi2x3/vCDg67Dw3Ci4nKQBJ9ZWhvj6PBjjS+p12NysscA3HuMw+4fDsQSXhXh7M2bcxnqdhJhe
	W5dZqcpnbVNaeO8IAJJ5EMempQX/3v/++FIbpTcBMRwffdSkcrGQc71imQSbahgDS1l8M2msxs09F
	xWcCU7qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9CxV-00000006xjL-0fYm;
	Wed, 23 Sep 2026 02:43:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Cx8-00000006xQB-1L5T;
	Wed, 23 Sep 2026 02:43:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Sf1pQlbMbiIrjnz8/66tGMCRdtP6utc4O8nw4rUQzS8=; b=jHb3QbUJHKL0MLedmB4YWvYBJ7
	1QrhRD5jXAW9eyaZbN5URdc3PKcMVw5WE3eKSsyCs4OcS0rkT4u50byxoQHbk3nBFWk7lWI6F4L0S
	ofi6jx1tOfMQAKJSGZLBsSnyWV9JPfp8X1kqjHuKZesaNhNdjLUvpFNtGpP+05quXleDXZByn9ofH
	uzgHeB481GKZ2FBYciW785MrDQTUinoLKdOABm9y3yhpwCvtdz/gux2kszL8buFpb9WWIEJb1HE68
	i2o1NwzRwRTtO9kWZqK9ky9wyOmhgA+/DeF3B5CTi9ONq0Pc/hEjkUXGubWSyn9lEETMqmv64GnK4
	isMmmvAA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9Cx2-0000000EI84-3ne0;
	Wed, 23 Sep 2026 02:43:21 +0000
X-UUID: 85b4dfdeb6f811f1acbe4559397dec65-20260922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Sf1pQlbMbiIrjnz8/66tGMCRdtP6utc4O8nw4rUQzS8=;
	b=bCWEYpv3piB7K/d7CiyQCmMz9Mj/lp5BiBKoEPyJxGyKKl8oVoSi+9NAveeF16rBcPwlleUwTjVHUPBt9Pc5c+tXt5BLIiGvYSLwu2R4k58l+CY9ju39mzbn1COqHeinkMBhJQrYO3b3U4BvHXaqIFPtXmyj/tDxkAXVtG4dFo4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:a04420f3-91e4-433d-8275-37db6e6b55ae,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:186045ba-8825-408e-ae13-13bc2511f41e,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 85b4dfdeb6f811f1acbe4559397dec65-20260922
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 475287661; Tue, 22 Sep 2026 19:43:13 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 23 Sep 2026 10:43:11 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 23 Sep 2026 10:43:09 +0800
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
Subject: [PATCH v7 06/14] media: mediatek: vcodec: add debug information
Date: Wed, 23 Sep 2026 10:42:49 +0800
Message-ID: <20260923024258.257846-7-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923024258.257846-1-kyrie.wu@mediatek.com>
References: <20260923024258.257846-1-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_034317_327721_81139B64 
X-CRM114-Status: GOOD (  11.68  )
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

Print hevc/av1 output format and 10bit capture format
information to debug.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../mediatek/vcodec/common/mtk_vcodec_dbgfs.c | 21 +++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
index 2da11521f..a9e52a320 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
@@ -29,6 +29,14 @@ static void mtk_vdec_dbgfs_get_format_type(struct mtk_vcodec_dec_ctx *ctx, char
 		curr_len = snprintf(buf + *used, total - *used,
 				    "\toutput format: vp9 slice\n");
 		break;
+	case V4L2_PIX_FMT_HEVC_SLICE:
+		curr_len = snprintf(buf + *used, total - *used,
+				    "\toutput format: hevc slice\n");
+		break;
+	case V4L2_PIX_FMT_AV1_FRAME:
+		curr_len = snprintf(buf + *used, total - *used,
+				    "\toutput format: av1 slice\n");
+		break;
 	default:
 		curr_len = snprintf(buf + *used, total - *used,
 				    "\tunsupported output format: 0x%x\n",
@@ -45,6 +53,14 @@ static void mtk_vdec_dbgfs_get_format_type(struct mtk_vcodec_dec_ctx *ctx, char
 		curr_len = snprintf(buf + *used, total - *used,
 				    "\tcapture format: MT21C\n");
 		break;
+	case V4L2_PIX_FMT_MT2110T:
+		curr_len = snprintf(buf + *used, total - *used,
+				    "\tcapture format: MT2110T (10bit tile mode)\n");
+		break;
+	case V4L2_PIX_FMT_MT2110R:
+		curr_len = snprintf(buf + *used, total - *used,
+				    "\tcapture format: MT2110R (10bit raster mode)\n");
+		break;
 	default:
 		curr_len = snprintf(buf + *used, total - *used,
 				    "\tunsupported capture format: 0x%x\n",
@@ -122,9 +138,10 @@ static ssize_t mtk_vdec_dbgfs_read(struct file *filp, char __user *ubuf,
 
 		if (dbgfs_index[MTK_VDEC_DBGFS_PICINFO]) {
 			curr_len = snprintf(buf + used_len, total_len - used_len,
-					    "\treal(%dx%d)=>align(%dx%d)\n",
+					    "\treal(%dx%d)=>align(%dx%d) 10bit(%d)\n",
 					    ctx->picinfo.pic_w, ctx->picinfo.pic_h,
-					    ctx->picinfo.buf_w, ctx->picinfo.buf_h);
+					    ctx->picinfo.buf_w, ctx->picinfo.buf_h,
+					    ctx->is_10bit_bitstream);
 			used_len += curr_len;
 		}
 
-- 
2.51.0.windows.2


