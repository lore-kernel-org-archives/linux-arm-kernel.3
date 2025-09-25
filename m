Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A52CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 00:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TOgq+okdNz6ViXgHfPGBYw0nYGJDTOQayWMsTxo3JFg=; b=OP1UJgeRlFSCW4Qlm/gZRWZa3p
	llHmGdT7rLzEtlnhf1+LmXv7XnJnRX0umWlBam27X2tCwII9dHOraHgIRQtHZ+25D+g5vp0tEXt77
	4nMAwtjAz6nccyDl1y4MhJfHZJeqtLNhP98fVUy3oCviTi7R7mWPagmZ5nWyJPssamDPBPY7g4Adi
	cBW2mzg/TcPtNSdd8RXcLwWFwETVbJU8r85SPmD7Dz+aDDwTgpTdjvY1YGAchRaWs5UCdJtMfAI1K
	xOHifhCo81mHqc9+J8SzkCyJITpHyWWXPzeHVr6BrCByobniVnvt4frxCTR9MfzCHfSyNDpaBBWlY
	avoiZ8GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1aBu-000000057sW-03iB;
	Thu, 25 Sep 2025 00:50:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1aBq-000000057s9-3ezq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 00:50:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8BC9841A75;
	Thu, 25 Sep 2025 00:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B9B9C4CEE7;
	Thu, 25 Sep 2025 00:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758761430;
	bh=JOl8bvOaXKHP/plKSiwbXnFjVcEniK9Q1dE2r/E8ICA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LqPSWHN/3chhCOmy+6YDPFN6xr8NDxzNO998lF9/Ht+yNjj1+/ryFEXHvdi3MFwOF
	 YIO81ZOdsUqiOOBydKwfNk5kaHi1kgSOoCUrrckwpPePseATf+b88RMEnSfBL6wmor
	 i9MlFI2y9QiIMofu7E1nZJFpIDteI9gw5e1GcTj7tYisIrEsOFf9TdMcaoqx5EWCpE
	 foJyUvGBudfGMWJvxptNTuThOu2IP3THl246s1RUgZuqlwif8OXYPIa2JY9X1vjk1O
	 NKcXnEmEmqAg+5umPWUvoUpLKXMKFi8n+NgG9KjqEZ61Dh2nq/TyU6YrFpqrdSr8GZ
	 s5RrflQCldl4A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEE139D0C20;
	Thu, 25 Sep 2025 00:50:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/6] net: stmmac: yet more cleanups
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175876142648.2757835.630635315199558536.git-patchwork-notify@kernel.org>
Date: Thu, 25 Sep 2025 00:50:26 +0000
References: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk>
In-Reply-To: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_175030_955872_AE65FC67 
X-CRM114-Status: UNSURE (   9.08  )
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 23 Sep 2025 12:25:30 +0100 you wrote:
> Building on the previous cleanup series, this cleans up yet more stmmac
> code.
> 
> - Move stmmac_bus_clks_config() into stmmac_platform() which is where
>   its onlny user is.
> 
> - Move the xpcs Clause 73 test into stmmac_init_phy(), resulting in
>   simpler code in __stmmac_open().
> 
> [...]

Here is the summary with links:
  - [net-next,1/6] net: stmmac: move stmmac_bus_clks_config() to stmmac_platform.c
    https://git.kernel.org/netdev/net-next/c/79d6e14e9cb3
  - [net-next,2/6] net: stmmac: move xpcs clause 73 test into stmmac_init_phy()
    https://git.kernel.org/netdev/net-next/c/f005ec4a3d6b
  - [net-next,3/6] net: stmmac: move PHY attachment error message into stmmac_init_phy()
    https://git.kernel.org/netdev/net-next/c/9641d727162d
  - [net-next,4/6] net: stmmac: move initialisation of priv->tx_lpi_timer to stmmac_open()
    https://git.kernel.org/netdev/net-next/c/bae62989a31b
  - [net-next,5/6] net: stmmac: move PHY handling out of __stmmac_open()/release()
    https://git.kernel.org/netdev/net-next/c/db299a0c09e9
  - [net-next,6/6] net: stmmac: simplify stmmac_init_phy()
    https://git.kernel.org/netdev/net-next/c/50acea3662bf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



