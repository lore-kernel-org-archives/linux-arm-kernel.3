Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99909FEA808
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 04:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5EmVMlVF6F/sW77krrXtoXn+FTQFaHjK8lLFyo5xvjw=; b=Dv+gTXGBlPVKAmX/w/tphd6tb/
	n9ejZXMqnzDzoa2rjL4LUnHN2Xhj2llhKRqPoTGCMleNcz/J+qMT3zAtsiWsf9+PBz+4pAlEBobTQ
	9FPxb51YDg5GyMj+nHc3OTWlfc1oLoezemO6qC5VRMwDYfheUJMIQqqvIpmweVzmnTW1ACEdgqTmI
	kupeOHhrydXgigNwtVkX+vnqGwyFJBpjQ688fKOS/ba2bkO9jQmDWMr1U5ElxmkUxlX9pFVG18h3s
	IzXMEJgOAcW1pyKci0iGQI/XeU3Wc9nwTq98KwCkCQh9R24RqdTMlYNy91TZr9yFOl5px711uMJBS
	zFD4BjUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5FUd-00000002eAQ-4BdP;
	Wed, 25 Mar 2026 04:05:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5FUb-00000002e8X-3BYa;
	Wed, 25 Mar 2026 04:05:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=5EmVMlVF6F/sW77krrXtoXn+FTQFaHjK8lLFyo5xvjw=; b=avbMXSWSdnkqFeYP4Srp3D5Pno
	ku1+zsHZtP2wZUpzslsQhHini4huaPuD5sFvIHymxjmExgmAx94Hmo2T78p8E1AHx7XYQO2C5qQX+
	0vHB8Pud/cVmJlpQ7hXlnVER1u2/BJGZZISX0+cr52h2eMuP4CeizD4ITq/LUnhQLjDiA+bLS+RC8
	F939NT4x9IbqpkEL9IREvUKyT9uaoS8E1I+m3G4BggCC0qzF4ThZ+QItoiFFOH/XvzePqNn21LdQF
	UILJcjiBRWvRBU3Z5E8P/MalxywZaV4IzIpAM5boZVqHXiRF0BuAAftYAIWcEivQ/xmfmib6jeK+7
	iY7TMMDQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5FUT-00000005Ocd-2Q0a;
	Wed, 25 Mar 2026 04:05:15 +0000
X-UUID: cbc1179627ff11f1a6de359d7043e138-20260324
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=5EmVMlVF6F/sW77krrXtoXn+FTQFaHjK8lLFyo5xvjw=;
	b=Cur7N8ZL7Cmfiy+JHzPi68NZUtxIA0IxQZbXMlB0iOayEULa0wxIKEJihU2zls+z25E+4bTH5yg/najCX36DaccM1rBLL1eJIS+KlDtey0e/6GAGYMOhUcPM8Gc10AKwFatFTMCUZSlgkKXFCYO5Cjj0w21W1f/AJf2PT018+Ck=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:40e1b21d-318f-47ea-b5c2-e6e9e238138b,IP:0,U
	RL:0,TC:0,Content:39,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:39
X-CID-META: VersionHash:e7bac3a,CLOUDID:520d6ce0-cf51-4058-942d-ef4f058f9afa,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	4|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: cbc1179627ff11f1a6de359d7043e138-20260324
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 106462921; Tue, 24 Mar 2026 21:05:01 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 25 Mar 2026 12:04:58 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 25 Mar 2026 12:04:58 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Nicolas Dufresne
	<nicolas@ndufresne.ca>, Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Jason-JH Lin
	<jason-jh.lin@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Paul-PL Chen <paul-pl.chen@mediatek.com>, Moudy
 Ho <moudy.ho@mediatek.com>, Xiandong Wang <xiandong.wang@mediatek.com>,
	Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>,
	Chen-yu Tsai <wenst@chromium.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-media@vger.kernel.org>
Subject: [PATCH v2 2/3] soc: mediatek: mtk-cmdq: Remove cmdq_pkt_write() and cmdq_pkt_write_mask()
Date: Wed, 25 Mar 2026 12:04:21 +0800
Message-ID: <20260325040457.2113120-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260325040457.2113120-1-jason-jh.lin@mediatek.com>
References: <20260325040457.2113120-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_040511_414581_194FB278 
X-CRM114-Status: GOOD (  16.18  )
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

The original cmdq_pkt_write() and cmdq_pkt_write_mask() only supported
generating GCE instructions with subsys ID. They have been replaced by
cmdq_pkt_write_pa(), cmdq_pkt_write_subsys(), cmdq_pkt_write_mask_pa()
and cmdq_pkt_write_mask_subsys().

These 2 functions can now be removed as they are no longer in use.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 49 ++++++++++----------------
 include/linux/soc/mediatek/mtk-cmdq.h  | 35 ------------------
 2 files changed, 18 insertions(+), 66 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 9cec6a096d8b..be5e6d80f4c0 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -215,18 +215,6 @@ static int cmdq_pkt_mask(struct cmdq_pkt *pkt, u32 mask)
 	return cmdq_pkt_append_command(pkt, inst);
 }
 
-int cmdq_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u16 offset, u32 value)
-{
-	struct cmdq_instruction inst = {
-		.op = CMDQ_CODE_WRITE,
-		.value = value,
-		.offset = offset,
-		.subsys = subsys
-	};
-	return cmdq_pkt_append_command(pkt, inst);
-}
-EXPORT_SYMBOL(cmdq_pkt_write);
-
 int cmdq_pkt_write_pa(struct cmdq_pkt *pkt, u8 subsys /*unused*/, u32 pa_base,
 		      u16 offset, u32 value)
 {
@@ -243,27 +231,16 @@ EXPORT_SYMBOL(cmdq_pkt_write_pa);
 int cmdq_pkt_write_subsys(struct cmdq_pkt *pkt, u8 subsys, u32 pa_base /*unused*/,
 			  u16 offset, u32 value)
 {
-	return cmdq_pkt_write(pkt, subsys, offset, value);
+	struct cmdq_instruction inst = {
+		.op = CMDQ_CODE_WRITE,
+		.value = value,
+		.offset = offset,
+		.subsys = subsys
+	};
+	return cmdq_pkt_append_command(pkt, inst);
 }
 EXPORT_SYMBOL(cmdq_pkt_write_subsys);
 
-int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
-			u16 offset, u32 value, u32 mask)
-{
-	u16 offset_mask = offset;
-	int err;
-
-	if (mask != GENMASK(31, 0)) {
-		err = cmdq_pkt_mask(pkt, mask);
-		if (err < 0)
-			return err;
-
-		offset_mask |= CMDQ_WRITE_ENABLE_MASK;
-	}
-	return cmdq_pkt_write(pkt, subsys, offset_mask, value);
-}
-EXPORT_SYMBOL(cmdq_pkt_write_mask);
-
 int cmdq_pkt_write_mask_pa(struct cmdq_pkt *pkt, u8 subsys /*unused*/, u32 pa_base,
 			   u16 offset, u32 value, u32 mask)
 {
@@ -281,7 +258,17 @@ EXPORT_SYMBOL(cmdq_pkt_write_mask_pa);
 int cmdq_pkt_write_mask_subsys(struct cmdq_pkt *pkt, u8 subsys, u32 pa_base /*unused*/,
 			       u16 offset, u32 value, u32 mask)
 {
-	return cmdq_pkt_write_mask(pkt, subsys, offset, value, mask);
+	u16 offset_mask = offset;
+	int err;
+
+	if (mask != GENMASK(31, 0)) {
+		err = cmdq_pkt_mask(pkt, mask);
+		if (err < 0)
+			return err;
+
+		offset_mask |= CMDQ_WRITE_ENABLE_MASK;
+	}
+	return cmdq_pkt_write_subsys(pkt, subsys, pa_base, offset_mask, value);
 }
 EXPORT_SYMBOL(cmdq_pkt_write_mask_subsys);
 
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index be67bee043ce..0e8fb4743d18 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -124,17 +124,6 @@ int cmdq_pkt_create(struct cmdq_client *client, struct cmdq_pkt *pkt, size_t siz
  */
 void cmdq_pkt_destroy(struct cmdq_client *client, struct cmdq_pkt *pkt);
 
-/**
- * cmdq_pkt_write() - append write command to the CMDQ packet
- * @pkt:	the CMDQ packet
- * @subsys:	the CMDQ sub system code
- * @offset:	register offset from CMDQ sub system
- * @value:	the specified target register value
- *
- * Return: 0 for success; else the error code is returned
- */
-int cmdq_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u16 offset, u32 value);
-
 /**
  * cmdq_pkt_write_pa() - append write command to the CMDQ packet with pa_base
  * @pkt:	the CMDQ packet
@@ -161,19 +150,6 @@ int cmdq_pkt_write_pa(struct cmdq_pkt *pkt, u8 subsys /*unused*/,
 int cmdq_pkt_write_subsys(struct cmdq_pkt *pkt, u8 subsys,
 			  u32 pa_base /*unused*/, u16 offset, u32 value);
 
-/**
- * cmdq_pkt_write_mask() - append write command with mask to the CMDQ packet
- * @pkt:	the CMDQ packet
- * @subsys:	the CMDQ sub system code
- * @offset:	register offset from CMDQ sub system
- * @value:	the specified target register value
- * @mask:	the specified target register mask
- *
- * Return: 0 for success; else the error code is returned
- */
-int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
-			u16 offset, u32 value, u32 mask);
-
 /**
  * cmdq_pkt_write_mask_pa() - append write command with mask to the CMDQ packet with pa
  * @pkt:	the CMDQ packet
@@ -471,11 +447,6 @@ static inline int cmdq_pkt_create(struct cmdq_client *client, struct cmdq_pkt *p
 
 static inline void cmdq_pkt_destroy(struct cmdq_client *client, struct cmdq_pkt *pkt) { }
 
-static inline int cmdq_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u16 offset, u32 value)
-{
-	return -ENOENT;
-}
-
 static inline int cmdq_pkt_write_pa(struct cmdq_pkt *pkt, u8 subsys /*unused*/,
 				    u32 pa_base, u16 offset, u32 value)
 {
@@ -488,12 +459,6 @@ static inline int cmdq_pkt_write_subsys(struct cmdq_pkt *pkt, u8 subsys,
 	return -ENOENT;
 }
 
-static inline int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
-				      u16 offset, u32 value, u32 mask)
-{
-	return -ENOENT;
-}
-
 static inline int cmdq_pkt_write_mask_pa(struct cmdq_pkt *pkt, u8 subsys /*unused*/,
 					 u32 pa_base, u16 offset, u32 value, u32 mask)
 {
-- 
2.43.0


