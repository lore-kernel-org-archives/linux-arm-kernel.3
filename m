Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF04CED240
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 04:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GdDVmhTRG4dtnyL+sAEw29oJ5cvESgFPzqUi1oxaWTc=; b=iTR1lOIiYvcDKRixh6y29UYMX7
	46nd8GlQUJxjomFPT3uc/6vSQB8vi84Gg1dvrJxEEhfUarzaY2Z3ine11AEzuRMtto2d46SC5WSnm
	+Qs18A6Zz6Mr70QGTAi+ktYMB6Sm1IgfoWe/VE13PbrWzrIWH7YI+ulw+HLywo3LvkvYbjWsnsqeV
	kcAigc+Cdh4eGanHIfHsy/J8nR4uz1UrY0IDlrKcQvsXF12ZpW6RDogXWRi8+teen6ilEPzP33NIE
	in4IYlJfBnacEXDVE2ySfQUI6HKsxzFdW/7lGf6Xh0e6vxzClBFs9Vi2/nxYF9WLhB/thKAp4iUo9
	vtji0qkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLDMr-0000000HMih-3jh5;
	Tue, 18 Nov 2025 04:31:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLDMq-0000000HMiY-1aYa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 04:31:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4285A60613;
	Tue, 18 Nov 2025 04:30:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C70AC116B1;
	Tue, 18 Nov 2025 04:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763440258;
	bh=b0tK/QFOidIQQqfzTvlAPr1kSgWygac/TGHNviqWPbU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kHr0Uw0Bjoa7ZnKIST07TsbWvMUE7coMCj+Mn+sszlvaBiJPkR45qgQEmyH0T33cJ
	 vwa7fSHLmtvdybBP8E9lnjb8zlIqCfSaX1NxNseYS5YrH/eYTQd93gQ723mIJBV310
	 ZgzPP2k+/Xwc8SWo1C8oQKmD35q/G2YJdMssggnMOVtQw7aqQiGRvccfxmBHeg953M
	 0mgNR3xgmJveKIbcHjMeyrqs4AmOtS4MG5/K829TC3wKSShgH5UwTqFEe9F29OXhvD
	 WAVk2GvaqYjeqeBkHMB5Sl/2kk+3JcERe3sAQQzaOTFgSRZZMBfuqugbkGF6/7/xR1
	 +DPh6QTK1f7Eg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E143809A1E;
	Tue, 18 Nov 2025 04:30:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v8 0/3] net: stmmac: dwmac-sophgo: Add phy interface
 filter
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176344022426.3968687.3804479598141783177.git-patchwork-notify@kernel.org>
Date: Tue, 18 Nov 2025 04:30:24 +0000
References: <20251114003805.494387-1-inochiama@gmail.com>
In-Reply-To: <20251114003805.494387-1-inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: rabenda.cn@gmail.com, uwu@icenowy.me, wangruikang@iscas.ac.cn,
 ziyao@disroot.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, unicorn_wang@outlook.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 hkallweit1@gmail.com, linux@armlinux.org.uk, rmk+kernel@armlinux.org.uk,
 netdev@vger.kernel.org, devicetree@vger.kernel.org, sophgo@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, dlan@gentoo.org, looong.bin@gmail.com
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

On Fri, 14 Nov 2025 08:38:02 +0800 you wrote:
> As the SG2042 has an internal rx delay, the delay should be remove
> when init the mac, otherwise the phy will be misconfigurated.
> 
> Since this delay fix is common for other MACs, add a common helper
> for it. And use it to fix SG2042.
> 
> Change from v7:
> - https://lore.kernel.org/all/20251107111715.3196746-1-inochiama@gmail.com
> 1. patch 1: fix a mistake that using rgmii-txid instead of rgmii-rxid
>             for SG2042
> 
> [...]

Here is the summary with links:
  - [v8,1/3] dt-bindings: net: sophgo,sg2044-dwmac: add phy mode restriction
    https://git.kernel.org/netdev/net-next/c/6b1aa3c87fcb
  - [v8,2/3] net: phy: Add helper for fixing RGMII PHY mode based on internal mac delay
    https://git.kernel.org/netdev/net-next/c/24afd7827efb
  - [v8,3/3] net: stmmac: dwmac-sophgo: Add phy interface filter
    https://git.kernel.org/netdev/net-next/c/db37c6e510de

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



