Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09987EEF32A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 08:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sO3PHAXEthLTTVgRRTRR8lgRQjQwsnb19jUyvaCx/sk=; b=FE2CrpAg/PhKlr0mPeKx1AuIn8
	h2sgNstDM8E7RWHFOkg2/FMSsbY8/QYvBxXWoBBi/o60qETHGjLrALsQqmeZf6GmVe01mNunlF4oG
	Yk+jNNvRLoh6KNyCKAmUHwB4q/nftq/EtgzZdOgFgtLZgs5AWfNGdJQ9w+i8mJJ3bX7z70Fym2mdl
	RevM5zbv6qxeAz8CNXNh20goB7ExxteTRmxjR/51X44vDHJ/MeYWowib5X+ZcnlM08s2Uy7hIGCL3
	qBogir7cTFuAc1myhLi7yPDIXQ+tqQwf0pRMP8e4YU6wFf3dpSUAlux+Q02oGgXvnGHb80aodDxKW
	zKUhNXHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4Qo-00000001FAS-1avN;
	Thu, 05 Mar 2026 08:51:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4Qm-00000001F9I-0n6q;
	Thu, 05 Mar 2026 08:51:41 +0000
X-UUID: 6348e2fc186e11f1ad39f32c34db0b1c-20260305
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=sO3PHAXEthLTTVgRRTRR8lgRQjQwsnb19jUyvaCx/sk=;
	b=Tdlsf0SphbBYkV++DkIdD1TnGfoP5TMLwrFxowZRPrPF8v5MsFMeeHbCPFOpOQuWrOhZRlk/fH6w5rBDNoNtDD7I8EUvutVXEEOGXRhGQCM7d7tLNdO8xAFgw86s85rJw4neuoj8d25hiY68RtkKsC7ElBQW88nR5hd14+CdaKQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:64389b66-06bf-4071-bacb-88499051a2ad,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:f41ce45b-a957-4259-bcca-d3af718d7034,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|123|836|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6348e2fc186e11f1ad39f32c34db0b1c-20260305
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <ed.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1204358137; Thu, 05 Mar 2026 01:36:21 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 5 Mar 2026 16:36:19 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 5 Mar 2026 16:36:19 +0800
From: <ed.tsai@mediatek.com>
To: Peter Wang <peter.wang@mediatek.com>, Chaotian Jing
	<chaotian.jing@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>, "James
 E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"
	<martin.petersen@oracle.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Ed Tsai <ed.tsai@mediatek.com>, <linux-scsi@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 2/2] ufs: host: mediatek: Add VCC on delay for stability
Date: Thu, 5 Mar 2026 16:29:15 +0800
Message-ID: <20260305083610.2672344-3-ed.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260305083610.2672344-1-ed.tsai@mediatek.com>
References: <20260305083610.2672344-1-ed.tsai@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_005140_241372_9BFA61AE 
X-CRM114-Status: GOOD (  11.56  )
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

Introduced a delay after enabling UFS5 VCC for MT6995 to ensure
voltage stability before refclk activation.

Signed-off-by: Ed Tsai <ed.tsai@mediatek.com>
---
 drivers/ufs/host/ufs-mediatek.c | 11 +++++++++++
 drivers/ufs/host/ufs-mediatek.h |  4 ++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index b3daaa07e925..020302f8fbdf 100644
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
+	 * Add a delay after enable UFS5 VCC to ensure the voltage is
+	 * stable before the refclk enable.
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


