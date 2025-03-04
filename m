Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 195F3C282D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 15:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=liLbalBwCJBcj8JinxZQyjkZlG5ljBsPba16yoUX+B4=; b=IdlnLjub1v+n03
	Jlk6lFTi8TIuuJxS2BoX/3zGNwqhwL/yLky49du5qudL+V8DXjnjKs9noBPwKyn5E23tGdiATA7P8
	Vzw8zaDdLjBReaTSBO2uLZwUAwA1nYXU0m166Vmoo60c7a6AKv+Ak1kEb5ncCd4XFsDDy7/HuPHxK
	59oj7U9ZUBoZS8KrhP+wta8nMTDkNTFdAFBOitZyJT6Tl83MIvONB/TzNC2t6bkQhY5+XMNj6YmVw
	SA2iz/2Vavmg05O2cODBk5cEL/yfFtra/vA56mgnG9Wxyy1bMdvZ4LvRU+4LN4+KDDwqebhlDlhva
	ssISxjjmqSaRhw6FCHEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUVa-00000005Hdw-3axr;
	Tue, 04 Mar 2025 15:48:38 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpU09-00000005A1I-2R7M;
	Tue, 04 Mar 2025 15:16:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741101367;
	bh=kRk65fFWGiW9cLrHn6Gq8JEnZaLlDaonyfy1q1fzf8Q=;
	h=From:Subject:Date:To:Cc:From;
	b=KY6FOERqCblcMtcMsG1Jo68iIUJRZhzGfDNIRsw0BTcMNCXmDNb2m1j3zcEo4RvAA
	 4S7+Gwr6uePEDLlKtbtdj/RVOurABGmkx9fwp3yXQqjDouTPSh11yiZivu9fY1jVlN
	 FnGhPGOiS0LxG0DEH79LUJnsEIlfcb/c45tdRMvwYHg6KA9tKUAEV3FnTVZwLQOsZd
	 97PWLOlLF2mntA+8Pqg9e9+2oi0YZYWvHs9xJVB9D31sYKrBrnM5tF91uDTC7lkJZq
	 Ds3fnE8Yd/GyCNhqnmSeN/CrCLGhAf38zLQcbPMcP9PotWGAcSku55fkzh4p2+U7lO
	 O9k4rMmTYv0aA==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5615517E065E;
	Tue,  4 Mar 2025 16:16:02 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Subject: [PATCH v3 00/20] Get mt6359-accdet ready for usage in Devicetree
Date: Tue, 04 Mar 2025 12:15:41 -0300
Message-Id: <20250304-mt6359-accdet-dts-v3-0-5b0eafc29f5b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAB0Zx2cC/33NSwrCMBSF4a2UjI3k2bSO3Ic4yOPWBlojSQhK6
 d5NOxFEHP4H7ncXlCB6SOjULChC8cmHew1+aJAd9f0G2LvaiBEmCaMCz7nlssfaWgcZu5wwIYZ
 2fSfUwC2qd48Ig3/u5uVae/Qph/jaXxS6rf+0QjHBrVKaSmp6I+zZhmnSJkR9tGFGm1jYR+GE/
 VJYVaRxLecAxAn1razr+gZ2a2Fy/AAAAA==
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
X-CRM114-CacheID: sfid-20250304_071609_791372_D33FF0DC 
X-CRM114-Status: GOOD (  13.54  )
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
4 get the mt6359-accdet driver probing, patches 5-18 clean up code
related to DT property parsing, patch 19 adds the node in the
Devicetree and patch 20 enables the kconfig for the driver.

Together with the series "Allow retrieving accessory detection reference
on MT8188" [1], and one extra patch on top enabling it on the
genio-700-evk DT, this series was tested on the Genio 700 EVK to get
audio jack detection working on it.

[1] https://lore.kernel.org/all/20250214-mt8188-accdet-v1-0-6bbd5483855b@collabora.com

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
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

Nícolas F. R. A. Prado (18):
      ASoC: dt-bindings: Add document for mt6359-accdet
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

 .../devicetree/bindings/mfd/mediatek,mt6397.yaml   |   6 +
 .../bindings/sound/mediatek,mt6359-accdet.yaml     |  42 ++
 arch/arm64/boot/dts/mediatek/mt6359.dtsi           |   4 +
 arch/arm64/configs/defconfig                       |   1 +
 drivers/mfd/mt6397-core.c                          |  12 +
 sound/soc/codecs/mt6359-accdet.c                   | 599 +++++----------------
 sound/soc/codecs/mt6359-accdet.h                   |  55 +-
 7 files changed, 195 insertions(+), 524 deletions(-)
---
base-commit: 20d5c66e1810e6e8805ec0d01373afb2dba9f51a
change-id: 20250214-mt6359-accdet-dts-00b189847f3c

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


