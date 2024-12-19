Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA826E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 17:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xdTcO5BYsiC76pmpVSFCQXrilZRrE8cJhBVbVvzU/rc=; b=NK2DBXc5HLF8/8Ggdu15NbvCeP
	YaTnipwoZt2JTmHFnos0ym8IgAqEOUB5k+PPAd2IYaVSneczUIJ0fMMenRTxcRIM901KtMLC8cr8M
	Ybh+ngw+5wrrGzrJtY+Bx1rdxX3W22EGLPKJjPyl7wLXiiurL3+qINtJ+pRLKI8ItYkPm/xEzCjoG
	cQIN5ksDB3RDwZJV8QaE2WUszJnk0eIoRAqS9LFCyOHxJXgYMUSA/rzfPUcbSWqA4pjG2tEkkeC05
	3ea3Fm2jWLyfAZtqNkowOOVqkqdHUniClYU6wLPDUM119v8znzkdOx96CC2CDyblLlnY3GB3n7OMH
	agI/SMnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOK8X-00000002WAm-2oHp;
	Thu, 19 Dec 2024 17:16:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOK3M-00000002Udo-475V;
	Thu, 19 Dec 2024 17:11:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xdTcO5BYsiC76pmpVSFCQXrilZRrE8cJhBVbVvzU/rc=; b=XNG8s0JVnL/9ircrLWiZBfHtHR
	UKIYO4b7QeqHwlPIRwvVewM5QIAbokN3TpP9uE227/fuSgeJbRz6qGzWmx2AR8Ftm2wYkcOfHyhwq
	dcD2Cti1hlnJFuERKLSX2NrR5RoqHhYHpNfbYcMH40J6ehzPGQ1jK3m2+R7y6Iz9ofhx+Z7+H5oCk
	hy/s2C6a8J/1BICmXHWyckBDWX7HUM8lr12p0l4Lt9JoMGedcuxPCCyZbkomrcuAHDz9EBtHaXAs1
	UB30GliusarMEn3aplM6qLgMel3BjfvcUwJycvBcW2YlNojt+Qv7IoT8kGLIZaUFBL2iR7i89mv7L
	AkTNUJIQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOK3J-00000005TfP-1rYv;
	Thu, 19 Dec 2024 17:11:11 +0000
X-UUID: d04ec446be2b11ef82ff63e91e7eb18c-20241219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=xdTcO5BYsiC76pmpVSFCQXrilZRrE8cJhBVbVvzU/rc=;
	b=ZyeWO0YqCRvHnjW+Qfm+4bY+vZ1BfMRMpoJbCrdPgzo/iaKEJvagkRRsIP9UFSkVzTDIwnefo+DdK4h7grMbxAE5akBXzUSVEPwhPpwpvEhely61QCQeP66fkV1vfyCdDK4cfj0O8amTukkC9Iixk8Dqky/CaTyngtaXbDDZvbc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:daa56e3f-3ca0-4f11-8e78-095239cbba60,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:-32768,SF:-32768,FILE:0,BULK:-32768,RULE:Rele
	ase_Ham,ACTION:release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:2f6e6813-8f5d-4ac6-9276-7b9691c7b8d6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d04ec446be2b11ef82ff63e91e7eb18c-20241219
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1188297137; Thu, 19 Dec 2024 10:08:05 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 20 Dec 2024 01:08:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 20 Dec 2024 01:08:02 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>, Xavier Chang <xavier.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 5/7] soc: mediatek: Add programming flow for unsupported subsys ID hardware
Date: Fri, 20 Dec 2024 01:07:58 +0800
Message-ID: <20241219170800.2957-6-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241219170800.2957-1-jason-jh.lin@mediatek.com>
References: <20241219170800.2957-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_171109_918862_A4EEA677 
X-CRM114-Status: GOOD (  12.95  )
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

To support hardware without subsys IDs on new SoCs, add a programming
flow that checks whether the subsys ID is valid. If the subsys ID is
invalid, the flow will call 2 alternative CMDQ APIs:
cmdq_pkt_assign() and cmdq_pkt_write_s_value() to achieve the same
functionality.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/soc/mediatek/mtk-mmsys.c | 14 +++++++++++---
 drivers/soc/mediatek/mtk-mutex.c | 11 +++++++++--
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index bb4639ca0b8c..ce949b863b05 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -167,9 +167,17 @@ static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask,
 	u32 tmp;
 
 	if (mmsys->cmdq_base.size && cmdq_pkt) {
-		ret = cmdq_pkt_write_mask(cmdq_pkt, mmsys->cmdq_base.subsys,
-					  mmsys->cmdq_base.offset + offset, val,
-					  mask);
+		offset += mmsys->cmdq_base.offset;
+		if (mmsys->cmdq_base.subsys != CMDQ_SUBSYS_INVALID) {
+			ret = cmdq_pkt_write_mask(cmdq_pkt, mmsys->cmdq_base.subsys,
+						  offset, val, mask);
+		} else {
+			/* only MMIO access, no need to check mminfro_offset */
+			ret = cmdq_pkt_assign(cmdq_pkt, CMDQ_THR_SPR_IDX0,
+					      CMDQ_ADDR_HIGH(mmsys->cmdq_base.pa_base));
+			ret |= cmdq_pkt_write_s_mask_value(cmdq_pkt, CMDQ_THR_SPR_IDX0,
+							   CMDQ_ADDR_LOW(offset), val, mask);
+		}
 		if (ret)
 			pr_debug("CMDQ unavailable: using CPU write\n");
 		else
diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 5250c1d702eb..3788b16efbf4 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -963,6 +963,7 @@ int mtk_mutex_enable_by_cmdq(struct mtk_mutex *mutex, void *pkt)
 	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
 						 mutex[mutex->id]);
 	struct cmdq_pkt *cmdq_pkt = (struct cmdq_pkt *)pkt;
+	dma_addr_t en_addr = mtx->addr + DISP_REG_MUTEX_EN(mutex->id);
 
 	WARN_ON(&mtx->mutex[mutex->id] != mutex);
 
@@ -971,8 +972,14 @@ int mtk_mutex_enable_by_cmdq(struct mtk_mutex *mutex, void *pkt)
 		return -ENODEV;
 	}
 
-	cmdq_pkt_write(cmdq_pkt, mtx->cmdq_reg.subsys,
-		       mtx->addr + DISP_REG_MUTEX_EN(mutex->id), 1);
+	if (mtx->cmdq_reg.subsys != CMDQ_SUBSYS_INVALID) {
+		cmdq_pkt_write(cmdq_pkt, mtx->cmdq_reg.subsys, en_addr, 1);
+	} else {
+		/* only MMIO access, no need to check mminfro_offset */
+		cmdq_pkt_assign(cmdq_pkt, CMDQ_THR_SPR_IDX0, CMDQ_ADDR_HIGH(en_addr));
+		cmdq_pkt_write_s_value(cmdq_pkt, CMDQ_THR_SPR_IDX0, CMDQ_ADDR_LOW(en_addr), 1);
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(mtk_mutex_enable_by_cmdq);
-- 
2.43.0


