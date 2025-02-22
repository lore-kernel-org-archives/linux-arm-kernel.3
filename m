Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC65AC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 00:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fzKEU6OM3UYFXa02K7RzmXgbWl3xhuTboqbk8Ym14Vo=; b=yjwQunbt4zA12tpisX0C20JgVF
	BHSBqmm50v8/T1vjWaDCaOFDdhrxZ9UhRgyXSZR7R1wwpuWbzdAAqIGs6uCMEZkBlvHXF0Ls3sUkd
	N5iDz8v6vyN1LpPSdXduecLSY67DMCzzizsqN5r2/3qx5YpaP6TcFx4jO8eqNexVxEBvkOidVs+kQ
	Fj15n48LNicDYuii3fe6Hjmd4NGJvbkc+sC1VFV/8GkrhdyVhE6Zvmkf6KmdxCIUe9qRKmfRX/XKr
	jqlHdjGE+spHbO9owZRLgyc6OrlQskQoHi+WY1eihOr9wEIVl0eMVFBxKNF8gmNS/o5DFNCbaHd6k
	+cQWzL9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tldaV-00000007Ev3-2AYf;
	Sat, 22 Feb 2025 00:41:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tldYt-00000007EfY-0WRa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 00:40:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 88306613DE;
	Sat, 22 Feb 2025 00:40:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04B6EC4CED6;
	Sat, 22 Feb 2025 00:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740184806;
	bh=H48JW7AW173NYuh0XY8Bexb5wuYfEmHh77BrSrgAcTw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IP5DaEZAGMCYAd7SYzf3poZOQnKpJUjp2s7WUISj87KW05YphO3WIX5+BCtPOifmp
	 5OqZCesEWqKAWvtfvysDZ8DFGoB6ZaXCq779oNeJzpH65QoX/Pr1Tn7ahvG/PL+tcZ
	 5GSDt+ih3RWfLL4ST7jozwiWLrkwejK/hy/0iQzDr0F20lxHSLJr6DI4WcbWEzuIUH
	 uNbKuCCd6G0iqwyIVeWMHKpH3oO9rPemjpv4wsZI40GhTIwbCDjKOEx++zSLSviNvb
	 OSicv/HEvr6pS0U0+PpfoJsjGzin9npFsiCNquWg8n5rjBxvsWaPF6y1OU0wPwkoJS
	 xwYqVbVL7wCcA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34031380CEF6;
	Sat, 22 Feb 2025 00:40:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: print stmmac_init_dma_engine() errors
 using netdev_err()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174018483699.2253519.16103743510022533749.git-patchwork-notify@kernel.org>
Date: Sat, 22 Feb 2025 00:40:36 +0000
References: <E1tl5y1-004UgG-8X@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1tl5y1-004UgG-8X@rmk-PC.armlinux.org.uk>
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

On Thu, 20 Feb 2025 12:47:49 +0000 you wrote:
> stmmac_init_dma_engine() uses dev_err() which leads to errors being
> reported as e.g:
> 
> dwc-eth-dwmac 2490000.ethernet: Failed to reset the dma
> dwc-eth-dwmac 2490000.ethernet eth0: stmmac_hw_setup: DMA engine initialization failed
> 
> stmmac_init_dma_engine() is only called from stmmac_hw_setup() which
> itself uses netdev_err(), and we will have a net_device setup. So,
> change the dev_err() to netdev_err() to give consistent error
> messages.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: print stmmac_init_dma_engine() errors using netdev_err()
    https://git.kernel.org/netdev/net-next/c/3e401818c81b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



