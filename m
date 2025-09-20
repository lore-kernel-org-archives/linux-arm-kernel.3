Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C00CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 00:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N+Gm0BmHC/L1qOP19l8I1KxsaJ9j03YK9zyKfthMSOc=; b=cORP1z3QoldY8rsfEzAr3/6vUm
	K/Yb9Xo/v2bKQXIcOxmQkbmJWV8nCTOxfEe/4EVeCKmUvKHugdN+nM/wRZGJleJwZxhtNq+SwZ76f
	uU06ba4R3sKHw7rjBtdSyhkBt7mz8zroOICj8W+ZRTNrgMz+u4T/8+3PHiUqah+Uxh6ndMC1o4kkT
	Ao6Kedsha/Wf67Q7shbF+WW0wj52hcHagMsaQMyGfm0deSQebXoC8AB8j0jYP3VrhARzMxdySHnQH
	E1yToAbAa/msaL22ssmiKjwmUvHUEHrvWgumxvvQsuhovitMAe+t5nzmftOdx/hOGrAioK0AkLBVL
	R0PNGB6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzlUb-00000004Pi9-00MY;
	Sat, 20 Sep 2025 00:30:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzlUa-00000004Phw-2DDP;
	Sat, 20 Sep 2025 00:30:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A0FEF6013C;
	Sat, 20 Sep 2025 00:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49A72C4CEF0;
	Sat, 20 Sep 2025 00:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758328219;
	bh=Yes7uCAJIf1OW9O4lN6N9kWrrNuylVquEJn5lf44T44=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LlSAb8P8UrBmrtodlL0ShRrL0RB/FGZLzl+svKgxt3WY1vou6qUJwz7D00B/ZXSle
	 dmmeHMKIrCaZPNQYJ+hbARFCLF3BeG7+mz+dA8iu16BHLxtWaMVYHn18eynY59S/H9
	 /yJYfv6NkCmIc8bZBwewQOWosl+jp9OATHySy4BBchEKejpLe42R6GnT0ArMrcZcQl
	 7KvspaiqADgBilZFJk9CxI1SLjT2ttZ6NdGhUs5mUL1c8a84R8T5jqZSj0cStOifYd
	 T2cP/YDSwrwUsiYhSxYdupE+K5NMm8whtP8u94NItPIpXVKTOcTvlB1gTfV4WKbTHf
	 PN2u2DiCDEE6w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADFF439D0C20;
	Sat, 20 Sep 2025 00:30:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 00/10] net: stmmac: remove mac_interface
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175832821850.3748897.10411784128279455244.git-patchwork-notify@kernel.org>
Date: Sat, 20 Sep 2025 00:30:18 +0000
References: <aMrPpc8oRxqGtVPJ@shell.armlinux.org.uk>
In-Reply-To: <aMrPpc8oRxqGtVPJ@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, wens@csie.org, davem@davemloft.net,
 fustini@kernel.org, kernel@esmil.dk, edumazet@google.com, festevam@gmail.com,
 wefu@redhat.com, guoren@kernel.org, imx@lists.linux.dev, kuba@kernel.org,
 jernej.skrabec@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, maxime.chevallier@bootlin.com,
 mcoquelin.stm32@gmail.com, minda.chen@starfivetech.com,
 mohd.anwar@oss.qualcomm.com, netdev@vger.kernel.org, pabeni@redhat.com,
 kernel@pengutronix.de, samuel@sholland.org, s.hauer@pengutronix.de,
 shawnguo@kernel.org, vz@mleia.com
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

On Wed, 17 Sep 2025 16:11:33 +0100 you wrote:
> The dwmac core supports a range of interfaces, but when it comes to
> SerDes interfaces, the core itself does not include the SerDes block.
> Consequently, it has to provide an interface suitable to interface such
> a block to, and uses TBI for this.
> 
> The driver also uses "PCS" for RGMII, even though the dwmac PCS block
> is not present for this interface type - it was a convenice for the
> code structure as RGMII includes inband signalling of the PHY state,
> much like Cisco SGMII does at a high level.
> 
> [...]

Here is the summary with links:
  - [net-next,01/10] net: stmmac: rework mac_interface and phy_interface documentation
    https://git.kernel.org/netdev/net-next/c/32a8d2a197c1
  - [net-next,02/10] net: stmmac: use phy_interface in stmmac_check_pcs_mode()
    https://git.kernel.org/netdev/net-next/c/0522f152a2c9
  - [net-next,03/10] net: stmmac: imx: convert to use phy_interface
    https://git.kernel.org/netdev/net-next/c/db1948da6860
  - [net-next,04/10] net: stmmac: ingenic: convert to use phy_interface
    https://git.kernel.org/netdev/net-next/c/9ff682b4a28f
  - [net-next,05/10] net: stmmac: socfpga: convert to use phy_interface
    https://git.kernel.org/netdev/net-next/c/de696c63c1dc
  - [net-next,06/10] net: stmmac: starfive: convert to use phy_interface
    https://git.kernel.org/netdev/net-next/c/6cb2b69c3419
  - [net-next,07/10] net: stmmac: stm32: convert to use phy_interface
    https://git.kernel.org/netdev/net-next/c/0ca60c26f655
  - [net-next,08/10] net: stmmac: sun8i: convert to use phy_interface
    https://git.kernel.org/netdev/net-next/c/0fe080fa884e
  - [net-next,09/10] net: stmmac: thead: convert to use phy_interface
    https://git.kernel.org/netdev/net-next/c/3a94ecdf1afb
  - [net-next,10/10] net: stmmac: remove mac_interface
    https://git.kernel.org/netdev/net-next/c/6b0ed6a3a89c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



