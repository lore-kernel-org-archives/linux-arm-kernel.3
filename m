Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E56C44500
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 14:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wrc7+qLgdBCAc/eLa/IBcxhk+BlROS47gbZmBQJufnY=; b=RWMKSnr1XeXNgfGCIyhXkAV1rR
	rSXawBVCtX1lo0NRjAvtRX4uvMeyQDUoVtEw2OVJNmssbsG5XRL+3o5WpXSoKbV/LgzTY/NqoPGd9
	DG2Bck+98IntL+kyslCg2Olx1fdOKWAP98tjL28g8EDkQfjyJoPvcNa68JhFsrgiQai8Co74Kwg4S
	APG80NZcwW2OQLfzJNa0+HKD8QZnGhBfHv6n7AOr11GyRdkpUhfIkkio0IJW9UP/w65/xpuw/9ASS
	tr6aR7l+DiKX4h0g0REQO6OnHyI4Nq0yM0aIKg6hA4nCS0sTU3JVakfyvOmiqu1h41NMDVPm4irzA
	zacazJAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wff4W-00000007Ieo-1iIm;
	Fri, 03 Jul 2026 14:40:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wff4V-00000007IeP-0ylc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 14:40:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E4BD842B3E;
	Fri,  3 Jul 2026 14:40:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F2771F000E9;
	Fri,  3 Jul 2026 14:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783089650;
	bh=wrc7+qLgdBCAc/eLa/IBcxhk+BlROS47gbZmBQJufnY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aA1qpJQk2IiXSlIyaHnaB/JjsDUHEvqU/fhEBcAtm+KpyzplcKGMk83QcYGpW6FcH
	 7pVo4xL2ZVuRVoscxXmQQ1gU3M6LUv1xwuQst9OTLPeH3CAEkAPQTuOJoD12QP1Z/7
	 UwjeFdsNVcLp+TOgMK8kQU0PDEzzx9QM7rKZdpQs5m4SFWITulPreZIEGzvb2WUfju
	 jmfYp7eQOGmU+gYWB2b+nlHiRqgQ7PpOo0d44ULZjZVRoYncZYs/AGHw1Q3jWSJhZm
	 9Znnq3wUPP1NnzX5bYq60ZBq3Er5ztbnyg+itOphj/IBDxATTmyzTkts5+6BbkZnpb
	 QTEzVzHMRCT1A==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/3] arm64: tegra: Device tree fixes for v7.2
Date: Fri,  3 Jul 2026 16:40:37 +0200
Message-ID: <20260703144042.1190046-3-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703144042.1190046-1-thierry.reding@kernel.org>
References: <20260703144042.1190046-1-thierry.reding@kernel.org>
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

The following changes since commit e1215cd6d3b9338e72573cc1cc60922b5bd34da4:

  arm64: tegra: Enable SMMU on Tegra194 display controllers (2026-05-29 14:33:29 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.2-arm64-dt-fixes

for you to fetch changes up to 806a66f926c2b6652aeb88983d01f25081b41a73:

  arm64: tegra: Fix CPU1 node unit-address on Tegra264 (2026-06-25 11:13:27 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree fixes for v7.2

These changes fix an invalid compatible string combination for GPC DMA
on Tegra264, change the compatible string for the CPU found on Tegra234
and update the unit-address of CPU#1 on Tegra264 so it matches the value
in the "reg" property.

----------------------------------------------------------------
Akhil R (1):
      arm64: tegra: Remove fallback compatible for GPCDMA

Sumit Gupta (2):
      arm64: tegra: Fix CPU compatible string to cortex-a78ae on Tegra234
      arm64: tegra: Fix CPU1 node unit-address on Tegra264

 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 24 ++++++++++++------------
 arch/arm64/boot/dts/nvidia/tegra264.dtsi |  4 ++--
 2 files changed, 14 insertions(+), 14 deletions(-)

