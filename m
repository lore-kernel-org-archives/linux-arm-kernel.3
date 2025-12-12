Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB7BD43367
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 03:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uP6o3k14zjZ9k2pmrlwCKibulk4puvnqf209+mWCUco=; b=R4uz5ES3p1Sammtz4bHhMG8Os3
	nMvkSK38TDU2pOuDizWSQWoRll9KP+pyGPWui5k//iWvCDIjKrVB4aO92+ZaFnkUHEEwZ8ZvguYCu
	itzWKGNbHKRnA5didWMF1cQF1bKp7OC91FktkJemWhtgroRNB/cXME6OH/C/DdGl9FqxnJlkYzluB
	9ueu2BMQIjfnJKUxtGFZNp/p4ezr4MfmwuJibkjR0Oh5by+v4gKClef0R9lcsM0hHrQlG9jL5t0cS
	niW3yPmQ9fUB9ljGePQ9+d+fcizJDKfseVsnQeTFnSTKmMqhD40tjS1ag0b+xDU0lk4aoD3hHCWu0
	DOgBlocg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTtch-0000000Habg-43p5;
	Fri, 12 Dec 2025 03:15:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTtcf-0000000HaVn-00PE;
	Fri, 12 Dec 2025 03:15:14 +0000
X-UUID: c2c79ca2d70811f0a52f393f94899d25-20251211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=uP6o3k14zjZ9k2pmrlwCKibulk4puvnqf209+mWCUco=;
	b=GmL1LiFFcnq/pacUcICbjX92ZIZTa76QGy0Kffivce0HMeiD+C32zHdFnryViLF3EshaNAIEQkNQZeNl/7EJFYTNWamXssKJpyKi3BaJLOxX+/9Pxkzny2R/WryjpocCOydgP5XMeOs6CpHBg/fmuV6SvtW/9y3fzeI8mvdI1GQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:0e984e1c-69b5-49cf-a44a-f3b71fe74d81,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:1bf81aaa-6421-45b1-b8b8-e73e3dc9a90f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|888|898,TC:-5,Content:0|15
	|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c2c79ca2d70811f0a52f393f94899d25-20251211
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <xiaoshun.xu@mediatek.corp-partner.google.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 63589577; Thu, 11 Dec 2025 20:15:07 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 12 Dec 2025 11:15:04 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Fri, 12 Dec 2025 11:15:04 +0800
From: Xiaoshun Xu <xiaoshun.xu@mediatek.corp-partner.google.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Xiaoshun Xu
	<xiaoshun.xu@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Sirius Wang <sirius.wang@mediatek.com>, Vince-wl Liu
	<vince-wl.liu@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 4/4] soc: mediatek: mtk-devapc: refine DEVAPC irq handler
Date: Fri, 12 Dec 2025 11:13:45 +0800
Message-ID: <20251212031450.489128-5-xiaoshun.xu@mediatek.corp-partner.google.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251212031450.489128-1-xiaoshun.xu@mediatek.corp-partner.google.com>
References: <20251212031450.489128-1-xiaoshun.xu@mediatek.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_191513_072404_5194065A 
X-CRM114-Status: GOOD (  11.88  )
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


External email : Please do not click links or open attachments until you ha=
ve verified the sender or the content.


From: "xiaoshun.xu" <xiaoshun.xu@mediatek.com>

Because the violation IRQ uses a while loop, it might cause the
system to remain in the interrupt handler indefinitely. We are
currently optimizing this part of the process to handle only 20
violations for debug violation issues, and then exit the loop

Signed-off-by: xiaoshun.xu <xiaoshun.xu@mediatek.com>
---
 drivers/soc/mediatek/mtk-devapc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-d=
evapc.c
index 18964d82ff08..30b7ee8b880a 100644
--- a/drivers/soc/mediatek/mtk-devapc.c
+++ b/drivers/soc/mediatek/mtk-devapc.c
@@ -15,6 +15,8 @@
 #define VIO_MOD_TO_REG_IND(m)  ((m) / 32)
 #define VIO_MOD_TO_REG_OFF(m)  ((m) % 32)

+#define MAX_VIO_NUM 20
+
 struct mtk_devapc_vio_dbgs {
        union {
                u32 vio_dbg0;
@@ -234,13 +236,18 @@ static void devapc_extract_vio_dbg(struct mtk_devapc_=
context *ctx)
  */
 static irqreturn_t devapc_violation_irq(int irq_number, void *data)
 {
+       unsigned int vio_num =3D 0;
        struct mtk_devapc_context *ctx =3D data;

-       while (devapc_sync_vio_dbg(ctx))
+       mask_module_irq(ctx, true);
+
+       for (vio_num =3D 0; (vio_num < MAX_VIO_NUM) && (devapc_sync_vio_dbg=
(ctx)); ++vio_num)
                devapc_extract_vio_dbg(ctx);

        clear_vio_status(ctx);

+       mask_module_irq(ctx, false);
+
        return IRQ_HANDLED;
 }

--
2.45.2


