Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E539CC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 00:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BuECNqwhuOKEXhntmn293ifsdKXLU3HGA/7kHQtHpxQ=; b=ZK0SDJTwVpppCi8BXai0er2cti
	iZzn5eG2JRkhPdBfIdVWWbtxYOL8VK8JpQ+wdS7VIvkl5YXztbqxfkMSKp6Ebnto4Sq0YsNkz4mzB
	5iWDq+etJHJRwV+p2c766U3iCRlkJffjDOxUkY94F6SuVZDeoakCI9t1Reja0Ml857+94M0QDE1mY
	r1JGzcXHbMq4NwHwi2oahE0PCKe1tOkF0lec0PHQ2hprU7P9U8iGYHIwdNvTpVMZ+WQnjCLwZNeAK
	7klqXZE0SyFGDmksUF0TROaYYLfWVlb7ICEj8+MDgGU0LgAxPJ/t8//tSbaxZX91imSOwEMMtITTG
	2j6hABTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x463t-0000000AUVr-0z4C;
	Wed, 09 Sep 2026 00:21:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x463r-0000000AUVl-0ooP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 00:21:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 47EF0601DE;
	Wed,  9 Sep 2026 00:21:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F085E1F00A3A;
	Wed,  9 Sep 2026 00:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788913270;
	bh=BuECNqwhuOKEXhntmn293ifsdKXLU3HGA/7kHQtHpxQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Sf5XitaDHRN98Xum/Hx2a/wvGG7tMi4ZbqsvijqgGVM5bgS53OS/9siLuLHr16GRS
	 x4qtKGLIaV1aMAbKavVzqie6bZyy5ohx2OWH4M+bVWdk6+vqmxL6xxorOCRwb+zU5F
	 c8lBgVZjofWDNV8NweiDJGIhqaZ1Me/2nL/j1ELxL2Ug5jihCD3l5u1izNN0tRRbWJ
	 f3xcaHt7FTJ3lRmhN9Lrc5eqRn68vo3zvWnB5NLiqG3oTxdGaB2epjJ8i4MMIpokD8
	 GIW05KWEzFnz0aeRuKOGZnJKYKxd8gSCqi2bAF5mXXsKccV1s5v320fok7MWZCOIy9
	 rNmL+wkNU+S/g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93B1A380820D;
	Wed,  9 Sep 2026 00:20:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/3] net: phy: motorcomm: Enable analog
 frontend
 DAC on yt8531S
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178891320812.76352.11462538996506591892.git-patchwork-notify@kernel.org>
Date: Wed, 09 Sep 2026 00:20:08 +0000
References: <20260905072830.28986-1-maxime.chevallier@bootlin.com>
In-Reply-To: <20260905072830.28986-1-maxime.chevallier@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: andrew+netdev@lunn.ch, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux@armlinux.org.uk, hkallweit1@gmail.com, me@ziyao.cc,
 Frank.Sae@motor-comm.com, thomas.petazzoni@bootlin.com,
 alexis.lothore@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
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

On Sat,  5 Sep 2026 09:28:25 +0200 you wrote:
> Hi,
> 
> This is V2 of TY8531S fixes for the YT6801 PCIe card.
> 
> It enables the analog frontend DAC at config_init() similar to what the
> most recent vendor driver does.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/3] net: phy: motorcomm: Split yt8521_config_init() page management
    https://git.kernel.org/netdev/net-next/c/4c1028a34760
  - [net-next,v2,2/3] net: phy: motorcomm: Add a dedicated .config_init for YT8531S
    https://git.kernel.org/netdev/net-next/c/58e1bbfe4713
  - [net-next,v2,3/3] net: phy: motorcomm: Enable analog frontend on YT8531S
    https://git.kernel.org/netdev/net-next/c/031c64bd1b02

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



