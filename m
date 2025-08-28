Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4E9C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 09:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/yNizcJDMvaghov3QefprQDhOsxET8qI5VK34Dn6D2o=; b=fEAG/ra7AXgPNcuwXMOVKCzCt1
	ScQJsDgl4EI65MePnqOf+HV9cTuP5yBKdpvS8Wd4WDxJ/Y22ezMtIzfCSLfSN10jY3rTvqZ0sCwUC
	UNjMaf2Q3SaIrx1iHxFdzyrqyLd+vqR0nnPZE1otyCeyPOGPzetBGgukg8Gl0iWNAp+aR9NW3Zg/H
	wMoq+GL1h9As7hWf7XOQ0IbbFaOb9u1LJFz59mKX4C/7cqu4rzc0x/oj0YO3Jn4YgkJSX8wcME3gg
	aBI9y2z3zH3xOj+2lmXxPVFqXNaR0XP5JQirQxG+7CvoDoileyHZ/r+Xt/8rnvBVYOGk8lQ6BZNuL
	HSb4miuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urYrJ-00000000wuj-3wPp;
	Thu, 28 Aug 2025 09:23:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urXhK-00000000jci-12fT;
	Thu, 28 Aug 2025 08:09:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/yNizcJDMvaghov3QefprQDhOsxET8qI5VK34Dn6D2o=; b=PtIIanUYELEZxIs4V9zFGxCN5+
	1z6wK7C36nFPZ/16rR3i3FAFXPy2pvjBmhU+BvSE9aWn7TErrYUpm9Imx6Evf2gVBQtLZrH3/pD9v
	eS6jTDknwHThwnHhAJ8pkb2BSB7yNEji9m3p+BKnOTGxRxkv8phNi7hmW6s69vxV8ep+cCjjwfBQI
	mhdlfGjM86T7nMl1vTERt8lc/TT3GSPrszC/x4DVSvlA5CYwCtdtq/kJoy4ugvYyQxZxjjo30WWhN
	yexbnw2Uf7NPC/4utaLpi/SR14/N4iVCkjpKZRJ/kTBpSQjFi2YBEtym0N4YnlkXGSSa1IlLwexMa
	P1v/mcrg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urXhF-00000002fcs-1uCD;
	Thu, 28 Aug 2025 08:09:28 +0000
X-UUID: 45941f8c83e611f09f706fa2197c6ceb-20250828
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=/yNizcJDMvaghov3QefprQDhOsxET8qI5VK34Dn6D2o=;
	b=CJbTFORAzSjvqXYZWkwn1lDtjoj/D+lNs0zW4eatC9YLaVDxH9uQzFjalWtOOMyfLaBoujZF/LK0UU2eES0lwU1RqptuZAzJusgBG+gCbrwq8XY5dYMKaY3IA4JJZIHWy6o9O24z+JfriyGM6YCn4ATc2+M+1woui/LnB6De8Ak=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:b376f18c-3876-4fdb-8f18-3a0730255a09,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:7f9bb36d-c2f4-47a6-876f-59a53e9ecc6e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 45941f8c83e611f09f706fa2197c6ceb-20250828
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <paul-pl.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 685776568; Thu, 28 Aug 2025 01:09:08 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 28 Aug 2025 16:09:04 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 28 Aug 2025 16:09:04 +0800
From: Paul Chen <paul-pl.chen@mediatek.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<chunkuang.hu@kernel.org>, <angelogioacchino.delregno@collabora.com>
CC: <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>,
	<jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
	<singo.chang@mediatek.com>, <xiandong.wang@mediatek.com>,
	<sirius.wang@mediatek.com>, <paul-pl.chen@mediatek.com>,
	<sunny.shen@mediatek.com>, <fshao@chromium.org>, <treapking@chromium.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4 10/19] soc: mediatek: mutex: add mutex support for MT8196
Date: Thu, 28 Aug 2025 16:07:05 +0800
Message-ID: <20250828080855.3502514-11-paul-pl.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250828080855.3502514-1-paul-pl.chen@mediatek.com>
References: <20250828080855.3502514-1-paul-pl.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_090926_147653_E0CB0EDC 
X-CRM114-Status: GOOD (  17.42  )
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

From: Nancy Lin <nancy.lin@mediatek.com>

Add mutex support for the main and external displays in MT8196:
- Introduce a new DVO0 output component for the new mutex
  settings of MT8196.
- Add a need_sof_mof flag to configure both SOF and MOD settings
  for the output component.

Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
---
 drivers/soc/mediatek/mtk-mutex.c | 148 +++++++++++++++++++++++++++++--
 1 file changed, 142 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index c48983d8a6cd..ebc938d065ce 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -22,6 +22,7 @@
 #define MT8183_MUTEX0_MOD0			0x30
 #define MT8183_MUTEX0_MOD1			0x34
 #define MT8183_MUTEX0_SOF0			0x2c
+#define MT8196_MUTEX0_MOD0			0x34
 
 #define DISP_REG_MUTEX_EN(n)			(0x20 + 0x20 * (n))
 #define DISP_REG_MUTEX(n)			(0x24 + 0x20 * (n))
@@ -256,6 +257,47 @@
 #define MT8195_MUTEX_MOD_MDP_WROT2             32
 #define MT8195_MUTEX_MOD_MDP_WROT3             33
 
+/* OVLSYS */
+#define MT8196_MUTEX_MOD0_OVL_EXDMA2		2
+#define MT8196_MUTEX_MOD0_OVL_EXDMA3		3
+#define MT8196_MUTEX_MOD0_OVL_EXDMA4		4
+#define MT8196_MUTEX_MOD0_OVL_EXDMA5		5
+#define MT8196_MUTEX_MOD0_OVL_EXDMA6		6
+#define MT8196_MUTEX_MOD0_OVL_EXDMA7		7
+#define MT8196_MUTEX_MOD0_OVL_EXDMA8		8
+#define MT8196_MUTEX_MOD0_OVL_EXDMA9		9
+#define MT8196_MUTEX_MOD0_OVL_BLENDER1		11
+#define MT8196_MUTEX_MOD0_OVL_BLENDER2		12
+#define MT8196_MUTEX_MOD0_OVL_BLENDER3		13
+#define MT8196_MUTEX_MOD0_OVL_BLENDER4		14
+#define MT8196_MUTEX_MOD0_OVL_BLENDER5		15
+#define MT8196_MUTEX_MOD0_OVL_BLENDER6		16
+#define MT8196_MUTEX_MOD0_OVL_BLENDER7		17
+#define MT8196_MUTEX_MOD0_OVL_BLENDER8		18
+#define MT8196_MUTEX_MOD0_OVL_BLENDER9		19
+#define MT8196_MUTEX_MOD0_OVL_OUTPROC0		20
+#define MT8196_MUTEX_MOD0_OVL_OUTPROC1		21
+#define MT8196_MUTEX_MOD0_OVL_OUTPROC2		22
+#define MT8196_MUTEX_MOD1_OVL_DLO_ASYNC5	(32 + 16)
+#define MT8196_MUTEX_MOD1_OVL_DLO_ASYNC6	(32 + 17)
+
+/* DISP0 */
+#define MT8196_MUTEX_MOD0_DISP_DLI_ASYNC0	16
+#define MT8196_MUTEX_MOD0_DISP_DLI_ASYNC1	17
+#define MT8196_MUTEX_MOD0_DISP_DLI_ASYNC8	24
+#define MT8196_MUTEX_MOD1_DISP_DLO_ASYNC1	(32 + 1)
+#define MT8196_MUTEX_MOD1_DISP_DLO_ASYNC2	(32 + 2)
+#define MT8196_MUTEX_MOD1_DISP_DLO_ASYNC3	(32 + 3)
+
+/* DISP1 */
+#define MT8196_MUTEX_MOD0_DISP1_DLI_ASYNC21	1
+#define MT8196_MUTEX_MOD0_DISP1_DLI_ASYNC22	2
+#define MT8196_MUTEX_MOD0_DISP1_DLI_ASYNC23	3
+#define MT8196_MUTEX_MOD0_DISP1_DP_INTF0	13
+#define MT8196_MUTEX_MOD0_DISP1_DP_INTF1	14
+#define MT8196_MUTEX_MOD0_DISP1_DSI0		23
+#define MT8196_MUTEX_MOD0_DISP1_DVO		29
+
 #define MT8365_MUTEX_MOD_DISP_OVL0		7
 #define MT8365_MUTEX_MOD_DISP_OVL0_2L		8
 #define MT8365_MUTEX_MOD_DISP_RDMA0		9
@@ -316,6 +358,12 @@
 #define MT8195_MUTEX_SOF_DP_INTF1		4
 #define MT8195_MUTEX_SOF_DPI0			6 /* for HDMI_TX */
 #define MT8195_MUTEX_SOF_DPI1			5 /* for digital video out */
+#define MT8196_MUTEX_SOF_DSI0			1
+#define MT8196_MUTEX_SOF_DSI1			2
+#define MT8196_MUTEX_SOF_DSI2			4
+#define MT8196_MUTEX_SOF_DPI0			5
+#define MT8196_MUTEX_SOF_DPI1			6
+#define MT8196_MUTEX_SOF_DVO0			7
 
 #define MT8183_MUTEX_EOF_DSI0			(MT8183_MUTEX_SOF_DSI0 << 6)
 #define MT8183_MUTEX_EOF_DPI0			(MT8183_MUTEX_SOF_DPI0 << 6)
@@ -329,6 +377,12 @@
 #define MT8195_MUTEX_EOF_DP_INTF1		(MT8195_MUTEX_SOF_DP_INTF1 << 7)
 #define MT8195_MUTEX_EOF_DPI0			(MT8195_MUTEX_SOF_DPI0 << 7)
 #define MT8195_MUTEX_EOF_DPI1			(MT8195_MUTEX_SOF_DPI1 << 7)
+#define MT8196_MUTEX_EOF_DSI0			(MT8196_MUTEX_SOF_DSI0 << 7)
+#define MT8196_MUTEX_EOF_DSI1			(MT8196_MUTEX_SOF_DSI1 << 7)
+#define MT8196_MUTEX_EOF_DSI2			(MT8196_MUTEX_SOF_DSI2 << 7)
+#define MT8196_MUTEX_EOF_DPI0			(MT8196_MUTEX_SOF_DPI0 << 7)
+#define MT8196_MUTEX_EOF_DPI1			(MT8196_MUTEX_SOF_DPI1 << 7)
+#define MT8196_MUTEX_EOF_DVO0			(MT8196_MUTEX_SOF_DVO0 << 7)
 
 struct mtk_mutex {
 	u8 id;
@@ -345,6 +399,7 @@ enum mtk_mutex_sof_id {
 	MUTEX_SOF_DSI3,
 	MUTEX_SOF_DP_INTF0,
 	MUTEX_SOF_DP_INTF1,
+	MUTEX_SOF_DVO0,
 	DDP_MUTEX_SOF_MAX,
 };
 
@@ -356,6 +411,7 @@ struct mtk_mutex_data {
 	const u16 mutex_mod1_reg;
 	const u16 mutex_sof_reg;
 	const bool no_clk;
+	const bool need_sof_mod;
 };
 
 struct mtk_mutex_ctx {
@@ -645,6 +701,64 @@ static const u8 mt8195_mutex_table_mod[MUTEX_MOD_IDX_MAX] = {
 	[MUTEX_MOD_IDX_MDP_WROT3] = MT8195_MUTEX_MOD_MDP_WROT3,
 };
 
+static const u8 mt8196_mutex_mod[DDP_COMPONENT_ID_MAX] = {
+	[DDP_COMPONENT_OVL0_EXDMA2] = MT8196_MUTEX_MOD0_OVL_EXDMA2,
+	[DDP_COMPONENT_OVL0_EXDMA3] = MT8196_MUTEX_MOD0_OVL_EXDMA3,
+	[DDP_COMPONENT_OVL0_EXDMA4] = MT8196_MUTEX_MOD0_OVL_EXDMA4,
+	[DDP_COMPONENT_OVL0_EXDMA5] = MT8196_MUTEX_MOD0_OVL_EXDMA5,
+	[DDP_COMPONENT_OVL0_EXDMA6] = MT8196_MUTEX_MOD0_OVL_EXDMA6,
+	[DDP_COMPONENT_OVL0_EXDMA7] = MT8196_MUTEX_MOD0_OVL_EXDMA7,
+	[DDP_COMPONENT_OVL0_EXDMA8] = MT8196_MUTEX_MOD0_OVL_EXDMA8,
+	[DDP_COMPONENT_OVL0_EXDMA9] = MT8196_MUTEX_MOD0_OVL_EXDMA9,
+	[DDP_COMPONENT_OVL0_BLENDER1] = MT8196_MUTEX_MOD0_OVL_BLENDER1,
+	[DDP_COMPONENT_OVL0_BLENDER2] = MT8196_MUTEX_MOD0_OVL_BLENDER2,
+	[DDP_COMPONENT_OVL0_BLENDER3] = MT8196_MUTEX_MOD0_OVL_BLENDER3,
+	[DDP_COMPONENT_OVL0_BLENDER4] = MT8196_MUTEX_MOD0_OVL_BLENDER4,
+	[DDP_COMPONENT_OVL0_BLENDER5] = MT8196_MUTEX_MOD0_OVL_BLENDER5,
+	[DDP_COMPONENT_OVL0_BLENDER6] = MT8196_MUTEX_MOD0_OVL_BLENDER6,
+	[DDP_COMPONENT_OVL0_BLENDER7] = MT8196_MUTEX_MOD0_OVL_BLENDER7,
+	[DDP_COMPONENT_OVL0_BLENDER8] = MT8196_MUTEX_MOD0_OVL_BLENDER8,
+	[DDP_COMPONENT_OVL0_BLENDER9] = MT8196_MUTEX_MOD0_OVL_BLENDER9,
+	[DDP_COMPONENT_OVL0_OUTPROC0] = MT8196_MUTEX_MOD0_OVL_OUTPROC0,
+	[DDP_COMPONENT_OVL0_OUTPROC1] = MT8196_MUTEX_MOD0_OVL_OUTPROC1,
+	[DDP_COMPONENT_OVL0_DLO_ASYNC5] = MT8196_MUTEX_MOD1_OVL_DLO_ASYNC5,
+	[DDP_COMPONENT_OVL0_DLO_ASYNC6] = MT8196_MUTEX_MOD1_OVL_DLO_ASYNC6,
+	[DDP_COMPONENT_OVL1_EXDMA2] = MT8196_MUTEX_MOD0_OVL_EXDMA2,
+	[DDP_COMPONENT_OVL1_EXDMA3] = MT8196_MUTEX_MOD0_OVL_EXDMA3,
+	[DDP_COMPONENT_OVL1_EXDMA4] = MT8196_MUTEX_MOD0_OVL_EXDMA4,
+	[DDP_COMPONENT_OVL1_EXDMA5] = MT8196_MUTEX_MOD0_OVL_EXDMA5,
+	[DDP_COMPONENT_OVL1_EXDMA6] = MT8196_MUTEX_MOD0_OVL_EXDMA6,
+	[DDP_COMPONENT_OVL1_EXDMA7] = MT8196_MUTEX_MOD0_OVL_EXDMA7,
+	[DDP_COMPONENT_OVL1_EXDMA8] = MT8196_MUTEX_MOD0_OVL_EXDMA8,
+	[DDP_COMPONENT_OVL1_EXDMA9] = MT8196_MUTEX_MOD0_OVL_EXDMA9,
+	[DDP_COMPONENT_OVL1_BLENDER1] = MT8196_MUTEX_MOD0_OVL_BLENDER1,
+	[DDP_COMPONENT_OVL1_BLENDER2] = MT8196_MUTEX_MOD0_OVL_BLENDER2,
+	[DDP_COMPONENT_OVL1_BLENDER3] = MT8196_MUTEX_MOD0_OVL_BLENDER3,
+	[DDP_COMPONENT_OVL1_BLENDER4] = MT8196_MUTEX_MOD0_OVL_BLENDER4,
+	[DDP_COMPONENT_OVL1_BLENDER5] = MT8196_MUTEX_MOD0_OVL_BLENDER5,
+	[DDP_COMPONENT_OVL1_BLENDER6] = MT8196_MUTEX_MOD0_OVL_BLENDER6,
+	[DDP_COMPONENT_OVL1_BLENDER7] = MT8196_MUTEX_MOD0_OVL_BLENDER7,
+	[DDP_COMPONENT_OVL1_BLENDER8] = MT8196_MUTEX_MOD0_OVL_BLENDER8,
+	[DDP_COMPONENT_OVL1_BLENDER9] = MT8196_MUTEX_MOD0_OVL_BLENDER9,
+	[DDP_COMPONENT_OVL1_OUTPROC0] = MT8196_MUTEX_MOD0_OVL_OUTPROC0,
+	[DDP_COMPONENT_OVL1_OUTPROC1] = MT8196_MUTEX_MOD0_OVL_OUTPROC1,
+	[DDP_COMPONENT_OVL1_DLO_ASYNC5] = MT8196_MUTEX_MOD1_OVL_DLO_ASYNC5,
+	[DDP_COMPONENT_OVL1_DLO_ASYNC6] = MT8196_MUTEX_MOD1_OVL_DLO_ASYNC6,
+	[DDP_COMPONENT_DLI_ASYNC0] = MT8196_MUTEX_MOD0_DISP_DLI_ASYNC0,
+	[DDP_COMPONENT_DLI_ASYNC1] = MT8196_MUTEX_MOD0_DISP_DLI_ASYNC1,
+	[DDP_COMPONENT_DLI_ASYNC8] = MT8196_MUTEX_MOD0_DISP_DLI_ASYNC8,
+	[DDP_COMPONENT_DLO_ASYNC1] = MT8196_MUTEX_MOD1_DISP_DLO_ASYNC1,
+	[DDP_COMPONENT_DLO_ASYNC2] = MT8196_MUTEX_MOD1_DISP_DLO_ASYNC2,
+	[DDP_COMPONENT_DLO_ASYNC3] = MT8196_MUTEX_MOD1_DISP_DLO_ASYNC3,
+	[DDP_COMPONENT_DLI_ASYNC21] = MT8196_MUTEX_MOD0_DISP1_DLI_ASYNC21,
+	[DDP_COMPONENT_DLI_ASYNC22] = MT8196_MUTEX_MOD0_DISP1_DLI_ASYNC22,
+	[DDP_COMPONENT_DLI_ASYNC23] = MT8196_MUTEX_MOD0_DISP1_DLI_ASYNC23,
+	[DDP_COMPONENT_DVO0] = MT8196_MUTEX_MOD0_DISP1_DVO,
+	[DDP_COMPONENT_DP_INTF0] = MT8196_MUTEX_MOD0_DISP1_DP_INTF0,
+	[DDP_COMPONENT_DP_INTF1] = MT8196_MUTEX_MOD0_DISP1_DP_INTF1,
+	[DDP_COMPONENT_DSI0] = MT8196_MUTEX_MOD0_DISP1_DSI0,
+};
+
 static const u8 mt8365_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_AAL0] = MT8365_MUTEX_MOD_DISP_AAL,
 	[DDP_COMPONENT_CCORR] = MT8365_MUTEX_MOD_DISP_CCORR,
@@ -730,6 +844,17 @@ static const u16 mt8195_mutex_sof[DDP_MUTEX_SOF_MAX] = {
 		MT8195_MUTEX_SOF_DP_INTF1 | MT8195_MUTEX_EOF_DP_INTF1,
 };
 
+static const u16 mt8196_mutex_sof[DDP_MUTEX_SOF_MAX] = {
+	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
+	[MUTEX_SOF_DSI0] = MT8196_MUTEX_SOF_DSI0 | MT8196_MUTEX_EOF_DSI0,
+	[MUTEX_SOF_DSI1] = MT8196_MUTEX_SOF_DSI1 | MT8196_MUTEX_EOF_DSI1,
+	[MUTEX_SOF_DP_INTF0] =
+		MT8196_MUTEX_SOF_DPI0 | MT8196_MUTEX_EOF_DPI0,
+	[MUTEX_SOF_DP_INTF1] =
+		MT8196_MUTEX_SOF_DPI1 | MT8196_MUTEX_EOF_DPI1,
+	[MUTEX_SOF_DVO0] = MT8196_MUTEX_SOF_DVO0 | MT8196_MUTEX_EOF_DVO0,
+};
+
 static const struct mtk_mutex_data mt2701_mutex_driver_data = {
 	.mutex_mod = mt2701_mutex_mod,
 	.mutex_sof = mt2712_mutex_sof,
@@ -836,6 +961,14 @@ static const struct mtk_mutex_data mt8195_vpp_mutex_driver_data = {
 	.mutex_table_mod = mt8195_mutex_table_mod,
 };
 
+static const struct mtk_mutex_data mt8196_mutex_driver_data = {
+	.mutex_mod = mt8196_mutex_mod,
+	.mutex_sof = mt8196_mutex_sof,
+	.mutex_mod_reg = MT8196_MUTEX0_MOD0,
+	.mutex_sof_reg = MT2701_MUTEX0_SOF0,
+	.need_sof_mod = true,
+};
+
 static const struct mtk_mutex_data mt8365_mutex_driver_data = {
 	.mutex_mod = mt8365_mutex_mod,
 	.mutex_sof = mt8183_mutex_sof,
@@ -906,6 +1039,8 @@ static int mtk_mutex_get_output_comp_sof(enum mtk_ddp_comp_id id)
 		return MUTEX_SOF_DP_INTF0;
 	case DDP_COMPONENT_DP_INTF1:
 		return MUTEX_SOF_DP_INTF1;
+	case DDP_COMPONENT_DVO0:
+		return MUTEX_SOF_DVO0;
 	default:
 		break;
 	}
@@ -963,7 +1098,7 @@ void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 
 	WARN_ON(&mtx->mutex[mutex->id] != mutex);
 
-	if (!is_output_comp) {
+	if (!is_output_comp || mtx->data->need_sof_mod) {
 		if (mtx->data->mutex_mod[id] < 32) {
 			offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
 						    mutex->id);
@@ -976,10 +1111,10 @@ void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 			reg |= 1 << (mtx->data->mutex_mod[id] - 32);
 			writel_relaxed(reg, mtx->regs + offset);
 		}
-		return;
 	}
 
-	mtk_mutex_add_comp_sof(mutex, id);
+	if (is_output_comp)
+		mtk_mutex_add_comp_sof(mutex, id);
 }
 EXPORT_SYMBOL_GPL(mtk_mutex_add_comp);
 
@@ -995,7 +1130,7 @@ void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
 
 	WARN_ON(&mtx->mutex[mutex->id] != mutex);
 
-	if (!is_output_comp) {
+	if (!is_output_comp || mtx->data->need_sof_mod) {
 		if (mtx->data->mutex_mod[id] < 32) {
 			offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
 						    mutex->id);
@@ -1008,10 +1143,10 @@ void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
 			reg &= ~(1 << (mtx->data->mutex_mod[id] - 32));
 			writel_relaxed(reg, mtx->regs + offset);
 		}
-		return;
 	}
 
-	mtk_mutex_remove_comp_sof(mutex, id);
+	if (is_output_comp)
+		mtk_mutex_remove_comp_sof(mutex, id);
 
 }
 EXPORT_SYMBOL_GPL(mtk_mutex_remove_comp);
@@ -1185,6 +1320,7 @@ static const struct of_device_id mutex_driver_dt_match[] = {
 	{ .compatible = "mediatek,mt8192-disp-mutex", .data = &mt8192_mutex_driver_data },
 	{ .compatible = "mediatek,mt8195-disp-mutex", .data = &mt8195_mutex_driver_data },
 	{ .compatible = "mediatek,mt8195-vpp-mutex",  .data = &mt8195_vpp_mutex_driver_data },
+	{ .compatible = "mediatek,mt8196-disp-mutex", .data = &mt8196_mutex_driver_data },
 	{ .compatible = "mediatek,mt8365-disp-mutex", .data = &mt8365_mutex_driver_data },
 	{ /* sentinel */ },
 };
-- 
2.45.2


