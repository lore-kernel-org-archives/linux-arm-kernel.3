Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C69FC9EC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 23:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f9pjXvyRRcThaWJkb12xlpbDTCbnuFtSX6s/rAoQAk0=; b=PgJpi6IzZ4MbufcqbNaFPacK0H
	PLjLc94jp2WRNkY/YTQ/vWEhGwZPJ8ZHIE7u206cpIMx4fjupVV4IIPJ6bdQLezBsT6ZBmJj8uvz1
	C4mgRc/ITiJEbgiyuZaMeVK3eRTrJmHabAEEzuU0T1SAnuuhEMwqemTzvSTGUTBmka6hAvZ96NVVl
	Xe66wgH460V14xF89TMDQLSq+vVvW5G1cG8NMLi/AMDCHYL/LiAAB7AxBDbs9zUVQC/azqOLNqmyw
	U3ivCKs+K/Nf3MB6bL4Ab8K+KNI5yR8HraIcpWKfuge3xUpkTzQ5ObFX9MFl/32ZDISCatrhfXdOf
	rFXC67tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyew0-00000004gLk-2pRW;
	Fri, 06 Mar 2026 23:50:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyevz-00000004gLd-117f
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 23:50:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7ED9E60018;
	Fri,  6 Mar 2026 23:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2844AC4CEF7;
	Fri,  6 Mar 2026 23:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772841018;
	bh=BQW73dxoFvf8W9lwbY5JOxppl2jq+PcUgOfCJhuasFc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=AZeceoFWUBzHrcZ1cwO/gNZKKGnTGYzoaTq4ZcmJ3PkLhzEbo1YHEm2P3D5sQjNah
	 JjVGGBxD6egmPXbetoSy8xZDIcG7gkwDbLTv3d/Vdx9zRojsBKqtn/KbKJrrR9mW+6
	 MIV9N1wlDdcbQPQuhvlxyWU+0t50ePLZCkAUFTaj2K0//qhaOvAvcWsz8Jcc54ruep
	 jmY9pkf1Wox7Jr4uIiIbFPmyYyKeHR3AMV/JyMKulw/n+PpejERXJxN5BzHzb1rq2e
	 3xAf9jv6V2j0O2tQhW0Zek11e/SysJwH3PkaOZ1yaV1orDHOOdjKJP/RgKNtSEUT2f
	 9p25rXvQLGR7w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CF413808200;
	Fri,  6 Mar 2026 23:50:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/8] net: stmmac: mdio related cleanups
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177284101730.95361.6178473364485118037.git-patchwork-notify@kernel.org>
Date: Fri, 06 Mar 2026 23:50:17 +0000
References: <aald--qJquWGIvmO@shell.armlinux.org.uk>
In-Reply-To: <aald--qJquWGIvmO@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
 wens@kernel.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 netdev@vger.kernel.org, pabeni@redhat.com, samuel@sholland.org
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

On Thu, 5 Mar 2026 10:42:03 +0000 you wrote:
> Hi,
> 
> The first four patches clean up the MDC clock divisor selection code,
> turning the three different ways we choose a divisor into tabular form,
> rather than doing the selection purely in code.
> 
> Convert MDIO to use field_prep() which allows a non-constant mask to be
> used when preparing fields.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/8] net: stmmac: mdio: convert MDC clock divisor selection to tables
    https://git.kernel.org/netdev/net-next/c/4c7e0e081889
  - [net-next,v2,2/8] net: stmmac: mdio: use same test for MDC clock divisor lookups
    https://git.kernel.org/netdev/net-next/c/b6687ef97603
  - [net-next,v2,3/8] net: stmmac: mdio: simplify MDC clock divisor lookup
    https://git.kernel.org/netdev/net-next/c/506f78f43c58
  - [net-next,v2,4/8] net: stmmac: mdio: convert field prep to use field_prep()
    https://git.kernel.org/netdev/net-next/c/58bd0039002b
  - [net-next,v2,5/8] net: stmmac: use u32 for MDIO register field masks
    https://git.kernel.org/netdev/net-next/c/df388b4d3913
  - [net-next,v2,6/8] net: stmmac: use GENMASK_U32() for mdio bitfields
    https://git.kernel.org/netdev/net-next/c/a64d927aecf1
  - [net-next,v2,7/8] net: stmmac: mdio_bus_data->default_an_inband is boolean
    https://git.kernel.org/netdev/net-next/c/3cd963fa915c
  - [net-next,v2,8/8] net: stmmac: make pcs_mask and phy_mask u32
    https://git.kernel.org/netdev/net-next/c/e4fd855c52ec

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



