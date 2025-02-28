Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4FF9C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 18:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=145++mwwjIoAaQbE61aIXnzEmj2//gARb3NFlxUHaXE=; b=sO/V44A4kSzCcoXr7BNUZGs41K
	f7puML4IHoIgrGt2Xai+kb079GL82NBAxKU1+9swErpEE6CymAjw5n47RogF+M8H0Rsr/4+wlVTzY
	wsL8Ld4aWtWv8Ue1KvS5JCDTHJrt1tDeDeu9ag9T/+SJRRx9z3Qa85Gfbb2SuuYQ433VED7RfiIQw
	09CBqy6iuBuIpdy7UJBMDIw0lM28KUt1Hi1BktN11nMr1jMVnZn9laH3RA8ZbyO4NFJWJQ1emeZcU
	cseMozJ/8qy7yF8MykfOwZI2+EmhLeL44afUikMS/dSlKx7x0DN7Fe58IjSWjesfE6JjJIaV/Mhw1
	lTpRHDJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to5RQ-0000000CEle-3rh7;
	Fri, 28 Feb 2025 18:50:32 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to57a-0000000C951-2QYl;
	Fri, 28 Feb 2025 18:30:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3C35461FC3;
	Fri, 28 Feb 2025 18:29:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 917B1C4CEED;
	Fri, 28 Feb 2025 18:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740767401;
	bh=OilwAZ5RXV38zTb+M44/89NDdAfBWpMVpgBj9F3ie5M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qko06JpBaB0Mhqay9/mFCbAZRqjBKioIFBIjsaLX69CFiooIOK6cQTIib8VidkwDa
	 6920EKQBFWvPxU/KaDSCCQeUmtMyIhUFxJ4SaiAw+TBD9dSJ0sDdr0AIc+oDoyea1u
	 Cc0CV4QGr2nGWBKrENwhuXlvL4dMSg7D60RJwDn6Ay2EiIGoH5Re4bbPE/fUduBWAl
	 ED/lJ4r/dxbL76l1rHW5blvs99gEzk0NkQhN1AmHpo1/2Viw687dTXHMY1839QATdA
	 CihdYAaDCONwhLA+EZWj70TPPMYxNRubEUWc1r8VX0g5dC2CXgcB4OQ0nXMhkcf+XD
	 ym4ylURLCwE1w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB9B4380CFF1;
	Fri, 28 Feb 2025 18:30:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 00/11] net: stmmac: cleanup transmit clock setting
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174076743376.2237263.14950662798271470831.git-patchwork-notify@kernel.org>
Date: Fri, 28 Feb 2025 18:30:33 +0000
References: <Z8AtX-wyPal1auVO@shell.armlinux.org.uk>
In-Reply-To: <Z8AtX-wyPal1auVO@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, drew@pdp7.com, kernel@esmil.dk,
 edumazet@google.com, festevam@gmail.com, wefu@redhat.com, guoren@kernel.org,
 imx@lists.linux.dev, kuba@kernel.org, jan.petrous@oss.nxp.com,
 jbrunet@baylibre.com, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 martin.blumenstingl@googlemail.com, mcoquelin.stm32@gmail.com,
 minda.chen@starfivetech.com, neil.armstrong@linaro.org,
 netdev@vger.kernel.org, pabeni@redhat.com, kernel@pengutronix.de,
 s.hauer@pengutronix.de, shawnguo@kernel.org
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

On Thu, 27 Feb 2025 09:16:15 +0000 you wrote:
> Hi,
> 
> A lot of stmmac platform code which sets the transmit clock is very
> similar - they decode the speed to the clock rate (125, 25 or 2.5 MHz)
> and then set a clock to that rate.
> 
> The DWMAC core appears to have a clock input for the transmit section
> called clk_tx_i which requires this rate.
> 
> [...]

Here is the summary with links:
  - [net-next,01/11] net: stmmac: provide set_clk_tx_rate() hook
    https://git.kernel.org/netdev/net-next/c/dea5c8ec20be
  - [net-next,02/11] net: stmmac: provide generic implementation for set_clk_tx_rate method
    https://git.kernel.org/netdev/net-next/c/12bce6d5404e
  - [net-next,03/11] net: stmmac: dwc-qos: use generic stmmac_set_clk_tx_rate()
    https://git.kernel.org/netdev/net-next/c/17c24f6dc641
  - [net-next,04/11] net: stmmac: starfive: use generic stmmac_set_clk_tx_rate()
    https://git.kernel.org/netdev/net-next/c/c81eb3da0be8
  - [net-next,05/11] net: stmmac: s32: use generic stmmac_set_clk_tx_rate()
    https://git.kernel.org/netdev/net-next/c/36fa8c960720
  - [net-next,06/11] net: stmmac: intel: use generic stmmac_set_clk_tx_rate()
    https://git.kernel.org/netdev/net-next/c/61356fb1b0d6
  - [net-next,07/11] net: stmmac: imx: use generic stmmac_set_clk_tx_rate()
    https://git.kernel.org/netdev/net-next/c/b693ce4f2704
  - [net-next,08/11] net: stmmac: rk: switch to use set_clk_tx_rate() hook
    https://git.kernel.org/netdev/net-next/c/c8caf6100f6d
  - [net-next,09/11] net: stmmac: ipq806x: switch to use set_clk_tx_rate() hook
    https://git.kernel.org/netdev/net-next/c/ca723519c28b
  - [net-next,10/11] net: stmmac: meson: switch to use set_clk_tx_rate() hook
    https://git.kernel.org/netdev/net-next/c/2a7d55f901a5
  - [net-next,11/11] net: stmmac: thead: switch to use set_clk_tx_rate() hook
    https://git.kernel.org/netdev/net-next/c/945db208fbe7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



