Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6121CCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 09:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5V/Vz/H8HM7LchfMCgMJIzRqE49QYJch3AIZX3W5lns=; b=NxSt8sO2+YBIjuBipD023xSpiX
	bET8F2OkgjrU+qwwYFDOc+8WEx2RLzdLl7P9EVgEXvKReN57n/0GK14LDpsqds7NUiSo224nunWhH
	ATAXP5wJVzOYSKX7i0PMNF6xUaqfa3qauYi6XBwYX7l7dZW8lVqybpyzKGD5TxifAoU8OaPMF39iy
	AaSxKS0yTgPzFG1Z0EE7Or1quLY/k3muDqk2hweSztW8xqzcx04k8TLnIU1pZDi0JBvRuB+d+K/RG
	5+2Bm1SUKAqNs/iyLngzuScXNMHDb59cJdISV00sPc1JFr7NN26hnkdmvM1tQzpLfzJYKecC4WgA6
	2StrpKbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCu0-0000000BUIx-2a4G;
	Tue, 04 Nov 2025 09:00:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCtw-0000000BUHP-3Y4D;
	Tue, 04 Nov 2025 09:00:29 +0000
X-UUID: a6bfbb1cb95c11f0a52f393f94899d25-20251104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=5V/Vz/H8HM7LchfMCgMJIzRqE49QYJch3AIZX3W5lns=;
	b=YOUU5Xq0LuMjGkUosfD+LrR/zgy9bAUAy8mkE6TOqZsjVk1ieVKYuCo1c6YYq0ir8+TbfDqZMHaTLCLiohJJIqYa+o1xwBsgi0p/HM4wYfG4UZBXuU3ciaO+mXqyMtY0cBbNN28QXagzJSJvU7B7ZVJxUb39OHvKFTlT9H07ytI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:a2fcd327-06df-492b-bb64-c3ad7c5d8e54,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:14121de0-3890-4bb9-a90e-2a6a4ecf6c66,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a6bfbb1cb95c11f0a52f393f94899d25-20251104
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <liankun.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1385362656; Tue, 04 Nov 2025 02:00:03 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 4 Nov 2025 17:00:00 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Tue, 4 Nov 2025 16:59:59 +0800
From: Liankun Yang <liankun.yang@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <mac.shen@mediatek.com>,
	<peng.liu@mediatek.com>, <liankun.yang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 0/2] Adjust bandwidth limit for DP
Date: Tue, 4 Nov 2025 16:55:10 +0800
Message-ID: <20251104085957.1175-1-liankun.yang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_010028_884858_05746331 
X-CRM114-Status: UNSURE (   7.90  )
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

DP link training checks the current PHY link signal quality.
After DP detects an HPD connection, it should first determine
the current link signal quality in order to select the resolution.

Since the EDP is already fixed to use the EDP panel,
the current training information and resolution are basically fixed.
EDP exists and its process differs from DP. Therefore,
it is necessary to isolate the parsing capability,
panel power, training state and enable state.

For example, the platform support DP 4lane 5.4G,
but panel A support DP 2lane 5.4G.

This is a time sequence:

1. Plug in panel A. According to the platform, it can output 4K 60Hz.
2. Timing mode set 4K 60Hz.
3. Atomic enable(Based on panel A ability, training pass 2lane 5.4G).
4. Finally, due to 2lane 5.4G bandwidth limitation, the platform cannot
output 4K 60Hz, resulting in a black sreen.

If apply this patch.

1. Plug in panel A.
2. Training pass 2lane 5.4G
3. Timing mode set 2K 60Hz(Based on the 2lane 5.4G bandwidth limit).
4. Atomic enable for output screen.

Liankun Yang (2):
  drm/mediatek: Adjust bandwidth limit for DP
  drm/mediatek: Add isolation to edp

 drivers/gpu/drm/mediatek/mtk_dp.c | 57 ++++++++++++++++++++-----------
 1 file changed, 38 insertions(+), 19 deletions(-)

-- 
2.45.2


