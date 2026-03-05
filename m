Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78096EEF32A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 08:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t6TRgPq7DKxCDmOZh4rGAZ9xbu66Z1j+cgR3cmV0iYU=; b=Q6p0cmokjTQHHWe5L6dA7LTPPh
	JAU2eKwzjvKUcBGwNScGKs+QMALzopVQLjmfYuk0m6k7awXgAS5M/GusojvJ+ClCLXyOL1riheCp+
	7BWX/Cw0ewbpqVLosgg7WoQd9UnSWyWqgY0lat4T/3m9OhGG0vXuw6Wu06g8KgSNpKm+fWxgbI1zU
	cDICNVAqJ1HT5UUQWnyxxBqwP6RWukqEDxbXiEShD7IzFFoHZkdw8NPFSvMvbe/JCl8uFdAhZ+mL9
	lHmK23MTVIS1rmjaqZF3qS7m5ZWDjBDCpVHRVL4TmIh+hyyj2kmn2IehVavgc9fFv3qej94yKBcY7
	R2NubNvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4Qx-00000001FFp-3Ych;
	Thu, 05 Mar 2026 08:51:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4Qw-00000001FEp-1j2s;
	Thu, 05 Mar 2026 08:51:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=t6TRgPq7DKxCDmOZh4rGAZ9xbu66Z1j+cgR3cmV0iYU=; b=fMH/aucrDLEuItbcN4vaR+9hXy
	Qor8t0o1LYtC34cOB5Kkr3daQ8hPd4jvYU6Dt5RFmxlFYNG8kRoxNt8mp0ayNJ8Av4RASuK+p+g8x
	MyD+V/8SC+qvxwyLa7HAewbPanJge8vctIq6Ahy/+dyUXH4fSKMNwD9xeTIOlikH2DxK3LLsm607b
	+R3USvHnJfAl4aiTyswh0DZCjCXNQA2FrOwe6y3U93+QoRwtX73GSa4sGLoMaa0DhcnQwhO7QmwB7
	AFayGkLI2l6wRtQeNYN8vV/R/IoDIsoLIinOz2CbLKS/cceExpaIiqeQ0JuJ1lwRty8MH/NTq/FoV
	6pVMF4WA==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4Qs-00000006FYe-2EmS;
	Thu, 05 Mar 2026 08:51:49 +0000
X-UUID: 62bb29a8186e11f1a16f0188aa809bee-20260305
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=t6TRgPq7DKxCDmOZh4rGAZ9xbu66Z1j+cgR3cmV0iYU=;
	b=UCUbdqIvDYpMCCaFrsSpARAzhm/yhivo/IvE+2AAWtOp9I1zq3i47hRPwLuVknWJpm98n8BwKoS5Ck0Dg3NJY1ypOEwzLswUqKl/u9HiOe3Ll7RcduCNJ6pw565TxGj9RDqTS5SiMITW1YW5fm0foeey2RXjMhdw4cRlFCHra4E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:72aee5c8-babf-4966-9ee5-5b30b8ef7ac0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:44654af1-16bd-4243-b4ca-b08ca08ab1d8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|123|836|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 62bb29a8186e11f1a16f0188aa809bee-20260305
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <ed.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1627339890; Thu, 05 Mar 2026 01:36:20 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 5 Mar 2026 16:36:18 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 5 Mar 2026 16:36:18 +0800
From: <ed.tsai@mediatek.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>, "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"
	<martin.petersen@oracle.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Ed Tsai <ed.tsai@mediatek.com>, <linux-scsi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH 1/2] ufs: core: Add quriks for VCC ramp-up delay
Date: Thu, 5 Mar 2026 16:29:14 +0800
Message-ID: <20260305083610.2672344-2-ed.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260305083610.2672344-1-ed.tsai@mediatek.com>
References: <20260305083610.2672344-1-ed.tsai@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_085147_403321_FA252BE8 
X-CRM114-Status: GOOD (  14.45  )
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

On some platforms, the VCC regulator has a slow ramp-up time. Add a
delay after enabling VCC to ensure voltage has fully stabilized before
we enable the clocks.

Signed-off-by: Ed Tsai <ed.tsai@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 12 ++++++++++++
 include/ufs/ufshcd.h      |  6 ++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 899e663fea6e..bea72e7c1d32 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -9942,11 +9942,13 @@ static void ufshcd_vreg_set_lpm(struct ufs_hba *hba)
 #ifdef CONFIG_PM
 static int ufshcd_vreg_set_hpm(struct ufs_hba *hba)
 {
+	bool vcc_on = false;
 	int ret = 0;
 
 	if (ufshcd_is_ufs_dev_poweroff(hba) && ufshcd_is_link_off(hba) &&
 	    !hba->dev_info.is_lu_power_on_wp) {
 		ret = ufshcd_setup_vreg(hba, true);
+		vcc_on = true;
 	} else if (!ufshcd_is_ufs_dev_active(hba)) {
 		if (!ufshcd_is_link_active(hba)) {
 			ret = ufshcd_config_vreg_hpm(hba, hba->vreg_info.vccq);
@@ -9957,6 +9959,7 @@ static int ufshcd_vreg_set_hpm(struct ufs_hba *hba)
 				goto vccq_lpm;
 		}
 		ret = ufshcd_toggle_vreg(hba->dev, hba->vreg_info.vcc, true);
+		vcc_on = true;
 	}
 	goto out;
 
@@ -9965,6 +9968,15 @@ static int ufshcd_vreg_set_hpm(struct ufs_hba *hba)
 vcc_disable:
 	ufshcd_toggle_vreg(hba->dev, hba->vreg_info.vcc, false);
 out:
+	/*
+	 * On platforms with a slow VCC ramp-up, a delay is needed after
+	 * turning on VCC to ensure the voltage is stable before the
+	 * reference clock is enabled.
+	 */
+	if (hba->quirks & UFSHCD_QUIRK_VCC_ON_DELAY && !ret && vcc_on &&
+	    hba->vreg_info.vcc && !hba->vreg_info.vcc->always_on)
+		usleep_range(1000, 1100);
+
 	return ret;
 }
 #endif /* CONFIG_PM */
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index 8563b6648976..bf50078708b9 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -690,6 +690,12 @@ enum ufshcd_quirks {
 	 * because it causes link startup to become unreliable.
 	 */
 	UFSHCD_QUIRK_PERFORM_LINK_STARTUP_ONCE		= 1 << 26,
+
+	/*
+	 * On some platforms, the VCC regulator has a slow ramp-up time. Add a
+	 * delay after enable VCC to ensure it's stable.
+	 */
+	UFSHCD_QUIRK_VCC_ON_DELAY			= 1 << 27,
 };
 
 enum ufshcd_caps {
-- 
2.45.2


