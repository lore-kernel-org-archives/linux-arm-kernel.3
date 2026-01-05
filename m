Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5D8C2A062
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 04:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tSnwqQ4DEG5Xd/QNiEqxoVCY2/oYuSe+axqra58I6ko=; b=tCp7DUWBNihxtZrQlWbJBHoNYy
	GMlyNBJW0Rtd8tWCP2NmF1tXk0WdI3MYQuSzFeXbh9+9TJAs1CWGyMpjAhgk80cV62r4ghhd6m/fv
	ARPGvcnlhRI6nto2y0JkB3q2YCxHpgxaJHxyvwctaUHF2sfQgzHlKK1KMUuXXWvN5p/xOLxDiN1cB
	F+g+Cpjmw1jd763VunljIpJF8LHIMcGHwB6BbJ/xNizKcGq1g53sjab8lD8rG+HyWJa7oxEsF5NfP
	GTFEJj5C2wQ38MJYcVSvtfOXWNDGVJtwWjvJ6hdzaMYa5owCzt380ugPEtsI04HDCYhtiCUHq4RUI
	uSmAOVdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccPC-0000000Ahyp-2WMO;
	Mon, 05 Jan 2026 04:41:22 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccP8-0000000AhyQ-2Nrt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 04:41:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1767588067;
	bh=tSnwqQ4DEG5Xd/QNiEqxoVCY2/oYuSe+axqra58I6ko=;
	h=Subject:From:To:Cc:Date;
	b=m03LK9lhp4zWDB6gJBtFLHzjJ5LzZfmvgtajryyBo+CFzyqXiXNm0e1ajCeqjHO71
	 iwH7I5qkN0I2LgxDy7gu7rzhKb9AVCCTzj2ijJdmAjI/l6TdfyCT4mBIwIUgpUij1t
	 Iy/4yN1B3Q+AOL8awvYxQNWHo6653S9Q70rohj/obfHP6FoJVlucR2bv5bcU2V43wp
	 xCjhBnBzOMJyKNMgJ2A4C9BrFF9HbZ4ZDP0JyrGXEucAjJ6Yqv4nUzz1HYreZKpjhn
	 VqFpoeG+PSbfKcGxK09n4pwHQcepK3xnMPcuVzxGpa03exudol54CAv8WvVP1BnLKu
	 WnTmw6V0TacjQ==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 8B88B7C1B2;
	Mon,  5 Jan 2026 12:41:04 +0800 (AWST)
Message-ID: <4ab756729c4e26f7e544156c8613e839a9a9bebe.camel@codeconstruct.com.au>
Subject: [GIT PULL] aspeed: first batch of devicetree changes for 6.20
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Mon, 05 Jan 2026 15:11:03 +1030
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_204118_967060_1AFC9CF0 
X-CRM114-Status: UNSURE (   8.24  )
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

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8=
:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/aspeed=
-6.20-devicetree-0

for you to fetch changes up to 459a5aa171c0f13fcd78faa9594dc4aa5a95770b:

  ARM: dts: aspeed: bletchley: Fix ADC vref property names (2025-12-17 15:5=
3:31 +1030)

----------------------------------------------------------------
First batch of ASPEED Arm devicetree changes for 6.20

New platforms:

- NVIDIA MSX4 BMC

  The NVIDIA MSX4 HPM (host platform module) is a reference board for
  managing up to 8 PCIe connected NVIDIA GPUs via ConnectX-8 (CX8)
  SuperNICs. The BMC manages all GPUs and CX8s for both telemetry and
  firmware update via MCTP over USB. The host CPUs are dual socket Intel
  Granite Rapids processors.

  For more detail on this architecture:

  https://developer.nvidia.com/blog/nvidia-connectx-8-supernics-advance-ai-=
platform-architecture-with-pcie-gen6-connectivity/

Updated platforms:

- ast2600-evb (ASPEED): Various tidy-ups to address binding warnings
- bletchley (Meta): Watchdog fix, tidy-ups to address binding warnings
- clemente (Meta): HDD LED fix, GPIO line names, EEPROMs
- harma (Meta): fanboard presence GPIO
- santabarbara (Meta): IPMB, GPIO line names, additional IO expander

----------------------------------------------------------------
Alex Wang (1):
      ARM: dts: aspeed: clemente: move hdd_led to its own gpio-leds group

Andrew Jeffery (6):
      ARM: dts: aspeed: Remove sdhci-drive-type property from AST2600 EVB
      ARM: dts: aspeed: Use specified wp-inverted property for AST2600 EVB
      ARM: dts: aspeed: Drop syscon compatible from EDAC in g6 dtsi
      ARM: dts: aspeed: g6: Drop unspecified aspeed,ast2600-udma node
      ARM: dts: aspeed: ast2600-evb: Tidy up A0 work-around for UART5
      ARM: dts: aspeed: g6: Drop clocks property from arm,armv7-timer

Cosmo Chou (6):
      ARM: dts: aspeed: bletchley: remove WDTRST1 assertion from wdt1
      ARM: dts: aspeed: bletchley: Use generic node names
      ARM: dts: aspeed: bletchley: Fix SPI GPIO property names
      ARM: dts: aspeed: bletchley: Remove unused pca9539 properties
      ARM: dts: aspeed: bletchley: Remove unused i2c13 property
      ARM: dts: aspeed: bletchley: Fix ADC vref property names

Daniel Hsu (1):
      ARM: dts: aspeed: harma: add fanboard presence sgpio

Fred Chen (2):
      ARM: dts: aspeed: santabarbara: Add swb IO expander and gpio line nam=
es
      ARM: dts: aspeed: santabarbara: Enable ipmb device for OCP debug card

Kimi Chen (1):
      ARM: dts: aspeed: clemente: add gpio line name to io expander

Leo Wang (1):
      ARM: dts: aspeed: clemente: Add EEPROMs for boot and data drive FRUs

Marc Olberding (2):
      dt-bindings: arm: aspeed: Add NVIDIA MSX4 board
      ARM: dts: aspeed: Add NVIDIA MSX4 HPM

 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml      |   1 +
 arch/arm/boot/dts/aspeed/Makefile                             |   1 +
 arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts               |   7 +++---=
-
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts    | 106 ++++++=
++++++++++++++++++++++++++++++++++++++++++++++++---------------------------=
-------------------------
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts     |  43 ++++++=
+++++++++++++++++++++++++++++++------
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts        |   8 ++++++=
--
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts |  29 ++++++=
+++++++++++++++++++----
 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dts       | 246 ++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi                       |  12 +-----=
------
 9 files changed, 374 insertions(+), 79 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dts


