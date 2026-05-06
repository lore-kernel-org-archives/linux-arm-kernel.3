Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354A2CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 08:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u/IJs98Hajll7Hvgo8Kcg+WgdbIxPibyariY5TUIpfU=; b=pFR1unhYG5CNtfMBCT7RzOQKjz
	HKP2uhNqBLfilbTO4omjOLX5lPcblwbRGwLAWO1RZW+TFUYxq5Ll44yJR9iVvxVQ0nJZVeQRhlFPE
	qYPOr4yBQR44zh6aC64h7g04MA+jMzX8LBYelwpp1tF67/6S5PoFjcS+yuWaaZrTydqQxDW+mgdgN
	5mQ31zA+gINGFxZUI613BJFbwO3F+IfkOEWyRIbfGBxDC+4OqkXsZlLyUR5uERRiv1f9P8Hx9Xw4G
	CTmIeH500/9m51Ou+xkro/EYSmRB1WCGcXr6TWTzj2SE79qr2zqnDVWAFltpFYpfGC9x3r3rm8j2g
	1dq9yZTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXpw-00000000CEk-1Gm0;
	Wed, 06 May 2026 08:42:32 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXpv-00000000CCo-02wC;
	Wed, 06 May 2026 08:42:31 +0000
Received: from localhost.localdomain (unknown [36.112.3.223])
	by APP-05 (Coremail) with SMTP id zQCowABn9Qjn_vppWvGIDw--.2900S4;
	Wed, 06 May 2026 16:42:19 +0800 (CST)
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
To: tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	mchehab@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	hverkuil+cisco@kernel.org,
	laurent.pinchart@ideasonboard.com,
	p.zabel@pengutronix.de,
	benjamin.gaignard@collabora.com,
	nicolas@ndufresne.ca
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Subject: [PATCH 2/4] media: mediatek: vcodec: remove redundant return value of vdec_vp9_slice_setup_prob_buffer()
Date: Wed,  6 May 2026 16:42:01 +0800
Message-Id: <20260506084203.202882-3-lihaoxiang@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260506084203.202882-1-lihaoxiang@isrc.iscas.ac.cn>
References: <20260506084203.202882-1-lihaoxiang@isrc.iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABn9Qjn_vppWvGIDw--.2900S4
X-Coremail-Antispam: 1UD129KBjvJXoW7uryrWrWxGF1xArWfKr4Durg_yoW5JFyfpr
	4YkrWUZFyjyFs2yaykXF48ua1rCrWSqry0gw4ak34Fyr98tr1UXr1Iyr9IyF45Grn2ka4r
	uw1jqry8WFW3Jw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
	v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kfnx
	nUUI43ZEXa7VUbH5lUUUUUU==
X-Originating-IP: [36.112.3.223]
X-CM-SenderInfo: 5olkt0x0ld0ww6lv2u4olvutnvoduhdfq/1tbiBwwTE2n6yxrNzwAAsL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_014231_430437_9A1DC5E0 
X-CRM114-Status: UNSURE (   9.88  )
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

vdec_vp9_slice_setup_prob_buffer() never fails, remove 'return 0' from
vdec_vp9_slice_setup_prob_buffer() and modify its signature.
Also, remove the return value check in vdec_vp9_slice_setup_single()
and vdec_vp9_slice_setup_lat().

Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
---
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c       | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
index 092fd34e21d2..0f47b2671353 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
@@ -1013,7 +1013,7 @@ static void vdec_vp9_slice_setup_lat_buffer(struct vdec_vp9_slice_instance *inst
 	vsi->row_info.size = 0;
 }
 
-static int vdec_vp9_slice_setup_prob_buffer(struct vdec_vp9_slice_instance *instance,
+static void vdec_vp9_slice_setup_prob_buffer(struct vdec_vp9_slice_instance *instance,
 					    struct vdec_vp9_slice_vsi *vsi)
 {
 	struct vdec_vp9_slice_frame_ctx *frame_ctx;
@@ -1030,8 +1030,6 @@ static int vdec_vp9_slice_setup_prob_buffer(struct vdec_vp9_slice_instance *inst
 	else
 		frame_ctx = vdec_vp9_slice_default_frame_ctx;
 	memcpy(instance->prob.va, frame_ctx, sizeof(*frame_ctx));
-
-	return 0;
 }
 
 static void vdec_vp9_slice_setup_seg_buffer(struct vdec_vp9_slice_instance *instance,
@@ -1170,9 +1168,7 @@ static int vdec_vp9_slice_setup_lat(struct vdec_vp9_slice_instance *instance,
 
 	/* setup prob/tile buffers for LAT */
 
-	ret = vdec_vp9_slice_setup_prob_buffer(instance, vsi);
-	if (ret)
-		goto err;
+	vdec_vp9_slice_setup_prob_buffer(instance, vsi);
 
 	ret = vdec_vp9_slice_setup_tile_buffer(instance, vsi, bs);
 	if (ret)
@@ -1804,10 +1800,7 @@ static int vdec_vp9_slice_setup_single(struct vdec_vp9_slice_instance *instance,
 
 	vdec_vp9_slice_setup_single_buffer(instance, pfc, vsi, bs, fb);
 	vdec_vp9_slice_setup_seg_buffer(instance, vsi, &instance->seg[0]);
-
-	ret = vdec_vp9_slice_setup_prob_buffer(instance, vsi);
-	if (ret)
-		goto err;
+	vdec_vp9_slice_setup_prob_buffer(instance, vsi);
 
 	ret = vdec_vp9_slice_setup_tile_buffer(instance, vsi, bs);
 	if (ret)
-- 
2.25.1


