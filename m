Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB9DEC0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 04:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vFqxwTsvmIoW4A0S0/Di3p/KIuTvNq8siIshHmcmHIU=; b=iNDOJD6KLvuit3jkP2WKgCxNU5
	EvpVRupapw27Gu5FG+Hdz+Eo6t8w48ZIuIU72S9olR5eTg2gI6YtpqSXBCrKdcZy13ZL59cpXmzKp
	/K/L+6OZ8ge6oR2BKsDBFsoBV4oMvmvcFKi9ODaX0wnFcQY/vTT9M0C9BRXUYM9gE2lfpOhhTTGeX
	BzRbkh1CVcep6xDkmjczsZPi/JE/3hGpfQf9ECJE4rr2v0TCpKVUgDcEtkk6vEA/xTAXpeHlX56jz
	L7QyUT5eF7ETuQE7b9rnRNEWsKoqHtvuFe9CMG1IrcZqQugGIpW1w819LHPVM5rtWNIPj+e07lKv5
	zIUe3K2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thhbp-00000002THw-08eb;
	Tue, 11 Feb 2025 04:10:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thgPJ-00000002Kd6-44uw;
	Tue, 11 Feb 2025 02:53:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vFqxwTsvmIoW4A0S0/Di3p/KIuTvNq8siIshHmcmHIU=; b=NfvtQaahJXTG6Z1hNJdHsi3v+5
	yRX/LebhiLza7O5Bt5b3SNDtQp6XAGUi4cTuH3dfCxMVlRzZEudXJVXzLVHi/6Er/BngfnmTC0zpp
	KkcZBSr0OkBjY9aa/STBfa13L0vYkVtsV5rFl9UVZos82E1XmFFLdj/E4TIJfa+Mb55WnbdLhBws+
	U82asYgkyJ7FmcpjCQY3WMdn4wiBhYjUrazJtvJZzc2CevyaPaWovPnF+okUqEh0RnMJ0+biWqPpC
	Kp4P6kE5v0VnhSnwH/2zjYtUKrI5r2GP9Zn1EwdxKvAQ622RRZMwG04tY6U8TdJ+T7WqO8i7wttSn
	nsE6SVPg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thgPF-00000000SPT-3GzB;
	Tue, 11 Feb 2025 02:53:52 +0000
X-UUID: 6513338ee82311ef82ff63e91e7eb18c-20250210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=vFqxwTsvmIoW4A0S0/Di3p/KIuTvNq8siIshHmcmHIU=;
	b=Hy8Pf3W4vd48N0Vj8L7VYXCJWuNFeQpoiO65XrlIGaEjb6a6DdVhnccstRLjUe/CYfGcaSW3g9X5+g/6rZiimnEJs57oZNY7qYTdFqnLx01dnXa/VB6/8O2wr+alfoq1UkF7xY+ddXMEoSoObpulTcKOZil3kJCAmv4FCoZxXwQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:3dc76082-566b-4823-af34-5488e4361496,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:cbca627f-427a-4311-9df4-bfaeeacd8532,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 6513338ee82311ef82ff63e91e7eb18c-20250210
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <sunny.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 570861647; Mon, 10 Feb 2025 19:53:38 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 11 Feb 2025 10:53:36 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 11 Feb 2025 10:53:36 +0800
From: Sunny Shen <sunny.shen@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Fei Shao <fshao@chromium.org>, Pin-yen Lin
	<treapking@chromium.org>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Nancy
 Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, "Paul
 Chen --cc=devicetree @ vger . kernel . org" <paul-pl.chen@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Sunny Shen
	<sunny.shen@mediatek.com>
Subject: [PATCH 5/5] drm/mediatek: Change main display path to support PQ for MT8196
Date: Tue, 11 Feb 2025 10:52:54 +0800
Message-ID: <20250211025317.399534-6-sunny.shen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250211025317.399534-1-sunny.shen@mediatek.com>
References: <20250211025317.399534-1-sunny.shen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_025350_542415_5137595A 
X-CRM114-Status: UNSURE (   8.41  )
X-CRM114-Notice: Please train this message.
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

Due to the path mux design of the MT8196, the following components
need to be added to support Picture Quality (PQ) in the main display
path: CCORR0, CCORR1, DITHER0, GAMMA0, MDP_RSZ0, POSTMASK0, TDSHP0.

Signed-off-by: Sunny Shen <sunny.shen@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index b810a197f58b..1c97dc46ae70 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -242,6 +242,13 @@ static const unsigned int mt8196_mtk_ddp_ovl0_main[] = {
 
 static const unsigned int mt8196_mtk_ddp_disp0_main[] = {
 	DDP_COMPONENT_DLI_ASYNC0,
+	DDP_COMPONENT_MDP_RSZ0,
+	DDP_COMPONENT_TDSHP0,
+	DDP_COMPONENT_CCORR0,
+	DDP_COMPONENT_CCORR1,
+	DDP_COMPONENT_GAMMA0,
+	DDP_COMPONENT_POSTMASK0,
+	DDP_COMPONENT_DITHER0,
 	DDP_COMPONENT_DLO_ASYNC1,
 };
 
-- 
2.34.1


