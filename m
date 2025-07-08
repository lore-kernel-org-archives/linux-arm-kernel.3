Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE22C83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 07:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kq+SB51IWx4bYSOte+h2bEHJqLVRzmFO3MooWcUuZaE=; b=ZIEBgr9a3tOoM39Vr2n8edJ94u
	P4h6OMh4QTezSf8oXHj1NBDG236MX5l9AbKzNoHfKPJSAzvb3B5JNc0jaTQc0I+ug7fuJ1fuHg2d4
	1B6R90/D2QAwEm0zr6WSz5cP95YxZXp+tP3iavn62rtgyZxkDMdDuCXgAmH6G/z9DL9EXmD+5M3l4
	IYg7aoaJOhUhsOEoXxGqrRCtfKkJje7ti1x1mE8ZlLN1i/CVHlhuMey+nsX/DCpdoU4kwaB6xU3k8
	6WIp3iu40CTs1up43lH4LgZk4w41tcZ1PEgKfmxjUfKWr4495OvvDAwD3rkXQt4r1T57lkgcbZb+r
	uQHS4Pzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3CE-00000004eoh-2i50;
	Tue, 08 Jul 2025 07:56:58 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ355-00000004dE0-443S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 07:49:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=kq+SB51IWx4bYSOte+h2bEHJqLVRzmFO3MooWcUuZaE=;
	b=CNaM7Y/SdBHvNuv3PZy9ah15cz/PUXZqtNyfTl0xaF4B/9JOQekha/EI2PV0ml
	0wEN1Cuk1ymEQdK6Fw/7TNdGEkoSOeWpkHVXVJYoDPmzoOjjJzp8t5HMmy4D20le
	LMkCJLdyLsU3FFSZNJggmS7jPVmJtyCyecsvkAIKAHTbo=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDHpsR5zWxowR9NAA--.48928S3;
	Tue, 08 Jul 2025 15:49:15 +0800 (CST)
Date: Tue, 8 Jul 2025 15:49:13 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	kernel@pengutronix.de, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.16
Message-ID: <aGzNeZ7KtsRsUkZT@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CM-TRANSID: Mc8vCgDHpsR5zWxowR9NAA--.48928S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zr1fGFyfKw18Gw4kAF47urg_yoW8tw1UpF
	43CrZFgr15Jrs5GrnxXrs7t3s8tw4rJF45Ar17Cry8KrW5ur9xXr15GryrWrZFvrWxuw4Y
	yF1kXryqg345XaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jc0eLUUUUU=
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIRvGLGhszXt6qwAA3z
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_004936_575974_83B47973 
X-CRM114-Status: UNSURE (   9.51  )
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

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.16

for you to fetch changes up to fbe94be09fa81343d623a86ec64a742759b669b3:

  arm64: dts: freescale: imx8mm-verdin: Keep LDO5 always on (2025-07-07 15:36:41 +0800)

----------------------------------------------------------------
i.MX fixes for 6.16:

- Keep LDO5 always on for imx8mm-verdin to fix broken Ethernet support
- Add big-endian property back for LS1046A watchdog, as the removal was
  an accident
- Fix DMA interrupter number of i.MX95 pcie0_ep device
- A set of changes from Tim Harvey to fix TPM SPI frequency on
  imx8mp-venice devices
- A couple of changes from Wei Fang to fix NETC overshoot issue on
  i.MX95 EVK boards

----------------------------------------------------------------
Francesco Dolcini (1):
      arm64: dts: freescale: imx8mm-verdin: Keep LDO5 always on

Meng Li (1):
      arm64: dts: add big-endian property back into watchdog node

Richard Zhu (1):
      arm64: dts: imx95: Correct the DMA interrupter number of pcie0_ep

Tim Harvey (4):
      arm64: dts: imx8mp-venice-gw71xx: fix TPM SPI frequency
      arm64: dts: imx8mp-venice-gw72xx: fix TPM SPI frequency
      arm64: dts: imx8mp-venice-gw73xx: fix TPM SPI frequency
      arm64: dts: imx8mp-venice-gw74xx: fix TPM SPI frequency

Wei Fang (2):
      arm64: dts: imx95-19x19-evk: fix the overshoot issue of NETC
      arm64: dts: imx95-15x15-evk: fix the overshoot issue of NETC

 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi       |  3 ++-
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi     |  1 +
 .../boot/dts/freescale/imx8mp-venice-gw71xx.dtsi     |  2 +-
 .../boot/dts/freescale/imx8mp-venice-gw72xx.dtsi     |  2 +-
 .../boot/dts/freescale/imx8mp-venice-gw73xx.dtsi     |  2 +-
 .../boot/dts/freescale/imx8mp-venice-gw74xx.dts      |  2 +-
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts    | 20 ++++++++++----------
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts    | 12 ++++++------
 arch/arm64/boot/dts/freescale/imx95.dtsi             |  2 +-
 9 files changed, 24 insertions(+), 22 deletions(-)


