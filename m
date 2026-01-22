Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95504D625E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 03:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MXkGAsiUYSP6MJqpHQrex0KZq4jq6Kjr+FabVAaVMoA=; b=0Z4yElZBrU+UIy5YFAgVkXw2E2
	Ww4KPloKJet9pTist45fsXOCxDDst127dQIHKK7kEzOxGo3H5zAd66YLM0Yd+ETBQJqU3aLwznu49
	3LPeklbeZY8CUvbRlhLUTRLoz1zRDDZC1o5A5LfCVknzQl+IDNnLIwnjKIxm/0xOy+0b6H6omG+wc
	Db895FUQPEWlPRtKA9O4MLAsTQEd5XEhcWmwAb5iJMb44+0fzqVlS9qYDctPmMU9rZmocCPv2pXY/
	LExwmMuYfklBtZ3/Ugz2NkeGwCjHGFM+jzcREN5AUct1iXx9NsltXOYOecQENpqhZWjXMIC7REvd6
	ZnOu+xhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vil5N-00000006M8h-1T5R;
	Thu, 22 Jan 2026 03:10:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vil5L-00000006M8S-3Q8u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 03:10:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D2309600C4;
	Thu, 22 Jan 2026 03:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87470C4CEF1;
	Thu, 22 Jan 2026 03:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769051414;
	bh=J01YD7KY4hnSzkWASrXaPhKp7sXQ0SZRpOToFM6BZTQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ltkk0MlYULFeKPZ0mpoxSKmkKNrFk6A8toF5w5F+1bZWey+fAGhLgz0y5f0xFvmva
	 /y8+KQOcEl8pXKrNOF2KzJAWx08qGLkMAsfodsr0QrpYWmAndC7um3S7VKPohMm6dI
	 qExtrGp2m54+QvR1/7sP9DPbMUsyyMGBQsT1Haxv5X4cgJK8SgV0nyMU7Km9Nn8jI7
	 MB20kt1vkg4w9vr9j7q2VMuidHACzPBUaqutYAIEzsfgSmZD1Qa/nyL2/wDvKSPRkw
	 zyrZAqDzcFWKOUjOvCrKMDdFKxwckb+cnnVY6XYnKH7/T88kRdbGn3VpCsCikL4CCx
	 2YS+jLtT6VjyA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8C0623808200;
	Thu, 22 Jan 2026 03:10:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH V3 0/2] Add devm_clk_bulk_get_optional_enable() helper and
 use
 in AXI Ethernet driver
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176905141134.1535278.5816404258279074051.git-patchwork-notify@kernel.org>
Date: Thu, 22 Jan 2026 03:10:11 +0000
References: <20260116192725.972966-1-suraj.gupta2@amd.com>
In-Reply-To: <20260116192725.972966-1-suraj.gupta2@amd.com>
To: Suraj Gupta <suraj.gupta2@amd.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, radhey.shyam.pandey@amd.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, michal.simek@amd.com,
 sean.anderson@linux.dev, linux@armlinux.org.uk, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, bmasney@redhat.com
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

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 17 Jan 2026 00:57:22 +0530 you wrote:
> This patch series introduces a new managed clock framework helper function
> and demonstrates its usage in AXI ethernet driver.
> 
> Device drivers frequently need to get optional bulk clocks, prepare them,
> and enable them during probe, while ensuring automatic cleanup on device
> unbind. Currently, this requires three separate operations with manual
> cleanup handling.
> 
> [...]

Here is the summary with links:
  - [V3,1/2] clk: Add devm_clk_bulk_get_optional_enable() helper
    https://git.kernel.org/netdev/net-next/c/820ce0c8e98a
  - [V3,2/2] net: xilinx: axienet: Use devres for resource management in probe path
    https://git.kernel.org/netdev/net-next/c/808d077f5b53

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



