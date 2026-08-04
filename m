Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF787C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 00:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qD/kTSIycb4D0zwgPTSDDqWXIMWN3dBO5Y/1O5wHyq0=; b=YRABLgzm964UjeqGXCRghuJBFR
	iOmsVVltbbj9tiyGlXSeKC/GcjxVakU2bdrAuF4y+51GE8bfJMPw2bak93Ibn6K6z1eoQjLSSL6vL
	fD34GRc7bpvBnVZvMU5nAF+ZS2miKZRNzAapDJjLm0NyepoZYnOXsuGbAdAWYps+R+Hczbyygr9O8
	DHq+XVCLTgTYqBlpm6XgNIo5iE0InBpfAb9bDzRcBInclLiSQOW4Vj//SS8ANgU2AGfC4pmyquGYJ
	DV5+VhuMpaTRAmXqloY5x1I33b0kbVILmX3d5OjQbHT0GQoyfVG+6mfWbm/Y08XXqjakmhm/AhbCL
	mzgJhgig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr3DL-00000000kt6-1oB1;
	Tue, 04 Aug 2026 00:41:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr3DK-00000000ksw-0F60
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 00:41:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B23960A6B;
	Tue,  4 Aug 2026 00:41:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A11E1F00A3A;
	Tue,  4 Aug 2026 00:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785804060;
	bh=qD/kTSIycb4D0zwgPTSDDqWXIMWN3dBO5Y/1O5wHyq0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=kFQUBfmHS++WLFAJKGYgkyoaTcdYafYfeww/3HnI8VWa+InVYbcaKF52JAuFAoTlg
	 hO+Raogh8fUf0AVizyisjlWY0xKNrcVbWc13dSSe9cn8sRPJJsb40JhJX6/KPmwwCM
	 AkD4DMlJCHkk/qHDmxLBM1+HGjxS79IuxsfBxbd6qDCbTBQDbCTyUspa89UnrEdqw2
	 VoDRtA2tCCj/LNQGvHrt4nZiJQaJaxkb3ICtS55UlJ8ATDjxsuGCfnQM2iaKg5GU8d
	 qIfaIcnjfaMVm70gIjkkRDHT7kYscMaU8FuyfInZEhMOuGXmmc/F1+F/zbgyV1RM4x
	 k5czMrK0BvmaQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5698E3924467;
	Tue,  4 Aug 2026 00:40:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 0/2] net: stmmac: Fix PHY attach when custom
 PCS
 is in use
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178580402088.2893509.17745137125486197990.git-patchwork-notify@kernel.org>
Date: Tue, 04 Aug 2026 00:40:20 +0000
References: <20260729074237.2624940-1-zxyan0222@gmail.com>
In-Reply-To: <20260729074237.2624940-1-zxyan0222@gmail.com>
To: Zxyan Zhu <zxyan0222@gmail.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux@armlinux.org.uk, rmk+kernel@armlinux.org.uk,
 maxime.chevallier@bootlin.com, fancer.lancer@gmail.com,
 romain.gantois@bootlin.com, hkelam@marvell.com,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Wed, 29 Jul 2026 15:42:35 +0800 you wrote:
> This series fixes the issue where stmmac platforms using a custom PCS
> via the pcs_init callback fail to probe when no phy-handle is specified
> in the device tree.
> 
> Patch 1 skips the PHY attach in stmmac when a custom PCS is already
> configured via priv->hw->phylink_pcs and phy_addr is invalid, avoiding
> the "no phy found" error for platforms that manage link state entirely
> through the PCS.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/2] net: stmmac: Skip PHY attach if custom PCS is in use
    https://git.kernel.org/netdev/net-next/c/af4d93416445
  - [net-next,v3,2/2] net: phylink: allow PHYs to be attached in 802.3z inband mode
    https://git.kernel.org/netdev/net-next/c/e5db987f5d7f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



