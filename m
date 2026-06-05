Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCDC3CD6E7E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 22:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SyL+KhKJOkLBPVYqIVEYemJAAJqjAzpI1nf+X+CuAeI=; b=KrDRXyp38xF0zgrFgnAu5yX/I8
	E7bh0om6XJ3qB9PGkZizJHwJ9cmFG/cdw6tkyQ/H2Dc5Hfl4e4B8F1AKj+xZZS2WoWmfLXdKuYwED
	CsmrXXnyIixK37bDsHsLwIHjOJtgq4Vy16rqHykobqWDM/kpxb7gerwFfPZJF4PXwyU6VwH2oD+2F
	O2dtDXKMk+XR/wsf+TixOcKnrJ15r2hwIWWzd/NISgPEorxSa5FlqtNT8TZDFpjzrGmQ+4NZr/zFn
	qRVKET+hw70PsCVQME2V+nkSXduWLYyFquAd3Z16Mh0jOU6zYG8g0viH/S05ZBAnOZVsforKLIhJf
	Qc0f0Hhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVcsY-00000001GcV-26gK;
	Fri, 05 Jun 2026 22:19:02 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVcsW-00000001GbI-04xG;
	Fri, 05 Jun 2026 22:19:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=SyL+KhKJOkLBPVYqIVEYemJAAJqjAzpI1nf+X+CuAeI=; b=loz66b8dq7vrC22SV6JKCgdn34
	hgTPGakmdzwdWJHUXt9X50+NVZoUo4lxK4zPXerHNV+3lgNVgXi07/g2qP+wswru4+ErYkLjRTmYO
	p4PuwoqA3RAIFR8gYelrynX0d1CifSbPci/Kba8VUI10IkHhCQhnaDhi5xFBuRWED3Q3hkrjHqdL/
	hX8hiGO9UZU1Fl1SkWBgl3SJ3zfHcJSzIFiYXmO8vD8KRedruytvxXAj7LwfTfKbdlKRThbGeBCKt
	NcqteKD0kr7CZKGlyDSNVwECPFYjF2DD61BQD0QLUNUy7BFubjlgNsEp8hjlU+JU06EYoR7nwdWe0
	QUlqP5KA==;
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 7.2 #2
Date: Sat, 06 Jun 2026 00:18:53 +0200
Message-ID: <21578066.fAMKPKieAE@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_151900_116343_4F7AD196 
X-CRM114-Status: GOOD (  12.68  )
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

please find below some more Rockchip DT changes for the merge-window
for 7.2 .

The most interesting addition is of course basic camera support
on RK3588 which enables unfiltered camera capture (i.e. without
postprocessing for whitebalance etc)


Please pull.
Thanks
Heiko


The following changes since commit eb24b60553e0692cbbec2863ca31d2a56bff098d:

  arm64: dts: rockchip: Add watchdog node for RK3528 (2026-05-07 13:27:53 +=
0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
tags/v7.2-rockchip-dts64-2

for you to fetch changes up to 8545eda00fdf3d7e17933ce0f706d005b1bad42d:

  arm64: dts: rockchip: Fix vcc_sdio regulator max voltage on Pinebook Pro =
(2026-06-02 22:47:18 +0200)

=2D---------------------------------------------------------------
We've got basic camera support on RK3588!

New peripherals RK3588 vicap plus camera addition to some boards,
RK3528 USB and USB enablement on some boards, RGA3 support on RK3588.
Missing EL2 virtual timer interrupt added to RK3588.

Some more added peripherals for the Khadas Edge 2L board.

=2D---------------------------------------------------------------
Chen-Yu Tsai (2):
      arm64: dts: rockchip: Fix EEPROM compatible on rk3399-nanopi-r4s-ente=
rprise
      arm64: dts: rockchip: Disable removed devices from rk3399-nanopi-r4s

Chukun Pan (1):
      arm64: dts: rockchip: enable adc button for Radxa E25

Gray Huang (2):
      arm64: dts: rockchip: Enable USB for Khadas Edge 2L
      arm64: dts: rockchip: Add Bluetooth support for Khadas Edge 2L

Hugo Osvaldo Barrera (1):
      arm64: dts: rockchip: Fix vcc_sdio regulator max voltage on Pinebook =
Pro

Jonas Karlman (5):
      arm64: dts: rockchip: Add USB nodes for RK3528
      arm64: dts: rockchip: Enable USB 2.0 ports on Radxa E20C
      arm64: dts: rockchip: Enable USB ports on Radxa ROCK 2A/2F
      arm64: dts: rockchip: Enable USB 2.0 ports on ArmSoM Sige1
      arm64: dts: rockchip: Enable USB 2.0 ports on NanoPi Zero2

Marc Zyngier (1):
      arm64: dts: rockchip: Add EL2 virtual timer interrupt

Michael Riesch (3):
      arm64: dts: rockchip: add vicap node to rk3588
      arm64: dts: rockchip: add radxa camera 4k on rock 5b+ cam0
      arm64: dts: rockchip: add radxa camera 4k on rock 5b+ cam1

Sven P=C3=BCschel (1):
      arm64: dts: rockchip: add rga3 dt nodes to rk3588

 arch/arm64/boot/dts/rockchip/Makefile              |   7 ++
 .../dts/rockchip/rk3399-nanopi-r4s-enterprise.dts  |   2 +-
 .../arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi |  68 +++++++++++
 .../boot/dts/rockchip/rk3399-pinebook-pro.dts      |   2 +-
 .../boot/dts/rockchip/rk3528-armsom-sige1.dts      |  25 ++++
 .../boot/dts/rockchip/rk3528-nanopi-zero2.dts      |  29 +++++
 arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts |  60 +++++++++
 arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi    |  17 +++
 arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dts    |  11 ++
 arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dts    |  12 ++
 arch/arm64/boot/dts/rockchip/rk3528.dtsi           |  80 ++++++++++++
 arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dts  |  14 +++
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi      |   3 +-
 .../boot/dts/rockchip/rk3576-khadas-edge-2l.dts    |  82 +++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      | 135 +++++++++++++++++=
++++
 .../rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso      |  99 +++++++++++++++
 .../rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso      |  99 +++++++++++++++
 17 files changed, 742 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-=
cam4k-cam0.dtso
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-=
cam4k-cam1.dtso




