Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E79CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gdrKdZ51IexfRxyYh9eQjGmdG6o5t0ED4W3C8AISUc8=; b=0qPdiuFgaUuJw5roX7ZrhFHtHM
	gkIZ/ShI9h6/zl+PeATPx3FfTnA0RMx1F0cOAJ4BigVb+lD7xdcDB4yxvoT7Z+g5sGaTqCewHZxyw
	/AVDGNaiNrCymFOKQTXaDe2YCr7TC1wzLJi2CIa92Pc7SRdZa1e/xGufj1/nlRQ44NcMD9xd2U3mx
	kh/6DSwpeCesR9vpvqiApvgdVcx3Zb1gVdOahxXLP9qFuN0BK/KojQwzZQ7qAnrpT7sgywCzbk9Eq
	FfR2Bdbpgc1i9T+LfDVGqL2szxXL1eCU8hJ/bH9/w3Qb+12kBnLgtad+afjY9c6S3ahu9VeDzDKQs
	p81W4YPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphl8-00000003xig-1vOD;
	Sat, 23 Aug 2025 06:29:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRGr-00000002YCI-2e8l;
	Fri, 22 Aug 2025 12:53:30 +0000
X-UUID: fb70662e7f5611f09eb0dd999d3936bf-20250822
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=gdrKdZ51IexfRxyYh9eQjGmdG6o5t0ED4W3C8AISUc8=;
	b=keyaL7QOfXRiAu0qbA6h3ulRSnAWmYhVkTofO8RvB/kxM8HAPDWVg25iIYoHjYAiVanjphn2u2hnPp0v83bE7G3fUbE7VYDbe7zrVfOOHQzbnvyhInr9amNJ8mls6Jd5sOavdiFZMqX/ByN03TQV0Q7Y6RqfPOKy0WFExmtT7gY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:9807ea8b-1d59-47fb-84d4-9cb72fe62b3a,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:e71138f4-66cd-4ff9-9728-6a6f64661009,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|102,TC:-5,Content:0|15|50,EDM:-3,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fb70662e7f5611f09eb0dd999d3936bf-20250822
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <darren.ye@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 305245922; Fri, 22 Aug 2025 05:53:21 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 22 Aug 2025 20:53:17 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 22 Aug 2025 20:53:16 +0800
From: Darren.Ye <darren.ye@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Linus
 Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>, Darren Ye
	<darren.ye@mediatek.com>
Subject: [PATCH v7 00/10] ASoC: mediatek: Add support for MT8196 SoC
Date: Fri, 22 Aug 2025 20:52:29 +0800
Message-ID: <20250822125301.12333-1-darren.ye@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_055329_688743_B60B55BA 
X-CRM114-Status: GOOD (  23.07  )
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

From: Darren Ye <darren.ye@mediatek.com>

This series of patches adds support for Mediatek AFE of MT8196 SoC.
Patches are based on broonie tree "for-next" branch.

Changes since v6:
 - optimize mtk_afe_pcm_pointer interface and improved logic checks.
 - update mt8196_afe_private structure by removing unused member variables.
 - only reference clocks directly supplied to afe and set required frequencies directly.
 - update adda driver according to reviewer suggestions.
 - update i2s driver according to reviewer suggestions.
 - update tdm driver according to reviewer suggestions.
 - optimize platform driver and update widget rotues.
 - move the sof route from platform driver to the machine driver, and moved pinctrl to platform driver.
 - update the afe yaml file to remove unnecessary clock references.

Changes since v5:
 - restore the commit message for mediatek,mt8196-afe.yaml and only remove the string document.
 - add reviewed owner for mediatek,mt8196-nau8825.yaml.
 - use SND_JACK_AVOUT as jack status.
 - use GENMASK_ULL to support 64-bit address masks.
 - modify the afe platform and i2s dai driver code based on reviewer's suggestions.

Changes since v4:
 - modify the mediatek,mt8196-afe.yaml commit message and add reviewed owner.
 - modify the mediatek,mt8196-nau8825.yaml commit message.
 - modify the audio common code based on reviewer's suggestions.
 - add reviewed and tested owners in the audio common code submission message.
 - fix cm update cnt calculation issue.

Changes since v3:
 - the AFE TOP CG index is added to the common header.
 - remove the audsys clk register and directly read and write to the regmap of afe cg clk.
 - modify the clk logic according to the suggestions.
 - remove the macro definition of MTKAIF4
 - remove the tdm cg event and directly read and write the tdm cg reg form the widget.
 - remove the i2s and cm cg event and directly read and write cg reg.
 - afe hopping and f26m clk cg are placed in remap_register_patch and enable.
 - the yaml file is modified according to the suggestions.
 - replace SND_SOC_DAIFMT_CBS_CFS with SND_SOC_DAIFMT_CBC_CFC.

Changes since v2:
  - remove the mtk_memif_set_channel interface modify.
  - remove duplicate definitions from the header file.
  - move the afe gate clk to the audio driver for management and registration
    and manage the afe clk gate in each dai driver.
  - delete the useless clk source.
  - the i2s driver adds i2s clk gate management, removes the additional dts
    configuration of i2s4.
  - the afe and i2s dai driver,memif and irq data structs are encapsulated using
    macros to reduce the amount of code.
  - the volatile reg is modified as suggested.
  - mt6681 codec is not supported, the mt6681 keyword is removed.
  - the name of the machine driver is changed from mt8196-mt6681.c to mt8196-nau8825.c
  - remove the i2s4 configuration from mt8196-afe.yaml and make the modifications as suggested.
  - change the mt8196-mt6681.yaml to mt8196-nau8825.yaml and make the modifications as suggested.

Changes since v1:
  - modify mtk_memif_set_channel and mtk_afe_pcm_pointer interfaces
    are improved to support mt8196.
  - remove duplicate definitions in the mt8196 common header file.
  - cm logic is merge into the afe platform driver.
  - modify afe clk to return judgment logic and remove useless clk sources.
  - refactor the mt8196 adda dai driver.
  - remove the gpio module and use SND_SOC_DAPM_PINCTRL to manage it.
  - removes CONNSYS_I2S related functions that are not supported in i2s dai driver.
  - fixed mt8196-afe.yaml and mt8196-mt6681.yaml syntax issues.
  - modify log printing in all modules.
  - optimize the header file included for machine driver.

Darren Ye (10):
  ASoC: mediatek: common: modify mtk afe platform driver for mt8196
  ASoC: mediatek: mt8196: add common header
  ASoC: mediatek: mt8196: support audio clock control
  ASoC: mediatek: mt8196: support ADDA in platform driver
  ASoC: mediatek: mt8196: support I2S in platform driver
  ASoC: mediatek: mt8196: support TDM in platform driver
  ASoC: mediatek: mt8196: add platform driver
  ASoC: dt-bindings: mediatek,mt8196-afe: add audio AFE
  ASoC: mediatek: mt8196: add machine driver with nau8825
  ASoC: dt-bindings: mediatek,mt8196-nau8825: Add audio sound card

 .../bindings/sound/mediatek,mt8196-afe.yaml   |   113 +
 .../sound/mediatek,mt8196-nau8825.yaml        |   100 +
 sound/soc/mediatek/Kconfig                    |    30 +
 sound/soc/mediatek/Makefile                   |     1 +
 .../mediatek/common/mtk-afe-platform-driver.c |    56 +-
 .../mediatek/common/mtk-afe-platform-driver.h |     2 +
 sound/soc/mediatek/mt8196/Makefile            |    14 +
 sound/soc/mediatek/mt8196/mt8196-afe-clk.c    |   580 +
 sound/soc/mediatek/mt8196/mt8196-afe-clk.h    |    64 +
 sound/soc/mediatek/mt8196/mt8196-afe-common.h |   205 +
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c    |  2497 ++++
 sound/soc/mediatek/mt8196/mt8196-dai-adda.c   |   845 ++
 sound/soc/mediatek/mt8196/mt8196-dai-i2s.c    |  2613 ++++
 sound/soc/mediatek/mt8196/mt8196-dai-tdm.c    |   675 +
 .../mediatek/mt8196/mt8196-interconnection.h  |   121 +
 sound/soc/mediatek/mt8196/mt8196-nau8825.c    |   868 ++
 sound/soc/mediatek/mt8196/mt8196-reg.h        | 12068 ++++++++++++++++
 17 files changed, 20834 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8196-nau8825.yaml
 create mode 100644 sound/soc/mediatek/mt8196/Makefile
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-clk.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-clk.h
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-common.h
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-dai-adda.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-dai-i2s.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-dai-tdm.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-interconnection.h
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-nau8825.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-reg.h

-- 
2.45.2


