Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6984CCD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 02:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0P5xTtK6qJk11drFxut88gGWQ14R3F9398eX/Saen6s=; b=iRefIcax6zk4kIfLf+XP5270vy
	AisGiNnlwAkRXnH67A1mhreo9Dx73i4KPwuLuIEeD28ks8bFsrdPe+y1Ff9ICF+XeISo9M7dNQ6oE
	yrv0RNaxfshys+bGxEggDD+431HwIEClGyp4sVvCYThc0vcbpV47ji7dQEvPfYZdVN9JlIaO2Py9w
	eIqMMrFc5XzRhvuxNbyX+AkGS4zfRlHzXla5M9lNsj348b0yPQxAr7J7lVX/rMJ81xZRho0OoCmtH
	YK5ozXMp7gelAjKZddU8MCu5poHHp7M6WhLg5j8q3bai71QYNJIn+CAYeszUSTDI56VIH4Uew2xDN
	5kn7ATPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUbQt-0000000E78B-0Cbq;
	Wed, 03 Jun 2026 02:34:15 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUbQq-0000000E77l-0a8v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 02:34:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1780454050;
	bh=0P5xTtK6qJk11drFxut88gGWQ14R3F9398eX/Saen6s=;
	h=Subject:From:To:Cc:Date;
	b=LY5gsaZEH8JGU8zm2qE+glifMq+UTc38flMyOSQoQ6WcAyQUQSpa4NdyJnnAk16zV
	 OaloRtqWrAABbM6nKhJ2NqxjBV/eMzuw9kFzyHnklntr58HYkBpeb6M33FBfBIeVxN
	 IMAbL3qUOjTHOpmsPdB21cxUYB9kuhaC5/VEDsGu5+GxSr9EfAJ2eZHcFaalS6qW8K
	 E/VZUKf/kTpYVvQ6wO7QjFrCG824k8kbaUpEpJ1mNMseE+syVhLK+dK6/2z99TSNHk
	 93NZY/ZgvTam5ER0zT5A2k4K3Aqn8U/zQ5kYv3J3csekPY+O+Ucwe0ndsh1mxRzW8Q
	 MUeDo3GpFnvCw==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 44A5960087;
	Wed,  3 Jun 2026 10:34:09 +0800 (AWST)
Message-ID: <55ab27bc5e09252b1dbfdf1505693eb193b8e846.camel@codeconstruct.com.au>
Subject: [GIT PULL] aspeed: First batch of ARM devicetree changes for v7.2
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Wed, 03 Jun 2026 12:04:08 +0930
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_193412_379822_848DA3B7 
X-CRM114-Status: GOOD (  10.57  )
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

aspeed: First batch of ARM devicetree changes for v7.2

New platforms:

- Rainiera6 (Meta)
- SanMiguel (Meta)

Updated platforms:

- Anacapa: SGPIO line names and interrupt configuration
- Clemente: Remove TMP421 nodes
- Kommando: Enable networking via MAC2/MDIO2
- SanMiguel: Line names and interrupt configuration

AST2600 SoC updates:

- Describe PWM/Tach
- Describe I3C controllers
- Reorganise I2C nodes

Other notes:

91b9aed7381c ("ARM: dts: aspeed-g6: Add nodes for i3c controllers") current=
ly
causes a new warning:

  ... /ahb/apb/bus@1e7a0000/syscon@0: failed to match any schema with compa=
tible: ['aspeed,ast2600-i3c-global', 'syscon']

The patch necessary to address it has an R-b tag from Kryzsztof[2] but as b=
est
I can tell is yet to be applied to the MFD tree. I've left the change in fo=
r now
as the warning will resolve once the binding patch is applied.

Lastly, as part of improving support for the Kommando card Anirudh has also
addressed[1] the persistent pain we've had with the phy-mode property for t=
he
AST2600 MACs. Thanks to Andrew Lunn for being on the case for a while now, =
and
for those who tested Anirudh's patch.

[1]: https://lore.kernel.org/all/20260525-asus-kommando-v3-0-e6a0ca1b4a3e@g=
mail.com/
[2]: https://lore.kernel.org/all/20260425-poised-accomplished-hyena-d2c1a0@=
quoll/

----------------------------------------------------------------
Anirudh Srinivasan (1):
      ARM: dts: aspeed: Enable networking for Asus Kommando IPMI Card

Billy Tsai (1):
      ARM: dts: aspeed: g6: Add PWM/Tach controller node

Colin Huang (1):
      ARM: dts: aspeed: anacapa: Add JTAG CPLD TRST pin to SGPIO map

Daniel Hsu (1):
      ARM: dts: aspeed: yosemite5: Add MP5998 power monitor

Dawid Glazik (2):
      ARM: dts: aspeed-g6: move i2c controllers directly into apb node
      ARM: dts: aspeed-g6: Add nodes for i3c controllers

Ender Hsieh (1):
      ARM: dts: aspeed: msx4: enable BMC networking via MAC0

Mike Hsieh (1):
      ARM: dts: aspeed: clemente: Remove IOB NIC TMP421 nodes

Neil Cheng (2):
      dt-bindings: arm: aspeed: Add Meta Rainiera6 board
      ARM: dts: aspeed: rainiera6: Add Meta Rainiera6 BMC

Potin Lai (4):
      dt-bindings: arm: aspeed: add Meta SanMiguel BMC
      ARM: dts: aspeed: Add Meta SanMiguel BMC
      ARM: dts: aspeed: sanmiguel: Add IOEXP interrupt pin settings
      ARM: dts: aspeed: sanmiguel: Fix the CPU_CHIPTHROT linename

Rex Fu (2):
      ARM: dts: aspeed: anacapa: Add interrupt properties for PDB PCA9555
      ARM: dts: aspeed: anacapa: Correct SGPIO names for monitoring

 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml        |    2 +
 arch/arm/boot/dts/aspeed/Makefile                               |    2 +
 arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts |   18 ++
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts        |   34 ++-
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts       |   20 --
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-rainiera6.dts      | 1012 +++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts      |  672 +++=
++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts      |    5 +
 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dts         |   15 ++
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi                         |  552 +++=
++++++++++++++++++++++++--------------------
 10 files changed, 2074 insertions(+), 258 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-rainiera6.=
dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.=
dts


