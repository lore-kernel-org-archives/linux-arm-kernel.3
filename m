Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B38CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 22:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3ScExPNQKYSZFeFlB8Eup0yAv+FWuJuIEcQHl2ZxmbI=; b=MVVIBTMVLP0Niw1zpZWjjcDxS2
	Ue/kbucxrSymh+u6/t+qnouA6K2nI/NU6SMqhhp86KTqzAGv1YGKSozaYgWSE5ThXWbCVabVEqP8r
	Gg+NZWiRREUIoRTra3TJ4h5lvDt7Wnt7o50Ao5gMb5Au4DtsVZqKIVokwo+0Zln4jDMHjj1sHjGSY
	S8s2eOwgfJRhNOLRJqCg4S2omRuMWxAmSGpzRcGh2xGmBMFpI+SNCcP+OjBgv3Vwfu0v9Y9a8ZiXh
	BupnfUBp51tJiKxPY9zYSo0l3NR4iF3mjJlHBD7peYrkoLeTshf/FzshLttM9sLiYEBfKsQp72rWM
	RLVKh9qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL7eb-0000000Gx84-0edp;
	Mon, 17 Nov 2025 22:24:57 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL7eY-0000000Gx7a-2aBw;
	Mon, 17 Nov 2025 22:24:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=3ScExPNQKYSZFeFlB8Eup0yAv+FWuJuIEcQHl2ZxmbI=; b=v35b62yIRn1c49VDOhAVT8mdvE
	jbM5TA+g/JMTLWxB0/wjdeKLCYN7TumaW8PSnLPXqdGevae+ZQHW/IZqXxEGudINsQf8sQUwFz6rI
	je6eo5d6Nre4nNAFjetp25G1xQFdA/WecN/BuH6dqB7G9cxnjBigqF4GQlS1jRa+ToQDkPt0BuCgf
	36bnUbClS4B615L6ejxCzjvKPFkHwQ+B8BDcLErwXuN8L0o+1YB/9DZ1J0Zo/mL7tO2woJvTVhzCj
	fq78Et08Ih+XqjwM3ILXfPzbyVIGLvKBg/VHCgM/DeRrKf3B0BHyZZRr6ExhZvpJgRmLFv+CAUmLh
	NA1glX/Q==;
Received: from [31.12.4.86] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vL7eW-0001S0-NC; Mon, 17 Nov 2025 23:24:52 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 6.19 #1
Date: Mon, 17 Nov 2025 23:24:51 +0100
Message-ID: <2046060.taCxCBeP46@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_142454_684738_7550898C 
X-CRM114-Status: GOOD (  16.29  )
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

Hi soc maintainers,

please find below and in the next mails Rockchip changes for for 6.19 .

As always the arm64 parts are the biggest chunk and for me as a
completionist the addition of display output on the old rk3368 is a fun
tidbit :-) .


Please pull.
Thanks
Heiko


The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.19-rockchip-dts64-1

for you to fetch changes up to 78f316e90906d54c8aa6029e5c19ae83e420e56a:

  arm64: dts: rockchip: add vicap node to rk356x (2025-11-16 00:39:47 +0100)

----------------------------------------------------------------
New boards: 9Tripod X3568, 100ASK DShanPi A1, LinkEase EasePi R1,
FriendlyElec NanoPi R76S

Interesting archeological addition: RK3368 (2015) gets display
output afterall.

New peripherals: vicap on px30 and rk356x, PCIe Gen2x1 on RK3528,
use actual clock-ids for SCMI clocks - not hardcoded numbers,
CQE support for the eMMC on RK3588.

As well as a number of enablements for individual boards.
For example enablement for the now usable NPU.

----------------------------------------------------------------
Chaoyi Chen (1):
      arm64: dts: rockchip: Enable DisplayPort for rk3588-evb2

Chris Morgan (6):
      arm64: dts: rockchip: enable NPU on Gameforce Ace
      arm64: dts: rockchip: Add device type for Indiedroid Nova.
      arm64: dts: rockchip: enable NPU on Indiedroid Nova
      arm64: dts: rockchip: Enable HS400 for Indiedroid Nova
      arm64: dts: rockchip: Fix DMA for Indiedroid Nova Bluetooth
      arm64: dts: rockchip: Enable USB-C DP Alt for Indiedroid Nova

Chukun Pan (4):
      arm64: dts: rockchip: fixes regulator for 100ASK DshanPi A1
      arm64: dts: rockchip: fixes ethernet for 100ASK DshanPi A1
      arm64: dts: rockchip: fixes vcc3v3_s0 supply for 100ASK DshanPi A1
      arm64: dts: rockchip: fixes audio for 100ASK DshanPi A1

Coia Prant (4):
      dt-bindings: vendor-prefixes: Add 9Tripod
      dt-bindings: arm: rockchip: Add 9Tripod X3568 series
      arm64: dts: rockchip: Add devicetree for the 9Tripod X3568 v4
      arm64: dts: rockchip: clean up devicetree for 9Tripod X3568 v4

FUKAUMI Naoki (6):
      arm64: dts: rockchip: Fix USB Type-C host mode for Radxa ROCK 5B+/5T
      arm64: dts: rockchip: Switch microSD card detect to gpio on Radxa ROCK 5 ITX/5C
      arm64: dts: rockchip: Remove sdmmc max-frequency for Radxa ROCK 5 ITX/5B/5B+/5T
      arm64: dts: rockchip: Move the EEPROM to correct I2C bus on Radxa ROCK 5A
      arm64: dts: rockchip: Add eeprom vcc-supply for Radxa ROCK 5A
      arm64: dts: rockchip: Add eeprom vcc-supply for Radxa ROCK 3C

Heiko Stuebner (5):
      dt-bindings: clock: rk3568: Add SCMI clock ids
      Merge branch 'v6.19-shared/clkids' into v6.19-armsoc/dts64
      arm64: dts: rockchip: use SCMI clock id for cpu clock on rk356x
      arm64: dts: rockchip: add missing clocks for cpu cores on rk356x
      arm64: dts: rockchip: use SCMI clock id for gpu clock on rk356x

Hsun Lai (2):
      dt-bindings: arm: rockchip: Add 100ASK DShanPi A1
      arm64: dts: rockchip: add DTs for 100ASK DShanPi A1

Johan Jonker (1):
      arm64: dts: rockchip: correct assigned-clock-rates spelling on 2 boards

Liangbin Lian (3):
      dt-bindings: vendor-prefixes: Document LinkEase
      dt-bindings: arm: rockchip: Add LinkEase EasePi R1
      arm64: dts: rockchip: add LinkEase EasePi R1

Mehdi Djait (1):
      arm64: dts: rockchip: add the vip node to px30

Michael Riesch (1):
      arm64: dts: rockchip: add vicap node to rk356x

Sebastian Reichel (1):
      arm64: dts: rockchip: add eMMC CQE support for rk3588

Shawn Lin (1):
      arm64: dts: rockchip: Remove sdmmc max-frequency on RK3588S EVB1 board

Tianling Shen (2):
      dt-bindings: arm: rockchip: Add FriendlyElec NanoPi R76S
      arm64: dts: rockchip: Add devicetree for the FriendlyElec NanoPi R76S

Torsten Duwe (1):
      arm64: dts: rockchip: enable HDMI audio on Rock 5 ITX

WeiHao Li (3):
      arm64: dts: rockchip: Add display subsystem for RK3368
      arm64: dts: rockchip: Add D-PHY for RK3368
      arm64: dts: rockchip: Add DSI for RK3368

Yao Zi (2):
      arm64: dts: rockchip: Add PCIe Gen2x1 controller for RK3528
      arm64: dts: rockchip: Enable PCIe controller on Radxa E20C

 .../devicetree/bindings/arm/rockchip.yaml          |  21 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   4 +
 arch/arm64/boot/dts/rockchip/Makefile              |   4 +
 arch/arm64/boot/dts/rockchip/px30.dtsi             |  12 +
 arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dts    |   2 +-
 arch/arm64/boot/dts/rockchip/rk3328-evb.dts        |   2 +-
 arch/arm64/boot/dts/rockchip/rk3368.dtsi           |  73 ++
 arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts |  12 +
 arch/arm64/boot/dts/rockchip/rk3528.dtsi           |  56 +-
 arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dts    |   1 +
 .../boot/dts/rockchip/rk3568-9tripod-x3568-v4.dts  | 880 +++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3568-easepi-r1.dts  | 623 +++++++++++++++
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi      |  51 +-
 .../boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts | 749 ++++++++++++++++++
 .../arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts | 860 ++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |   1 +
 arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dts   |  48 ++
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts |  19 +-
 .../boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi   |  13 +-
 .../boot/dts/rockchip/rk3588-rock-5b-plus.dts      |   5 +
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts    |   4 +
 arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts    |   4 +
 arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts  |   1 -
 .../boot/dts/rockchip/rk3588s-gameforce-ace.dts    |  34 +
 .../boot/dts/rockchip/rk3588s-indiedroid-nova.dts  | 122 ++-
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts   |  23 +-
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts   |   9 +
 include/dt-bindings/clock/rk3568-cru.h             |   6 +
 28 files changed, 3603 insertions(+), 36 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-easepi-r1.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts




