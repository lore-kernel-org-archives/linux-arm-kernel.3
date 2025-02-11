Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B9FC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 03:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=keKohg8hOTFLfdJBLpLuY7turgd/R5WQW4fSD4VLxnc=; b=UR7nwg+Zv3JZUnSMsNFfpjAurG
	3oy5SRmDoCFrVpc9UVT83lmqYxWyrZSipirznt9F+ag/NdwwG+lbIcnD/Do34b/J9x/0/tXafYFL5
	E2r5t9hzvkw75JsnypRi7xrMsDzQM3qz5GYW4GwpddKvRcvn3bbWuSJOMQH8JdqljNsr7k9pb6syc
	u+wwlYBEQLFeCYDUPPYQTKsmzyDx9YkVzCHKY0bB5QLbkoTx0iKQ1RGGK9/aPSvJc+HZIo1bcHgru
	E+FEgHiC4Fjslkstx5ElVNpPnEKI+IhTSJgNijITeuZFFZttjKSyr5fcH0uXOKFBGf3Sbt5SD58lq
	h1yQgncA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thgXf-00000002MXR-1FaO;
	Tue, 11 Feb 2025 03:02:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thgPJ-00000002Kd7-4C5m
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 11 Feb 2025 02:53:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=keKohg8hOTFLfdJBLpLuY7turgd/R5WQW4fSD4VLxnc=; b=LVc/SPdR8Ds7SnOA7/xB0H+EkN
	379tRtJbAuzPn1l6I/yzyk3bvOTIfvsOqdY7yFkRWPVOV5qIPGBhbRkpVIehPCfjOdkuMmUvujU23
	8dXfFMD7qEVf10O0h4wyY0C+6zHGCPTT5ewKpE8epDNl1Siz6yCXpeBpCqnNxA3TS/CFRddRaaOZf
	Chhp3bIY52ZJWkkBrww8WBEhXqljg1mEHp5gjkO3CVcgVxVXjkolWxVxgydMrm8/4nCJV9O3BYqS3
	K14OkdfVJE1lukKPpsoX3b7xQ6vfyq7MrPWyeuB5I0vnxc8IyX/mWy9ElR0yY+8kbOGKNFp07NJ0K
	s/Rb9iAA==;
Received: from [216.200.240.185] (helo=mailgw02.mediatek.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thgPD-00000000SOy-0o2l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 02:53:52 +0000
X-UUID: 5cd7fb46e82311ef9048ed6ed365623b-20250210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=keKohg8hOTFLfdJBLpLuY7turgd/R5WQW4fSD4VLxnc=;
	b=ckVtcGyyfuGvs8EvIuNFqLOdKfoH4F9ewySkQK9dei/0FiDISPWoK5fbfRGU3uR+o1NktwiIN/fb6t3FkES6ROpYpx3UmH0nfctnSX5y/u4zdAJ0U/wTZjGKHs9CHVr1fGun3BLMNrI3cZBdUBbiFNeYWg1BpsCx1hJFLRkNTnE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:c965511d-2cc3-45e4-95c4-8cec9f3c3c42,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:1fd76b92-d651-4ec6-81e1-a3deb10c9ff8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 5cd7fb46e82311ef9048ed6ed365623b-20250210
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <sunny.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1623320859; Mon, 10 Feb 2025 19:53:25 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 11 Feb 2025 10:53:22 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 11 Feb 2025 10:53:22 +0800
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
Subject: [PATCH 0/5] Add components to support PQ in display path for MT8196
Date: Tue, 11 Feb 2025 10:52:49 +0800
Message-ID: <20250211025317.399534-1-sunny.shen@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_025348_493347_83F59398 
X-CRM114-Status: GOOD (  10.47  )
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

Due to the path mux design of the MT8196, the following components need to be configured to support Picture Quality (PQ) in the display path:CCORR0, CCORR1, DITHER0, GAMMA0, MDP_RSZ0, POSTMASK0, TDSHP0.

This patch series is based on [1]
[1] Add Mediatek Soc DRM Soc support for mt8196
    - https://patchwork.kernel.org/project/linux-mediatek/list/?series=924191

Sunny Shen (5):
  dt-bindings: display: mediatek: mdp-rsz: Add rules for MT8196
  dt-bindings: display: mediatek: postmask: Modify rules for MT8196
  soc: mediatek: Add components to support PQ in display path for MT8196
  drm/mediatek: Add MDP-RSZ component support for MT8196
  drm/mediatek: Change main display path to support PQ for MT8196

 .../display/mediatek/mediatek,mdp-rsz.yaml    | 46 ++++++++++++
 .../display/mediatek/mediatek,postmask.yaml   |  1 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c       | 24 +++++++
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h       |  1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  9 +++
 drivers/soc/mediatek/mt8196-mmsys.h           | 70 ++++++++++++++++++-
 drivers/soc/mediatek/mtk-mutex.c              | 17 +++++
 include/linux/soc/mediatek/mtk-mmsys.h        |  5 ++
 8 files changed, 171 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rsz.yaml

-- 
2.34.1


