Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5AF7C02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 11:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bYhQeMczi1tMdYrWIJu8f4Q/3bTEW+VwOFUT1aZg1FA=; b=ODCyn40vTr87hpoyZj/kGqRU04
	+C22bhQJZDQvLeUDVsaHP5myjbDNWMoBI8Pte+G0Ic1MQ/BBIYu2Xu/G9kxvZC1LAGE319SkYpm98
	ObOTg+4Shgv/knhkZXcmARNfikTO+cxl6uBvkJ2eyVmbfG3bn+N0xoHTXJSwQjG11f2F2woszvWwc
	I25bRDDF22P5+XOtarRF8URgyQjMBv3B0/KzRk+QTlzUFc+coJTisWL1F7uZ8AaflI8IBFy4AlpGn
	qxJ3qrVOSg5t1g9bTfkYalqAM86sIeG1clBCBEyGN/Yx3+0/I+wv1fM4aWVhVy9YTyKU3fiWKKaSI
	0zWXHtjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYOFc-0000000EmCk-263L;
	Thu, 16 Jan 2025 11:41:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYOEL-0000000Em29-2rdL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 11:40:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 73CFD5C0FE6;
	Thu, 16 Jan 2025 11:39:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA9B5C4CED6;
	Thu, 16 Jan 2025 11:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737027608;
	bh=9kDIJwhprd3J8UBVpElxMP0gxs4aR3treIZNaaamSzU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=O27Wtx4j5aKBT4gPT98zbqD37H0u/MtvIb0u4K2cxJF/XWEh3r+SV3yzpdPSC89iY
	 UsNqsdXAE22ukwamWlQHDmrnFZ+9fofuKmr8rpEUi8Ca24WZdak5TN1nSgXIwqohWN
	 9zF2sDjpVukOO5ud1IwX6D8bIQ8PIXyJiTNxWp2EplpDN4AuY3gj4My56scRuvtgSU
	 sd0CnE0JnH2A7O1eznLqTO+pkSdHYqOQWGgornAiPhgr4+9kRjeoNEEH40+PZYhyiZ
	 NB7ESjs3x0sg+wQFyMwXaACd+IQK8SL1FozmQe1iqd6Pjoe3r1u3qjx4cdX0yuLYtA
	 SNpaTa2RuOd1w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34555380AA62;
	Thu, 16 Jan 2025 11:40:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 0/4] net: stmmac: RX performance improvement
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173702763200.1425732.12955141458016148201.git-patchwork-notify@kernel.org>
Date: Thu, 16 Jan 2025 11:40:32 +0000
References: <cover.1736910454.git.0x1207@gmail.com>
In-Reply-To: <cover.1736910454.git.0x1207@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 aleksander.lobakin@intel.com, jdamato@fastly.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, xfr@outlook.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_034009_766513_647E70A4 
X-CRM114-Status: UNSURE (   8.47  )
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
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 15 Jan 2025 11:27:01 +0800 you wrote:
> This series improves RX performance a lot, ~40% TCP RX throughput boost
> has been observed with DWXGMAC CORE 3.20a running on Cortex-A65 CPUs:
> from 2.18 Gbits/sec increased to 3.06 Gbits/sec.
> 
> ---
> Changes in v3:
>   1. Convert prefetch() to net_prefetch() to get better performance (Joe Damato)
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/4] net: stmmac: Switch to zero-copy in non-XDP RX path
    https://git.kernel.org/netdev/net-next/c/df542f669307
  - [net-next,v3,2/4] net: stmmac: Set page_pool_params.max_len to a precise size
    https://git.kernel.org/netdev/net-next/c/2324c78a75c5
  - [net-next,v3,3/4] net: stmmac: Optimize cache prefetch in RX path
    https://git.kernel.org/netdev/net-next/c/2a2931517c9a
  - [net-next,v3,4/4] net: stmmac: Convert prefetch() to net_prefetch() for received frames
    https://git.kernel.org/netdev/net-next/c/204182edb310

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



