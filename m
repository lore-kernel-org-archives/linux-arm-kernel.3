Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F303CA5FEC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 21:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JD6bVYc2N3S5atXb5HxS0QL0k9uB54dvuwIHqeroLl8=; b=hobjtnOyBfpX0d7Fzeq2IyFzGH
	T12u1ZVT63yHJOokw7S3tMlmhxKqZlqul+V+jYHEYyI4wSo1c9A17nivsUQfe5DMjFvu+t65UvtJW
	erMSbP6/gqlQ1SjCSLAwUWwzO5BshYqKbKYCcPA7NueI1Wpv8SruFii6mmuaVH4iaoACGAK+4wtga
	YosPCxOrUyvICGZqYILEfHyJ4qUFNQCawgzIlNBw03X6g+yxhLBKI3M8FjWQkOBjWlLnON0VnJRqV
	ji/V/4RY4qOb6IPdzc8sotyFelgTDItamjazJA549l1/h1W7t4X3N7+vvcgrYmzGQvUHQm7fn2j+w
	LiORfmvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDU2x-0000000FO4j-3lgq;
	Sun, 04 Oct 2026 21:47:03 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDU2s-0000000FO4A-3C4m;
	Sun, 04 Oct 2026 21:47:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=JD6bVYc2N3S5atXb5HxS0QL0k9uB54dvuwIHqeroLl8=; b=JgyFuJIhfBAhQLnYhFUhSEka5K
	mUKo6xaF08QV+3FZvoFrfv8HpqASAHcRR+EFh4dyMIcoy8k/mDbB5bkBVLnFg8QYt95IF4tWAFi2F
	EOlKgdp1KcFxfPriShpFJgQ94SeK05wBxgnkdDaQCi0I4uRY8TpD2OyPcBYfuS424W7oeKiFEG3p6
	WqKzUIf1squCnkgr8pJf/yOk9Wh9UUqvxmZ4mUh5Qzb0fq2LOOSCECniM/wESptGwF2pr26AwukJU
	4ENpQy6AgACmQPSmshDCN87zRJvJ3oalRSKXLspQkX1ZegDd9P3R64STb101lncpzarIdZLQZebaX
	WYcCzmCw==;
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 7.4 #2
Date: Sun, 04 Oct 2026 23:46:55 +0200
Message-ID: <2088481.8hb0ThOEGa@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_144659_705631_25A1632B 
X-CRM114-Status: GOOD (  11.66  )
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

please find below some more Rockchip dt changes for arm64
for the next merge window.

Please pull

Thanks
Heiko


The following changes since commit 7aa165b62ccaf340da22c517074e7c6853db55cd:

  arm64: dts: rockchip: support CAN1-CAN2-UART4 adapter for RK3588 Jaguar (=
2026-09-02 13:07:56 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
tags/v7.4-rockchip-dts64-2

for you to fetch changes up to fa932a9b632ff0d80390b940e6aabe38ac305fe1:

  arm64: dts: rockchip: Add MangoPi M28K (2026-10-01 00:22:48 +0200)

=2D---------------------------------------------------------------
New boards: MangoPi M28K, NanoPi R28S, DFRobot UNIHIKER M10 V1.2
The gpio controllers on the RK3576 are always on, so they can get aliases
in the main soc dtsi.

Apart from that some cleanup of MMC properties and some board changes.

=2D---------------------------------------------------------------
Adam Wermuth (1):
      arm64: dts: rockchip: Add PWM fan to Radxa ROCK 3B

Alexey Charkov (1):
      arm64: dts: rockchip: Set gpioN aliases on RK3576

Chukun Pan (2):
      dt-bindings: arm: rockchip: Add MangoPi M28K
      arm64: dts: rockchip: Add MangoPi M28K

Diederik de Haas (1):
      arm64: dts: rockchip: Add supplies for es8316 on RockPro64

Mizuno Miotsuki (2):
      dt-bindings: arm: rockchip: Add DFRobot UNIHIKER M10 V1.2
      arm64: dts: rockchip: Add DFRobot UNIHIKER M10 V1.2

Peter Robinson (1):
      arm64: dts: rockchip: Add missing audio codec supplies to Pinebook Pro

Shawn Lin (2):
      arm64: dts: rockchip: Remove broken-cd on Rock 5 ITX SDIO
      arm64: dts: rockchip: Remove cap-mmc-highspeed from SD-only slots

=E5=AE=89=E5=AE=B9 (3):
      dt-bindings: arm: rockchip: Add FriendlyElec NanoPi R28S
      arm64: dts: rockchip: Split out the common NanoPi RK3528 parts
      arm64: dts: rockchip: Add devicetree for the FriendlyElec NanoPi R28S

 .../devicetree/bindings/arm/rockchip.yaml          |  22 +-
 arch/arm64/boot/dts/rockchip/Makefile              |   3 +
 .../boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts | 248 +++++++++++++
 arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts    |   1 -
 .../boot/dts/rockchip/rk3399-pinebook-pro.dts      |   4 +
 .../boot/dts/rockchip/rk3399-rockpro64-v2.dts      |   4 +
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts  |   4 +
 .../boot/dts/rockchip/rk3528-mangopi-m28k.dts      | 412 +++++++++++++++++=
++++
 .../arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts | 160 ++++++++
 .../boot/dts/rockchip/rk3528-nanopi-zero2.dts      | 290 +--------------
 arch/arm64/boot/dts/rockchip/rk3528-nanopi.dtsi    | 291 +++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dts   |   1 -
 arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dts |   1 -
 .../boot/dts/rockchip/rk3568-fastrhino-r66s.dts    |   1 -
 arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dts |   1 -
 .../arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtsi |   1 -
 arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts    |  51 +++
 .../dts/rockchip/rk3576-anbernic-rg-vita-pro.dts   |   2 -
 .../boot/dts/rockchip/rk3576-armsom-cm5-io.dts     |   1 -
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      |   1 -
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts   |   1 -
 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts  |   1 -
 .../arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts |   1 -
 arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts     |   1 -
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts    |   1 -
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           |   5 +
 .../boot/dts/rockchip/rk3588-armsom-sige7.dts      |   1 -
 arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dts  |   1 -
 .../arm64/boot/dts/rockchip/rk3588-coolpi-cm5.dtsi |   1 -
 .../boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtsi |   1 -
 .../boot/dts/rockchip/rk3588-lubancat-5io.dts      |   1 -
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi |   1 -
 arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dts   |   1 -
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts |   2 -
 .../boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi   |   1 -
 .../boot/dts/rockchip/rk3588-vicharak-axon.dts     |   1 -
 .../boot/dts/rockchip/rk3588-vicharak-vaaman2.dts  |   1 -
 .../boot/dts/rockchip/rk3588-youyeetoo-yy3588.dts  |   1 -
 arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts |   1 -
 arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts  |   1 -
 .../boot/dts/rockchip/rk3588s-gameforce-ace.dts    |   1 -
 .../boot/dts/rockchip/rk3588s-indiedroid-nova.dts  |   1 -
 .../arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts |   1 -
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts   |   1 -
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts   |   1 -
 45 files changed, 1204 insertions(+), 325 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.d=
ts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-mangopi-m28k.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-nanopi.dtsi




