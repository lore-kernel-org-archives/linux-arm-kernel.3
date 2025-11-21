Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C3ECFA47C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 14:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z+2FHPGQ8KaHgRzQ0SvKKUa0fA+0J0N8zKFskoR7lVE=; b=fpfer9RpCLxoNcPzLwVR0OpXHt
	3jYJ7jNwXPk2SYi6ETF79bA6r0PH7Nv51NPySf6c8894IOgw2cU8lEyd+8r9E1oj0wyOtIxPfqqBS
	9ifs51DDbfhU6pH9XhGdWWoztw4JGJl0ua01K4xfrDX9cZ3J+jyC+fQ7x5HqiUkwEr7my27S0s2lA
	ghumfHwrIrEjWuqSiSv9VE/d3IEUGiZlevTXsOMgTw/gbIijVc+/VzD6syrl0bDCGDDnau46xeDRa
	tCtU+bQoS6Lxk65IPU6+xF/4XlPJL8gKgsG8Id1rDFuhBWkvFfW4eEiMUvDwBPgye4w0fDz8VCj5t
	t1AamvTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMS9g-00000008WbU-0kWJ;
	Fri, 21 Nov 2025 14:30:32 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMS9c-00000008Wb7-37aZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 14:30:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5744D4E41831;
	Fri, 21 Nov 2025 14:30:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2498360719;
	Fri, 21 Nov 2025 14:30:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5FB0C10371423;
	Fri, 21 Nov 2025 15:30:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763735423; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Z+2FHPGQ8KaHgRzQ0SvKKUa0fA+0J0N8zKFskoR7lVE=;
	b=fpk4Q6LjG5CoMlbRdpEao0czinLXrrOXCQyFuF8KqtwsadIMZyV6DpUzA2Cy5YxuZmBZIH
	ggVdpdRa1+wEpq2efvNzV1EeqclYrZKvkiAfLkYqM+rg9suw9GHQUZiqmahP6ZN72dYZQM
	YgsV7YOccdBwSppoNXAnnnV4H9PG019ME/e8JHMhtQu0oJ2fmfD2BKlDiCOyk53zfHIcUL
	LZYxlAeaeGvFtdQRjVlEQnWRIo8quM8VF0WF3F/ZSpzQK292rGykhJNkDAclsx2S8ntERx
	h23iYXwqMvi1yD5gSG8HV53O8QpTpDPIYFk+F3I076dj/rQmK4ETjBxHL6Zzew==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>,  <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt64 for v6.19 (#1)
Date: Fri, 21 Nov 2025 15:30:21 +0100
Message-ID: <87ikf3a26a.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_063028_935089_62048A14 
X-CRM114-Status: UNSURE (   8.03  )
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

Hi,

Here is the first pull request for dt64 for mvebu for v6.19.

Gregory

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt64-6.19-1

for you to fetch changes up to f0e6bc0c3ef4b4afb299bd6912586cafd5d864e9:

  clk: mvebu: cp110 add CLK_IGNORE_UNUSED to pcie_x10, pcie_x11 & pcie_x4 (=
2025-11-10 15:19:00 +0100)

----------------------------------------------------------------
mvebu dt64 for 6.19 (part 1)

pinctrl node names cleanup from Rob on Marvell device tree files
Proper fix for pci errors on armada cp11x based platforms

----------------------------------------------------------------
Josua Mayer (2):
      Revert "arm64: dts: marvell: cn9132-clearfog: fix multi-lane pci x2 a=
nd x4 ports"
      clk: mvebu: cp110 add CLK_IGNORE_UNUSED to pcie_x10, pcie_x11 & pcie_=
x4

Rob Herring (Arm) (1):
      arm64/arm: dts: marvell: Rename "nand-rb" pinctrl node names

 arch/arm/boot/dts/marvell/armada-38x.dtsi         |  2 +-
 arch/arm/boot/dts/marvell/armada-xp-98dx3236.dtsi |  2 +-
 arch/arm64/boot/dts/marvell/armada-70x0.dtsi      |  2 +-
 arch/arm64/boot/dts/marvell/armada-80x0.dtsi      |  2 +-
 arch/arm64/boot/dts/marvell/cn9130-db.dtsi        |  2 +-
 arch/arm64/boot/dts/marvell/cn9132-clearfog.dts   | 16 ++--------------
 drivers/clk/mvebu/cp110-system-controller.c       | 20 ++++++++++++++++++++
 7 files changed, 27 insertions(+), 19 deletions(-)
--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

