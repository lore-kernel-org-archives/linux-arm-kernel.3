Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C71109E542
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 03:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gc1Cfkcgv/5lPuvFF53M/UC0jd9eXEdjF+510NK63+E=; b=ywFIZGtmqmEACb/pi2r62wiKMZ
	+KsjVKztEh953D9s7z9047umK61XyXWnBat64UxDi4t7JxLzDNpcFrec5rWswLvC2s8y0hoOUNZd6
	TcoFf2H2nzi43vUAxnlOkZq+r25l7M75Zz3AfQ5nVTfgjK/AC0hRnH3TQ0JAF9SeQNg4NTEsoHU5j
	m2RhG43a9WFnzIeUPHiJGTwsXf5h95dlXncrGbiBNCSrt40MzvGJgH/rFq21nrNZ3xNzH4wFdRKuc
	6srnWErTS7v0z2heldqeYyG4ld5WmHpc6+dqsZ867jujgDPy7Tfwfs5hcsjcACcicHSeSHfCKF/Qh
	tqH+xL5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5b5g-00000004bnY-1KmK;
	Thu, 26 Mar 2026 03:09:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5b5c-00000004bn1-3Lf0;
	Thu, 26 Mar 2026 03:08:57 +0000
X-UUID: 1cc117c428c111f1a6de359d7043e138-20260325
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=gc1Cfkcgv/5lPuvFF53M/UC0jd9eXEdjF+510NK63+E=;
	b=gmKO2qkAAxrmjzTqBw4aLC8P41r4tut1eZ8bTxm1h4+9Aw4KefYdSR3vJGbGSqSV0IwbO4QIMP93huCuG9cxPuxly9hiqXZV35/h2BqMt/2kBybsQemuqqOC21Yv+7bxsDHpHM1l5Gy+eBcmLRJsxM7VEcos1a01PH7/FznFfqQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:e716eacf-05c5-4acd-808f-96be45d2efff,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:c6b6b48e-6df4-4a3d-a7a4-fbdc42d669ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1cc117c428c111f1a6de359d7043e138-20260325
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 222753313; Wed, 25 Mar 2026 20:08:50 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 26 Mar 2026 11:08:47 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 26 Mar 2026 11:08:46 +0800
From: Cathy Xu <ot_cathy.xu@mediatek.com>
To: Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson
	<ulf.hansson@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
CC: <linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Mengqi Zhang <Mengqi.Zhang@mediatek.com>, Wenbin Mei
	<Wenbin.Mei@mediatek.com>, Andy-ld Lu <Andy-ld.Lu@mediatek.com>, Axe Yang
	<Axe.Yang@mediatek.com>, Yong Mao <yong.mao@mediatek.com>, Cathy Xu
	<ot_cathy.xu@mediatek.com>, <stable@vger.kernel.org>
Subject: [PATCH RESEND] mmc: mtk-sd: disable new_tx/rx and modify related settings for mt8189
Date: Thu, 26 Mar 2026 11:05:16 +0800
Message-ID: <20260326030759.8107-1-ot_cathy.xu@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_200856_862321_B18B1A88 
X-CRM114-Status: GOOD (  11.49  )
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

Disable new_tx/rx to avoid data transmission instability, and adjust
.data_tune, .stop_dly_sel, and .pop_en_cnt to fit the overall
configuration after disabling new_tx/rx, making it more compatible
with mt8189.

Fixes: 846a3a2fdff5 ("mmc: mtk-sd: add support for MT8189 SoC")
Cc: stable@vger.kernel.org
Tested-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>
---
 drivers/mmc/host/mtk-sd.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 302ac8529c4f..b2680cc054bd 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -682,15 +682,15 @@ static const struct mtk_mmc_compatible mt8189_compat = {
 	.needs_top_base = true,
 	.pad_tune_reg = MSDC_PAD_TUNE0,
 	.async_fifo = true,
-	.data_tune = true,
+	.data_tune = false,
 	.busy_check = true,
 	.stop_clk_fix = true,
-	.stop_dly_sel = 1,
-	.pop_en_cnt = 2,
+	.stop_dly_sel = 3,
+	.pop_en_cnt = 8,
 	.enhance_rx = true,
 	.support_64g = true,
-	.support_new_tx = true,
-	.support_new_rx = true,
+	.support_new_tx = false,
+	.support_new_rx = false,
 	.support_spm_res_release = true,
 };
 
-- 
2.45.2


