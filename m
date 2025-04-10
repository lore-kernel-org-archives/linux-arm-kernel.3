Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB6BC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 06:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LPwlFy/7crNNuoEpI5/mPfpSQ7J+Vn14OdtyfLQUaPo=; b=L5vYNYKe+6iw8/zWLrjmO4WPWb
	QGBXsInSdD0D2m4ePJTNui/XoTbnGhDKjom/6xGKvzYL2Iol9hL2+LUUdf4SWP7aUUkXukfyBdudX
	3mSvkVSrcCYMlisxQ1R2s++pSTQ5PhVLKbDjPNv6PtuX3DmXVr50t7beHDgpW2ID61zS8NCHBSFkn
	g3GTg0puDigzREJ0hQ+ke+OKcfgKXApkZ9uOSZe3Y6c2J5mlDYjzhCJTxitMubZDuJpWd/IP0Yyk7
	y1RGy2lkbqDEiSRY+854ZoJUyOb8Ze686nOD7UMR8o5atAlaLp02dTx+fzOviaLZTyqJvNlqnUbFU
	4reL1mKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2lfU-00000009Plq-2vjx;
	Thu, 10 Apr 2025 06:45:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2lQg-00000009N65-1LoY;
	Thu, 10 Apr 2025 06:30:32 +0000
X-UUID: 45d4b18415d511f0a1e849db4cc18d44-20250409
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=LPwlFy/7crNNuoEpI5/mPfpSQ7J+Vn14OdtyfLQUaPo=;
	b=mln0sW0fwyClBMRuN8joCEgakG7D0htXD55BjV1SXL63JR7Z8c4nk8Dp6Zbn2STmri0aNBW1Zj9Um7BqunofDFkw+Ig8RoxoM/yOVBlvl3t3+MBjS3X3fEz8oZE1qNYyso1TbMtSIJlTJyMegG7WrjPk2v9UFt/9h+DSkmnaN7Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:389a4c6b-af90-41e5-8529-aae0362fa246,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:aec86f8d-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 5,DFT
X-CID-BAS: 5,DFT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 45d4b18415d511f0a1e849db4cc18d44-20250409
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 464242414; Wed, 09 Apr 2025 23:30:19 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 10 Apr 2025 14:30:16 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 10 Apr 2025 14:30:16 +0800
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, kyrie wu
	<kyrie.wu@mediatek.corp-partner.google.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: kyrie.wu <kyrie.wu@mediatek.com>
Subject: [PATCH v2 06/12] media: mediatek: jpeg: refactor jpeg buffer payload setting
Date: Thu, 10 Apr 2025 14:29:59 +0800
Message-ID: <20250410063006.5313-7-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250410063006.5313-1-kyrie.wu@mediatek.com>
References: <20250410063006.5313-1-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_233026_421622_8BC99E0A 
X-CRM114-Status: GOOD (  11.91  )
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

1. for multi-core jpegdec:
   core0: |<-------- decoding buffer0 and resolution changed to smaller
   core1:  |<-------- decoding buffer1
   core0:   |<- handling resolution changing
   core0:    |<- vb2_set_plane_payload
2. the payload size is changed on the step of set format. Because core1
is running and streaming has not been stopped, the format cannot be
set again, resulting in no change in the payload size.
3. at this time, the payload size is bigger than buffer length,
it will print a warnning call trace
4. set payload size must less than buffer length

Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
---
 .../platform/mediatek/jpeg/mtk_jpeg_core.c     | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 0ea3851e0ab1..3b386ec44b36 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -719,10 +719,22 @@ static int mtk_jpeg_buf_prepare(struct vb2_buffer *vb)
 		plane_fmt = q_data->pix_mp.plane_fmt[i];
 		if (ctx->enable_exif &&
 		    q_data->fmt->fourcc == V4L2_PIX_FMT_JPEG)
-			vb2_set_plane_payload(vb, i, plane_fmt.sizeimage +
-					      MTK_JPEG_MAX_EXIF_SIZE);
+			if (vb->planes[i].length > (plane_fmt.sizeimage +
+			    MTK_JPEG_MAX_EXIF_SIZE))
+				vb2_set_plane_payload(vb, i,
+						      plane_fmt.sizeimage +
+						      MTK_JPEG_MAX_EXIF_SIZE);
+			else
+				vb2_set_plane_payload(vb, i,
+						      vb->planes[i].length);
+
 		else
-			vb2_set_plane_payload(vb, i,  plane_fmt.sizeimage);
+			if (vb->planes[i].length > plane_fmt.sizeimage)
+				vb2_set_plane_payload(vb, i,
+						      plane_fmt.sizeimage);
+			else
+				vb2_set_plane_payload(vb, i,
+						      vb->planes[i].length);
 	}
 
 	return 0;
-- 
2.46.0


