Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A681DCD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 09:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FnrhofE9Lm3ESyWHCL1Y8qsXgJPYLXk2zoyXKkn1S/w=; b=A08Re8JbEcjiUloNGYRFmln1Nq
	+fuE4IHb1bizfFRWCUJobT6A9Msr8ZQrjMRkD37RXjc5okNicCs/YH4qj+SPXCK/AMjTfh2rNBlqn
	Gw3zDQNMWj9OwTtpJ1ojinbVmMNangVrxN6Gn45Y1WW9BEyZIxUSZrAC2/earT2nXylDy+mRNqlAn
	5wbcJ6nViAr/h6uMkGCN56Fm0wUh2P12ZkckSPA99R0oxPaRrqELjr3G5y0HWzTkNTGfkeuAtJOd5
	EG71eM+GHsIGkEVPMiAq96jHPD349Zj156aV7Fy8P4GdrUUMpmY4f1wL3vTYlj4eTP2+pOhmxPu0H
	IZf7urDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyhI-0000000ASen-1Rr0;
	Mon, 01 Jun 2026 09:12:36 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyhG-0000000ASdt-01sW;
	Mon, 01 Jun 2026 09:12:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780305150;
	bh=FSTO3TRl4lx3BZ9JBp86fc4IYV6oDb1HJzOov30RXiA=;
	h=From:To:Cc:Subject:Date:From;
	b=m+SzVcelZMs1+3b/mvqZb0mujuDoA0deDJknX4I/BZlx0AMltIqlS/X17Xki4Evqp
	 TOJgaaWspEWNOcfjVQoisBxjgLUtVNaLkH7Vr+HZx2LZzGXEJ7/Lv9JM6EewNy1Adb
	 GctAqeBzNk040IkYjKz+2rbu4Wk1ZnwCZ0q7Ikn4krdd7oHu6y9KTKpk2V76OE3E5L
	 b0yICXEV2q9sqUrkQeUZ+RwcAS+FobCQxvm5MfyoEyuvSaZUqCrJlKwuZwu5yKJ2C0
	 NZ9zpRgggDFRwbPRFqUIkg4sK4gmEf5NyhtVSyjexF/QDyhKsAaaf4YVqc4eN40YIo
	 hwx/G9MJqS1fA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4ED1017E052F;
	Mon,  1 Jun 2026 11:12:30 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com
Subject: [GIT,PULL,1/3] MediaTek ARM64 Device Tree updates for v7.2
Date: Mon,  1 Jun 2026 11:12:20 +0200
Message-ID: <20260601091225.5223-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_021234_191118_000FD683 
X-CRM114-Status: GOOD (  12.26  )
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

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ tags/mtk-dts64-for-v7.2

for you to fetch changes up to 9897c586b09f79ebcf2e67a888743c046b20d254:

  arm64: dts: mediatek: add LED and key support on Xiaomi AX3000T (2026-05-25 10:43:10 +0200)

----------------------------------------------------------------
MediaTek ARM64 DeviceTree updates

This adds improvements for already supported SoCs and devices.

In particular:
 - Adds support for the MT7981 SoC's Crypto Accelerator
 - Enables gpio-keys and leds found on the MT7981b based
   Xiaomi AX3000T router
 - Adds new variants of MT7988 BananaPi BPi-R4 Pro
   - ...and some spare cleanups for all BPi-R4 Pro boards
 - Adds a MediaTek MT6365 devicetree and uses it in all of
   the relevant supported boards in place of MT6359, where
   needed (the MT6365 PMIC is a fully compatible variant
   of the MT6359 PMIC, but still not named MT6359).
 - Adds correct power supplies for CPUs and devices on a
   variety of MediaTek Chromebooks and Genio AIoT boards,
   including:
   - MT8186 Corsola Chromebooks
   - MT8192 Asurada Chromebooks
   - MT8195 Cherry Chromebooks
   - MT8390 Genio based boards
   - MT8395 Genio based boards
 - Adds HDMI TX support for Ezurio Tungsten 510/700 boards.

----------------------------------------------------------------
Aleksander Jan Bajkowski (2):
      arm64: dts: mediatek: add crypto offload support on MT7981
      arm64: dts: mediatek: add LED and key support on Xiaomi AX3000T

Chen-Yu Tsai (21):
      arm64: dts: mediatek: mt8192-asurada: Move PCIe DMA bounce buffer to host
      arm64: dts: mediatek: mt8186-corsola-voltorb: Add MT6315 PMIC supplies
      arm64: dts: mediatek: mt6359: Switch to proper ldo_vcn33_[12] regulators
      arm64: dts: mediatek: mt8192-asurada: Add MT6359 PMIC supplies
      arm64: dts: mediatek: mt8192-asurada: Add MT6315 PMIC supplies
      arm64: dts: mediatek: mt8192-asurada: Add supplies for ChromeOS EC regulators
      arm64: dts: mediatek: mt8192-asurada: Add CPU power supplies
      arm64: dts: mediatek: mt8192-asurada: Add SPI NOR flash power supply
      arm64: dts: mediatek: mt8192-asurada: Fix WiFi regulator description
      arm64: dts: mediatek: mt8195-cherry: Add MT6359 PMIC supplies
      arm64: dts: mediatek: mt8195-cherry: Add MT6315 PMIC supplies
      arm64: dts: mediatek: mt8195-cherry: Add supplies for ChromeOS EC regulators
      arm64: dts: mediatek: mt8195-cherry: Fix VBUS regulator description
      arm64: dts: mediatek: mt8195-cherry: Add supply for SPI NOR flash
      arm64: dts: mediatek: mt8195-cherry: Add vusb33 supplies for XHCI controllers
      arm64: dts: mediatek: mt8188-geralt: Add MT6359 PMIC supplies
      arm64: dts: mediatek: mt8188-geralt: Add little core CPU power supplies
      arm64: dts: mediatek: mt8192-asurada: Fix SPI-NOR flash compatible
      arm64: dts: mediatek: mt8192-asurada: Add (BT|WIFI)_KILL_1V8_L GPIO line names
      arm64: dts: mediatek: mt8195-cherry: Fix names for EC controlled regulators
      arm64: dts: mediatek: mt8195-cherry: Sort top level nodes correctly

Frank Wunderlich (4):
      arm64: dts: mediatek: mt7988a-bpi-r4pro: rename mgmt port to lan5
      arm64: dts: mediatek: mt7988a-bpi-r4pro: drop duplicate fan properties
      arm64: dts: mediatek: mt7988a-bpi-r4pro: update gpio-leds
      arm64: dts: mediatek: mt7988a-bpi-r4pro: rework pcie gpio-hog handling

Gary Bisson (1):
      arm64: dts: mediatek: mt8390-tungsten-smarc: add HDMI support

Louis-Alexis Eyraud (9):
      arm64: dts: mediatek: add MT6365 PMIC include
      arm64: dts: mediatek: mt8390-genio-common: use MT6365 PMIC definitions
      arm64: dts: mediatek: mt8395-genio-common: use MT6365 PMIC definitions
      arm64: dts: mediatek: mt8395-radxa-nio-12l: use MT6365 PMIC definitions
      arm64: dts: mediatek: mt8390-genio-common: add MT6319 PMIC support
      arm64: dts: mediatek: mt8390-genio-common: add CPU power supplies
      arm64: dts: mediatek: mt8390-genio-700-evk: add specific CPU power supplies
      arm64: dts: mediatek: mt8395-genio-common: add MT6315 PMIC supplies
      arm64: dts: mediatek: mt8395-genio-common: add MT6360 PMIC supplies

 arch/arm64/boot/dts/mediatek/Makefile                              |   8 +++++
 arch/arm64/boot/dts/mediatek/mt6359.dtsi                           |  22 +++-----------
 arch/arm64/boot/dts/mediatek/mt6365.dtsi                           |  26 ++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dts            |  36 ++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi                          |  15 ++++++++++
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn13.dtso |  20 +++++++++++++
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn14.dtso |  20 +++++++++++++
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi      |  15 ++--------
 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi           |   4 +++
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi                    |  41 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi                   |  82 +++++++++++++++++++++++++++++++++++++++++++++++----
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi                    | 154 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----------------------------------
 arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts              |   7 +++++
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi              |  80 +++++++++++++++++++++++++++++++++++++++++++++----
 arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-som.dtsi           |   2 +-
 arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi            | 122 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
 arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi              |  46 ++++++++++++++++++++++++-----
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtso  |   4 +--
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts              |   8 ++---
 19 files changed, 595 insertions(+), 117 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6365.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn13.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn14.dtso

