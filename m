Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBB5CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 03:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xrDU9iuO3h8fs/5flWhgbsmn8Bu4aapOuvAqkyRv/p8=; b=1wfpf4ftFL/1cMy4WyAxR6nSnp
	zV5QUkm9oO7k5zQHI5pLXQ0fCu/aCdllUZl6dngYXEw3YM694BoZgepmY0ZbxRBIIaN6NeaQvX0NX
	5SA3btnb2okpEWJHTlrpdOZ2UW578wIPADToG6xZ4DRTKRfgaa+IPdh5/aKtbYiYCKifPek9g2IjG
	Rpx1T++oQacwLVKHjOjzktzVkRVX1uaKL6eJvr/6eNK6jPqTZrU/JH9egW1zD2oEJS2sW8UeSzDEG
	n+xCvBHDalBi6ujL2k4AgAo/YPlT5TCVf68GoWHtXVGM3phV+RnWdSgbLUdOIqEffv9hJistk5EzV
	hDsfQjKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHZVi-00000002ISN-1UTo;
	Sat, 08 Nov 2025 03:21:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHZVg-00000002ISB-2eiH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 03:21:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9064D601CF;
	Sat,  8 Nov 2025 03:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC16C4CEF7;
	Sat,  8 Nov 2025 03:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762572063;
	bh=DP08fxj1Pdwkhh9oz9l/d6OztIyIzUnB15JwEWi8VFk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=G5QfO/MiUu27w75C/ZLOlvWMwACK1YXcNog7YMeLC7VyzhKmEW66mj5ZB3oL4uOeY
	 ho19rE0+re+c9qvvkIkyQtvUfs384GH25HqlPKY3E+eSYKtG50678DWyAcJh8Gw2ec
	 fXvI8j7y7S+0tpTlKuphx1hXd9Ghfy2Ytoo3Oa/f6+bctPWzyZiNcq22YxFwpB6UzW
	 IyaIZF33P9q+LbpQO9QlRUjBYbo3qrD4SRPs9e+K1oHUTVi+yrZNp6PAuPLdFWq5/t
	 oQ7VToqP0EhYpAKWLzCV48bpcXtGoH2cHUCEo/uCw/opFVhvOipzQfGJNsFQBo2xIc
	 dN0oZxWgRZr5Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 716DC3A40FCA;
	Sat,  8 Nov 2025 03:20:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/9] net: stmmac: lpc18xx and sti: convert to
 set_phy_intf_sel()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176257203525.1236021.18202260388195244751.git-patchwork-notify@kernel.org>
Date: Sat, 08 Nov 2025 03:20:35 +0000
References: <aQyEs4DAZRWpAz32@shell.armlinux.org.uk>
In-Reply-To: <aQyEs4DAZRWpAz32@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com, vz@mleia.com
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

On Thu, 6 Nov 2025 11:21:23 +0000 you wrote:
> This series converts lpc18xx and sti to use the new .set_phy_intf_sel()
> method.
> 
>  .../net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c    | 42 ++++++++++--------
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c    | 50 ++++++++--------------
>  2 files changed, 42 insertions(+), 50 deletions(-)

Here is the summary with links:
  - [net-next,1/9] net: stmmac: lpc18xx: convert to PHY_INTF_SEL_x
    https://git.kernel.org/netdev/net-next/c/5636fcdb0211
  - [net-next,2/9] net: stmmac: lpc18xx: use PHY_INTF_SEL_x directly
    https://git.kernel.org/netdev/net-next/c/eb0533c7e63b
  - [net-next,3/9] net: stmmac: lpc18xx: use stmmac_get_phy_intf_sel()
    https://git.kernel.org/netdev/net-next/c/9882f1219408
  - [net-next,4/9] net: stmmac: lpc18xx: validate phy_intf_sel
    https://git.kernel.org/netdev/net-next/c/4bad4219249f
  - [net-next,5/9] net: stmmac: lpc18xx: use ->set_phy_intf_sel()
    https://git.kernel.org/netdev/net-next/c/7fe0e06a7364
  - [net-next,6/9] net: stmmac: sti: use PHY_INTF_SEL_x to select PHY interface
    https://git.kernel.org/netdev/net-next/c/9cd23c02ac57
  - [net-next,7/9] net: stmmac: sti: use PHY_INTF_SEL_x directly
    https://git.kernel.org/netdev/net-next/c/bd5a68159259
  - [net-next,8/9] net: stmmac: sti: use stmmac_get_phy_intf_sel()
    https://git.kernel.org/netdev/net-next/c/ef5e870be90f
  - [net-next,9/9] net: stmmac: sti: use ->set_phy_intf_sel()
    https://git.kernel.org/netdev/net-next/c/e3c8f25cf2aa

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



