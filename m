Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C8DCD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 23:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7lono346LLiByVxDpmcbPatLkqlMCZPQmgQ7Az+Hj/8=; b=aFANY8HBcZ5N9VL6rT873hfjJu
	gmlYnCaYImC5ibhLJtN/LpGrb5NXdwO+j+xGRot7lKlEORD2tLOLstzNg0nBrsPgayys7lt+76lVZ
	Dk37j9Wszi8ONOojNpY0ddhSMIqecVsfjRX5ukz7ypSDJcCDqSrOj8wbzZc4sNiBgV6e+EyOb/D6V
	xEfTTFc5RfgToDwHMV9UOcDxq4YUm3LarWZZhSn7bkfutjzVYHAbe3wg1uadwu6GvsN0gziIWS61I
	VODnWKgQdDEh1YTttmFOAt9dgbkOnJ0ceh1hJncL4alK7k0T9EGfBuqK12Gd8LjHJesasf/d5v6+X
	rov9oSuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXonW-0000000AAcI-1Wxc;
	Thu, 11 Jun 2026 23:26:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXonT-0000000AAaN-2p5r;
	Thu, 11 Jun 2026 23:26:52 +0000
X-UUID: 03a6f61465ed11f1afed4741b24580c9-20260611
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=7lono346LLiByVxDpmcbPatLkqlMCZPQmgQ7Az+Hj/8=;
	b=JGrr8xBSLd8m56Mka7KvuHvthyYtlmFc0GoNFvb3vE1L7xRwnzamktrLGzPfvPA8Wer2VhDYpcl7LN2M19oSXuY8Fjb1zEeb0MMmHmJ1ALu021A9F0pwrENWLYOtp2tb46vhIq+hqaX1sG2gxGFHJ3pUZhiDcdYgRunYnDlVAN4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:112b8751-53aa-4bc8-ba58-da9198db4a61,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:73d2f8a4-9ef7-4489-861a-e83b251ece46,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|123|836|865|888|898,TC:-5,
	Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,C
	OL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 03a6f61465ed11f1afed4741b24580c9-20260611
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <ed.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2108142806; Thu, 11 Jun 2026 16:26:46 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Jun 2026 07:26:44 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 12 Jun 2026 07:26:44 +0800
From: <ed.tsai@mediatek.com>
To: <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
	<James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>,
	<linux-scsi@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>,
	<peter.wang@mediatek.com>, <alice.chao@mediatek.com>,
	<naomi.chu@mediatek.com>, <chun-hung.wu@mediatek.com>, Ed Tsai
	<ed.tsai@mediatek.com>
Subject: [PATCH v2 1/3] ufs: core: Add get_hba_nortt callback for vendor-specific RTT capability
Date: Fri, 12 Jun 2026 07:26:30 +0800
Message-ID: <20260611232632.2324422-2-ed.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260611232632.2324422-1-ed.tsai@mediatek.com>
References: <20260611232632.2324422-1-ed.tsai@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_162651_718344_024F0525 
X-CRM114-Status: GOOD (  15.33  )
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


