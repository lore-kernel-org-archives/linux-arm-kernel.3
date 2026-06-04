Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30739CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 02:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gJZ51moKH/Fl5apdorABxKRD8vG3tBqQUGlUHnSqB9U=; b=npe0EKtp2LNcpnCkAhlnrlgtsP
	m9+wQEZ/02oa0p57En8vxQvySFEVJQtdTf1S67/mIZ4Idm7t0PPzBLlG3mFW2lU2tpKSTgSF9jnXX
	kVM8CVvF1ajksldoIWNn1AhoXFgyeOgFtN42RmvIPMFmhZCao+aSXPoD+B6gV/b61BjBW7cSPm0fW
	8YnlXxsGawKjDomyLI1a+mJuxYDPjc8rg8+ASLK0eb0zHxAUEihPFMUsvPsq0zgf91jgGDdfiDJY+
	B9vhrDQ4vi5UmiXtVodQ2k5UsZ2js9VRYSZxySZizy5Xl5Q4jWBHoZvwXuYJ9JYhaliU6otlV2wIy
	zJcS6eQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUxqe-0000000G2aM-0S93;
	Thu, 04 Jun 2026 02:30:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUxqd-0000000G2Zy-22pF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 02:30:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 804726022A;
	Thu,  4 Jun 2026 02:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 332D71F00893;
	Thu,  4 Jun 2026 02:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780540218;
	bh=gJZ51moKH/Fl5apdorABxKRD8vG3tBqQUGlUHnSqB9U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=f0RjVvaV+faPfCD4qKTd8hBQ2jkv/r6lBIWEA8p1hKQ8p4O6QWjhbYQ89Wa/cj9lw
	 JV1Kz1FPpJ2LdhJqhDpVBvMnJkJvlK6U8LCHzO/jKe0KanFpDqahyFco13FmiG7z3V
	 cXKcrH+x8TTNod6/TeMoFOG7A0cH6+/XveXNAb0H4thIAke8W3O0CYyU9vCcDC8QRJ
	 AUCngmKAdVbvOu5U/wfTopUif5d3LmcYApea0SWHIQpJruhBr2uWTJ2rvsvJn7St+x
	 fGuK315eN4jRKTZMbptjBEiH59kUIZHpYA52NoQd0Q2klPNPY38P98bYWDFv7cW4jr
	 Xpa9VtYLM+a/w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939EE39308E6;
	Thu,  4 Jun 2026 02:30:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net next] net: axienet: Use dedicated ethtool_ops for the
 dmaengine path
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178054021914.2211213.5101312493242393925.git-patchwork-notify@kernel.org>
Date: Thu, 04 Jun 2026 02:30:19 +0000
References: <20260601124454.3384601-1-suraj.gupta2@amd.com>
In-Reply-To: <20260601124454.3384601-1-suraj.gupta2@amd.com>
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

On Mon, 1 Jun 2026 18:14:54 +0530 you wrote:
> The dmaengine path shares ethtool_ops with the legacy AXI DMA path,
> including .get_coalesce/.set_coalesce that poke XAXIDMA_*_CR_OFFSET
> directly. In dmaengine mode lp->dma_regs is not mapped by axienet, so
> those ethtool calls touch unmapped/unrelated memory and report values
> unrelated to the channel actually in use.
> 
> .get_ringparam/.set_ringparam only touch lp->rx_bd_num/lp->tx_bd_num,
> fields used only by the legacy path for BD ring sizing. In dmaengine
> mode the descriptor ring is owned by the dmaengine provider and these
> fields are not consulted, so reporting them is misleading.
> 
> [...]

Here is the summary with links:
  - [net,next] net: axienet: Use dedicated ethtool_ops for the dmaengine path
    https://git.kernel.org/netdev/net-next/c/c1c3d01e3a90

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



