Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8AD5CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 01:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q0R1Cb3ntsxANlpVuDpTrkjCVOgtH2SqpR/4v6nhU/Y=; b=2oeREBZPtyRLIp8j+wMwuXtlgS
	uKFJSLCJpv+UgI+VfQvAZcEzFBmipPGJ3RYgVtve5e3rSjjNKKPefKwhB43lJWpH6LXeczoKlzzr1
	TZH0bI3LxbbwxjjxNzUUvAiCWjUxk21+RCLLsInY0LpqH2ZOVXZf5mwHD3r/Kow+Xp+UgvbyvBIZs
	t/jTHK4DOED4/9I8K5xr3qJ3xv7drz94qU+CVJdZJLxHIJpfWuNUc3CUzdUyycCQzW8Os7Au+Hj10
	+UOKFgE4ihFSPyT0b40fIToO2/g5ICZqzAhi38OhAG5JEcL4zNn/dsc/ZarIZNZcJaGwTyeTh0Iry
	aAMPf8ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urneX-00000003yVh-3Hbq;
	Fri, 29 Aug 2025 01:11:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urmXQ-00000003lC3-3ccM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 00:00:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4E46B6013F;
	Fri, 29 Aug 2025 00:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 041F4C4CEEB;
	Fri, 29 Aug 2025 00:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756425616;
	bh=XHuj/eFq3JvZKdFMnx6z2EM258B7b2c8RFcbChBfhaE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=c9Fz911dMFkeBEClmnNO3pEJkP0L8NFES3iaVgARcOTrSwhdX2qbhxFRNpxT+2KPP
	 bnP/UWwgO+tgh5lU9mbRdDDNy33gfaLFnItyT9TOZgHkNjIAOAw2t3k8FshOYVCbYp
	 w7JqMGhnMZ8ZIru6obFoVqSjBpf2ZUn6YEKOFp2wsuj5+OKxb5fDrky75Mm4sTZR7O
	 vlKWX74VVz61xtbflvp98GoUTcXoih6v9+4ikLgnlx+VAJoJNnFp3TwHkX2jkpeY2i
	 uuNpgupoxRFbvMdot7sIOvj8FTKXh2l4oYJodFUt3oNnZK+klMak+GRLn+cuZazoR2
	 2VSuAAUWjvFOA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BF8383BF75;
	Fri, 29 Aug 2025 00:00:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: minor cleanups to
 stmmac_bus_clks_config()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175642562274.1653564.10878658368837488044.git-patchwork-notify@kernel.org>
Date: Fri, 29 Aug 2025 00:00:22 +0000
References: <E1urBvf-000000002ii-37Ce@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1urBvf-000000002ii-37Ce@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 27 Aug 2025 09:54:51 +0100 you wrote:
> stmmac_bus_clks_config() doesn't need to repeatedly on dereference
> priv->plat as this remains the same throughout this function. Not only
> does this detract from the function's readability, but it could cause
> the value to be reloaded each time. Use a local variable.
> 
> Also, the final return can simply return zero, and we can dispense
> with the initialiser for 'ret'.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: minor cleanups to stmmac_bus_clks_config()
    https://git.kernel.org/netdev/net-next/c/2584ed250a37

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



