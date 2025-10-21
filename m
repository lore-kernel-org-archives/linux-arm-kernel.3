Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C20CCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 00:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z8yxCV1rihdgNW06yNi6btHIMFL2Tl2MiLb3GZKvv6k=; b=qF8gr/KnacaWBIQJewpgq0jmY7
	jtavKBJ6yo55n16iPhavcm/DPml/BqH2pVBk43XmwfAEr7u89wsrrTxQltvc53U/spivZ3m0YD2TX
	w8Aisy4vOfRrDV50j7/R6Zzfy9f02qNSZBNBRhjuaYZXBnkQR1Sfa6SgQ01gaVSOtmVRFLX5MDrNU
	jFjxnlstybsESWrrnrPVcqlB4hxOW+JXdAvNS2dBU/mM6ah+0WqQflczrsp3/Mb9IrkHL/5ty6W1f
	wXx4pSJUaitqIZ/udouzNdMps/XReiJmOYYPPS1lpyaFLhqzfqkL6lc30HPxC5LJ21Z2t0KPpuiLF
	LDh5Rxhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB0R2-0000000FN7n-1B57;
	Tue, 21 Oct 2025 00:41:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB0R0-0000000FN6r-1SsS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 00:41:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1601461407;
	Tue, 21 Oct 2025 00:40:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8F8AC4CEFB;
	Tue, 21 Oct 2025 00:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761007250;
	bh=UU1RkXwZN8NwOrfKRqz1pbaC+bNTIeLHOSMus2MSmCI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RuVmwOUXaDCl969T+Def4jubbj5ikNZL1Jx+dMTQsZsDS/LntPH3l06U4H+N30OaJ
	 0iJUOXcIrix6lyQw/c0S5arVQH19mYzFYMxfDmHLYV10LYhcnA5wToKukUmz3TfFcd
	 UhpG5GehVxOG9PrEA2NWHu+QaoG8iQz6vY19Zow4+5SvQh/B6T4o8Qt7dcHJJb+rtm
	 7fYIZnsdZxRgs52WtPeOThufbn/RooNRUOnd9shGeA16HyvZItmqx7NAU2AILD2gsQ
	 3jyVQv/3Yup5sCGwmxrLirr0UYNWqw4fgY+Vl3YUdBeWN8UHqdQgqEtwYAIwlfFEoz
	 8ARJgAhOeJJSw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADEF33A4102D;
	Tue, 21 Oct 2025 00:40:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 00/14] net: stmmac: phylink PCS conversion
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176100723252.470828.3402215548050414141.git-patchwork-notify@kernel.org>
Date: Tue, 21 Oct 2025 00:40:32 +0000
References: <aPECqg0vZGnBFCbh@shell.armlinux.org.uk>
In-Reply-To: <aPECqg0vZGnBFCbh@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, quic_abchauha@quicinc.com,
 alexandre.torgue@foss.st.com, alexis.lothore@bootlin.com,
 andrew+netdev@lunn.ch, boon.khai.ng@altera.com,
 yong.liang.choong@linux.intel.com, daniel.machon@microchip.com,
 davem@davemloft.net, dfustini@tenstorrent.com,
 emil.renner.berthing@canonical.com, edumazet@google.com,
 faizal.abdul.rahim@linux.intel.com, 0x1207@gmail.com, inochiama@gmail.com,
 jacob.e.keller@intel.com, kuba@kernel.org, jan.petrous@oss.nxp.com,
 jszhang@kernel.org, kees@kernel.org, hayashi.kunihiko@socionext.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, leyfoon.tan@starfivetech.com,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, matthew.gerlach@altera.com,
 maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com,
 michal.swiatkowski@linux.intel.com, netdev@vger.kernel.org,
 o.rempel@pengutronix.de, pabeni@redhat.com, rohan.g.thomas@altera.com,
 shenwei.wang@nxp.com, horms@kernel.org, yoong.siang.song@intel.com,
 swathi.ks@samsung.com, yangtiezhu@loongson.cn, vkoul@kernel.org,
 olteanv@gmail.com, vladimir.oltean@nxp.com, eleanor15x@gmail.com
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

On Thu, 16 Oct 2025 15:35:22 +0100 you wrote:
> This series is radical - it takes the brave step of ripping out much of
> the existing PCS support code and throwing it all away.
> 
> I have discussed the introduction of the STMMAC_FLAG_HAS_INTEGRATED_PCS
> flag with Bartosz Golaszewski, and the conclusion I came to is that
> this is to workaround the breakage that I've been going on about
> concerning the phylink conversion for the last five or six years.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,01/14] net: stmmac: remove broken PCS code
    https://git.kernel.org/netdev/net-next/c/813882ae2275
  - [net-next,v2,02/14] net: stmmac: remove xstats.pcs_* members
    https://git.kernel.org/netdev/net-next/c/14f74bc6dc69
  - [net-next,v2,03/14] net: stmmac: remove SGMII/RGMII/SMII interrupt handling
    https://git.kernel.org/netdev/net-next/c/2e2c878a3141
  - [net-next,v2,04/14] net: stmmac: remove PCS "mode" pause handling
    https://git.kernel.org/netdev/net-next/c/ebc5d656b78c
  - [net-next,v2,05/14] net: stmmac: remove unused PCS loopback support
    https://git.kernel.org/netdev/net-next/c/19064a58bd3c
  - [net-next,v2,06/14] net: stmmac: remove hw->ps xxx_core_init() hardware setup
    https://git.kernel.org/netdev/net-next/c/aa1b6775aef7
  - [net-next,v2,07/14] net: stmmac: remove RGMII "pcs" mode
    https://git.kernel.org/netdev/net-next/c/70589b05a03e
  - [net-next,v2,08/14] net: stmmac: move reverse-"pcs" mode setup to stmmac_check_pcs_mode()
    https://git.kernel.org/netdev/net-next/c/c7b0d7874de0
  - [net-next,v2,09/14] net: stmmac: simplify stmmac_check_pcs_mode()
    https://git.kernel.org/netdev/net-next/c/412d5f32cb36
  - [net-next,v2,10/14] net: stmmac: hw->ps becomes hw->reverse_sgmii_enable
    https://git.kernel.org/netdev/net-next/c/5d1e7621f869
  - [net-next,v2,11/14] net: stmmac: do not require snps,ps-speed for SGMII
    https://git.kernel.org/netdev/net-next/c/5c61db08d9ae
  - [net-next,v2,12/14] net: stmmac: only call stmmac_pcs_ctrl_ane() for integrated SGMII PCS
    https://git.kernel.org/netdev/net-next/c/045d7e5727c4
  - [net-next,v2,13/14] net: stmmac: provide PCS initialisation hook
    https://git.kernel.org/netdev/net-next/c/237e54caeaef
  - [net-next,v2,14/14] net: stmmac: convert to phylink PCS support
    https://git.kernel.org/netdev/net-next/c/2c81f3357136

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



