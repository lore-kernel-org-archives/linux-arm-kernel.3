Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDCEC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 09:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ezCMGFwDc92Jn/DhraxBSvUoNsaumlXvaT9EQfTDkKk=; b=lnM0iYdmu+ZZDRrOupBTXPthqJ
	hY8CeXNsIDcM6ODXolDeWxxUk/v5tzpP7nHdwyaWglxy54QcsrF8v8LU8HAwhB3+sIAjPRH6RpQIz
	Jo2V9XxL523yxEqF6cPBMOUQecC+VwqT8OTRi90yjxKn8IUH02MVvlMyohdRCgckpWtmgcTVtYCoJ
	q5SHK8yLQ3n7bM9kzs3kPn+2Ig7fv39tvQ9Taqyjz5WJr3+NSiTDUnAWX5/wqqCYSS9NUon4Pve3E
	o2Kda9tKiRU7YMiG1Bb/SF5j9Xfu0skyj3uMGVr6SrBdI8hcwoEOac6OOqZAL+MBATYIZGN482JmD
	D6dqXotg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaADB-0000000EKzJ-2NyA;
	Fri, 11 Jul 2025 09:38:33 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua9Fd-0000000EAlj-3Pe8;
	Fri, 11 Jul 2025 08:37:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752223019;
	bh=hAaORvtwWlpuxH12pfYKOOV0L21hWokW/goaLX76tHw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VJyS6C/7HScUQBY7HlIASQgdYBNtKqNZ/T+dwmsDb/qoqmJIhLqQOazYiH8FTdkja
	 Yz0W7bokegZr0DV1vqZInUARQ5edJ7YSKIx/hhYp/CGFv+GWyx2VuN0qKcg6q0hgLg
	 xthFHibCzzLUZtFZoBhdv2gZpzjMA7YtZCaOiAtzlOF9ntbSVFL33Yk86cS7wY1/xD
	 9+fZ2rpJt3lMWrxvf9C5t75o3nNJy1vemHHSlQCj6xPoB6ypIZJUmTmiatSel+rZ7t
	 06mTl/iCsPPo3RTkx77RMGX9Iasr+DUWJ5T9lC5j5jaY+ZSM12F5348BlfsScysez4
	 RiljspQoOZNMg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2E33217E0FA8;
	Fri, 11 Jul 2025 10:36:59 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: matthias.bgg@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,2/4] MediaTek ARM32 DTS updates for v6.17
Date: Fri, 11 Jul 2025 10:36:46 +0200
Message-ID: <20250711083656.33538-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250711083656.33538-1-angelogioacchino.delregno@collabora.com>
References: <20250711083656.33538-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_013702_005406_71660356 
X-CRM114-Status: GOOD (  10.37  )
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

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts32-for-v6.17

for you to fetch changes up to 5a8e7b4eaaa232d747517fe34ba6867139a4cea8:

  ARM: dts: mediatek: add basic support for Lenovo A369i board (2025-07-11 10:31:43 +0200)

----------------------------------------------------------------
MediaTek mach ARM32 updates

This adds support for the MediaTek MT6572 SoC, found in various
old smartphones and tablets from various manufacturers.

In particular, this adds a board_dt_compat entry for this SoC
and its SMP bring up sequence to enable secondary cores.

----------------------------------------------------------------
Max Shevchenko (7):
      dt-bindings: interrupt-controller: mediatek,mt6577-sysirq: add MT6572
      dt-bindings: watchdog: mediatek,mtk-wdt: add MT6572
      dt-bindings: vendor-prefixes: add JTY
      dt-bindings: arm: mediatek: add boards based on the MT6572 SoC
      ARM: dts: mediatek: add basic support for MT6572 SoC
      ARM: dts: mediatek: add basic support for JTY D101 board
      ARM: dts: mediatek: add basic support for Lenovo A369i board

 Documentation/devicetree/bindings/arm/mediatek.yaml                                |   5 +++
 Documentation/devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml |   1 +
 Documentation/devicetree/bindings/vendor-prefixes.yaml                             |   2 +
 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml                   |   1 +
 arch/arm/boot/dts/mediatek/Makefile                                                |   2 +
 arch/arm/boot/dts/mediatek/mt6572-jty-d101.dts                                     |  61 +++++++++++++++++++++++++++
 arch/arm/boot/dts/mediatek/mt6572-lenovo-a369i.dts                                 |  56 +++++++++++++++++++++++++
 arch/arm/boot/dts/mediatek/mt6572.dtsi                                             | 108 ++++++++++++++++++++++++++++++++++++++++++++++++
 8 files changed, 236 insertions(+)
 create mode 100644 arch/arm/boot/dts/mediatek/mt6572-jty-d101.dts
 create mode 100644 arch/arm/boot/dts/mediatek/mt6572-lenovo-a369i.dts
 create mode 100644 arch/arm/boot/dts/mediatek/mt6572.dtsi


