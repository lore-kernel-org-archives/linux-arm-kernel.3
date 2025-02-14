Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A72C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 18:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N6snzrDgUTK8ck9Ry9M8mhs36pJFOnl7+SAC181yyLg=; b=blA5BZr8DzwMck
	im0O5QTephcJkhkPrx7g4JnqyMveUoUrG5F5wPoOat3Hma8UFIVieabLXLorUTMIPWzkPEObSFu92
	w5wqP/P9ACWV5HVbKwMTzKSry66ZqhUIogvtiJvdlw3LFZm80WInSX9G+YkTYvahWlhAzul4x79p+
	8e90l49DEzTdl8LleMz3T34HUaEbm5ZpwR888p0ISHycG7t2O6cFiHUP+edWMM6XwN84gFVqx0f+V
	HcEixRS4MmAVcXfBQ9bNtgv18WCUOIDj35CFkJrDsYA2eq4P3PaPYidoQp2AgGkDzVW16uDy9zJy9
	JSRVtcuW6PwVSeTwk0+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0rT-0000000Fx4Q-1xDO;
	Fri, 14 Feb 2025 18:56:27 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tizLQ-0000000Ffno-1WBj;
	Fri, 14 Feb 2025 17:19:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739553554;
	bh=/Vq4HRI2BN0XjmmO8kOb2O01hlISp/5ZPmuCinm7xyQ=;
	h=From:Subject:Date:To:Cc:From;
	b=IUGXUY/ikc92B5KBNi1Q/E/BPJeorXdvdXpf9z4MeLr8tHubO3s6O1iySo15XcYST
	 6B226mq0N8mUcJH3admq/6+MBMlT7HUgPMxa/51nMmJbRP1pXX/VTjlGz95cMO/JwO
	 vc+dIWIB9bz3wf2E5o7JNYWZxGIB7pvDEYVWOwoZaJIICHdHBvcq9KrkL2BrND1+Y7
	 odvR+2y6YZ4HymROR5zvlB4de0l3ZnCTgPcP+9upl45Do7khw20IBeggDCkaxPsfn/
	 RMwtzwVK/LOJ1p2dpzIxIUM0mZqA9bZL8HQ6W8SoDtdedZwgiMF6iUGElE++mnBLar
	 jNYjW/FkrF8eg==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1003])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EDEEA17E0239;
	Fri, 14 Feb 2025 18:19:09 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Subject: [PATCH 00/13] Get mt6359-accdet ready for usage in Devicetree
Date: Fri, 14 Feb 2025 14:18:31 -0300
Message-Id: <20250214-mt6359-accdet-dts-v1-0-677a151b9b4c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOd6r2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDI0MT3dwSM2NTS93E5OSU1BLdlJJiXQODJEMLSwsT8zTjZCWgvoKi1LT
 MCrCZ0bG1tQBQBtbGYwAAAA==
X-Change-ID: 20250214-mt6359-accdet-dts-00b189847f3c
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Andrew Perepech <andrew.perepech@mediatek.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_091916_554281_7AFEAB07 
X-CRM114-Status: UNSURE (   9.36  )
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

This series prepares the MT6359 ACCDET for actual usage in the
Devicetree. Patches 1 and 2 add the required DT bindings, patches 3 and
4 get the mt6359-accdet driver probing, patches 5-12 clean up code
related to DT property parsing, and patch 13 adds the node in the
Devicetree.

Together with the series "Allow retrieving accessory detection reference
on MT8188" [1], and one extra patch on top enabling it on the
genio-700-evk DT, this series was tested on the Genio 700 EVK to get
audio jack detection working on it.

[1] https://lore.kernel.org/all/20250214-mt8188-accdet-v1-0-6bbd5483855b@collabora.com

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
Andrew Perepech (3):
      mfd: mt6397-core: Add mfd_cell for mt6359-accdet
      ASoC: mediatek: mt6359-accdet: Implement EINT IRQ polarity configuration
      ASoC: mediatek: mt6359-accdet: Use IRQ_TYPE_LEVEL_LOW not raw value

Nícolas F. R. A. Prado (10):
      ASoC: dt-bindings: Add document for mt6359-accdet
      dt-bindings: mfd: mediatek: mt6397: Add accdet subnode
      ASoC: mediatek: mt6359-accdet: Add compatible property
      ASoC: mediatek: mt6359-accdet: Drop dead code for EINT/GPIO IRQ handling
      ASoC: mediatek: mt6359-accdet: Drop dead code for EINT trigger setting
      ASoC: mediatek: mt6359-accdet: Drop dead code for button detection
      ASoC: mediatek: mt6359-accdet: Drop dead code for plugout-debounce
      ASoC: mediatek: mt6359-accdet: Handle mediatek,eint-use-ext-res as bool
      ASoC: mediatek: mt6359-accdet: Split mediatek,pwm-deb-setting properties
      arm64: dts: mt6359: Add accessory detect node

 .../devicetree/bindings/mfd/mediatek,mt6397.yaml   |   7 +
 .../bindings/sound/mediatek,mt6359-accdet.yaml     | 293 +++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt6359.dtsi           |  24 ++
 drivers/mfd/mt6397-core.c                          |  12 +
 sound/soc/codecs/mt6359-accdet.c                   | 208 +++++----------
 sound/soc/codecs/mt6359-accdet.h                   |  18 +-
 6 files changed, 404 insertions(+), 158 deletions(-)
---
base-commit: dab2734f8e9ecba609d66d1dd087a392a7774c04
change-id: 20250214-mt6359-accdet-dts-00b189847f3c

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


