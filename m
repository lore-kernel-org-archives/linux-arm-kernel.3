Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E34C5C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 00:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=866y1zFYMGQapdbO6V3O+AHD/ATtpHsp/dEOOLt10f8=; b=2IREc8TcGFnONFan3DiXFwBGML
	Ni8Cs+nQ4suquLqEQTl0rgOwT8jYuYZKgVjyQoHgNYCdd554yCdQWtwsp0v7ubQHZ7jFz3yQJwMQj
	Rfm7WxVfEh+/x6YU7wKojaiFQLZ4j3xkbwOnYBcKxTE+kJhXDFxh3cASmjN+YpSjJSmS1EpkWIFO6
	ZPdx331qBOUz1PU8aq4olj29+QF2XHEI1f8+lByr2Afr9JzKBxrJKPLkzru1jRKt6KScfza0glufq
	kVzh9Fb7mwh0ahElmsKdJsYWy8x2V0V7V/pUgYypuMYs3LmSaoM8jBUzIb7lpkN1Sn00cqFMGDzl1
	5r2J/jYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4UFY-000000041Vw-3FkY;
	Tue, 15 Apr 2025 00:34:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4UBj-000000040Xj-1bzi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 00:30:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BCACD4A5BA;
	Tue, 15 Apr 2025 00:30:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91E0EC4CEE2;
	Tue, 15 Apr 2025 00:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744677005;
	bh=yjpdz4PuIqTD7mEXGatsyIxmp7A6s9XAhTm4vrHfH2s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=CE6nEiad/1W1gBK8pSqbDaMepRZj/zt+jzb/w3Nz54ovwAX29XRmP548oeJdXcgIX
	 uuxv3syie1V12w+LbBquq0yyQ+DXyuZBfgNS6E9KfyQuIuruyHosRloD84MqEtYRWj
	 DxcfjdjqJiR5iYjv+9HRMVwtqw4z+O/+rblyG4fxUM64JbKWaNmEsXAbDErzJru2P9
	 5+w8+E6IjWmj0v87YPBwRYmmeMqvJ5tCxxO2LimaYu8sILZ9rGM28i7WI/hkMmn8Vn
	 sOESEqhEeurj2hHBGo+4N4wz7XM8GMRlZZD2rsb1Iyhs130qpDf+3yRyT0j3uCOdHP
	 Bqz4dMs3V61Vw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE54C3822D1A;
	Tue, 15 Apr 2025 00:30:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/5] =?iso-8859-1?q?net=3A_stmmac=3A_remove_unne?=
	=?iso-8859-1?q?cessary_initialisation_of_1=B5s?= TIC counter
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174467704323.2083973.2524046763560331419.git-patchwork-notify@kernel.org>
Date: Tue, 15 Apr 2025 00:30:43 +0000
References: <Z_oe0U5E0i3uZbop@shell.armlinux.org.uk>
In-Reply-To: <Z_oe0U5E0i3uZbop@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, jonathanh@nvidia.com, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com, p.zabel@pengutronix.de,
 richardcochran@gmail.com, treding@nvidia.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_173007_442249_9DC60688 
X-CRM114-Status: UNSURE (   9.00  )
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

On Sat, 12 Apr 2025 09:05:37 +0100 you wrote:
> Hi,
> 
> In commit 8efbdbfa9938 ("net: stmmac: Initialize MAC_ONEUS_TIC_COUNTER
> register"), code to initialise the LPI 1us counter in dwmac4's
> initialisation was added, making the initialisation in glue drivers
> unnecessary. This series cleans up the now redundant initialisation.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/5] net: stmmac: dwc-qos: remove tegra_eqos_init()
    https://git.kernel.org/netdev/net-next/c/dadc3a6be469
  - [net-next,v2,2/5] net: stmmac: intel: remove eee_usecs_rate and hardware write
    https://git.kernel.org/netdev/net-next/c/17ec6dbaaed3
  - [net-next,v2,3/5] net: stmmac: intel-plat: remove eee_usecs_rate and hardware write
    https://git.kernel.org/netdev/net-next/c/35031c6256f1
  - [net-next,v2,4/5] net: stmmac: remove eee_usecs_rate
    https://git.kernel.org/netdev/net-next/c/651f88cb046c
  - [net-next,v2,5/5] net: stmmac: remove GMAC_1US_TIC_COUNTER definition
    https://git.kernel.org/netdev/net-next/c/25af74ed68c4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



