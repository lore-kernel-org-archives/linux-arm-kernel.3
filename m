Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C411CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4h7FJ9ztFTiruGnHEyOBbr9+MzkEULDXp36cGte6iPI=; b=hLQZwJG7WS7bBr8JgO5BlAeaCp
	dmGCphifxR2PwjkudtwXqgZIT2+jMKw7qIeKW4+CE0sVRLd0UDgOasA5GcMKOhhfgxfozJ6i5zMer
	lw1JwW66EOocBc5zjQ/5mVPD0NtX2DsBHZRpJlZksEfj1LSCG8ydAjFbAdyskqJY4Po5EoiUyzTBz
	Xik9Gkjb/Hgd5TbLjQiaTjgBQd2+Nf2GtEqY/x3JBJWi2ZO+hu9zNvCmZk5TpBz62U+8cc7OpbR5y
	Cww1d6PazOLnefDKPpr8qhTZy7o1HLZ9zAVvV2u7OMfG4eiiybCYAsoK2cW8clHNnNZN+ZTb1gOfl
	paPbjfVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsG5-00000004uwE-2Krh;
	Tue, 09 Sep 2025 06:55:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvnBr-00000003TQA-31Wh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 01:30:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E97444B27;
	Tue,  9 Sep 2025 01:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EBE7C4CEF1;
	Tue,  9 Sep 2025 01:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757381433;
	bh=LW/aTIf77jl0JmfF2/xesj80TUgUyZIZrteGn5xgTdY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=N2LmF253IP2fFjntS60H1EYz6n0oEhQ5SgNReZZZmm3iqr6QI3hTSvNSk5bBn87IN
	 Nm7e6KWeH/dJMvr3InUPJE5nIKSenKb2OPVhh1h7OHDKEoKGmVWSJZcdEbfSic/Frt
	 fbCSclpBOXPLrO/ExMrE8fSwyZTVCbcGgWh2j/15/JOz934kzuyl9l0jBRAi/8MdNN
	 nb6Twcs4Ic29o2KgYjuNrkaWHbPQu7nNRzfJu7c4lmFYu/3MCnaBPME07q1IqL/c+A
	 +90B59i+nRriO0ExgWvZJpS3ql/ZedNtYlLNoswTgajTIPSPz+i4G/p9OGTKjaRu7d
	 15DhRXbwi0YiQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C8F383BF69;
	Tue,  9 Sep 2025 01:30:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 00/11] net: stmmac: mdio cleanups
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175738143698.108077.11508219910437568266.git-patchwork-notify@kernel.org>
Date: Tue, 09 Sep 2025 01:30:36 +0000
References: <aLmBwsMdW__XBv7g@shell.armlinux.org.uk>
In-Reply-To: <aLmBwsMdW__XBv7g@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_183035_799612_DED97EE2 
X-CRM114-Status: GOOD (  14.22  )
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

On Thu, 4 Sep 2025 13:10:42 +0100 you wrote:
> On Wed, Sep 03, 2025 at 01:38:57PM +0100, Russell King (Oracle) wrote:
> Hi,
> 
> Clean up the stmmac MDIO code:
> - provide an address register formatter to avoid repeated code
> - provide a common function to wait for the busy bit to clear
> - pre-compute the CR field (mdio clock divider)
> - move address formatter into read/write functions
> - combine the read/write functions into a common accessor function
> - move runtime PM handling into common accessor function
> - rename register constants to better reflect manufacturer names
> - move stmmac_clk_csr_set() into stmmac_mdio
> - make stmmac_clk_csr_set() return the CR field value and remove
>   priv->clk_csr
> - clean up if() range tests in stmmac_clk_csr_set()
> - use STMMAC_CSR_xxx definitions in initialisers
> 
> [...]

Here is the summary with links:
  - [net-next,v2,01/11] net: stmmac: mdio: provide address register formatter
    https://git.kernel.org/netdev/net-next/c/16e03235d51b
  - [net-next,v2,02/11] net: stmmac: mdio: provide stmmac_mdio_wait()
    https://git.kernel.org/netdev/net-next/c/9eb633ad1d69
  - [net-next,v2,03/11] net: stmmac: mdio: provide priv->gmii_address_bus_config
    https://git.kernel.org/netdev/net-next/c/6717746f33ab
  - [net-next,v2,04/11] net: stmmac: mdio: move stmmac_mdio_format_addr() into read/write
    https://git.kernel.org/netdev/net-next/c/6cb3d67ad624
  - [net-next,v2,05/11] net: stmmac: mdio: merge stmmac_mdio_read() and stmmac_mdio_write()
    https://git.kernel.org/netdev/net-next/c/9b0ed33a4256
  - [net-next,v2,06/11] net: stmmac: mdio: move runtime PM into stmmac_mdio_access()
    https://git.kernel.org/netdev/net-next/c/9b88194a3b68
  - [net-next,v2,07/11] net: stmmac: mdio: improve mdio register field definitions
    https://git.kernel.org/netdev/net-next/c/3581acbb789a
  - [net-next,v2,08/11] net: stmmac: mdio: move initialisation of priv->clk_csr to stmmac_mdio
    https://git.kernel.org/netdev/net-next/c/661a868937a1
  - [net-next,v2,09/11] net: stmmac: mdio: return clk_csr value from stmmac_clk_csr_set()
    https://git.kernel.org/netdev/net-next/c/231e2b016fb2
  - [net-next,v2,10/11] net: stmmac: mdio: remove redundant clock rate tests
    https://git.kernel.org/netdev/net-next/c/78c91bec8fb9
  - [net-next,v2,11/11] net: stmmac: use STMMAC_CSR_xxx definitions in platform glue
    https://git.kernel.org/netdev/net-next/c/fc8f62c827ea

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



