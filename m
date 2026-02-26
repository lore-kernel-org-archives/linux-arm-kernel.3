Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A42F4FD8FC3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 15:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NCIRf1ej7xUKzBRlJLjQ8Sjik/6dl4x9fAbbK5aCa0Y=; b=Ucm4PlLdqS3stLoTtE4b2H1Ltk
	wBzX2zBAmCGapoVJGo2QJZefb9yyTp7GOaKa4uUJZJJZzZogBmh1WlcKWnxEz520F+PZyIqwR+Et1
	Hzz5kYMpjMxn5lEFdzYehKILYLBkp2/6eRad5IwudYDN+ZKcpmKe0oFzgCgf58vJhpOvBPLS1ZQlx
	/pkSAMaxLHi6QdpDxiC1Z+b0NzEwA3Z1H/30xnVzm01J+SQAdsh8mxSQVU/fYgC31z5npFERhvdOq
	JYaHlHPkNYFFSg3DBya65HmM9CPLJmYS4XylL9RAa9U8wehT/Jx/KKJS1CnXBEnY/gOaEIuXETYaH
	o09mwRNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvczm-00000006PXj-0dWJ;
	Thu, 26 Feb 2026 15:09:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvczl-00000006PXW-2heP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 15:09:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 18A7F600AE;
	Thu, 26 Feb 2026 15:09:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40214C116C6;
	Thu, 26 Feb 2026 15:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772118580;
	bh=v1ACgIlRD8KvR06CUuh6zGTqQBP7zb+Wqfw6At6WSBo=;
	h=From:To:Cc:Subject:Date:From;
	b=AglWGKwcJ0FyHd064/As67R7WsRFpIWJ/hOM/h3i3hudcQarvs+8jM8v4eQyN6bNA
	 wTwmgC73q8i0l2dTa+/mPKL12W3JdF/YJATT3eFlCB07VUol8p6eWl0jOuPUQPNC9n
	 C00dAOLqLd8szk+9nUgX3ZpMqhVzh9pu9fntLfhvNM9RfkXeKCrNyRwfWYqYR36hB6
	 pRuiFWWEUdDuj+rHGAWEN7f9Y1MzlRkzmsL7bifxkFrmZ0le405C39BtFSHaGd/Wd3
	 tewIaOspx5ATMxEjNkpcMZnTJNbGjQCUfU7UwRO5xteYOK3weei5SwT6Rkc7nnsLSm
	 2azybZVK/yCbg==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] soc/tegra: Add Tegra238 Kconfig symbol
Date: Thu, 26 Feb 2026 16:09:32 +0100
Message-ID: <20260226150933.4067324-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
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

From: Thierry Reding <treding@nvidia.com>

The NVIDIA Tegra238 SoC is an upcoming new chip. Add a Kconfig symbol to
allow fine-grained selection of support code for this chip.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/Kconfig | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
index c0fc54c3cd35..0a84bfd5c657 100644
--- a/drivers/soc/tegra/Kconfig
+++ b/drivers/soc/tegra/Kconfig
@@ -125,6 +125,15 @@ config ARCH_TEGRA_234_SOC
 	help
 	  Enable support for the NVIDIA Tegra234 SoC.
 
+config ARCH_TEGRA_238_SOC
+	bool "NVIDIA Tegra238 SoC"
+	default ARCH_TEGRA
+	depends on !CPU_BIG_ENDIAN
+	select MAILBOX
+	select SOC_TEGRA_PMC
+	help
+	  Enable support for the NVIDIA Tegra238 SoC.
+
 config ARCH_TEGRA_241_SOC
 	bool "NVIDIA Tegra241 SoC"
 	help
-- 
2.52.0


