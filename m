Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28303CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 11:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=336PQw3uXU0Znvz55zA6oLPN4hF7V2cSCNRDMtsX4HE=; b=sMEwgtAOK+CjDNzqiRu2EsHgYr
	5FKoHtvtWCRju5iBtuYDU686xuJDyfmXN+fEvANARexBITa+0L66v5JBb+WBXuSvmjnI6isv9L5CU
	F0Ru/EEnqymQtZjUaVo08/NzipWcIQfA1vS/XHQZBocatjtA5XbY1DmXany2vezKt7e9Nm11dacT0
	KIccC+QkzMh1tnajElThyD9iASyPsjXWDVmqXrgZ8jYLtWD3R8xdAKMKJqVlEqD7Bya2o/BhHhzua
	ZLg3yvsxbx2sr8gSO73HCooukTYCjsp82cP4beTxvg8L8HPeLDXrpBzsYphoEAPlbq8jg1vRIogq2
	0XR7ER5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urxNx-00000005V18-2FVX;
	Fri, 29 Aug 2025 11:35:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urvEm-000000056rK-0tIk;
	Fri, 29 Aug 2025 09:17:37 +0000
X-UUID: fd91819284b811f09eb0dd999d3936bf-20250829
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=336PQw3uXU0Znvz55zA6oLPN4hF7V2cSCNRDMtsX4HE=;
	b=sYlbdGooXVEnJzNKjh5LXZjQUkeWJNSTFxfHzje2cwgR8vwblCj8hlKReDqtM0CCIttIeqSNbzUsg7B9aUfaX7zyT7fluccozABLU8wCekZ/t9dKk9IeU+AD0AX1dgtcQdxdemzneyFxjeWchc++md6pLADtWT5aaAZoV0qwuZo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:7566eb8c-918b-4c5d-bb00-8be57f06c7e2,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:9d37fe6b-8443-424b-b119-dc42e68239b0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:-3,IP:
	nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fd91819284b811f09eb0dd999d3936bf-20250829
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 429509075; Fri, 29 Aug 2025 02:17:31 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 29 Aug 2025 17:17:27 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 29 Aug 2025 17:17:27 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jassi Brar
	<jassisinghbrar@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Jason-JH Lin <jason-jh.lin@mediatek.com>,
	Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
	Paul-PL Chen <paul-pl.chen@mediatek.com>, Yongqiang Niu
	<yongqiang.niu@mediatek.com>, Zhenxing Qin <zhenxing.qin@mediatek.com>,
	Xiandong Wang <xiandong.wang@mediatek.com>, Sirius Wang
	<sirius.wang@mediatek.com>, Xavier Chang <xavier.chang@mediatek.com>, Jarried
 Lin <jarried.lin@mediatek.com>, Fei Shao <fshao@chromium.org>, Chen-yu Tsai
	<wenst@chromium.org>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-media@vger.kernel.org>
Subject: [PATCH v2 0/3] Fix sleeping function called from invalid context
Date: Fri, 29 Aug 2025 17:15:57 +0800
Message-ID: <20250829091727.3745415-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_021736_258382_ED9B3785 
X-CRM114-Status: GOOD (  10.72  )
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

We found that there is a spin_lock_irqsave protection in msg_submit()
of mailbox.c and it is in the atomic context.
So when the mailbox controller driver calls pm_runtime_get_sync() in
mbox_chan_ops->send_data(), it will get this BUG report.
"BUG: sleeping function called from invalid context at drivers/base/power/runtime.c:1164"

Additionally, pm_runtime_put_autosuspend() should be invoked from the
GCE IRQ handler to ensure the hardware has actually completed its work.

To resolve these issues, remove the pm_runtime calls from
cmdq_mbox_send_data() and delegate power management responsibilities
to the client driver.
---
Changes in v2:
- Move pm_runtmie APIs from cmdq driver to client drivers.
- Move pm_runtime_put_autosuspend to GCE irq callback function.
- Link to v1: https://lore.kernel.org/r/20240614040133.24967-1-jason-jh.lin@mediatek.com
---
Jason-JH Lin (3):
  mailbox: mtk-cmdq: Remove pm_runtime APIs from cmdq_mbox_send_data()
  drm/mediatek: Add pm_runtime support for GCE power control
  media: platform: mtk-mdp3: Add pm_runtime support for GCE power
    control

 drivers/gpu/drm/mediatek/mtk_crtc.c                  |  7 +++++++
 drivers/mailbox/mtk-cmdq-mailbox.c                   | 12 +-----------
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c | 11 +++++++++++
 3 files changed, 19 insertions(+), 11 deletions(-)

-- 
2.43.0


