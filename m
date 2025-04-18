Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 836B0C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 01:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zat2AK7FqC7/QLDOKUZ/IFj92BlWO7dKJlOJcOTjD7c=; b=N1NPz1WRk4c/MsUjskhG24JCIU
	6EQgQdoLjzqqG1nZxMUbWnwwqwtBwrUCcXb168yLGnGCzNbL8QAtxHwf8IpzhmR1+T+86rKZbZI+P
	CvyXCG2pbGnN37Fc0Ri6ewolKWJF8gBO8UEhwIo6GGbBdNxT26j6xB05F568e7h0Y6Pl64TbiQaSn
	bNftQJ5v1K5duw6aMjQYGpDtZJbdPxveD08xRlMouh+0+9ZMmaMgt1yEJYIzVgMO8CMFD5vn4wslr
	aweHpCiX3cFlOqNHEwddjsF8F19PauoeJznoOkNSuB7Q2H0UMPlGq5pbOQqFZoanTd7svwy1jRMCG
	uTLAlNTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5axk-0000000EoGM-2yNq;
	Fri, 18 Apr 2025 01:56:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5as5-0000000Engf-2nJG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 01:50:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 328495C5464;
	Fri, 18 Apr 2025 01:48:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC52CC4CEEB;
	Fri, 18 Apr 2025 01:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744941023;
	bh=RWS3beSN0nf1LG/1NlhXEkDw2nBv4zaRnqOhm+10ccI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Hc1SNNT+G7wWIDXsMbBYH6kqxhekJntqM19hxW+syQOW5t8laYO+5aKRzz8QYhMrX
	 bF1u0Ay9Qu1NTL3YoBDE+8lfoliQKhOT8/WUUoPQevnNmERTAxfNSoa3TEbQb02XhJ
	 d9yRTqlz9dSqkd7jUQA5hv2lXVeLZJZyGTAL66t/G5DznRDt3IagjzE+rcoVp37Mpc
	 SYbukbpLlYZAzPItqcVdVPleocnrFlsp+1NzZAGzsL5nMsfinvYvzBkxOk8OepL9Bx
	 krH5AR1X9D2i1Mct8gD4P+ODe0uaw+pvcDOpQFnk5uJh0lRroXyf/UFu5wd5JHMTgg
	 wstyBa+3h68Hw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B0B380AAEB;
	Fri, 18 Apr 2025 01:51:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/3] net: stmmac: sunxi cleanups
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174494106174.75375.14390030556312826842.git-patchwork-notify@kernel.org>
Date: Fri, 18 Apr 2025 01:51:01 +0000
References: <Z_5WT_jOBgubjWQg@shell.armlinux.org.uk>
In-Reply-To: <Z_5WT_jOBgubjWQg@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, wens@csie.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, jernej.skrabec@gmail.com,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, pabeni@redhat.com,
 samuel@sholland.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_185025_750840_9F4E5639 
X-CRM114-Status: GOOD (  12.43  )
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

On Tue, 15 Apr 2025 13:51:27 +0100 you wrote:
> Hi,
> 
> This series cleans up the sunxi (sun7i) code in two ways:
> 
> 1. it converts to use the new set_clk_tx_rate() method, even though
>    we don't use clk_tx_i. In doing so, I reformat the function to
>    read better, but with no changes to the code.
> 
> [...]

Here is the summary with links:
  - [net-next,1/3] net: stmmac: sunxi: convert to set_clk_tx_rate()
    https://git.kernel.org/netdev/net-next/c/a27d798fd83c
  - [net-next,2/3] net: stmmac: sunxi: use stmmac_pltfr_probe()
    https://git.kernel.org/netdev/net-next/c/dd2cdba4709f
  - [net-next,3/3] net: stmmac: sunxi: use devm_stmmac_pltfr_probe()
    https://git.kernel.org/netdev/net-next/c/69b3e38e2fb5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



