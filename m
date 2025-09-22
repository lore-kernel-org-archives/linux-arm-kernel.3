Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF2BCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 23:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7E/YDLybPC/9yzf2H4ojfN2TOYFnywcfvqhtXKh06/w=; b=ArvGJdXqBKAXnAZYNaA8wx5jwY
	/9urcxvJl2mQ+pF3JgsJLYXuD6GvFD0KsWIOsnmltwPeO7u0PiGf6PSDOasNPz5+JW1A/0d/IinCI
	9tNk+jjtFu1P/TMf/BmO9IAISoBp4PXs4oe2tejSzKt6N3PmxILCXtoVlJk0I/PihmJMiktPZlYQX
	ZdKzD58PTl4HIaRb5pQhcks+lgEytBjWxTuh9QrUL8hHPFalwV1uIL4yU6xBOGB+7o1TfALxrMoYS
	VZWF1CE12pQ9zh4vbh8EeZA+XoVupCZAlr1OpY29ZciYYQkxfl0XY97eBrEia1iqgWlOtZYYH/srD
	fHwg6XDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0q8s-0000000BoW1-1LCI;
	Mon, 22 Sep 2025 23:40:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0q8r-0000000BoV7-1MJp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 23:40:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8319460262;
	Mon, 22 Sep 2025 23:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33106C4CEF0;
	Mon, 22 Sep 2025 23:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758584420;
	bh=nOnerZmRV0c5WJjU8VhwkEjiAKaD2K/BYYOQhijJfIE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=uVvWcj/d0yvTzBZDzbmzaCkaA+HwY1/+ztqjUkAPwBGkQmYWD+afeV2VTWk2Biz5j
	 +qIEF9I91+EB1NyPSdpNe5GLcdzoHp38Qj9LplT1G72W0b3pZBlVnHlKRqbxcE/fth
	 5EVClVWy/KfwgO0Ac/O/UACM9gj/pAEnOR+XVC8kEqkYj8/QUW6WDqeg5ybc00eoHP
	 rfS4Tgx4UO/+7SN8skCnM7YKQSYoYhJfpxecdumcjp8bUY07dpwwjOkYOXjDSn0GfH
	 QILHSOhqh0WxXsZ4zL/6p0eVB2v5vIZyhOcTv2yC5CAhV+EYlwDUnHwpjEWCM4pMWy
	 v9tN3L08gSDxw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE1A39D0C20;
	Mon, 22 Sep 2025 23:40:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next V3] net: xilinx: axienet: Fix kernel-doc warnings
 for
 missing return descriptions
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175858441749.1195312.3629295031958677070.git-patchwork-notify@kernel.org>
Date: Mon, 22 Sep 2025 23:40:17 +0000
References: <20250919103754.434711-1-suraj.gupta2@amd.com>
In-Reply-To: <20250919103754.434711-1-suraj.gupta2@amd.com>
To: Suraj Gupta <suraj.gupta2@amd.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, michal.simek@amd.com,
 sean.anderson@linux.dev, radhey.shyam.pandey@amd.com, horms@kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, harini.katakam@amd.com
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 19 Sep 2025 16:07:54 +0530 you wrote:
> Add missing "Return:" sections to kernel-doc comments for four functions:
> - axienet_calc_cr()
> - axienet_device_reset()
> - axienet_free_tx_chain()
> - axienet_dim_coalesce_count_rx()
> 
> Also standardize the return documentation format by replacing inline
> "Returns" text with proper "Return:" tags as per kernel documentation
> guidelines.
> 
> [...]

Here is the summary with links:
  - [net-next,V3] net: xilinx: axienet: Fix kernel-doc warnings for missing return descriptions
    https://git.kernel.org/netdev/net-next/c/312e6a58f764

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



