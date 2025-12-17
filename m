Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9BFAD64076
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 06:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U26zkVH5d+38dGjc9TpfhT1XgnH0NEu83IWC3L9CNRg=; b=aq8TeKT1GdACR9VctDfXRZms3V
	K5SvKsmxzTed9ZM2PVBmqlv2E3mZcION3zpMkxFyBAtrUBCZQN/ohgQlU/gfD+c+F8l4R9ThmlGBO
	32Bq3wqtezCtdsJt0GnbUUp6TZwqWogvCwpgzJn4bEA7k6xJ6E1q3OybhrtPAF1ZlO5nHC6fBTmxt
	SxPiXvMH6ZOV4hFS3YYMu4HsPGKu/wbMod3e2NgA2AB2DZT8jglfPDe6IFrTV3tI4p/Kei216+lTT
	jr6+fD5u48tFEO8k/apmOfDpK7kcyS+A3Mg5EawGXzJOtQK5Uh98nUKJn1VKfAzl5H8pPyebRrkYz
	R/A6ctHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVl7j-00000006FEt-0mxq;
	Wed, 17 Dec 2025 06:34:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVl7X-00000006F7A-3eNg;
	Wed, 17 Dec 2025 06:34:48 +0000
X-UUID: 784ae32edb1211f0a52f393f94899d25-20251216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=U26zkVH5d+38dGjc9TpfhT1XgnH0NEu83IWC3L9CNRg=;
	b=Ly4FPhxGFVkV7/oLlmXX5lTQRZjLKr1XIP7GK8LrChOUWPqw1vKf4BoO7ewMvEUtoThtHaRbAFdquuenUJZa6ff+WZyo7wlQgPowTu+yqZmnBd5z6uvh7xusItKPCANC3vEY3ktRA9Q4SRlsC+mX3iXGzhz+WclJNB1PYLB3q2Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:9dd591ab-fca3-499c-b477-d35e2e446a27,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:44b348aa-6421-45b1-b8b8-e73e3dc9a90f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|888|898,TC:-5,Content:0|15
	|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 784ae32edb1211f0a52f393f94899d25-20251216
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <xiaoshun.xu@mediatek.corp-partner.google.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2081818218; Tue, 16 Dec 2025 23:34:42 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 14:34:39 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 17 Dec 2025 14:34:39 +0800
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
Subject: [PATCH v2 4/4] soc: mediatek: mtk-devapc: refine devapc interrupt handler
Date: Wed, 17 Dec 2025 14:34:13 +0800
Message-ID: <20251217063429.1157084-5-xiaoshun.xu@mediatek.corp-partner.google.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251217063429.1157084-1-xiaoshun.xu@mediatek.corp-partner.google.com>
References: <20251217063429.1157084-1-xiaoshun.xu@mediatek.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_223447_916678_36E5CA7D 
X-CRM114-Status: GOOD (  11.96  )
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


From: Xiaoshun Xu <xiaoshun.xu@mediatek.com>

Because the violation IRQ uses a while loop, it might cause the
system to remain in the interrupt handler indefinitely. We are
currently optimizing this part of the process to handle only 20
violations for debug violation issues, and then exit the loop

Signed-off-by: Xiaoshun Xu <xiaoshun.xu@mediatek.com>
---
 drivers/soc/mediatek/mtk-devapc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-d=
evapc.c
index 61628b941d92..ea38086c5554 100644
--- a/drivers/soc/mediatek/mtk-devapc.c
+++ b/drivers/soc/mediatek/mtk-devapc.c
@@ -12,6 +12,7 @@
 #include <linux/of_irq.h>
 #include <linux/of_address.h>

+#define MAX_VIO_NUM 20
 #define VIO_MOD_TO_REG_IND(m)  ((m) / 32)
 #define VIO_MOD_TO_REG_OFF(m)  ((m) % 32)

@@ -234,13 +235,18 @@ static void devapc_extract_vio_dbg(struct mtk_devapc_=
context *ctx)
  */
 static irqreturn_t devapc_violation_irq(int irq_number, void *data)
 {
+       u32 vio_num =3D 0;
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


