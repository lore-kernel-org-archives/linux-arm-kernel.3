Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F8CCCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 00:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/FJpKyU+MF/aXXgYOCgn5htgwX9FXbZ2s93yGG7Ric=; b=neuqTc2/76aMcOLLhI0tj/IpXb
	H/27kSEQmp+0gIXcLhWqy6nCex+ubQJxqzWu1jn5FYs6LSiy17Co/t3tHWK4jPx/1PqORDHIk9ubU
	AvsCh9+p6IlS61Ajz0AMpyAasuQncDXaeNxNFh+LTIM8dRQZKPpq8KPZCWiptVyjxdMsILCUqWuv5
	FAU0TVuaovvK2LeqwXi9akmHUBBWNZ2rxh+beyMAflKWGcM3MXBqJJ6xvszI0BBOaT9DCh7gtLyh5
	TZgjF3KXESQA9LIzDotVCAKPJ1t2GOuVQgfZZCVFWGvPBPMRfdH5z4sbFpMW7U27B+7TSpszgl1I8
	S+/cgmtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGRGe-0000000CnCo-2pha;
	Wed, 05 Nov 2025 00:20:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGRGc-0000000CnCB-00vD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 00:20:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5491D44861;
	Wed,  5 Nov 2025 00:20:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C497C116B1;
	Wed,  5 Nov 2025 00:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762302049;
	bh=3MKFuCG76JthLJcZE3T3Op7stJ2k8Ttv8bqnfs9tWiE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=INojycZy/a78lhVsLvVbeiECZLvsgpUyNONTu4veLZSMfi2e3lJyk0lhbjUy3QZHZ
	 NGDkYI9wKuMd+GNF8uaYyfmeV5vBqYG0eNH75xE9lfqkLTr6by2JUbcU2MxPGWLMNY
	 wjqIqv4bXs0DnB0y1BJG5h7QYMVEH01j69TJfwp9D1CNtZ1GKdR3YLFkYEgU89DU9H
	 3qJgmPG4RulqybvIwgtHGcVoUQR9GI0YGS1eP6mJzlwxLW39Q+Ha8g3OunNUZMxdz+
	 mYWN4bT+tNgUNH9kDvYI8/YyHC9cMX7rIZ2X0P+YdUkW7agsF7NY7onfZo5qshndfO
	 CmVHFirNLCsOA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33CB2380AA54;
	Wed,  5 Nov 2025 00:20:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 00/11] net: stmmac: multi-interface stmmac
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176230202300.3035250.17732707564655810857.git-patchwork-notify@kernel.org>
Date: Wed, 05 Nov 2025 00:20:23 +0000
References: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
In-Reply-To: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 festevam@gmail.com, imx@lists.linux.dev, kuba@kernel.org,
 jan.petrous@oss.nxp.com, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com, kernel@pengutronix.de,
 s32@nxp.com, s.hauer@pengutronix.de, shawnguo@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_162050_079641_2D16C348 
X-CRM114-Status: GOOD (  11.38  )
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

On Mon, 3 Nov 2025 11:49:35 +0000 you wrote:
> Hi,
> 
> This series adds a callback for platform glue to configure the stmmac
> core interface mode depending on the PHY interface mode that is being
> used. This is currently only called justbefore the dwmac core is reset
> since these signals are latched on reset.
> 
> [...]

Here is the summary with links:
  - [net-next,01/11] net: stmmac: imx: use phylink's interface mode for set_clk_tx_rate()
    https://git.kernel.org/netdev/net-next/c/42190a188fdb
  - [net-next,02/11] net: stmmac: s32: move PHY_INTF_SEL_x definitions out of the way
    https://git.kernel.org/netdev/net-next/c/d8df08b0df02
  - [net-next,03/11] net: stmmac: add phy_intf_sel and ACTPHYIF definitions
    https://git.kernel.org/netdev/net-next/c/38e8c0fb0fc3
  - [net-next,04/11] net: stmmac: add stmmac_get_phy_intf_sel()
    https://git.kernel.org/netdev/net-next/c/2f2a7b907446
  - [net-next,05/11] net: stmmac: add support for configuring the phy_intf_sel inputs
    https://git.kernel.org/netdev/net-next/c/15ade7dbf64f
  - [net-next,06/11] net: stmmac: imx: convert to PHY_INTF_SEL_xxx
    https://git.kernel.org/netdev/net-next/c/8088ca0d88f8
  - [net-next,07/11] net: stmmac: imx: use FIELD_PREP()/FIELD_GET() for PHY_INTF_SEL_x
    https://git.kernel.org/netdev/net-next/c/27db57875c08
  - [net-next,08/11] net: stmmac: imx: use stmmac_get_phy_intf_sel()
    https://git.kernel.org/netdev/net-next/c/cb09d1b9582a
  - [net-next,09/11] net: stmmac: imx: simplify set_intf_mode() implementations
    https://git.kernel.org/netdev/net-next/c/8fc75fe5948d
  - [net-next,10/11] net: stmmac: imx: cleanup arguments for set_intf_mode() method
    https://git.kernel.org/netdev/net-next/c/fb526d0c16c1
  - [net-next,11/11] net: stmmac: imx: use ->set_phy_intf_sel()
    https://git.kernel.org/netdev/net-next/c/da836959c78a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



