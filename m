Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1372DE67A63
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 04:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aHL9yblgZevTjW7G4dfR149xPCMXl2tIR++OnIJ+ZEY=; b=NgVzoTUpIomkmuEVkA68uOBJKt
	QIS4fc+FfIg3d7ZMN4V/Nymx1mrCwjFpLju7dHRa6L2vrCT85jvf/vhHHhnS43bnDQ0TjUuQGMmWa
	3KsBGsQ8CsvWkCA7owtwNKHKTL0lQP8cgG48VE2+yPMrZgab+kJk0yQS+X+pbD7Ga8wOP8tQoGNP0
	unq915I9QffMRU8r5dNDXG8liOTiIvBZtcpzO/7C4uhA/0q+luoK18TMj2q9WgIqecTsGEbXErOeJ
	xFrS0z5NlqOMpHN8T2A1uq8cemvm0t/y9ceI+mVN3/jpTBH8+sTPTAngel1X3Zd3bstfeet5GNzAn
	jM016ImA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxHf2-0000000EVrz-17Cm;
	Tue, 03 Mar 2026 04:47:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxHev-0000000EVq5-2L9h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 04:47:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7A702443E9;
	Tue,  3 Mar 2026 04:47:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5320EC116C6;
	Tue,  3 Mar 2026 04:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772513220;
	bh=CS1WrxtxU/kHPZfcygHyRAiSv8ol2PAZ5jWVio9L/AA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BJ+REdOOU26G9ad9XcSeLSyblI4tigLc+DZn3j7z+pMBYsenlvPMIK9+3oDHDWk/w
	 6YfN9+LuTCM4keU1xpH4oshl1rKyelnlWDjbuRiU1umFFpgFFObh1sIbEwrDyiaDVI
	 erP/IBYCcGTsdvoyQvsPZ4L02f2kQZeT1Khe2hDkBPhYZk+v6x7r2u1n8bJb9jGtGb
	 OF1DGnRBmcvwOQEB4WK4Se1NpENTd0bxefIJygYrEzh6hXCSF7mXPk00rraRZie0Zp
	 9ZrLuZOLy9NfGW5RuD73zgwSFxminkIcm+h5dnphQDXo2aHvZBLuqEqoyNuAjnJKse
	 lYkVaS/IyrD3Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02DCB3809A80;
	Tue,  3 Mar 2026 04:47:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 00/14] net: stmmac: further cleanups
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177251322154.625663.1785427574755264345.git-patchwork-notify@kernel.org>
Date: Tue, 03 Mar 2026 04:47:01 +0000
References: <aaFpZvuIzOLaNM0m@shell.armlinux.org.uk>
In-Reply-To: <aaFpZvuIzOLaNM0m@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_204701_637347_CFA5C2F8 
X-CRM114-Status: GOOD (  10.21  )
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

On Fri, 27 Feb 2026 09:52:38 +0000 you wrote:
> Hi,
> 
> Yet another bunch of patches cleaning up the stmmac driver.
> 
> We start off by cleaning up the formatting for stmmac_mac_finish(). Then
> remove a plat_dat->port_node which is redundant, followed by several
> descriptor methods that aren't called.
> 
> [...]

Here is the summary with links:
  - [net-next,01/14] net: stmmac: clean up formatting in stmmac_mac_finish()
    https://git.kernel.org/netdev/net-next/c/940ec40dd299
  - [net-next,02/14] net: stmmac: remove plat_dat->port_node
    https://git.kernel.org/netdev/net-next/c/44a2ec96d374
  - [net-next,03/14] net: stmmac: remove .get_tx_owner()
    https://git.kernel.org/netdev/net-next/c/d48ba98bbc82
  - [net-next,04/14] net: stmmac: remove .get_tx_ls()
    https://git.kernel.org/netdev/net-next/c/1fe444bdc583
  - [net-next,05/14] net: stmmac: remove .get_tx_len()
    https://git.kernel.org/netdev/net-next/c/19f2d59c3c3a
  - [net-next,06/14] net: stmmac: remove dwmac4 DMA_CHAN_INTR_DEFAULT_[TR]X*
    https://git.kernel.org/netdev/net-next/c/d1925291231e
  - [net-next,07/14] net: stmmac: remove dwmac410_(enable|disable)_dma_irq
    https://git.kernel.org/netdev/net-next/c/0e7cb34d0f6c
  - [net-next,08/14] net: stmmac: remove mac->xlgmac
    https://git.kernel.org/netdev/net-next/c/70bafb53b305
  - [net-next,09/14] net: stmmac: make extend_desc boolean
    https://git.kernel.org/netdev/net-next/c/ecb037f58da7
  - [net-next,10/14] net: stmmac: make chain_mode a boolean
    https://git.kernel.org/netdev/net-next/c/a2a3832ad76d
  - [net-next,11/14] net: stmmac: make dma_cfg mixed/fixed burst boolean
    https://git.kernel.org/netdev/net-next/c/1558705afbb2
  - [net-next,12/14] net: stmmac: move initialisation of dma_cfg->atds
    https://git.kernel.org/netdev/net-next/c/0835bc72510f
  - [net-next,13/14] net: stmmac: simplify atds initialisation
    https://git.kernel.org/netdev/net-next/c/93cde989bd28
  - [net-next,14/14] net: stmmac: move DMA configuration validation to driver probe
    https://git.kernel.org/netdev/net-next/c/07a8531d4427

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



