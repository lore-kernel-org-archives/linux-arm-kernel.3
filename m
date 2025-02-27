Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B65C19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 10:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qd4HzO5DI05dF9t4EH+iv2z6iNBamypUQVWMX+idBZQ=; b=MS+fWClDtNedL7JK00/1Q2+XLi
	Xyn8RAabjUv86YPQueliIknfzN9pdQxiXK6HENlS/bI9UzCEgyVVwRtY52DDMs5ED/v7/cm3kG5vn
	PyKvAPxSeNojDMmqLdhBoiwkXPQlWeR3GwdMsbvDzwMLxWDbWpbh5bjBORh20HYUxm5w57ZSn69+z
	Y4nrrug1dC/07dhGRM7U8lWLjpCuUmQF5X10buKSxDZNlSXHc9VXBzeI4PzlTdCTxem6VkLtZs1Oa
	j991MsmDIvx9IR/CY/hpzgCu6R39falc2b0AIvMda9fTk/dAqqtxMagdXz+dAq1IWza7+To/vUFPc
	JDIoil1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnbBX-000000070EZ-2HnK;
	Thu, 27 Feb 2025 10:32:07 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnb9y-0000000707L-2qpv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 10:30:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=qd4HzO5DI05dF9t4EH+iv2z6iNBamypUQVWMX+idBZQ=;
	b=de6IKaUWk4gJS58kgVUA8ARoMXnGwGbRNG4BeySV+MMY3ZiTd1W24oSrMyonRA
	Xft550fi30swTpCZE7b9RAa4Ocbx4Uy9E6eIt/yF3FFcaezDzUwADcWLq5be/OcW
	tZrTUTJXSNocCDhrCKPGcwGJnDFUzohLZBjyGa4rlgegU=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgC3EYquPsBnJxMcCg--.28199S3;
	Thu, 27 Feb 2025 18:30:08 +0800 (CST)
Date: Thu, 27 Feb 2025 18:30:06 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	kernel@pengutronix.de, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.14
Message-ID: <Z8A+rihFV4K3l8QR@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CM-TRANSID: Ms8vCgC3EYquPsBnJxMcCg--.28199S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7ArW7WF18WFykKFW8XF1UKFg_yoW8CFW3pF
	4fArnxKr18JryfArnxXw48XF9xta1rJF45Wr13t3y8CF15CFn7Jr1jqryIgry2qryxAr43
	tF17JryUCFy5Ww7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uu6wNUUUUU=
X-Originating-IP: [117.82.86.124]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBA8BZWfANJQmPgAAsw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_023031_075134_A41E4AB7 
X-CRM114-Status: UNSURE (   6.67  )
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

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.14

for you to fetch changes up to 2c1092823eb03f8508d6769e2f38eef7e1fe62a0:

  arm64: dts: freescale: imx8mm-verdin-dahlia: add Microphone Jack to sound card (2025-02-23 16:13:33 +0800)

----------------------------------------------------------------
i.MX fixes for 6.14:

- A tqma8mpql board fix from Alexander Stein to correct vqmmc-supply for
  usdhc3
- A change from Joe Hattori to fix OF node leak in imx-scu driver probe
- A soc-imx8m driver fix from Peng Fan unregister cpufreq and soc device
  in cleanup path
- A couple of changes from Stefan Eichenberger to fix iMX6 Apalis
  poweroff and iMX8M verdin-dahlia sound-card descriptions

----------------------------------------------------------------
Alexander Stein (1):
      arm64: dts: freescale: tqma8mpql: Fix vqmmc-supply

Joe Hattori (1):
      firmware: imx-scu: fix OF node leak in .probe()

Peng Fan (1):
      soc: imx8m: Unregister cpufreq and soc dev in cleanup path

Stefan Eichenberger (3):
      ARM: dts: imx6qdl-apalis: Fix poweroff on Apalis iMX6
      arm64: dts: freescale: imx8mp-verdin-dahlia: add Microphone Jack to sound card
      arm64: dts: freescale: imx8mm-verdin-dahlia: add Microphone Jack to sound card

 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi      | 10 ++++-----
 .../boot/dts/freescale/imx8mm-verdin-dahlia.dtsi   |  6 ++---
 .../arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi | 16 ++++---------
 .../boot/dts/freescale/imx8mp-verdin-dahlia.dtsi   |  6 ++---
 drivers/firmware/imx/imx-scu.c                     |  1 +
 drivers/soc/imx/soc-imx8m.c                        | 26 ++++++++++++++++++++--
 6 files changed, 40 insertions(+), 25 deletions(-)


