Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3173DCD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 08:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uM0w+DpVYOcmujWW/kaHUf1dKYapStU849BeDAiDQw4=; b=tACeBG1F4ErI+8lMGUOmjtBHEz
	Egb2fibzjWWgRHdZmEAd+1CuWz1lB3RH+qy5VRkwVJXdE2YWioCP0YkJ8KgLtweGzWSqS7c7PWhw4
	DNUT9yCOT/da5RnhEA4Rk/ADwQ47qv1+lPAw8STo0HqBu23Gwj9O17Z5xPOKOlI5sltCRdhPvbm7M
	pDXIZeMmwVFeYvsdOlEqkwLby/yl6sh7odbnpuNfaQ9pMAAAeUq+KKjLu5uHBeJZt6v2KnxuKtWD/
	opOAepAUOAJimMtMOYUmbky5+nr25QMxbL3mHqA5BFVlPX437B1gicfD1XFqyv6+Ks7ZbRVt1JNmD
	4TBdUwAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhAU-0000000Ecai-0O2u;
	Wed, 03 Jun 2026 08:41:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhAP-0000000EcUW-0Hwm;
	Wed, 03 Jun 2026 08:41:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=uM0w+DpVYOcmujWW/kaHUf1dKYapStU849BeDAiDQw4=; b=YVSU738XtM3FY/uEk4zP5PrQnU
	aweBb0wVyJWiPlJXd9jrf13OAWnaqdsr4158EoRBqjTXG4JUxtPUvjQQqGssekW0ETLh7a3m0zJeA
	jkukll038NdqKZVMK9X2Gkx7c+GRdD4MIgLqvzJX0upPHuMJ+hEkxGk4tpjDamo1+QLwCutKH1RrT
	hxJpb8pAT4kORhbBIONYoqQIOPl6wFCkHokjTT4kxMmAgvyogabTuCIzm+aNJT78rzegRj0Q0nWsF
	jbOgMR1QM83mmuYYufB74FEIKCLkUQ5St59qoCWRwceHJgle27MiIFZtKx/SefOSn0RilMAdbWE1k
	6k+UTWog==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUhAL-0000000Bbj4-2Jqn;
	Wed, 03 Jun 2026 08:41:36 +0000
X-UUID: 00e948585f2811f1afed4741b24580c9-20260603
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=uM0w+DpVYOcmujWW/kaHUf1dKYapStU849BeDAiDQw4=;
	b=IC/tYyyFGJ1PYl4Wigi+hCdhZht1T38LoyU24pPfP5tLUbaQbILyU9Wu0d3MW5tSj8w5unYt0Xf0ISWnwgAAAcMsUy5enykCtPX6PnbgKdyiNjNx9msT+K46gG6t3aenVbO92fjKHmWOtO7YExqkrtyiGThM7gs1W4Y8O+tKIQo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:0a787230-8539-41c9-8d23-6b95fa0e8c98,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:9db62e8f-2d9b-4560-8147-1122f58e041c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 00e948585f2811f1afed4741b24580c9-20260603
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1972533018; Wed, 03 Jun 2026 01:41:24 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Jun 2026 16:41:21 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 3 Jun 2026 16:41:20 +0800
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
Subject: [PATCH v5 10/14] media: mediatek: vcodec: send share memory address to vcp
Date: Wed, 3 Jun 2026 16:40:40 +0800
Message-ID: <20260603084045.17488-11-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260603084045.17488-1-kyrie.wu@mediatek.com>
References: <20260603084045.17488-1-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_094133_941862_C3B9046B 
X-CRM114-Status: GOOD (  11.29  )
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

The share memory is allocated in kernel for vcp architecture, it's
different with vpu which share memors is reserved in vpu micro
processor. Need to send share memory address to vcp.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h | 2 ++
 drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h b/drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h
index 47070be2a991..097561a1efdc 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h
@@ -67,11 +67,13 @@ struct vdec_vpu_ipi_ack {
  * @msg_id	: AP_IPIMSG_DEC_INIT
  * @codec_type	: codec fourcc
  * @ap_inst_addr	: AP video decoder instance address
+ * @shared_iova	: reserved share memory address
  */
 struct vdec_ap_ipi_init {
 	uint32_t msg_id;
 	u32 codec_type;
 	uint64_t ap_inst_addr;
+	u64 shared_iova;
 };
 
 /**
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
index cdb673e6b477..3a10b32be094 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
@@ -236,6 +236,8 @@ int vpu_dec_init(struct vdec_vpu_inst *vpu)
 	msg.msg_id = AP_IPIMSG_DEC_INIT;
 	msg.ap_inst_addr = (unsigned long)vpu;
 	msg.codec_type = vpu->codec_type;
+	if (mtk_vcodec_fw_get_type(vpu->ctx->dev->fw_handler) == VCP)
+		msg.shared_iova = vpu->ctx->dev->fw_handler->vcp->iova_addr;
 
 	mtk_vdec_debug(vpu->ctx, "vdec_inst=%p", vpu);
 
-- 
2.45.2


