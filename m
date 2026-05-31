Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DDDCD6E51
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 06:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D++U1nkKs5wRw2cqvZO4MKORFcaw0F53yOnifOad0po=; b=T6VTUC4KPTckYMPUgaCZ209LEI
	v9lDvVtrgUYXq0Kai1iINw7E/UiUv2z5mievOmpkNAOhKG9VHjwf31fBo0UPYBvSuD+suEk+bT4q/
	9ruG8JDy/MHkbKJVscWUOGnzVMgHfI59WGWITMoQfSjckEXRM1OjXuW32WIfPJoXdd1NgmRAC19Rm
	cMrRs0NeBoQfqitXmEYy46v3Oa2bWrjHPru69UofgUYm1BA1J2ThARmdqd6YNtYo5ndBRGPVxx9jd
	dxHnMamB2fzUF71V8dw35jbbd/AQqrvdniCIs7qHLU5qkW0en1KLhPNDiJVkyJ2pkKQNYgbPt5Ctk
	G89RwQwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTZLv-00000009HA5-0qvh;
	Sun, 31 May 2026 06:08:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTZLp-00000009H83-2o0i
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 06:08:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 22BD0424C9;
	Sun, 31 May 2026 06:08:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 730881F00893;
	Sun, 31 May 2026 06:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780207725;
	bh=D++U1nkKs5wRw2cqvZO4MKORFcaw0F53yOnifOad0po=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iwMipyGYfxQXHLbuQYTrR+ffNueQpMdDdALkh5TmKxXOb7e9BjyTI0SYxMrviWX7H
	 So6tXHFaXfkeMy0V798kiR1DNLKCn7hzH0iNGkVRqsxG9Df2/jlsJIB/TkeR26xj9F
	 0GR1f8iQORay/oK4UFbfZnefIZWeazgYo8la7Fr8UmPoTrxJD4B0bgenricwC9lSli
	 6VSWWI+WZ08tlS5nUtXcGyhPHvKPAltRWhBNeBpoc+2+2MRS8MNJgAp2w5lgxpsCzk
	 jBE2DZTyTHsflRSvWcaZ56BmBmgxs728PFKZobTPpm1hoZgv3TDmxqRJXf0K9dlvIq
	 yC32kx1XL7VyQ==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/6] arm64: tegra: Changes for v7.2-rc1
Date: Sun, 31 May 2026 08:08:23 +0200
Message-ID: <20260531060825.1855391-6-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260531060825.1855391-1-thierry.reding@kernel.org>
References: <20260531060825.1855391-1-thierry.reding@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_230845_756734_E9A4EBB0 
X-CRM114-Status: UNSURE (   9.04  )
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

From: Thierry Reding <thierry.reding@gmail.com>

Hi ARM SoC maintainers,

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.2-arm64-dt

for you to fetch changes up to e1215cd6d3b9338e72573cc1cc60922b5bd34da4:

  arm64: tegra: Enable SMMU on Tegra194 display controllers (2026-05-29 14:33:29 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Changes for v7.2-rc1

This contains a fix for GPIO on Jetson AGX Thor and enables the PCIe
controllers used on this platform.

Smaug (a.k.a. Pixel C) devices can now be properly powered off via the
PMIC.

Miscellaneous improvements are made across a number of different boards,
such as SMMU enablement on Tegra194 platforms and some better bootloader
interoperation on Chromium-based devices.

Finally, various minor fixes to device tree properties round off this
set of changes.

----------------------------------------------------------------
Aaron Kling (2):
      Revert "arm64: tegra: Disable ISO SMMU for Tegra194"
      arm64: tegra: Enable SMMU on Tegra194 display controllers

Brian Norris (1):
      arm64: tegra: Add #{address,size}-cells to Chromium-based /firmware

Diogo Ivo (1):
      arm64: tegra: Mark MAX77620 as system power controller on Smaug

Jon Hunter (3):
      arm64: tegra: Fix Tegra234 MGBE PTP clock
      arm64: tegra: Fix address of Tegra264 main GPIO controller
      arm64: tegra: Enable PCIe for Jetson AGX Thor

Manikanta Maddireddy (2):
      arm64: tegra: Add aspm-l1-entry-delay-ns to PCIe nodes
      arm64: tegra: Fix aspm-l1-entry-delay-ns L1 latency cells

 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts     |  5 ++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           | 17 ++++-
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      |  7 ++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           | 24 +++++-
 .../dts/nvidia/tegra264-p4071-0000+p3834-0008.dts  | 12 +++
 arch/arm64/boot/dts/nvidia/tegra264.dtsi           | 88 +++++++++++-----------
 6 files changed, 103 insertions(+), 50 deletions(-)

