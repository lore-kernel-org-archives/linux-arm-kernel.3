Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A38A60A5BC2
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 22:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P5ZSxVmR;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XYeaF+lL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jgMNL39llvWo9fpC9p/QMlWjuszkHAxcrG1aLPRLi8g=; b=P5ZSxVmR31tnsR
	YLkpCV729D+wuN8WOdhdXKnq5s0KEV95J1ISDGRHvRlHbR6B4RSpYFKZ7OUhObiygntg6FxlUf/3p
	RswDvXAX/QTeQsDBJop13D6lO7/ugaxBo2bqvS/VX8IZqdldM8AM2h+NUOgMDx3fPhxKI5YmxSfAz
	68uQ46PHmHqY0734U0/9lpyeWJ3+w3HDAhJyMS4hQmvCrcpl4OLciC/386yrjTXa4Ww7Twx1e9tER
	/XtF7UpEjrQE7UEpnxUrO6vjM821rQZCzbriRpUMw3DC1nUaca27kE6mU/pCEZpYlhwth+/m8C/U/
	/nrk0i/OKiIsGBJ2yh1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdrK-0000000F21z-3ZwG;
	Sun, 01 Nov 2026 22:17:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqw-0000000F0o6-37bD;
	Sun, 01 Nov 2026 22:16:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 667B544035;
	Sun,  1 Nov 2026 22:16:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 495611F00919;
	Sun,  1 Nov 2026 22:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571398;
	bh=jgMNL39llvWo9fpC9p/QMlWjuszkHAxcrG1aLPRLi8g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=XYeaF+lLG+zcg+MoYoZlG0y/uk5q8MRTTDbq8BkdvkzUFl9Vun1ihD1SxAc2ECy16
	 z4DWocwx1WWi47Oj9QiNtJ6jmhL7zmf5bxeoWHoY4yzM2kZQfolcuIAWxK+jS7cm07
	 fmwAg/Ivw2hGS6A7TJkYkC3exTpBiM5aaokwLR9TjbsfP3pWR5EZZp804p7drBfMd8
	 frNkLhYzNMl5ef+Cj82eXGRsRKL/A4gC1aPR37M48qabULeNXZFgqSenEBQ9QKLwWw
	 Vzz4O5/hem3VSNyc/YuAn2p3V4AP0T1bhoNHZjIEalvXnARs3fwKPBkflkTi+V8isn
	 Z38bORaSKlOQw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4020238003B8;
	Sun,  1 Nov 2026 22:16:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v9 0/3] PCI prerequisites for PHY consumer/provider split
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357139679.2624073.13873851750746305916.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:36 +0000
References: <20260810124315.433448-1-vladimir.oltean@nxp.com>
In-Reply-To: <20260810124315.433448-1-vladimir.oltean@nxp.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, spacemit@lists.linux.dev,
 linux-tegra@vger.kernel.org
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This series was applied to riscv/linux.git (fixes)
by Bjorn Helgaas <bhelgaas@google.com>:

On Mon, 10 Aug 2026 15:43:12 +0300 you wrote:
> "[PATCH v8 phy-next 00/31] Split Generic PHY consumer and provider API"
> https://lore.kernel.org/linux-phy/20260505100523.1922388-1-vladimir.oltean@nxp.com/
> became unmanageably large for a single patch series and needs to be
> split per subsystem.
> 
> Here are the patches pertaining to PCI extracted out of the larger
> series.
> 
> [...]

Here is the summary with links:
  - [v9,1/3] PCI: cadence: Preserve all error codes in cdns_plat_pcie_probe()
    https://git.kernel.org/riscv/c/fe108800a865
  - [v9,2/3] PCI: Add missing headers transitively included by <linux/phy/phy.h>
    https://git.kernel.org/riscv/c/a685daa02d97
  - [v9,3/3] PCI: Remove device links to PHY
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



