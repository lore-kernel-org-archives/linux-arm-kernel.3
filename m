Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BCB4FCC9A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 00:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4cZtpNr2xeZJdyeS+qSCfwN53SQaiuSNWhMXvj97KgU=; b=Z/6sx7xcv7+Gu7r8axdWT87AhN
	/iuw9MAXDam2kQ6Ri+cvSpGqiRK/OcADtBg6z+/l/lxDILyg+4eDQdtQhndCZLi7nB8tPrsDlQMYg
	3hV0BjbUyYAjQzP70+/lHgOjXXnKz2yMbAoqs3/cuIsls+3i4eEqMd+3Ju6Qt4pbagsIP7t12zV6e
	vu4D8gDU2CzNKNnB3dcZUyLgFXVESd6zoMaZO1uJ0/Cg6hOf20+1YuTNPAJiEgipK/72gUxmsp8XV
	L7YOvHgLMvt0f1KQ/iS0nuTFRhVD5JzH78ON0gBCFQsUEYW0ILNEU4Hn8Kyn8EaT8ENDMuo9lnNAJ
	iTsAnS6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzlM7-00000008Qjk-2J6j;
	Tue, 10 Mar 2026 00:53:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzlM4-00000008Qj4-1z1B;
	Tue, 10 Mar 2026 00:53:49 +0000
X-UUID: 95dfc90a1c1b11f19e7563141e833ce8-20260309
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=4cZtpNr2xeZJdyeS+qSCfwN53SQaiuSNWhMXvj97KgU=;
	b=LxNgOmsuCA+OBysOpOjLeRdPngXjdk2dJ2PcG5qayP314VIaP4rMNfhiwB/VkwdeOVJL3p2JJVOE+otzoJWy3f1qXsrOIohjXyGZRYcrZSwYR2mODKl5n61MPfh427ItEJK1TPbPidcGYAhvJKZkLb3Y0gXX3FAefxlba5h5CiE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:a80b33cd-8372-4787-b322-bf978686fb15,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:a7030d5c-a957-4259-bcca-d3af718d7034,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|123|836|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 95dfc90a1c1b11f19e7563141e833ce8-20260309
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <ed.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1392198413; Mon, 09 Mar 2026 17:53:42 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Mar 2026 08:53:40 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Mar 2026 08:53:40 +0800
From: <ed.tsai@mediatek.com>
To: <bvanassche@acm.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>,
	<peter.wang@mediatek.com>, <alice.chao@mediatek.com>,
	<naomi.chu@mediatek.com>, <chun-hung.wu@mediatek.com>, Ed Tsai
	<ed.tsai@mediatek.com>
Subject: [PATCH v2 0/2] ufs: add delay for VCC ramp-up stability
Date: Tue, 10 Mar 2026 08:52:26 +0800
Message-ID: <20260310005230.4001904-2-ed.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_175348_521508_30345216 
X-CRM114-Status: UNSURE (   9.65  )
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

From: Ed Tsai <ed.tsai@mediatek.com>

Hi,

This patch series resolves a link stability issue found on our certain
platforms where the VCC regulator has a slow ramp-up time.

To fix this, a delay is needed after VCC is turned on. The solution is
implemented in two parts:

1. Introduce the new host quirks, UFSHCD_QUIRK_VCC_ON_DELAY.
2. Apply in our new platform with UFS5 device to ensure the VCC is
   ready before we enable the clocks.

Changes in v2:
- Fix typos and wording issues.

Ed Tsai (2):
  ufs: core: Add quirks for VCC ramp-up delay
  ufs: host: mediatek: Add VCC on delay for stability

 drivers/ufs/core/ufshcd.c       | 12 ++++++++++++
 drivers/ufs/host/ufs-mediatek.c | 11 +++++++++++
 drivers/ufs/host/ufs-mediatek.h |  4 ++++
 include/ufs/ufshcd.h            |  6 ++++++
 4 files changed, 33 insertions(+)

-- 
2.45.2


