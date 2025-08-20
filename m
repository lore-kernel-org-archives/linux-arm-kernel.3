Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C81CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 10:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FOxlmpmJRaJ3nqLdwsR6RnT/cJ5L9JYFFZhQXQbNCXQ=; b=N22XcqwmZw+MR/Erucy6eGGBlq
	NoJQkotLrccN5E8pvgbLAT7fskgNao3KCdAj24h/OyiPyiaeHr7t5vX81y7Y3k3wIrwnp0IiQ7yGn
	o4bWeo8hhAC527toO4Kpd2BLfI9J2xDw46FrpbVRvNhcynlkGVsugIZofs/2T6WSvJeVlbjozcLOF
	JIGsozAj1tBkJiLxVX2MMNq7fiY52o/K8MFLiBWmnfFb0aac3/RP3PkV+Jz+mOawXZ2+4OpFlVY3D
	HYIerbgXCuT6CSLRYvZnkOll40bdvBGoMZeuNPNNSiARfqPFSoPfFsNp04psp3G2YS6lD1yZr/0hW
	PnAaJ2jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uofmf-0000000D6G3-0Uxo;
	Wed, 20 Aug 2025 10:11:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uofHe-0000000Cy78-2DiU
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 20 Aug 2025 09:39:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=FOxlmpmJRaJ3nqLdwsR6RnT/cJ5L9JYFFZhQXQbNCXQ=; b=R9hu+l2mqkv0AWXzNdrQI3E3VW
	I5r2HOhDbt28YHxnOwW1x8aJHxHK4UwduXZ1LeqJIa6A8tbUuourfq/MCrQxMjfPw1ICXB/IiUkx0
	dwaWnUEnpuhRykxW+slrRgn6K8k30Ib/8Htun+VgiJqkokWU7Ab0QbKJX+Vkqp38N/7rdlD4cgOdn
	UtrOvhJfzw3Fn+HVwyRkKZ9mwzsD4eSgqQdxaa/6VzK3X9UY48o8BdTZ5LaiIaYrcsh4DNJBE1ZgA
	ZOrOwXNy9Qvgcku2WMmXJauZ/lRuDXVdG9o04uCtUKpME0PbPQemEyoHPEkN3aMosg5idQikKwynG
	7SzE6/Mg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uofHb-00000000GlA-2KqF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 09:39:05 +0000
X-UUID: 74704c927da911f09f706fa2197c6ceb-20250820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=FOxlmpmJRaJ3nqLdwsR6RnT/cJ5L9JYFFZhQXQbNCXQ=;
	b=ckU8YIm1zyEdhtT/rVs0Iow8KUw5+ik+PpuMNyQpYl9Ril/UPtromm3g4+dqOdUG4LmdqKoA7xyituGrrXPyS1/aYT/na1onN2ejjKBQqNBgbSvnrGoFwoe2a6ezDiuQYXyxr3RvxqbyF0vdn/dX8QW58rM2WLicDqXISFOH9kE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:fa0ba4a9-b1d0-45ae-a821-bd27c3cf206b,IP:0,UR
	L:0,TC:0,Content:100,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:100
X-CID-META: VersionHash:f1326cf,CLOUDID:90a5547a-966c-41bd-96b5-7d0b3c22e782,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|801,TC:-5,Content:3|15|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 74704c927da911f09f706fa2197c6ceb-20250820
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xiandong.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 601277653; Wed, 20 Aug 2025 02:38:40 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 20 Aug 2025 17:38:36 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 20 Aug 2025 17:38:35 +0800
From: Xiandong Wang <xiandong.wang@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Yongqiang Niu
	<yongqiang.niu@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	Xiandong Wang <xiandong.wang@mediatek.com>
Subject: [PATCH v4 3/4] mailbox: mtk-cmdq: Add CMDQ driver support for mt8189
Date: Wed, 20 Aug 2025 17:38:22 +0800
Message-ID: <20250820093831.23437-4-xiandong.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250820093831.23437-1-xiandong.wang@mediatek.com>
References: <20250820093831.23437-1-xiandong.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_103904_021254_DA248703 
X-CRM114-Status: GOOD (  11.89  )
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

Add CMDQ driver support for mt8189 by adding its compatible and
driver data in CMDQ driver.

These changes ensure correct GCE operation for MT8189.

Signed-off-by: Xiandong Wang <xiandong.wang@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index a0f1616d9e42..54d008ebdf33 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -838,6 +838,15 @@ static const struct gce_plat gce_plat_mt8188 = {
 	.gce_num = 2
 };
 
+static const struct gce_plat gce_plat_mt8189 = {
+	.thread_nr = 32,
+	.shift = 3,
+	.mminfra_offset = 0x40000000, /* 1GB */
+	.control_by_sw = false,
+	.sw_ddr_en = true,
+	.gce_num = 2
+};
+
 static const struct gce_plat gce_plat_mt8192 = {
 	.thread_nr = 24,
 	.shift = 3,
@@ -858,6 +867,7 @@ static const struct of_device_id cmdq_of_ids[] = {
 	{.compatible = "mediatek,mt8183-gce", .data = (void *)&gce_plat_mt8183},
 	{.compatible = "mediatek,mt8186-gce", .data = (void *)&gce_plat_mt8186},
 	{.compatible = "mediatek,mt8188-gce", .data = (void *)&gce_plat_mt8188},
+	{.compatible = "mediatek,mt8189-gce", .data = (void *)&gce_plat_mt8189},
 	{.compatible = "mediatek,mt8192-gce", .data = (void *)&gce_plat_mt8192},
 	{.compatible = "mediatek,mt8195-gce", .data = (void *)&gce_plat_mt8195},
 	{}
-- 
2.46.0


