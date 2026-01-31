Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EFB6E6BF38
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 01:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XjOuH8PjbQdU8XAp0O+H/PqRLryXbifFjtc9XLqey+U=; b=Q1+X/k/GIWsKvt2sy3wjBOq/b6
	KsSVl8ER7E4RDJF2Dnit5sgYAaDUzM5kwJ+kOgsCX+fUuXvQM1mtWZQJqs7bZZnt5KPnKD0qP5ofa
	VSsrizpaZtKA2XaQEd6kZnaFo34edlcL4HUs+27/wFG6LA6EBNpg3Co9VdGOmc3XE74w48xc15tEQ
	m8DVhW1Cu1Uw5KCPdwtlClardWMMpLhS8Y52xJBKTrYrZ0pwBaqnG1ijZkgzxs8GmV9nDv7jaOXLp
	uutTBBZAa9ykEyS4BPoCH9nY+wmpTTMfRsQQycEs5bCl+HT9RzRbr8VFe8yCVXRs8JCWSRBiAIPgG
	BCJiDJKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm07x-00000002CnC-20Qu;
	Sat, 31 Jan 2026 01:50:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm07s-00000002CmG-0GBJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 01:50:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4CE7E41A93;
	Sat, 31 Jan 2026 01:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 249B2C116D0;
	Sat, 31 Jan 2026 01:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769824215;
	bh=KveGONG7UJdElvqV315bWlMz8AD27Y9PZLI+Vh0KgjU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GX4SYWdycMxo+2vTLOeR/ZBoTMWGL8AgvbwdETbXxJVMdby1l6Dl/yDEby0l+bAq9
	 9c6Q3Ki4B+bTUnQbsrudX3kJlBk7gdDK6na9gXWgC1zrDWUW1D8AI/xuaO62XKAHNz
	 7KBl252hzYi7jCPIyLfasU49uL767ZC6Z4XMBFGqjlwJeCKovdwCkF4QZXfgLvw6ZD
	 D/mcX2MYw6EilRtyq7BbVr626UBsoRRvZTRjwOMFTTTQq0bay74A5d7p/9ms1wP+5m
	 xCmKiBfwRLNb5F0zTpAInNgI6E6+gWD86d68SAQ6+GF/qJ1X8ABgRJC3WNeCF52EYt
	 aYEQDXnTXp2bg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8BC98380CFFB;
	Sat, 31 Jan 2026 01:50:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: spelling corrections
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176982420710.3961929.13739265763800349219.git-patchwork-notify@kernel.org>
Date: Sat, 31 Jan 2026 01:50:07 +0000
References: <20260129-stmmac-spell-v1-1-c7df9a96e482@kernel.org>
In-Reply-To: <20260129-stmmac-spell-v1-1-c7df9a96e482@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, wens@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-sunxi@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_175016_121919_4B667439 
X-CRM114-Status: UNSURE (   8.76  )
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

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 29 Jan 2026 17:35:03 +0000 you wrote:
> Correct spelling as flagged by codespell.
> 
> Signed-off-by: Simon Horman <horms@kernel.org>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c        |  4 ++--
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c      |  4 ++--
>  drivers/net/ethernet/stmicro/stmmac/dwmac1000.h        |  2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c    |  2 +-
>  drivers/net/ethernet/stmicro/stmmac/enh_desc.c         |  2 +-
>  drivers/net/ethernet/stmicro/stmmac/mmc_core.c         |  4 ++--
>  drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c  |  2 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c      | 10 +++++-----
>  drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c      |  2 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c |  2 +-
>  10 files changed, 17 insertions(+), 17 deletions(-)

Here is the summary with links:
  - [net-next] net: stmmac: spelling corrections
    https://git.kernel.org/netdev/net-next/c/96e1c895b5ec

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



