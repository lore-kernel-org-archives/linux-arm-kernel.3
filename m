Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 615EDFCC9A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 00:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1F0aD+CzjJwe4XQ5783eJK+juRpKEbGlXhwX8wPolo=; b=Js+xmnLs3Vs6672xmBh6TRId2a
	SxQiHX8giLm7GwI3jddkiEXGbTPUkIjsNyg4ZMYFiRdcx2o6c/hlXOkLmezG2AncoJZpyETJiehul
	p0Gmr7EIfQjSFUrv6+osmtUkncU42jPSfpChGt49DWecXq6IkHcUWegNnELo1H2BdgQYxQwjb0bdg
	6GjdrjFkVujB8YS6ArPQnlApQRS08bAsu2J0skTGwwmNbogqeL/EZxP8p9KmjOD/8d1fTNqHcn+UT
	bSQbi4omTjOSnrciUT3XGfwg6KaR6EPbA7OfpzDCqGPgWs91/8tgmLdQkcRUia83l5QcXKKl/wuOh
	FLfkkChQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzlNi-00000008R2K-1R14;
	Tue, 10 Mar 2026 00:55:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzlNh-00000008R1o-0Etj;
	Tue, 10 Mar 2026 00:55:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=U1F0aD+CzjJwe4XQ5783eJK+juRpKEbGlXhwX8wPolo=; b=oJJ5o8KAnd7bBwThxtOnLdaT7I
	eV88PCKMUcnWfm8Y+R7k8ekEpgpzjwLhl222t7Nd0d6UBYxv+Zyd3ES2kVV9+5P/TBtZrToseAGV8
	SzvqudcMR1u8E72wn3yY/om7ap70oBnzfTsW6qidim5Fg1Te1UbUtyW4RlkfIrvVsihZrcpROqjV/
	VrDtKOGPGI4Z6vsL0JgyXqAe+B0lKvZgeKAETlU2+VZeOpU89YjMzcgQIfTWwc///yb6jCT7NW2ba
	OoQsB6l1L40XhJF66rTVi7JtLgJXV7DqxYHcW5Sajvn/CZv/XcTum3l7Pqwbd4SFcq0X5pcHFoU2d
	1kVPMdnw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzlNd-0000000DQrJ-07Ma;
	Tue, 10 Mar 2026 00:55:27 +0000
X-UUID: ce1086481c1b11f19e7563141e833ce8-20260309
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=U1F0aD+CzjJwe4XQ5783eJK+juRpKEbGlXhwX8wPolo=;
	b=ndT/5ptxiBIT6feVvAtTWMDVvoTf6PdX++UVQgm9TfSyryXJYbxNFIbOvr5IcLMjqtyH6rMOmolpvnOwJlYsKGIDRjFqW0wRTSl8XKnXDQFEe8Ivj62MC/lENLg8HtTun9PHjIwpM1/R2+D1rbBvyeO8R/r6VzZhKSr7zNjLIWM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:5497872a-47d4-41f2-9d59-eab04f1e9896,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:fa4573f1-16bd-4243-b4ca-b08ca08ab1d8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|123|836|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ce1086481c1b11f19e7563141e833ce8-20260309
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <ed.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1675852559; Mon, 09 Mar 2026 17:55:17 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Mar 2026 08:55:14 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Mar 2026 08:55:14 +0800
From: <ed.tsai@mediatek.com>
To: <bvanassche@acm.org>, Peter Wang <peter.wang@mediatek.com>, Chaotian Jing
	<chaotian.jing@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>, "James
 E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"
	<martin.petersen@oracle.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>,
	<alice.chao@mediatek.com>, <naomi.chu@mediatek.com>,
	<chun-hung.wu@mediatek.com>, Ed Tsai <ed.tsai@mediatek.com>,
	<linux-scsi@vger.kernel.org>
Subject: [PATCH v2 2/2] ufs: host: mediatek: Add VCC on delay for stability
Date: Tue, 10 Mar 2026 08:52:30 +0800
Message-ID: <20260310005230.4001904-6-ed.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260310005230.4001904-2-ed.tsai@mediatek.com>
References: <20260310005230.4001904-2-ed.tsai@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_005525_680629_7C3FF192 
X-CRM114-Status: GOOD (  11.75  )
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

Introduce a delay after enabling UFS5 VCC for MT6995 to ensure
voltage stability before refclk activation.

Signed-off-by: Ed Tsai <ed.tsai@mediatek.com>
---
 drivers/ufs/host/ufs-mediatek.c | 11 +++++++++++
 drivers/ufs/host/ufs-mediatek.h |  4 ++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index b3daaa07e925..4618d7834414 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -1960,6 +1960,8 @@ static int ufs_mtk_apply_dev_quirks(struct ufs_hba *hba)
 
 static void ufs_mtk_fixup_dev_quirks(struct ufs_hba *hba)
 {
+	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
+
 	ufshcd_fixup_dev_quirks(hba, ufs_mtk_dev_fixups);
 
 	if (ufs_mtk_is_broken_vcc(hba) && hba->vreg_info.vcc) {
@@ -1971,6 +1973,15 @@ static void ufs_mtk_fixup_dev_quirks(struct ufs_hba *hba)
 		hba->dev_quirks &= ~UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM;
 	}
 
+	/*
+	 * Add a delay after enabling UFS5 VCC to ensure the voltage
+	 * is stable before the refclk is enabled.
+	 */
+	if (hba->dev_info.wspecversion >= 0x0500 &&
+	    (host->ip_ver == IP_VER_MT6995_A0 ||
+	     host->ip_ver == IP_VER_MT6995_B0))
+		hba->quirks |= UFSHCD_QUIRK_VCC_ON_DELAY;
+
 	ufs_mtk_vreg_fix_vcc(hba);
 	ufs_mtk_vreg_fix_vccqx(hba);
 	ufs_mtk_fix_ahit(hba);
diff --git a/drivers/ufs/host/ufs-mediatek.h b/drivers/ufs/host/ufs-mediatek.h
index 9747277f11e8..8547a6f04990 100644
--- a/drivers/ufs/host/ufs-mediatek.h
+++ b/drivers/ufs/host/ufs-mediatek.h
@@ -220,6 +220,10 @@ enum {
 	IP_VER_MT6991_B0 = 0x10470000,
 	IP_VER_MT6993    = 0x10480000,
 
+	/* UFSHCI 5.0 */
+	IP_VER_MT6995_A0 = 0x10490000,
+	IP_VER_MT6995_B0 = 0x10500000,
+
 	IP_VER_NONE      = 0xFFFFFFFF
 };
 
-- 
2.45.2


