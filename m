Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF245C36005
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 08:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4K3Qwsa6osT47RC+pxezJV4ZKGVwxR2f9TSemPDQ+RM=; b=ZmL579eIMv+rj0guEUQ29H8c2q
	EZIG/y/l6XJcoLmdfpV6ntDievImTjO9pIDHzv+q4+1MRnZ7lERWhsWjWOxpirNBVX8X3cACEs6Ob
	+D/AJppkrpdp8xHmEnxsvkJyi4mH+utn3OQFjkoFRSpCPRJ2bYCQlHqPp4foZ/Eql0UwqIfKjGvT8
	k/brQEXoip3QCXcZRtGp/CCeAc9eSAMv/jaguSX50K7DImoEs+fIrZ0c/gLEzrdhRBDs9PsULnlbo
	ktN04ttHMUvh0aRYPZCosSqYZ8wi3T9qtTcCpIYDlDwjAh4V1AqlCdUuLdX+3Z597y5Hq+lg0FA9q
	PNRmZmJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9KHW-00000005WoN-2TyF;
	Mon, 28 Apr 2025 08:56:06 +0000
Received: from mail-m16.yeah.net ([1.95.21.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9K4r-00000005V0e-0b2T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 08:43:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=4K3Qwsa6osT47RC+pxezJV4ZKGVwxR2f9TSemPDQ+RM=;
	b=qbJT/6nX6mSTCQCOCMYGvgyL6IwI2sY+D7ktj7c1vVNdgBMTucsfXvR6K3XRjs
	vRDzyVAMsX2o6BT0P2KQSBJZEFL0QAD/MLLmLqcTaCg6EZY7nLjeEYvw2Q6NiQZ0
	odel16PFErR6M7H8A5SaTyRkfPBwuSiti4uiuAVmFjP64=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAHLyR8Pw9oAgMVAA--.28245S3;
	Mon, 28 Apr 2025 16:42:38 +0800 (CST)
Date: Mon, 28 Apr 2025 16:42:36 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	kernel@pengutronix.de, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.15
Message-ID: <aA8/fFzh22s1Vtl1@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: Mc8vCgAHLyR8Pw9oAgMVAA--.28245S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zr1xCr47JF4rKFyDWw48Zwb_yoW8uF4UpF
	y3CrnxGr48Jr1xZrnxt3Wqq345Jws5A3WYvF13X340yF15Ar18Xrs8W34FgryUAryIv3yY
	yFyxtr9rK3WrZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uu6wNUUUUU=
X-Originating-IP: [117.81.80.76]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiARk9ZWgPB4HeVgAAsp
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_014301_592362_95694BBB 
X-CRM114-Status: UNSURE (   8.16  )
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

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.15

for you to fetch changes up to 5591ce0069ddda97cdbbea596bed53e698f399c2:

  arm64: dts: imx8mm-verdin: Link reg_usdhc2_vqmmc to usdhc2 (2025-04-27 21:49:30 +0800)

----------------------------------------------------------------
i.MX fixes for 6.15:

- An i.MX8MP change from Ahmad Fatoum to fix the broken nominal device
  tree caused by commit 9f7595b3e5ae ("arm64: dts: imx8mp: configure
  GPU and NPU clocks to overdrive rate")
- A MAINTAINERS update from Michael Riesch to exclude Sony IMX image
  sensor drivers from i.MX entry
- A i.MX95 device tree change from Richard Zhu to correct the range of
  PCIe app-reg region
- An opos6ul device tree change from Sébastien Szymanski to fix
  an Ethernet regression caused by commit c7e73b5051d6 ("ARM: imx:
  mach-imx6ul: remove 14x14 EVK specific PHY fixup")
- An imx8mm-verdin device tree change from Wojciech Dubowik to fix
  a SD card regression caused by commit f5aab0438ef1 ("regulator:
  pca9450: Fix enable register for LDO5")

----------------------------------------------------------------
Ahmad Fatoum (1):
      arm64: dts: imx8mp: configure GPU and NPU clocks in nominal DTSI

Michael Riesch (1):
      MAINTAINERS: add exclude for dt-bindings to imx entry

Richard Zhu (1):
      arm64: dts: imx95: Correct the range of PCIe app-reg region

Sébastien Szymanski (1):
      ARM: dts: opos6ul: add ksz8081 phy properties

Wojciech Dubowik (1):
      arm64: dts: imx8mm-verdin: Link reg_usdhc2_vqmmc to usdhc2

 MAINTAINERS                                        |  1 +
 .../boot/dts/nxp/imx/imx6ul-imx6ull-opos6ul.dtsi   |  3 +++
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi   | 25 ++++++++++++++++-----
 arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi  | 26 ++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95.dtsi           |  8 +++----
 5 files changed, 54 insertions(+), 9 deletions(-)


