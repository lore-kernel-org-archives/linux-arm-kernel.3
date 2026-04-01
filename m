Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D01B10FCADC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 21:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CgQ0riG099Ng810rA77pJLFLouGFW6v9pWnuuSLHYA8=; b=exhn3j5BQ+OMqysWQvMON5E723
	bar+0eZR6BsqZxVWjBHb8oAzS4ugqpOfB7Q57A0Ti38FBg4IVgWosgLopTQyh93xFc/aZiLDoyD2t
	iEGKMduU+N12tL5J53hOXVAPcE4DWNHjLW97I03FhgWw1auwGVA2GVeoE+XAn1j3vze//Wk/6w5Vb
	DvE37Cj6/LAY0xEkhh2XZJGbWk2dp7HjvSoSnMcpf5PH3cJTiYBihqiH2HgTcrMXWVG3+tHelU066
	JjT4zOpZfoua4tTIFngNMGyWT9lzaej7BLPZWhJyGiLo5ZGNqTQmAtRv3TgCnZFrrJAsIQ4IzgSrQ
	u8XxC9Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w836V-0000000G6wP-14JV;
	Wed, 01 Apr 2026 21:27:59 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w836O-0000000G6vj-12PX;
	Wed, 01 Apr 2026 21:27:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=CgQ0riG099Ng810rA77pJLFLouGFW6v9pWnuuSLHYA8=; b=1ZSAu4a8MGgxzMttGWd2CqVwMd
	8VwEeDUgh9p9DdHxy4k9NgO2VAXOB0faNqM8TSPtxZkEZMXSxOTnRxONOHygabn7Cr/EZN0W4+DhY
	H/HPaLy78lVS3F9bWYMjg7IW5QD9uFHMXoKU+knwpch+orC7Jn14rhhmW5ff8cGM12aqUqaqzgHja
	xG6oBLxjZlMbT/O+YqTTd9JvKo0i0Ar2XnAtvtttXlw22HS2u6g39ZMpfZZYtFdhwzTK2h4uuT08C
	dDnuxnc2ACyI2wa6Naoa9Xf06cuKQQeGDw7moWvdRV0Wlk62sWdZaf4tNenfrcHhx+3mT5ErN7U02
	MFT9KzwQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 7.1 #2
Date: Wed, 01 Apr 2026 23:27:47 +0200
Message-ID: <2902697.BEx9A2HvPv@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_142752_332844_804FD9A8 
X-CRM114-Status: GOOD (  13.31  )
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
for 7.1 .

This time they have also marinated longer in next without complaints.


Please pull.
Thanks
Heiko


The following changes since commit d7787a77cf8b129304f590233032556dec10dfc6:

  arm64: dts: rockchip: enable vicap dvp on wolfvision pf5 io expander (202=
6-03-13 21:39:34 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
tags/v7.1-rockchip-dts64-2

for you to fetch changes up to 6cb4ec63ba9a5831621cf951b7af55c67beeb97b:

  arm64: dts: rockchip: configure hdmirx in Rock 5 ITX (2026-03-26 00:34:54=
 +0100)

=2D---------------------------------------------------------------
New board, the Khadas Edge 2L. Newly added peripherals are the
OTP nvmem controllers for RK3528, RK3562 and RK3566/8, SPDIF on RK3576.
The RK3566/8 SoCs now also control the Pipe-clocks on their PCIe
controllers and UFSHC controller on RK3576 got an additional reset line.

Apart from that are of course individual board changes and fixes for
older issues that are not specific to the current development cycle.

=2D---------------------------------------------------------------
Anand Moon (1):
      arm64: dts: rockchip: Enable PCIe CLKREQ# for RK3588 on Rock 5b-5bp-5=
t series

Chris Morgan (2):
      arm64: dts: rockchip: Correct Fan Supply for Gameforce Ace
      arm64: dts: rockchip: Correct Joystick Axes on Gameforce Ace

David Heidelberg (1):
      arm64: dts: rockchip: assign pipe clock to rk356x PCIe lanes

Gray Huang (2):
      dt-bindings: arm: rockchip: Add Khadas Edge 2L board
      arm64: dts: rockchip: Add Khadas Edge 2L board

Heiko Stuebner (2):
      arm64: dts: rockchip: Enable OTP controller for RK3562
      arm64: dts: rockchip: Enable OTP controller for RK356x

Jonas Karlman (1):
      arm64: dts: rockchip: Enable OTP controller for RK3528

Ming Wang (1):
      arm64: dts: rockchip: Fix Bluetooth stability on LCKFB TaiShan Pi

Pedro Alves (1):
      arm64: dts: rockchip: configure hdmirx in Rock 5 ITX

Robin Murphy (1):
      Revert "arm64: dts: rockchip: add SPDIF audio to Beelink A1"

Sebastian Reichel (2):
      arm64: dts: rockchip: Add SPDIF nodes to RK3576 device tree
      arm64: dts: rockchip: add SD/eMMC aliases for ArmSom Sige5

Shawn Lin (1):
      arm64: dts: rockchip: Add mphy reset to ufshc node

=E8=B0=A2=E8=87=B4=E9=82=A6 (XIE Zhibang) (1):
      arm64: dts: rockchip: Fix RK3562 EVB2 model name

 .../devicetree/bindings/arm/rockchip.yaml          |  5 ++
 arch/arm64/boot/dts/rockchip/Makefile              |  1 +
 arch/arm64/boot/dts/rockchip/rk3328-a1.dts         | 23 ------
 arch/arm64/boot/dts/rockchip/rk3528.dtsi           | 47 ++++++++++++
 arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dts   |  2 +-
 arch/arm64/boot/dts/rockchip/rk3562.dtsi           | 46 ++++++++++++
 arch/arm64/boot/dts/rockchip/rk3566-lckfb-tspi.dts |  4 +-
 arch/arm64/boot/dts/rockchip/rk3568.dtsi           | 12 ++-
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi      | 52 ++++++++++++-
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      |  2 +
 .../boot/dts/rockchip/rk3576-khadas-edge-2l.dts    | 34 +++++++++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 87 ++++++++++++++++++=
+++-
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts | 12 +++
 .../boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi   |  6 +-
 .../boot/dts/rockchip/rk3588s-gameforce-ace.dts    | 12 +--
 15 files changed, 303 insertions(+), 42 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts




