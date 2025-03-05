Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE547C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 19:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pnR7kGV20ztpGOtiNskMN7IndMZcW40Rp6o6coAGqIU=; b=VkJFwKlQF8ii0o
	KfFXt+ymLF6GCtp9QCDUwxKF4yeawYdQECl42qXtmSy6RJ7i0w3lEbd8a/wVy873/Ansegak/i+wB
	Odmj+qTVp1H+tU7Mvdaujt+Aybcz410TSS2u50+DRJsoLCGG6URWif8fWXb6TECVAY264mDs4bXAF
	6uSg8KadejcAst+u9pjoMckcTOrcNZGPYPCulMc2oJX+gaHf3GhKY4U6LIpVnwPVH7Gqh+5uymn46
	Okc0skg6+Q0uT4B9dCWpjL4z8ZuhZZDoKnj4QGEmFx5TUakmuZ6CER8cFZx+MJhtm3Z57lWUHl3rt
	8SpEYiJYw/E5eD6KZvfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tptzO-000000090be-1Pbx;
	Wed, 05 Mar 2025 19:01:06 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tptxi-00000008zlB-08pb;
	Wed, 05 Mar 2025 18:59:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741201160;
	bh=u/GQhP1xEopgzVBLmurB5SYuCMPtvKHmpfxo57+s2TE=;
	h=From:Subject:Date:To:Cc:From;
	b=MHW65aF5zt1j/P/JBQGhK4Ht+n1SPqCp9rnl7HVPK/MxufyDMnTGiFq+KJU5To5iu
	 qjqaWvq5FMB2H4Gf2zY1a1Dj9sbP6up5u5ABBQap/J6xIVvaqHp6a5fm1e6dUlRAW4
	 XD8uj8A1tPbMEZ9m2HwoRLr3Zga6yX6KmCt96gjg+Gbk5t9yVcxBEq170XEyFJWYDM
	 qMlqFYxdiINU+ie2Dq6WE1/DzYrAimdTNsALBJFAJ9yXZG3HLif69TPKsAVpP+TtRg
	 yNEMX5JoFuu4mB+FDfZwjN1Ssfs34DmXKRdaRdL67cCeeeuUIo9rncuCiYScq/P2wF
	 2ExQ+Tk/zupXQ==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1004])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DFC6717E0599;
	Wed,  5 Mar 2025 19:59:14 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Subject: [PATCH v4 00/19] Get mt6359-accdet ready for usage in Devicetree
Date: Wed, 05 Mar 2025 15:58:15 -0300
Message-Id: <20250305-mt6359-accdet-dts-v4-0-e5ffa5ee9991@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMeeyGcC/33OSwrCMBCA4auUrI3k2TSuvIe4yGNqA62RpBSl9
 O6m3ShSXP4D883MKEMKkNGpmlGCKeQQ7yXEoUKuM/cb4OBLI0aYJIwKPIw1lxob5zyM2I8ZE2J
 poxuhWu5Q2XskaMNzMy/X0l3IY0yv7cRE1+k/baKY4FopQyW12gp3drHvjY3JHF0c0CpO7KNww
 vYUVhRpfc05APFC7Sn8W9n9hW8KAdM6pltpf5VlWd73WOlzQgEAAA==
X-Change-ID: 20250214-mt6359-accdet-dts-00b189847f3c
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Andrew Perepech <andrew.perepech@mediatek.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_105922_251148_BC30EBD0 
X-CRM114-Status: GOOD (  13.51  )
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
Devicetree. Patch 1 adds the required DT bindings, patches 2 and 3 get
the mt6359-accdet driver probing, patches 4-17 clean up code related to
DT property parsing, patch 18 adds the node in the Devicetree and patch
19 enables the kconfig for the driver.

Together with the series "Allow retrieving accessory detection reference
on MT8188" [1], and one extra patch on top enabling it on the
genio-700-evk DT, this series was tested on the Genio 700 EVK to get
audio jack detection working on it.

[1] https://lore.kernel.org/all/20250214-mt8188-accdet-v1-0-6bbd5483855b@collabora.com

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
Changes in v4:
- Moved DT-binding for accdet from standalone file
  (sound/mediatek,mt6359-accdet.yaml) to parent mfd's file
  (mfd/mediatek,mt6397.yaml), squashing patches 1 and 2.
- Link to v3: https://lore.kernel.org/r/20250304-mt6359-accdet-dts-v3-0-5b0eafc29f5b@collabora.com

Changes in v3:
- Removed unneeded '|' in mt6359-accdet's dt-binding description
- Removed unneeded unevaluatedProperties for accdet node in mt6397's
  dt-binding
- Clarified HP_EINT pin is on the MT6359 PMIC in mediatek,hp-eint-high's
  description in the mt6359-accdet dt-binding
- Link to v2: https://lore.kernel.org/r/20250302-mt6359-accdet-dts-v2-0-5bd633ee0d47@collabora.com

Changes in v2:
- Removed all DT-binding properties except for EINT polarity one
  (mediatek,eint-level-pol / mediatek,hp-eint-high)
  - Added patches 12-18 to make those settings internal to driver
- Renamed mediatek,eint-level-pol to mediatek,hp-eint-high and made it
  bool
- Added patch 20 to enable the MT6359 ACCDET Kconfig in the defconfig
- Removed unused btn_type variable as part of "Drop dead code for button
  detection" patch.
- Link to v1: https://lore.kernel.org/r/20250214-mt6359-accdet-dts-v1-0-677a151b9b4c@collabora.com

---
Andrew Perepech (2):
      mfd: mt6397-core: Add mfd_cell for mt6359-accdet
      ASoC: mediatek: mt6359-accdet: Implement HP_EINT polarity configuration

Nícolas F. R. A. Prado (17):
      dt-bindings: mfd: mediatek: mt6397: Add accdet subnode
      ASoC: mediatek: mt6359-accdet: Add compatible property
      ASoC: mediatek: mt6359-accdet: Handle hp-eint-high property
      ASoC: mediatek: mt6359-accdet: Drop dead code for EINT/GPIO IRQ handling
      ASoC: mediatek: mt6359-accdet: Drop dead code for EINT trigger setting
      ASoC: mediatek: mt6359-accdet: Drop dead code for button detection
      ASoC: mediatek: mt6359-accdet: Drop dead code for plugout-debounce
      ASoC: mediatek: mt6359-accdet: Drop unused moisture variables
      ASoC: mediatek: mt6359-accdet: Always use internal resistor
      ASoC: mediatek: mt6359-accdet: Make PWM debounce settings internal
      ASoC: mediatek: mt6359-accdet: Always use eint detect mode 4
      ASoC: mediatek: mt6359-accdet: Always set micbias1 to 2.8V
      ASoC: mediatek: mt6359-accdet: Always configure hardware as mic-mode 2
      ASoC: mediatek: mt6359-accdet: Always set comp-vth to 1.6V
      ASoC: mediatek: mt6359-accdet: Always use EINT0 IRQ
      arm64: dts: mt6359: Add accessory detect node
      arm64: defconfig: Enable MT6359 ACCDET

 .../devicetree/bindings/mfd/mediatek,mt6397.yaml   |  51 ++
 arch/arm64/boot/dts/mediatek/mt6359.dtsi           |   4 +
 arch/arm64/configs/defconfig                       |   1 +
 drivers/mfd/mt6397-core.c                          |  12 +
 sound/soc/codecs/mt6359-accdet.c                   | 599 +++++----------------
 sound/soc/codecs/mt6359-accdet.h                   |  55 +-
 6 files changed, 198 insertions(+), 524 deletions(-)
---
base-commit: 20d5c66e1810e6e8805ec0d01373afb2dba9f51a
change-id: 20250214-mt6359-accdet-dts-00b189847f3c

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


