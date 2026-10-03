Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2FACA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 09:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KU4kJGQayYFAkD8rvd0S8uhRZ14L3OxviWvXPNVCttE=; b=vNk+D+cM6Oa24mgRKW+mrhDCVq
	DeW5xzBwpErNqszlLOZoMkG9stnDZmCtK5FRkrbHjyehD5zWAPCdHx3bSKrvkMu789hJAFdMMe9CS
	YDl8ZCfZF9AmygDLsl4Ikdl2KB1H2KwBPHEel5nrKEIOJPw8Rex1EFU8lTDlr3wqABm+2Qaf4NebA
	1Isovpatb6msdR973gEpCiMobIVLnTnmzZ66uGsYSPSvZH4jnjoBa+pybrm3DzS8e0q7beovVWh0P
	WVdTRpg6lnY42ZQvKanTP7kgGbrkSmO43pxuXHyofdHeEL1OOxIpwsAbGUefI27UetJdpqnk8qR1/
	xFfxGBqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwSW-0000000DJHS-2MKD;
	Sat, 03 Oct 2026 09:55:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwSV-0000000DJGw-2gDB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 09:55:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C74EB60AAF;
	Sat,  3 Oct 2026 09:55:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8C861F0089B;
	Sat,  3 Oct 2026 09:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791021310;
	bh=KU4kJGQayYFAkD8rvd0S8uhRZ14L3OxviWvXPNVCttE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=L3j55Hk0hM0BkDubNicANS74lSr32Hx3vTam27V0EC8OC0FgZ6osT+ggQnWqgc/DG
	 Twlo1nhFhlqHlWHlc+sxBa93mXJl2i1EYLNaM3SVQlnM7RlXDS0PKAqE7DvUhZaWzg
	 j96QSzffJkb1e7bAcWb4xQDNOJHYy0hjQwcP+DtpeejaCYe50b1PPUOWAv6nrv8jBN
	 BHWB9H/EroLPjGnmI2DFSOCZjb6KCsjByv0ItPaOhRDi45FuurH4g1BjteYXgfpoHh
	 ZVw1DRX7QC1oE/5ZRVQaV+9TRVB/80LDr41FgnrQe1Kl8bB0kfbQtrHmDvEAbPrKOQ
	 H5yvgj5cvGWUg==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/2] arm64: tegra: Device tree fixes for v7.3
Date: Sat,  3 Oct 2026 11:55:02 +0200
Message-ID: <20261003095505.1369507-2-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003095505.1369507-1-thierry.reding@kernel.org>
References: <20261003095505.1369507-1-thierry.reding@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.3-arm64-dt-fixes

for you to fetch changes up to b86eaddf467a9ddb69dbaa46eea9dda7f93347a3:

  arm64: tegra: Add PCIe root ports on Tegra264 (2026-08-31 15:14:25 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree fixes for v7.3

This contains various fixes for Tegra264. While the PWM and fan patches
look like they'd be feature additions, I'd like to get them into stable
kernels because without them, these devices either end up with the fan
running at full speed or not at all, neither of which are great, but in
case of the fan not running at all, it can cause the system to overheat.

The remainder are some minor fixes for PCIe, mostly to satisfy the
device tree validation.

----------------------------------------------------------------
Thierry Reding (4):
      arm64: tegra: Add PWM controllers on Tegra264
      arm64: tegra: Add PWM fan on Jetson AGX Thor DevKit
      arm64: tegra: Reorder reg and reg-names to match bindings
      arm64: tegra: Add PCIe root ports on Tegra264

 .../boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi |  13 ++
 arch/arm64/boot/dts/nvidia/tegra264.dtsi           | 180 ++++++++++++++++++---
 2 files changed, 169 insertions(+), 24 deletions(-)

