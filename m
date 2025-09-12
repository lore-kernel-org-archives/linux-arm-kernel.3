Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF6ACAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 14:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Bh6lev1UNCESNw2mOnhwcMCgXQC7sNspGByTb4mN6ic=; b=kPPV17v1+xvZwxnYNUJACBPJaJ
	9temLsVe7neNj67cg+Htydc+ju5UIvd09ktixvVqe+k+uRGdslV7XrU7GEE8Tw83KmVvOXHbYNVeF
	bwVyvkda7NtA2k5AFXnWcrnlP+kgQfHzUHTEwfdWWWnKwZaK4yukQvjdDq808LLX0SsxVsZUpNyNG
	zrhDDACm/ShfV4gvItviZaTGCgXVMvkS2KhGEXzpOzmp+L4BgdT/lxkO2vYfDOqTLbLXukKQSzu/Y
	gBpbXTVq0vdlxgJQFI4Vqgqf2D9FdAmmqWjPZEp88PjFQtPrfR3YikI+wEfZCr/gZVJcHzeDbd97e
	eoMNgx5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4gk-00000009rGT-1M1u;
	Fri, 12 Sep 2025 14:23:46 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4gh-00000009rCR-0iI5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 14:23:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Bh6lev1UNCESNw2mOnhwcMCgXQC7sNspGByTb4mN6ic=;
	b=TEpx6NUW7mChNKtapFhFOgQ5td4e+L9NbhQUbdE8iZdl3X5QEzkjJKCyBaD1EQ
	NLZvjDZh2gGzzJRKl01jS0HH1Wa8lIC0799/CHWcIgFYLMXfjIlQQm/ciQMD3zr9
	ExRcV72VqNv9ptvOlVkrE0VdadwPJtDXgIy61r2V+J/IQ=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgAHdtvbLMRoo6N0BA--.61488S3;
	Fri, 12 Sep 2025 22:23:24 +0800 (CST)
Date: Fri, 12 Sep 2025 22:23:23 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	kernel@pengutronix.de, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.17, round 2
Message-ID: <aMQs2zr4fYl2DYVr@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CM-TRANSID: Ms8vCgAHdtvbLMRoo6N0BA--.61488S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7WrW7tw47tw1kCFWkZrW5ZFb_yoW8GF4rpF
	43Gry3Kr1UGryxJr93Jr40q3y5Gr1kJr4Utr47X348ZrW5A3WUJr1qyr1rWrWUJFy29r4Y
	9F1rXr1DKw1DAr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jBMKZUUUUU=
X-Originating-IP: [114.216.146.49]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNx2N8mjELN0kVQAA35
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_072343_541857_ADBD1999 
X-CRM114-Status: UNSURE (   6.19  )
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

The following changes since commit 37e5caa5571b5a60b0c835a0bc09ab1e53f57bfe:

  arm64: dts: imx95: Fix JPEG encoder node assigned clock (2025-08-22 17:45:30 +0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.17-2

for you to fetch changes up to a50342f976d25aace73ff551845ce89406f48f35:

  arm64: dts: imx8mp: Correct thermal sensor index (2025-09-11 11:25:04 +0800)

----------------------------------------------------------------
i.MX fixes for 6.17, round 2:

- Fix mach-imx Kconfig to select the correct PIT timer option
  (Lukas Bulwahn)
- Correct thermal sensor index for i.MX8MP device tree (Peng Fan)
- Fix i.MX SCMI build error by adding stub API functions (Peng Fan)

----------------------------------------------------------------
Lukas Bulwahn (1):
      ARM: imx: Kconfig: Adjust select after renamed config option

Peng Fan (4):
      firmware: imx: Add stub functions for SCMI MISC API
      firmware: imx: Add stub functions for SCMI LMM API
      firmware: imx: Add stub functions for SCMI CPU API
      arm64: dts: imx8mp: Correct thermal sensor index

 arch/arm/mach-imx/Kconfig                 |  2 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi |  4 +--
 include/linux/firmware/imx/sm.h           | 47 +++++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+), 3 deletions(-)


