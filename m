Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63FBFB5EA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 03:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s9yiTB7zq143EWD0/d3qs8+lTbud+yiTf0oa39F9vq8=; b=Ij+L7yDR52e2wZnfIU6mU7wD1s
	Z3kSDEj6tT1YeTmwiwikqhF5myRQBNENLBCwEavErUASloG7Pdxz1zc5GhQQgQ5SeLdjNW+h23Fq2
	LyvtNpMpa0aqve+Y67B/p/e0pq6GADh2PgwcNx1U0TkD2LChHA6CAsjvKXzEAkMaG1Jke6C1x16MT
	qNp6fkg4bToPSNueZn+OBvwKVugsbcZfoIBWKmbXDuPOa9mEZR81IAwZlA3OX/trvP345u4y3dYXv
	PXJxuddmDAwSqVyD1cGRRh8sIX8kiZJ1UsSNO1QK+Qw2yTjkRfAwB/3VP3Ahka+gtLHlqmJsNziwr
	lMBdJhqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Kyo-00000005IJo-1dyF;
	Tue, 17 Mar 2026 03:20:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Kym-00000005IJ4-1IpK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 03:20:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A86A643A91;
	Tue, 17 Mar 2026 03:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77AF6C19421;
	Tue, 17 Mar 2026 03:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773717623;
	bh=v/7y334kmrpQVe8O+MZvlcwnp+EHDxJCOGIBAHun8wM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gU842gHh9ysARNVOeDDKttK9Jif2kSzliZHnnbb3LiHCfooVpTerQ0HYlj/YtsJF8
	 Ym4cTtqk5aF8JG/keBw4ll6dgK2EbJyr2na2wOpH4gfij4618LseODQ5DO2GH3KnWy
	 7UP4iZQgVu6bolPjYLdfNWejhluWtqTrwTvbRTJGJfrQFsd35I3WqAt4vtv9/lQ7Af
	 Rhnz9hPXC+uH9qd1/nHv+rhIcY+WVdSXZNSgSW1MXjuvigwnb9qObX62FTNzSQnd9R
	 GEwJs2txup9u3fBVvEB/FYHDSOvsR/KENPjhtlt6MMa4+33Tdu1PmxmygyTuM1wt91
	 UTF7MCCI67RCQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4012C3808200;
	Tue, 17 Mar 2026 03:20:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v12 0/4] Support multi-channel IRQs in stmmac
 platform drivers
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177371761578.3410412.12736160514869511469.git-patchwork-notify@kernel.org>
Date: Tue, 17 Mar 2026 03:20:15 +0000
References: <20260313-dwmac_multi_irq-v12-0-b5c9d0aa13d6@oss.nxp.com>
In-Reply-To: <20260313-dwmac_multi_irq-v12-0-b5c9d0aa13d6@oss.nxp.com>
To: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, chester62515@gmail.com, mbrugger@suse.com,
 ghennadi.procopciuc@oss.nxp.com, s32@nxp.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, devicetree@vger.kernel.org, rmk+kernel@armlinux.org.uk,
 vladimir.oltean@nxp.com, boon.khai.ng@altera.com, conor.dooley@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_202024_392103_384878C5 
X-CRM114-Status: UNSURE (   9.97  )
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

On Fri, 13 Mar 2026 08:13:31 +0100 you wrote:
> The stmmac core supports two interrupt modes, controlled by the
> flag STMMAC_FLAG_MULTI_MSI_EN:
> 
> - When the flag is set, the driver uses multi-channel IRQ mode (Multi-IRQ).
> - Otherwise, a single IRQ line is requested (aka MAC-IRQ):
> 
> static int stmmac_request_irq(struct net_device *dev)
> {
>         /* Request the IRQ lines */
>         if (priv->plat->flags & STMMAC_FLAG_MULTI_MSI_EN)
>                 ret = stmmac_request_irq_multi_msi(dev);
>         else
>                 ret = stmmac_request_irq_single(dev);
> }
> 
> [...]

Here is the summary with links:
  - [net-next,v12,1/4] net: stmmac: platform: read channels irq
    https://git.kernel.org/netdev/net-next/c/a31bbe5ca2f8
  - [net-next,v12,2/4] arm64: dts: s32: set Ethernet channel irqs
    (no matching commit)
  - [net-next,v12,3/4] dt-bindings: net: nxp,s32-dwmac: Declare per-queue interrupts
    https://git.kernel.org/netdev/net-next/c/cc7a3435dfad
  - [net-next,v12,4/4] stmmac: s32: enable support for Multi-IRQ mode
    https://git.kernel.org/netdev/net-next/c/66ccb4f1d205

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



