Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F77C982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 10:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H5S0ck3gdeA68aFJF+/2ViN8qQjJT7WhfD6QVIMv7Vk=; b=Ptnsj3KyGdbc9CP4jvdVFQhORo
	8fwUINgLJMV7tZNAq0kYWl1UOit+ZVg9EmUsPWXZVVwnz7EkInhp4WufSAea6bBHoVtw+v5AE/hhv
	NGqM1vErK4973e8Em83eCNg9ZGqnC7NrO/h8y+/9IHxJ/CojTc1XjyNvLwB7KM2sSf60S/A+c8E8C
	uWgNvmuCNjm8V5HD3OZ79t1NChCF0oyVr/FhOXumoEgBDxyfZjcZId0li6NU6MRJFzp1KE+xb1WIX
	CJqeRxKFoZD97rDuLKyLlNtGFxsn7GhT2TBJ/iMOlTdmjnD3crxvaaPR0VHFQbN4nSBEXJkAgN6/0
	ciX69ihQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9KH9-00000007uBu-3KTo;
	Wed, 23 Sep 2026 10:32:31 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9KH6-00000007uAY-1xyZ;
	Wed, 23 Sep 2026 10:32:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790159545;
	bh=kHhWudTgVsro0XbOJkN9vDbK3sEtyOdWWA0FcJwwoOw=;
	h=From:To:Cc:Subject:Date:From;
	b=OEBcH7GGSk65/WVw1yqb8yhjClfiiQd6etWpk+bVbcFuJu53V2F/ciAzfGo2WkhHx
	 cHmCpxGKYK5DlMem9Y/p3H2aj4+LZnITHtpr/WMZJJIHiZ2cT1qp0HsbgFSN4mPQ36
	 Ah1RQShb818V1ENAExkvbmltAtoS0yUvw6XincUDIUjtb0RXEgl5wJ+YkPDTKEI+M9
	 C7gWWS/SFgnfMn8cOOQLCOXh4xjKZJwM5DXHM0s03LaZOlwVqQMhjSYOuEbQMG8Mlx
	 7aAmsujck1Z/vRGsCN21daXkVHOBwkqa7kguncNU55BKuAbxS9+t2Exm9cwDzwFwMz
	 2qcg3Q3BJzI5A==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 788DF17E0034;
	Wed, 23 Sep 2026 12:32:25 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com
Subject: [GIT,PULL,1/3] MediaTek ARM64 Device Tree updates for v7.4
Date: Wed, 23 Sep 2026 12:32:05 +0200
Message-ID: <20260923103222.25504-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_033228_666020_3FC06348 
X-CRM114-Status: UNSURE (   9.88  )
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

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ tags/mtk-dts64-for-v7.4

for you to fetch changes up to bf89276b2db391cbb25d1a0e898280fe85b16fb5:

  arm64: dts: mediatek: mt7988a-bpi-r4pro: label gpio-hogs (2026-09-21 12:22:18 +0200)

----------------------------------------------------------------
MediaTek ARM64 DeviceTree updates

As the most exciting change, this finally adds support for the
PowerVR Rogue GX6250 GPU on the MediaTek MT8173 SoC which can
now enjoy graphics acceleration after years of SW rendering on
a SoC featuring rather slow CPU cores by today's standards.

This also adds an important fix for the frequency of the
architected timer on the MT7986A/MT7986B SoCs, resolving
issues with NTP correction limits.

Additional changes include:
 - Addition of labels to the GPIO hogs and the GPIO expander
   chip on the BananaPi R4 Pro;
 - Addition of ramoops memory region on BananaPi R3 and R4;
 - Addition of address/size cells in /firmware node for all
   of the supported Chromebooks;
 - Size increase for the SCP Core 0 memory region in MT8188 Geralt;
 - Indentation fixes in MT8173

----------------------------------------------------------------
Andrea Pesaresi (1):
      arm64: dts: mediatek: mt7986: correct timer frequency

Brian Norris (1):
      arm64: dts: mediatek: Add #{address,size}-cells to Chromium-based /firmware

Chen-Yu Tsai (2):
      arm64: dts: mediatek: mt8173: Fix MFG_ASYNC power domain clock
      arm64: dts: mediatek: mt8173: Add GPU device nodes

Frank Wunderlich (2):
      arm64: dts: mediatek: mt7988a-bpi-r4pro: add names for i2c-to-gpio chip
      arm64: dts: mediatek: mt7988a-bpi-r4pro: label gpio-hogs

Igor Belwon (2):
      arm64: dts: mediatek: mt6878-pinfunc: Fix pinctrl header path
      arm64: dts: mediatek: mt6893-pinfunc: Fix pinctrl header path

Justin Yeh (1):
      arm64: dts: mediatek: mt8188-geralt: Enlarge SCP core0 memory region

Krzysztof Kozlowski (1):
      arm64: dts: mediatek: mt8173: Replace spaces indentation with tabs

Martino Dell'Ambrogio (2):
      arm64: dts: mediatek: mt7986a-bananapi-bpi-r3: add ramoops region
      arm64: dts: mediatek: mt7988a-bananapi-bpi-r4: add ramoops region

 arch/arm64/boot/dts/mediatek/mt6878-pinfunc.h                      |  2 +-
 arch/arm64/boot/dts/mediatek/mt6893-pinfunc.h                      |  2 +-
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts           | 13 +++++++++++++
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi                          |  1 +
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn13.dtso |  1 +
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn14.dtso |  1 +
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn15.dtso |  1 +
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn18.dtso |  1 +
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi      | 18 ++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi          | 13 +++++++++++++
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi                       |  5 +++++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi                           | 35 +++++++++++++++++++++++++++++++++--
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi                     |  5 +++++
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi                   |  5 +++++
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi                    |  7 ++++++-
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi                   |  5 +++++
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi                    |  5 +++++
 17 files changed, 115 insertions(+), 5 deletions(-)


