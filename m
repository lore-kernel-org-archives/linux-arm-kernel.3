Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C96CD8C89
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Jun 2026 01:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4L/2vxjqjL4RiGujkM/Ro9au+zwXOQvhTC3CfFNd7rc=; b=NYMxt1WQ0ZeVwvAgkS52kpm1EY
	tsRr0NuNsnbVGvunA2XE0o3Xmx5y4tQpRT6F5h0WHpAZzsX9MvJySITbhiU96l1xwUpFp5AlNVnLR
	T5q/+/0ct+6ba/Bbt1gpYQosHxFIz7kJiWqyODfYXa7Tn0nUkK/61IsHQtmXp0N9mL4ZWe29v7oX9
	ChTtDa0BI5S32T+Xazd81zvcirvj5FA0hNbOAEgNwaDD9QY3gXbwsEWHh7xnl74EnBMQGZ8PQcLfk
	EsE68yipLD+b8wN0I39OFPxiqzIi7956ZW60IOktt05YMO5RfP3F1AIOnMysHz3gwGR6Jxeo9BgIC
	6UtisrNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVg1B-00000001MHW-0fSp;
	Sat, 06 Jun 2026 01:40:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVg19-00000001MHO-03zL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Jun 2026 01:40:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 576F5436C0;
	Sat,  6 Jun 2026 01:40:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36DBE1F00893;
	Sat,  6 Jun 2026 01:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780710006;
	bh=4L/2vxjqjL4RiGujkM/Ro9au+zwXOQvhTC3CfFNd7rc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=myUMH5mY46MJYaBDJHER0h2NVBkakwbmfRrN40iDO58t5pJSdHfWSbFsm3RhBeeSG
	 bT3gSEBqzUgCxEJA7Ki4sl+++M0Nob+pCHOIlLqvjfLpQ9PkL8OArol5KPMZYc8F8l
	 GbGpjrk1Z/mubuiTDNH7rFAkeEKexTSQJ38YJTqBAeyvbZ4gVix2srIlwxfqDp68v4
	 ErDNINU7pNc7Esr1SNFSruUl/WBWUb7SxlHLzCBwwN0AWxYuSNLUIrqKgtbHuzEpHw
	 HcsffE4JpP40QuovURdcYoTiZ8nI8MEUk2QC1xKC5FVmcg8loKz1UI8qFq359LerE0
	 kjcl0IO0Xmwog==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939813930A9C;
	Sat,  6 Jun 2026 01:40:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: dwmac4: Report DCB feature
 capability
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178071000615.3987407.7537922881978365743.git-patchwork-notify@kernel.org>
Date: Sat, 06 Jun 2026 01:40:06 +0000
References: <20260603173644.24371-1-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260603173644.24371-1-ovidiu.panait.rb@renesas.com>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
 maxime.chevallier@bootlin.com, o.rempel@pengutronix.de,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Wed,  3 Jun 2026 17:36:43 +0000 you wrote:
> Bit 16 of the MAC HW Feature1 register reports the DCB (Data Centre
> Bridging) feature. Read it so that dma_cap.dcben and the debugfs
> report it accurately. Right now it is always reported as being disabled.
> 
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac4.h     | 1 +
>  drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c | 1 +
>  2 files changed, 2 insertions(+)

Here is the summary with links:
  - [net-next] net: stmmac: dwmac4: Report DCB feature capability
    https://git.kernel.org/netdev/net-next/c/3a58a1b8d505

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



