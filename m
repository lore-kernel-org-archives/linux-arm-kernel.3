Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1DC4D74955
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 01:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P7nbJqT7Rm1H4AHPjbsBGMrWkOmgdm228ehu4L7mLa0=; b=BBMluDh2R3xnxZtFaH0Pocs84s
	sWA5JYsdthBF1DYLI3HxbMdiADa9ZfJvlyqsMCrS+m2cWmir2LfuqLX55fVHl0LvO/W9SWzzuSd2i
	amYcYJXiFz3Ewp9HjdcdLt+J5IM/DcMPdBkHUZmymQU3dKfEaLwTOltosQc6ssEir8KCvta5IsEkZ
	N/tHFrJopjZtNwVc5v7BtGH5KQoX1BDkSwUOj6d0T6ZITErvWZq/AbXT1fYZxnzfeqkn9OtXHr4EK
	wfpALt5bXzji9DYeImI0lyd77w6h+UxsAOn+9aOz8knRB3mVFLFh9nClFfDklA5kkBrxaFxfD5hL4
	qafcX/cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5xhY-0000000GRD6-3JIC;
	Wed, 30 Oct 2024 01:40:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5xeT-0000000GQpQ-36Nv;
	Wed, 30 Oct 2024 01:37:39 +0000
X-UUID: 87a7d000965f11ef9048ed6ed365623b-20241029
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=P7nbJqT7Rm1H4AHPjbsBGMrWkOmgdm228ehu4L7mLa0=;
	b=POQ4R38JY06+Gh2Hod44HBPTuSpkE7pQ88f1p/NHG3Uxt1iEQJfQ1IfqoPZIaRSsGtFThC3m8sHRQye+ulmPARkYDaJ8ew2FlI6wjsP0GBcVIOzlsaxr3q6rQa0Wk1c/dltc09UehxY94Quj9nG2p7/xMO9eJMxCkMn2NYx+YCQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:7d58d582-c09c-4bda-b824-253b9955b627,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:647742e7-cb6b-4a59-bfa3-98f245b4912e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 87a7d000965f11ef9048ed6ed365623b-20241029
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <karl.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1409637739; Tue, 29 Oct 2024 18:37:31 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 30 Oct 2024 09:37:28 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 30 Oct 2024 09:37:28 +0800
From: Karl.Li <karl.li@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Karl Li <Karl.Li@mediatek.com>,
	Chungying Lu <chungying.lu@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<chien-chih.tseng@mediatek.com>, <andy.teng@mediatek.com>, Karl Li
	<karl.li@mediatek.com>
Subject: [PATCH v2 1/1] soc: mediatek: Add command for APU SMC call
Date: Wed, 30 Oct 2024 09:35:28 +0800
Message-ID: <20241030013533.855696-2-karl.li@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241030013533.855696-1-karl.li@mediatek.com>
References: <20241030013533.855696-1-karl.li@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_183737_888203_61EDAA4A 
X-CRM114-Status: GOOD (  12.28  )
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

From: Karl Li <karl.li@mediatek.com>

Add command for APU SMC call.
The APU microprocess's start and stop sequence will process in ATF.

Signed-off-by: Karl Li <karl.li@mediatek.com>
---
 include/linux/firmware/mediatek/mtk-apu.h | 32 +++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 include/linux/firmware/mediatek/mtk-apu.h

diff --git a/include/linux/firmware/mediatek/mtk-apu.h b/include/linux/firmware/mediatek/mtk-apu.h
new file mode 100644
index 000000000000..a327e31d40fa
--- /dev/null
+++ b/include/linux/firmware/mediatek/mtk-apu.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2024 MediaTek Inc.
+ */
+
+#ifndef __MEDIATEK_APU_H__
+#define __MEDIATEK_APU_H__
+
+enum mtk_apusys_kernel_op {
+	MTK_APUSYS_KERNEL_OP_APUSYS_PWR_TOP_ON,			/*  0 */
+	MTK_APUSYS_KERNEL_OP_APUSYS_PWR_TOP_OFF,		/*  1 */
+	MTK_APUSYS_KERNEL_OP_APUSYS_RV_SETUP_REVISER,		/*  2 */
+	MTK_APUSYS_KERNEL_OP_APUSYS_RV_RESET_MP,		/*  3 */
+	MTK_APUSYS_KERNEL_OP_APUSYS_RV_SETUP_BOOT,		/*  4 */
+	MTK_APUSYS_KERNEL_OP_APUSYS_RV_START_MP,		/*  5 */
+	MTK_APUSYS_KERNEL_OP_APUSYS_RV_STOP_MP,			/*  6 */
+	MTK_APUSYS_KERNEL_OP_DEVAPC_INIT_RCX,			/*  7 */
+	MTK_APUSYS_KERNEL_OP_APUSYS_RV_SETUP_SEC_MEM,		/*  8 */
+	MTK_APUSYS_KERNEL_OP_APUSYS_RV_DISABLE_WDT_ISR,		/*  9 */
+	MTK_APUSYS_KERNEL_OP_APUSYS_RV_CLEAR_WDT_ISR,		/* 10 */
+	MTK_APUSYS_KERNEL_OP_APUSYS_RV_CG_GATING,		/* 11 */
+	MTK_APUSYS_KERNEL_OP_APUSYS_RV_CG_UNGATING,		/* 12 */
+	MTK_APUSYS_KERNEL_OP_APUSYS_RV_SETUP_APUMMU,		/* 13 */
+	MTK_APUSYS_KERNEL_OP_APUSYS_LOGTOP_REG_DUMP,		/* 14 */
+	MTK_APUSYS_KERNEL_OP_APUSYS_LOGTOP_REG_WRITE,		/* 15 */
+	MTK_APUSYS_KERNEL_OP_APUSYS_LOGTOP_REG_W1C,		/* 16 */
+	MTK_APUSYS_KERNEL_OP_APUSYS_COLD_BOOT_CLR_MBOX_DUMMY,	/* 17 */
+	MTK_APUSYS_KERNEL_OP_APUSYS_SETUP_CE_BIN,		/* 18 */
+	MTK_APUSYS_KERNEL_OP_NUM,
+};
+
+#endif
-- 
2.18.0


