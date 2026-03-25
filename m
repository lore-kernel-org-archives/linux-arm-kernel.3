Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD09FFEA806
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 03:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D+YQ3c1JxIPYJ6rQ2JZt6TXgpTOOwn4ufLcw8yJ1Rec=; b=oBC/zFCLfyRsnV3U4BDSwh4nb5
	d+bEgYP8l0sHUSAU4v4ZyFHnfz665XDQxU9S51p3+6TV8CuIGeWNrZTm48vLAxH+09p7/CJUJgXbs
	i/UMILBGi59CsgM9CMD/NP6R2SzT7HeFJ18s++kz9q0qhARGYauNETAtvIC+/HCDOlp0G7UJdbj63
	+6XGz/G2lP5X4r1xQoyhvApzzo+Ebkh9Z2H0lRRXYW6AfbbXeAj5DfuvgbNv05bKhV+UoOjDp3Si3
	OmPqTCFty83hEPpspLe70Kb4u9o2paPA+h7d4v7FyIGH1IrGgy8onDcrbbvauL5StRjlFWrYnxmKX
	d4HncOjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5FOo-00000002d5a-224x;
	Wed, 25 Mar 2026 03:59:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5FOf-00000002czc-1s84;
	Wed, 25 Mar 2026 03:59:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=D+YQ3c1JxIPYJ6rQ2JZt6TXgpTOOwn4ufLcw8yJ1Rec=; b=phTM+lqxp+B9cqXqJfHZc5bz4w
	A6uWhlsW5wWSHTi5it2FxtiwwNPlIvO39pyIslvLOPZauDyeg7eWtPChLAlp6QwkEDdRWOB+0pmKJ
	Omn1M3uqyUjr2XgYdcA0cJXscjpGNKhtL+bANg2SO+5pF4ciy6MA/s2sQx4SKSH3r3h8LFntgBZYw
	rqpJpYqHPKAkqVuDDpA6/XMBjHB1ZYWlzAu3KmKUpYKad+GneNYCNIMic6jOZ5/UNDmSeP0Y60S1M
	GDWvgBleWdR6xI1h4MagtaHPSXStNPEsNdI64nSSmh58fVpywRSnYoVqodkZYvxHdx9Ls1jEXoVKC
	EGaehukA==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5FOa-00000005NQA-2Y3D;
	Wed, 25 Mar 2026 03:59:08 +0000
X-UUID: ec91ff7227fe11f19e7563141e833ce8-20260324
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=D+YQ3c1JxIPYJ6rQ2JZt6TXgpTOOwn4ufLcw8yJ1Rec=;
	b=I63Zx87aDFNeZwSnUgv0knTcb6E4dj23SDMjK2hxEw8JUTJ+XUHS2ehqeWLZjhLnSNrwIp/GtQf1fYKHn0LBIdlcaegyBhkuqEFHLxRiDWJ6WrDGPKaQ1EPZW1dXDSCoxT2AZJGIUzq1E+RGigLuQOVJjB6Psbzj7vDOsiUKczE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:adc3afab-c52e-4ea3-a6a9-d33fa2002e12,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:f6a42d94-f8ef-4ca8-bea0-143568f9ca1d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ec91ff7227fe11f19e7563141e833ce8-20260324
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1575686142; Tue, 24 Mar 2026 20:58:46 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 25 Mar 2026 11:58:44 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 25 Mar 2026 11:58:44 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Nicolas Dufresne
	<nicolas@ndufresne.ca>, Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Jason-JH Lin
	<jason-jh.lin@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Paul-PL Chen <paul-pl.chen@mediatek.com>, Moudy
 Ho <moudy.ho@mediatek.com>, Xiandong Wang <xiandong.wang@mediatek.com>,
	Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>,
	Chen-yu Tsai <wenst@chromium.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-media@vger.kernel.org>
Subject: [PATCH v2 4/5] media: platform: mtk-mdp3: Refactor CMDQ writes for CMDQ API change
Date: Wed, 25 Mar 2026 11:57:41 +0800
Message-ID: <20260325035836.2110757-5-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260325035836.2110757-1-jason-jh.lin@mediatek.com>
References: <20260325035836.2110757-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_035906_402005_2220D3FB 
X-CRM114-Status: GOOD (  12.56  )
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

Update CMDQ register writes to use subsys-aware APIs,
cmdq_pkt_write_subsys() and cmdq_pkt_write_mask_subsys().
This conforms to recent CMDQ API changes that split access by
subsys ID support.

Since all current MDP SoCs support subsys ID, and future MDP
deployments will not run on SoCs without subsys ID, only
subsys-specific API calls are needed. No logic for non-subsys ID
hardware is required.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c | 4 ++--
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
index d30a05782ab9..8dff981f6720 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
@@ -321,7 +321,7 @@ static int mdp_path_config_subfrm(struct mdp_cmdq_cmd *cmd,
 	/* Enable mux settings */
 	for (index = 0; index < ctrl->num_sets; index++) {
 		set = &ctrl->sets[index];
-		cmdq_pkt_write(&cmd->pkt, set->subsys_id, set->reg, set->value);
+		cmdq_pkt_write_subsys(&cmd->pkt, set->subsys_id, set->reg, set->reg, set->value);
 	}
 	/* Config sub-frame information */
 	for (index = (num_comp - 1); index >= 0; index--) {
@@ -376,7 +376,7 @@ static int mdp_path_config_subfrm(struct mdp_cmdq_cmd *cmd,
 	/* Disable mux settings */
 	for (index = 0; index < ctrl->num_sets; index++) {
 		set = &ctrl->sets[index];
-		cmdq_pkt_write(&cmd->pkt, set->subsys_id, set->reg, 0);
+		cmdq_pkt_write_subsys(&cmd->pkt, set->subsys_id, set->reg, set->reg, 0);
 	}
 
 	return 0;
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
index 681906c16419..c6fc180950f2 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
@@ -12,14 +12,14 @@
 #define MM_REG_WRITE_MASK(cmd, id, base, ofst, val, mask)	\
 do {								\
 	typeof(mask) (m) = (mask);				\
-	cmdq_pkt_write_mask(&((cmd)->pkt), id, (base) + (ofst),	\
-			    (val),				\
+	cmdq_pkt_write_mask_subsys(&((cmd)->pkt), (id), (base),	\
+				   (base) + (ofst), (val),	\
 		(((m) & (ofst##_MASK)) == (ofst##_MASK)) ?	\
 			(0xffffffff) : (m));			\
 } while (0)
 
 #define MM_REG_WRITE(cmd, id, base, ofst, val)			\
-	cmdq_pkt_write(&((cmd)->pkt), id, (base) + (ofst), (val))
+	cmdq_pkt_write_subsys(&((cmd)->pkt), (id), (base), (base) + (ofst), (val))
 
 #define MM_REG_WAIT(cmd, evt)					\
 do {								\
-- 
2.43.0


