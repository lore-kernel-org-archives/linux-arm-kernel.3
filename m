Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 555E1C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 08:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SA99F68Gvyu1KWTj0/viDoHSk80kTdTfBAzHsy9w0dE=; b=A/btG4Ro9FOoCsIeBHN4U8aBsV
	iwusH9bT+G6QOCAmuo2PGqEGJ1Vq9HyoHLER+OUwdW6KgI+eAKttiUzm5sd8x0iEIhH9kULe8P1WR
	zJ1hpKc2YLJcznrmFVpwGZyaVZVsQ+6HMJAk3AVPBGTvzIEwt1oR4A0F0wxMlzqZ643vqS8HV6KIA
	OrXSiJg8OIPmSYtDVhqPVPquzt8M4E8Cm6LKjr6C7ZuNWGojsLcJL8iiXaEFi8EPEJIth5Z5N8VKK
	B+sjGkixAKAVbT/1Vqb5F1yagwbs1wPi5lgLd2pBnHXAZpXGVv+4VVu04rSqYkbiPtJro5ze6x/C+
	lPrsS5zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXEvP-0000000AbvW-2LVo;
	Thu, 03 Jul 2025 08:04:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXEoH-0000000AaIi-3t1i;
	Thu, 03 Jul 2025 07:56:47 +0000
X-UUID: 3fd9942057e311f09eb0dd999d3936bf-20250703
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=SA99F68Gvyu1KWTj0/viDoHSk80kTdTfBAzHsy9w0dE=;
	b=heLqocMHVOoeHbIqCim1byVclO7d+pVUlU9eHWSacpons7a7mwIa/A8w9GBLkqfKhS4rV590/3knL15QOz5JlPY9SAd52MBi/unnL3UL/kdUTNE9a38xqHY1MVtAJD+y+P68eyTwyYEQJ7WMe48YWN3hLh72kafNpIMwARHxjWA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:7b80be12-68c6-4541-b464-79d4ff705b49,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:681cd673-15a7-4ae6-ad4b-94c27b45c266,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3fd9942057e311f09eb0dd999d3936bf-20250703
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <hailong.fan@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1304544520; Thu, 03 Jul 2025 00:56:38 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 3 Jul 2025 15:56:33 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 3 Jul 2025 15:56:32 +0800
From: hailong.fan <hailong.fan@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, "Bard
 Liao" <yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, Mark Brown <broonie@kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<sound-open-firmware@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Hailong Fan
	<hailong.fan@mediatek.com>
Subject: [PATCH v2 0/2] ASoC: mediatek: Add support of SOF on Mediatek mt8196 SoC.
Date: Thu, 3 Jul 2025 15:56:22 +0800
Message-ID: <20250703075632.20758-1-hailong.fan@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_005645_974261_14042A88 
X-CRM114-Status: GOOD (  11.34  )
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

From: Hailong Fan <hailong.fan@mediatek.com>

Sorry for late reply.

Add support of MediaTek mt8196 SoC DSP to SOF.
This series is based on linux-next, tag: next-20250702.

---
Changes in v2:
- Rebase onto https://lore.kernel.org/all/20250320115300.137410-1-angelogioacchino.delregno@collabora.com/
- Link to v1: https://lore.kernel.org/lkml/20250320031753.13669-1-hailong.fan@mediatek.com/

This series patches dependent on:
[1]
https://lore.kernel.org/all/20250307032942.10447-1-guangjie.song@mediatek.com/
[2]
https://lore.kernel.org/all/20250307034454.12243-1-guangjie.song@mediatek.com/

Hailong Fan (2):
  dt-bindings: dsp: mediatek: add mt8196 dsp document
  ASoC: SOF: MediaTek: Add mt8196 hardware support

 .../bindings/sound/mediatek,mt8196-dsp.yaml   |  95 +++
 sound/soc/sof/mediatek/Kconfig                |   9 +
 sound/soc/sof/mediatek/Makefile               |   1 +
 sound/soc/sof/mediatek/mt8196/Makefile        |   3 +
 sound/soc/sof/mediatek/mt8196/mt8196-clk.c    |  98 +++
 sound/soc/sof/mediatek/mt8196/mt8196-clk.h    |  23 +
 sound/soc/sof/mediatek/mt8196/mt8196-loader.c |  60 ++
 sound/soc/sof/mediatek/mt8196/mt8196.c        | 556 ++++++++++++++++++
 sound/soc/sof/mediatek/mt8196/mt8196.h        | 124 ++++
 9 files changed, 969 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8196-dsp.yaml
 create mode 100644 sound/soc/sof/mediatek/mt8196/Makefile
 create mode 100644 sound/soc/sof/mediatek/mt8196/mt8196-clk.c
 create mode 100644 sound/soc/sof/mediatek/mt8196/mt8196-clk.h
 create mode 100644 sound/soc/sof/mediatek/mt8196/mt8196-loader.c
 create mode 100644 sound/soc/sof/mediatek/mt8196/mt8196.c
 create mode 100644 sound/soc/sof/mediatek/mt8196/mt8196.h

-- 
2.45.2


