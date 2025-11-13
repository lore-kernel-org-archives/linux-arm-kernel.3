Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67BAACD4F3B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 02:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5IiZAd+4EnNbHAFsm3jpgHhPsFKQo1OldxwS1QORFJ8=; b=p4gsXqIAzVahLCg/A46toYp6pr
	8wNHijt26EnP0+dU9/mKkZAsjjD6uWGl+xKGOAvnMt5M2rjmDTm/hWHcR532vjwXxbztVCiN/31K7
	qH0laNsn84Wqy6GOXIasfReL/RlWUTz1zselxWda1S3ZXYqDtVGQom6DK5Fd8PBu/IucHcsH53GNS
	0Jo/zHSvIIEwmgctd0OLJHmhkLKdAE2w1V/B6Txl+MEHwnXTtNxg7V9pRkPq8rKF6rknGGNYZaOGU
	tpy6SKJRVGxxV2ur3gWjX0i8XpSYOxUmXx0BfSusTH5CvnBJNgbXcBSjrFRU6oiH66GXXa/m7Ahfe
	QB2X6xUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMxG-00000009nIt-1zYm;
	Thu, 13 Nov 2025 02:20:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMxE-00000009nIj-0LLI;
	Thu, 13 Nov 2025 02:20:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2F9AC601AF;
	Thu, 13 Nov 2025 02:20:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9C71C16AAE;
	Thu, 13 Nov 2025 02:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763000454;
	bh=8ejBa8X0oQZTOqEW8wmzYE3T4O7hj6OmR6op+Ep2U6k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=CSQv8g5loeBZqGzmCvUsSPniqMoFRVNtpoRs0afr+bvThoG+hh30q0camffgh4MaO
	 JQG6cihmoYGnghBOeRxp6mBxZgq5Hcd2/K4DBMk7XhNwmmWaIFoEop/WrRN6cOVaF+
	 ovE1OTaKveGq0UT+DQc4wQfxrfG2KTb1Fu8Oo3H9WYK7ZWb+WpxkpP98OIof4+sATD
	 Joj+Z8Ka9I6buzx809VpN5D55WncG6CnYu0rHOF5E5yR44VUZT7zcGUWjHnKOKj8UK
	 i+7Z6au5q+VA7oNQ0Ci+SvOlR0hFYuNYaAa4C39P2V40SNmkRQeZ37fO+IR2HlmXn1
	 MpVw3p+2vu4Cw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E533A40FD1;
	Thu, 13 Nov 2025 02:20:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 00/13] net: stmmac: convert glue drivers to
 use
 stmmac_get_phy_intf_sel()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176300042425.285552.5459936972326957453.git-patchwork-notify@kernel.org>
Date: Thu, 13 Nov 2025 02:20:24 +0000
References: <aRLvrfx6tOa-RhrY@shell.armlinux.org.uk>
In-Reply-To: <aRLvrfx6tOa-RhrY@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com,
 davem@davemloft.net, kernel@esmil.dk, edumazet@google.com, kuba@kernel.org,
 keguang.zhang@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, matthias.bgg@gmail.com,
 mcoquelin.stm32@gmail.com, minda.chen@starfivetech.com,
 netdev@vger.kernel.org, nobuhiro.iwamatsu.x90@mail.toshiba, pabeni@redhat.com
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

On Tue, 11 Nov 2025 08:11:25 +0000 you wrote:
> This series converts the remaining glue drivers that support
> multi-interface to use stmmac_get_phy_intf_sel(). The reason these
> drivers are not converted to the set_phy_intf_sel() method is
> because it is unclear whether there are ordering dependencies that
> would prevent it.
> 
> For example, reading the stm32mp2 documentation, it is required to
> set the ETH1_SEL field while the dwmac core is in reset and before
> clocks are enabled. This requirement can not be satsified at the
> moment (but could with further changes.)
> 
> [...]

Here is the summary with links:
  - [net-next,v2,01/13] net: stmmac: loongson1: use PHY_INTF_SEL_x
    https://git.kernel.org/netdev/net-next/c/5d88b24c1de8
  - [net-next,v2,02/13] net: stmmac: loongson1: use PHY_INTF_SEL_x directly
    https://git.kernel.org/netdev/net-next/c/031f7a05d4b3
  - [net-next,v2,03/13] net: stmmac: loongson1: use stmmac_get_phy_intf_sel()
    https://git.kernel.org/netdev/net-next/c/83eb6c7e1864
  - [net-next,v2,04/13] net: stmmac: mediatek: use PHY_INTF_SEL_x
    https://git.kernel.org/netdev/net-next/c/c3308d380e2c
  - [net-next,v2,05/13] net: stmmac: mediatek: use stmmac_get_phy_intf_sel()
    https://git.kernel.org/netdev/net-next/c/d9c7964fd934
  - [net-next,v2,06/13] net: stmmac: mediatek: simplify set_interface() methods
    https://git.kernel.org/netdev/net-next/c/f06620091fe7
  - [net-next,v2,07/13] net: stmmac: starfive: use PHY_INTF_SEL_x to select PHY interface
    https://git.kernel.org/netdev/net-next/c/f0917b475378
  - [net-next,v2,08/13] net: stmmac: starfive: use stmmac_get_phy_intf_sel()
    https://git.kernel.org/netdev/net-next/c/d22045997b53
  - [net-next,v2,09/13] net: stmmac: stm32: use PHY_INTF_SEL_x to select PHY interface
    https://git.kernel.org/netdev/net-next/c/73130c298fa0
  - [net-next,v2,10/13] net: stmmac: stm32: use PHY_INTF_SEL_x directly
    https://git.kernel.org/netdev/net-next/c/07669cf12ea8
  - [net-next,v2,11/13] net: stmmac: stm32: use stmmac_get_phy_intf_sel()
    https://git.kernel.org/netdev/net-next/c/45c5e24a53f1
  - [net-next,v2,12/13] net: stmmac: visconti: use PHY_INTF_SEL_x to select PHY interface
    https://git.kernel.org/netdev/net-next/c/bb68e0183e04
  - [net-next,v2,13/13] net: stmmac: visconti: use stmmac_get_phy_intf_sel()
    https://git.kernel.org/netdev/net-next/c/ccb4ff9f24e2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



