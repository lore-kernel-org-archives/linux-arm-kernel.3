Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CD4CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 23:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=88KBlL4xUTV7siG+o+5Td6u+tNx+n4ecg/FuEBRQIzg=; b=P+TkUHgq1uYwtn0VlomgpDvrFE
	vp6g6Ywiw9byf6UWppdjyvwkOGwZ2TfbV58vwE7ZP23IZuegYie5f/83ejA0FkHSXrefnuZOPE9+1
	yZThFIJywKY6HnbsS68r268EZ5COShW3wMtcTR5H/9IJ/uwiFRfBtks5O3qv6RAhyRFCEZPDEdVNi
	2Q4TlwLTpC39w4cksYAKf6g0ZqXcGq7sjthpp1teEOPnkqgIDLrgSUvGo9rDFWF2cYgA4/aDpsEpG
	lToXY24YnUjgeiQz389sNYqZibKLEU3uguNdlEhpsWk4ws/cqEsILh7v3anlkF+7GkwMNLbCaJmaI
	a3JFIfQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEbn7-000000057FY-0Pov;
	Thu, 30 Oct 2025 23:10:49 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEbms-000000057C4-3u9O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 23:10:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1761865827;
	bh=88KBlL4xUTV7siG+o+5Td6u+tNx+n4ecg/FuEBRQIzg=;
	h=Subject:From:To:Cc:Date;
	b=DyVQKM9AN351thCoS8lCuUYSZbGE3zHkEb1My2e1PTyKyUc4BKNLPTaBen5Uj9+Zx
	 Tf61VjJJH8VUfWMAmIG+MzBqGRvacQmjxpE3QmZh/OV8GIvjLBnqrJiTaOTaEN9I0x
	 xnZEdWwRfuF4rHGF9wzEWsGXHdplY/6rh1B/5k+m7Zy6Uw1Rz6zwqFEUArJgWaBGkm
	 bjY0cjy1YqQcrtQ/C70eCsbvIy7Ddis84NYNxM9VzbWfn1/rsuKvZ+dA1kSiaSrF9O
	 +MyzJjRDTnDG8HSHgtBAWcK5qSZz02oVJTDU7i/Bu6vhMK3g/m3qjpft6yLlNHpRgS
	 yomLHRmC3I/gw==
Received: from [IPv6:2405:6e00:2421:7372:17cf:8b2f:ac7e:ac4d] (unknown [120.20.6.198])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9C2D278C99;
	Fri, 31 Oct 2025 07:10:26 +0800 (AWST)
Message-ID: <d2bd7e3e6045ac68875fd220e528c76f4fb2faac.camel@codeconstruct.com.au>
Subject: [GIT PULL] aspeed: First batch of devicetree changes for 6.19
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Fri, 31 Oct 2025 09:40:25 +1030
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_161035_252694_459D1011 
X-CRM114-Status: GOOD (  10.43  )
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

Hello SoC maintainers,

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787=
:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/aspeed=
-6.19-devicetree-0

for you to fetch changes up to 6953afcd81a2cc73784e3dd23faa0a1aaf97441a:

  ARM: dts: aspeed: santabarbara: Add eeprom device node for PRoT module (2=
025-10-17 16:44:13 +1030)

----------------------------------------------------------------
First batch of ASPEED Arm devicetree changes for 6.19

Significant changes:

- The IBM Power11 FSI DTSIs have been rearranged to accommodate new systems

New platforms:

- IBM Balcones

  The Balcones system is similar to Bonnell but with a POWER11 processor.
  Like POWER10, the POWER11 is a dual-chip module, so a dual chip FSI
  tree is needed.

- Meta Yosemite5

  The Yosemite5 platform provides monitoring of voltages, power,
  temperatures, and other critical parameters across the motherboard,
  CXL board, E1.S expansion board, and NIC components.

Updated platforms:

- clemente (Meta): LEDs, shunt resistor configuration
- santabarbara (Meta): AMD APML, EEPROMs, LEDs, GPIO line names, MCTP for N=
ICs

There are a scattering of one-off changes and devicetree cleanups for other
platforms as well.

----------------------------------------------------------------
Daniel Hsu (1):
      ARM: dts: aspeed: harma: Add MCTP I2C controller node

Eddie James (4):
      dt-bindings: arm: aspeed: add IBM Balcones board
      dt-bindings: arm: aspeed: add IBM Bonnell board
      ARM: dts: aspeed: Add Balcones system
      ARM: dts: aspeed: Fix max31785 fan properties

Fred Chen (7):
      ARM: dts: aspeed: santabarbara: Add blank lines between nodes for rea=
dability
      ARM: dts: aspeed: santabarbara: Add sensor support for extension boar=
ds
      ARM: dts: aspeed: santabarbara: Enable MCTP for frontend NIC
      ARM: dts: aspeed: santabarbara: Add bmc_ready_noled Led
      ARM: dts: aspeed: santabarbara: Add gpio line name
      ARM: dts: aspeed: santabarbara: Add AMD APML interface support
      ARM: dts: aspeed: santabarbara: Add eeprom device node for PRoT modul=
e

Kevin Tung (2):
      dt-bindings: arm: aspeed: add Meta Yosemite5 board
      ARM: dts: aspeed: yosemite5: Add Meta Yosemite5 BMC

Leo Wang (2):
      ARM: dts: aspeed: clemente: add shunt-resistor-micro-ohms for LM5066i
      ARM: dts: aspeed: clemente: Add HDD LED GPIO

Zane Li (1):
      ARM: dts: aspeed: yosemite4: allocate ramoops for kernel panic

 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml      |    3 +
 arch/arm/boot/dts/aspeed/Makefile                             |    2 +
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts     |    9 +-
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts        |    8 +
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts |  919 +++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts    |   14 ++
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts    | 1067 +++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dts          |  609 +++++=
+++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dts           |    4 -
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts           |    8 -
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dts           |   12 -
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts            |   36 ---
 arch/arm/boot/dts/aspeed/ibm-power11-dual.dtsi                |  779 +++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/aspeed/ibm-power11-quad.dtsi                |  769 +----=
----------------------------------------------------------
 14 files changed, 3405 insertions(+), 834 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.=
dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dts
 create mode 100644 arch/arm/boot/dts/aspeed/ibm-power11-dual.dtsi


