Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC887CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 05:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7lono346LLiByVxDpmcbPatLkqlMCZPQmgQ7Az+Hj/8=; b=KHiPC7EUYg5EUd++jh8P0XIFOo
	pzBh2Pc2ya/Uh8rZppoCrhq16QSUWLXJE03zuuabaC7I8J93MYjpIAwT5ujy5L8B2kMthjhij2WM6
	QnYpoZuLNYsUBaKBmU3+6ZuZfGEc9BC5UZ1fU20tVtfy8IeJiIbAmdIfsb+KZlFyv8em4LuyxxqSa
	E/GuSA8FuQ/mSrH26D5jQE5U2arKHnpP2p6ozgCEMjHIhC2fE9CYduasEj6sKQHh9o4n9VIyzvsR8
	COhRTGgasf16ExdzVQ6dgn3urptVlZ72X3Et5Ef+GnyaZVI9nmgu978UIM1pGAQx8C2CqqyEhCLyG
	TgH8aZ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ0LE-0000000DelO-1zhK;
	Mon, 15 Jun 2026 05:58:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ0LB-0000000Deip-0U30;
	Mon, 15 Jun 2026 05:58:34 +0000
X-UUID: 3839a568687f11f1acbe4559397dec65-20260614
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=7lono346LLiByVxDpmcbPatLkqlMCZPQmgQ7Az+Hj/8=;
	b=uQhKKn3VU2BqIva/rYfTrP1E8olZRBH13h7CWit43p6ckhEMz+ZvdD6MwySSdbZpb4c2rg5H0L/ORnP0gCwgJnn3KlOf7WQrhH91Hn5SNrLR4XelhHUzfB/c/UJ3DlnYKJpggHTo+vbCRezkajodYQJ/pNuTn2MM6fXH10Hstsk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:77dde74a-cb66-4c12-8b3c-c6cc070b181c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:0a15cd30-7784-4a77-a538-47ed6151d81b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|123|836|865|888|898,TC:-5,
	Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,C
	OL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3839a568687f11f1acbe4559397dec65-20260614
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <ed.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 514886896; Sun, 14 Jun 2026 22:58:23 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Jun 2026 13:58:22 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 15 Jun 2026 13:58:22 +0800
From: <ed.tsai@mediatek.com>
To: <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
	<James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>,
	<linux-scsi@vger.kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>,
	<peter.wang@mediatek.com>, <alice.chao@mediatek.com>,
	<naomi.chu@mediatek.com>, <chun-hung.wu@mediatek.com>, Ed Tsai
	<ed.tsai@mediatek.com>
Subject: [PATCH v3 1/3] ufs: core: Add get_hba_nortt callback for vendor-specific RTT capability
Date: Mon, 15 Jun 2026 13:57:15 +0800
Message-ID: <20260615055802.105479-2-ed.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260615055802.105479-1-ed.tsai@mediatek.com>
References: <20260615055802.105479-1-ed.tsai@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_225833_151890_DE6614ED 
X-CRM114-Status: GOOD (  15.22  )
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

From: Ed Tsai <ed.tsai@mediatek.com>

The number of outstanding RTTs read from host controller capability
register is problematic on some platforms. Add a new vendor callback
get_hba_nortt() to allow platform vendors to override the default RTT
capability value with platform-specific handling.

This patch keeps max_num_rtt field for bisectability and will be removed
in a later patch once all platforms are migrated.

Signed-off-by: Ed Tsai <ed.tsai@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 5 ++++-
 include/ufs/ufshcd.h      | 3 +++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index c3f08957d179..382b6041c716 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -2529,7 +2529,10 @@ static inline int ufshcd_hba_capabilities(struct ufs_hba *hba)
 	hba->nutmrs =
 	((hba->capabilities & MASK_TASK_MANAGEMENT_REQUEST_SLOTS) >> 16) + 1;
 
-	hba->nortt = FIELD_GET(MASK_NUMBER_OUTSTANDING_RTT, hba->capabilities) + 1;
+	if (hba->vops && hba->vops->get_hba_nortt)
+		hba->nortt = hba->vops->get_hba_nortt(hba);
+	else
+		hba->nortt = FIELD_GET(MASK_NUMBER_OUTSTANDING_RTT, hba->capabilities) + 1;
 
 	/* Read crypto capabilities */
 	err = ufshcd_hba_init_crypto_capabilities(hba);
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index cfbc75d8df83..421c286481e8 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -415,6 +415,8 @@ struct ufshcd_tx_eq_params {
  * @get_rx_fom: called to get Figure of Merit (FOM) value.
  * @tx_eqtr_notify: called before and after TX Equalization Training procedure
  *	to allow platform vendor specific configs to take place.
+ * @get_hba_nortt: called to get maximum number of outstanding RTTs supported by
+ *	the controller.
  */
 struct ufs_hba_variant_ops {
 	const char *name;
@@ -477,6 +479,7 @@ struct ufs_hba_variant_ops {
 	int	(*tx_eqtr_notify)(struct ufs_hba *hba,
 				  enum ufs_notify_change_status status,
 				  struct ufs_pa_layer_attr *pwr_mode);
+	int	(*get_hba_nortt)(struct ufs_hba *hba);
 };
 
 /* clock gating state  */
-- 
2.45.2


