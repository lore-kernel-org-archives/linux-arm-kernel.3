Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89EC5C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 09:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xooKwfqKZPpKfPYNFtOO33yjWX3ExswTqq8/C09VJ7U=; b=hPe0IqwF7q+HPXUR1StLr23hyf
	EFE1nQfhVzTSJU9GtYIjRx6gjTbQbm/5SEsLPNmm/nuUHUyixcD+UzGAjvqZHR4evTxr0mOIln5XH
	/keAx9FaSIX1JqBJXsxwUX4K3r8IIEGYBde7O8v4au5F4yulz3z+DvqVEOze9y/Sg8imp8hXGheJ3
	Z+swYW+dmDNqJTHE7eBG/0ztxvbEuvFF42jLsCGI+lUw/OgXO5bXGF5+7Vi7o6E7ZLydCvVjkZxoV
	UuWPFb/p1EYxUxNi7a0RyhAQIYpvBN/ZuZ4H3rqSyJvcIIrnZOtL/rsogx6MX3yiZjCWsFz+MH5PO
	VZCWHk7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfmP-0000000FJpc-38QD;
	Wed, 21 May 2025 09:30:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfYz-0000000FHJm-3or7;
	Wed, 21 May 2025 09:16:39 +0000
X-UUID: 489bd7ca362411f0bed96b30c12bc3d6-20250521
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=xooKwfqKZPpKfPYNFtOO33yjWX3ExswTqq8/C09VJ7U=;
	b=mEufUaEHEu/GyMqip8M0lCENxgktP8osa2gQaCWjQzRjfVr9Jr2Djbm0c2oEEf4OCnbVIahcgFvRmT+VJshIcFgq1dYBUz5VaXnp2fwmruGcqn40tUO1dQtlUY9p0vO7PxJhnD+TVutl5RnUiMlI4lYH8AEQ3jd47pXu21No3XU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:777c6655-d460-4aa3-a5dc-037346fad64b,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:df4ed057-abad-4ac2-9923-3af0a8a9a079,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 489bd7ca362411f0bed96b30c12bc3d6-20250521
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <friday.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1238770623; Wed, 21 May 2025 02:16:31 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 21 May 2025 17:16:27 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 21 May 2025 17:16:26 +0800
From: Friday Yang <friday.yang@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Philipp Zabel
	<p.zabel@pengutronix.de>
CC: Friday Yang <friday.yang@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v1] memory: mtk-smi: Add ostd setting for mt8186
Date: Wed, 21 May 2025 17:16:16 +0800
Message-ID: <20250521091626.4283-1-friday.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_021637_951105_AE24CEC2 
X-CRM114-Status: GOOD (  10.80  )
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

Add initial ostd setting for mt8186. All the settings come from DE.
These settings help adjust Multimedia HW's bandwidth limits to achieve
a balanced bandwidth requirement. Without this, the VENC HW works
abnormal while stress testing.

Fixes: 86a010bfc739 ("memory: mtk-smi: mt8186: Add smi support")
Signed-off-by: Friday Yang <friday.yang@mediatek.com>
---
 drivers/memory/mtk-smi.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index c086c22511f7..733e22f695ab 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -320,6 +320,38 @@ static const u8 mtk_smi_larb_mt6893_ostd[][SMI_LARB_PORT_NR_MAX] = {
 	[20] = {0x9, 0x9, 0x5, 0x5, 0x1, 0x1},
 };

+static const u8 mtk_smi_larb_mt8186_ostd[][SMI_LARB_PORT_NR_MAX] = {
+	[0] = {0x2, 0x1, 0x8, 0x1,},
+	[1] = {0x1, 0x3, 0x1, 0x1,},
+	[2] = {0x6, 0x1, 0x4, 0x1,},
+	[3] = {},
+	[4] = {0xf, 0x1, 0x5, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1,
+	       0x1, 0x1, 0x1,},
+	[5] = {},
+	[6] = {},
+	[7] = {0x1, 0x3, 0x1, 0x1, 0x1, 0x3, 0x2, 0xd, 0x7, 0x5, 0x3,
+	       0x1, 0x5,},
+	[8] = {0x1, 0x2, 0x2,},
+	[9] = {0x9, 0x7, 0xf, 0x8, 0x1, 0x8, 0x9, 0x3, 0x3, 0xb, 0x7, 0x4,
+	       0x9, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1,
+	       0x1, 0x1, 0x1, 0x1, 0x1,},
+	[10] = {},
+	[11] = {0x9, 0x7, 0xf, 0x8, 0x1, 0x8, 0x9, 0x3, 0x3, 0xb, 0x7, 0x4,
+		0x9, 0x1, 0x1, 0x1, 0x1, 0x1, 0x8, 0x7, 0x7, 0x1, 0x6, 0x2,
+		0xf, 0x8, 0x1, 0x1, 0x1,},
+	[12] = {},
+	[13] = {0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x6, 0x6, 0x6, 0x1, 0x1, 0x1,},
+	[14] = {0x1, 0x1, 0x1, 0x1, 0x1, 0x1,},
+	[15] = {},
+	[16] = {0x28, 0x14, 0x2, 0xc, 0x18, 0x1, 0x14, 0x1, 0x4, 0x4, 0x4,
+		0x2, 0x4, 0x2, 0x8, 0x4, 0x4,},
+	[17] = {0x28, 0x14, 0x2, 0xc, 0x18, 0x1, 0x14, 0x1, 0x4, 0x4, 0x4,
+		0x2, 0x4, 0x2, 0x8, 0x4, 0x4,},
+	[18] = {},
+	[19] = {0x1, 0x1, 0x1, 0x1,},
+	[20] = {0x2, 0x2, 0x2, 0x2, 0x1, 0x1,},
+};
+
 static const u8 mtk_smi_larb_mt8188_ostd[][SMI_LARB_PORT_NR_MAX] = {
 	[0] = {0x02, 0x18, 0x22, 0x22, 0x01, 0x02, 0x0a,},
 	[1] = {0x12, 0x02, 0x14, 0x14, 0x01, 0x18, 0x0a,},
@@ -491,6 +523,7 @@ static const struct mtk_smi_larb_gen mtk_smi_larb_mt8183 = {
 static const struct mtk_smi_larb_gen mtk_smi_larb_mt8186 = {
 	.config_port                = mtk_smi_larb_config_port_gen2_general,
 	.flags_general	            = MTK_SMI_FLAG_SLEEP_CTL,
+	.ostd			    = mtk_smi_larb_mt8186_ostd,
 };

 static const struct mtk_smi_larb_gen mtk_smi_larb_mt8188 = {
--
2.46.0


