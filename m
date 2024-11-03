Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D970DD11186
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 23:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nt09x9rkB3A8eBz/tx2co/TepG6Wei0gxrpGYB5h9zY=; b=Ev3rmgglWsBi4TqfC5RwWbszv3
	r6HTbfHpGTRwnqD4bnass/3xttskRSMADlqRH+yr4/gOuv1UByIs91fc3yPkf6yyy+DdqU3eZ+4QU
	3cs3BFxAyDOdxSPkhDX+QXCkirANQYqDZBJbFcGapMEHB4w0LpxYIKCovgXwYnS1UtK+RV37GczRv
	9UfisPgq8VwekX3RABrnpC3X/KFeLZLwJDTK37+0TXaC2bg4AiNL+2pt4jO1qvCeNQrFTL36P/lDP
	clcqxhxJoTD1LiSmJoqg5dlvmGg/OEEANYSE873Q6Ko6aRMsNgvRn1v3Em84Q/WC7rQNAmEUwzSf2
	CHPEETJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7kER-0000000CFub-0k25;
	Sun, 03 Nov 2024 23:42:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7kCj-0000000CFkc-3ZwX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Nov 2024 23:40:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 45CB95C4CB7;
	Sun,  3 Nov 2024 23:39:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4216C4CECD;
	Sun,  3 Nov 2024 23:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730677220;
	bh=Fpk5/6wEk3/C7/XnnbdYZqJeyR/d7QRxg8mqahUQje0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=o5y1Se85YGaNi46PIpCG3IAkB/9cfCO/zEuGXlPlNZl44IP6NkIteQYvLzdTIAxRu
	 6j124vRpxxT0uN7ViTo3CPUOUJ3/xksJhw+Zvf6w6Tcak/WGnDAKFloGWQheOy1JyP
	 +wGBZMCZnoiULs2q3l6i44ZmJtXrRYmlHOw0FHVBs9sRHzCc1ahZ4fCCo9Ydr7eH3U
	 qIQbXAH8hPHHBy5pjYvMjtjX/lQhEqDlzSuj8crVR+5Spb9HIf6TzC0w653QcdBlO2
	 sA5pqauaU3x89iv2hAz6B4rWkmZz1vOuXfBwHIYnQkJ/0UMBkaMrPZUtRznqnsjAC/
	 AuEanAEtsqQ3Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 710B738363C3;
	Sun,  3 Nov 2024 23:40:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v8 0/8] net: stmmac: Refactor FPE as a separate
 module
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173067722927.3278663.4571680407072079402.git-patchwork-notify@kernel.org>
Date: Sun, 03 Nov 2024 23:40:29 +0000
References: <cover.1730449003.git.0x1207@gmail.com>
In-Reply-To: <cover.1730449003.git.0x1207@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 olteanv@gmail.com, andrew@lunn.ch, horms@kernel.org, andrew+netdev@lunn.ch,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, xfr@outlook.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_154021_955798_A8A1377E 
X-CRM114-Status: UNSURE (   8.62  )
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

On Fri,  1 Nov 2024 21:31:27 +0800 you wrote:
> Refactor FPE implementation by moving common code for DWMAC4 and
> DWXGMAC into a separate FPE module.
> 
> FPE implementation for DWMAC4 and DWXGMAC differs only for:
> 1) Offset address of MAC_FPE_CTRL_STS and MTL_FPE_CTRL_STS
> 2) FPRQ(Frame Preemption Residue Queue) field in MAC_RxQ_Ctrl1
> 3) Bit offset of Frame Preemption Interrupt Enable
> 
> [...]

Here is the summary with links:
  - [net-next,v8,1/8] net: stmmac: Introduce separate files for FPE implementation
    https://git.kernel.org/netdev/net-next/c/2c6ad81de163
  - [net-next,v8,2/8] net: stmmac: Rework macro definitions for gmac4 and xgmac
    https://git.kernel.org/netdev/net-next/c/61e6051f4bbb
  - [net-next,v8,3/8] net: stmmac: Introduce stmmac_fpe_supported()
    https://git.kernel.org/netdev/net-next/c/af478ca82204
  - [net-next,v8,4/8] net: stmmac: Refactor FPE functions to generic version
    https://git.kernel.org/netdev/net-next/c/c9cd9a5a834c
  - [net-next,v8,5/8] net: stmmac: Get the TC number of net_device by netdev_get_num_tc()
    https://git.kernel.org/netdev/net-next/c/2558fe30ae8b
  - [net-next,v8,6/8] net: stmmac: xgmac: Rename XGMAC_RQ to XGMAC_FPRQ
    https://git.kernel.org/netdev/net-next/c/df9e7b0250ad
  - [net-next,v8,7/8] net: stmmac: xgmac: Complete FPE support
    https://git.kernel.org/netdev/net-next/c/b440d677e15f
  - [net-next,v8,8/8] net: stmmac: xgmac: Enable FPE for tc-mqprio/tc-taprio
    https://git.kernel.org/netdev/net-next/c/77be7d737305

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



