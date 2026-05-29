Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93AA9CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 10:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1RW2Z3LsSNM3icSTnqEc0UY3nAMI9vqAGPsBLrTw/qc=; b=PfuSBpPbv/+g3uIeDNo+eApGZx
	1Cw17oI/il9YClkQoLpxWwUL5SB7XtoyTSbMpF3qJ2fQJs1EO/5e5qSI8XiRmPiNDpuOLzZ3Qp+bC
	NQdbbfScDMdcjSBbvTUCTeRevg1dy8vxHqW/W4+HJwUtEMkdKZYJCkQ9sCj5voS4AM+7zB93Wu0bd
	ixkH64G10qoGLrAreKXb5Us2FlfI57rGtNu+7Dw1fghoxrTFDpBXqnHKBNBUHLR8g21em1uoyFlAL
	w1nwyMNfIDlZExwEnzLOVOQe5vpej45nEDUxr7qOM0ET0Lnh2Z0JwFq5naaloMs5OOIu0MKZt0XNU
	GA0uFCXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSuGM-000000079jm-0Pgv;
	Fri, 29 May 2026 10:16:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSuGK-000000079ie-1HXM;
	Fri, 29 May 2026 10:16:21 +0000
X-UUID: 6e590caa5b4711f1afed4741b24580c9-20260529
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=1RW2Z3LsSNM3icSTnqEc0UY3nAMI9vqAGPsBLrTw/qc=;
	b=ep+ZxStdzOW6SjX35uLIoTMl8j0NK/46vkuG5DR98Hu9JelNWOf/vpkAbJE3YichZz/s4gnjkNYCOYQgbW+ZiDBZLr6le1MUIx2oglWCt/BT/cjqQN74nQGdyc9/14/FU0WwN0B+789RY/AgfA1pqJbdoM6w4YwXRG4Ro/hshFw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:f6276282-63cd-47c4-b078-abf2768b750b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:08aad0f6-ddd5-40e6-821c-e08002aeddf5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6e590caa5b4711f1afed4741b24580c9-20260529
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1303822715; Fri, 29 May 2026 03:16:17 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 29 May 2026 18:16:15 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 29 May 2026 18:16:15 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH 0/2] soc: mediatek: Make mtk-infracfg modular
Date: Fri, 29 May 2026 18:16:01 +0800
Message-ID: <20260529101613.55697-1-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_031620_368641_B661DFC2 
X-CRM114-Status: UNSURE (   8.07  )
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

This series converts mtk-infracfg to be buildable as a loadable module,
allowing for more flexible kernel configurations and reduced memory
footprint on systems that don't require this functionality built-in.

Justin Yeh (2):
  soc: mediatek: Allow MTK_INFRACFG to be built as module
  soc: mediatek: mtk-infracfg: Export symbols for module support

 drivers/soc/mediatek/Kconfig          | 2 +-
 drivers/soc/mediatek/mtk-infracfg.c   | 9 +++++++--
 include/linux/soc/mediatek/infracfg.h | 1 +
 3 files changed, 9 insertions(+), 3 deletions(-)

-- 
2.45.2


