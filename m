Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C650CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 23:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P8WasD/vQDuJyqo+FqFAI74xFhoNUNnfAZPGSwZVYz4=; b=Ayo91kJTkeB0pnf5N/aDBIAuGt
	lYD6wvJXhy8OobvCMetU9uu77nua+2NAF9NCQALeEP+3HPN2q6W3mRi/UBi6G/EgflJabhbSb3nkr
	iG5JsEhsbgmv/QHJ9VV6PaHCi/pAhCPglHSxpVM4c1pjz0803tWZ7o1pQ63oE33/0sEQ1fphWEWkL
	7oR3/EgL6JvKwI2BBMh6vD5BE4gHey2zVYJOqgwDJYsSJ7JyxxE55eJg1RvAf2MV4isy7eEcd/d64
	u7KdiN+nPD6uf0qpWVRRwopG5p6/NCH2wy6KOXvnuB4nqTzZYVPpQUJ9pOMh1A09bN55DK4hxlz78
	6eYRl+jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYXKm-0000000CbAt-3lmv;
	Sat, 13 Jun 2026 23:00:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYXKl-0000000CbAj-2S8k;
	Sat, 13 Jun 2026 23:00:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 28C5843CEA;
	Sat, 13 Jun 2026 23:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BCE51F000E9;
	Sat, 13 Jun 2026 23:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781391611;
	bh=P8WasD/vQDuJyqo+FqFAI74xFhoNUNnfAZPGSwZVYz4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=f5wl2PhVE+t5FIGOYZcIed7M/JTvwEGVMDs5i8fGdfle8E/VvnBXFqpZwL9iC5QYy
	 LjtKcUWzZ8bumn3BtDnA0icJwIfgjxfxf5wjKJ4HgvBusG78xfctu+6VDXHpf9Jncy
	 AfSugPVbsC1ue0DLWgc4KgtvGChggITXQGJtUdNwwvD6rHh2F9DiTr9o3MlyXsddqe
	 +45jo2IKFkKjYian9v48u9T4fu2JqS9mK3cVTB7bwXV4cP7CK9X8fg8RYChdYpIRMg
	 kowTV98iskwMS/aNqHmFsK5b2R0Pjzx/3hSd0yYgd2lVcLtiml2IFpd+nwSrQas7Q4
	 x75d60fEaAl1w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56AE23A54A32;
	Sat, 13 Jun 2026 23:00:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: airoha: Fix register index for Tx-fwd counter
 configuration
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178139160689.1619194.9003446949920537731.git-patchwork-notify@kernel.org>
Date: Sat, 13 Jun 2026 23:00:06 +0000
References: <6a2b40e7.4dd82583.3a5c46.e566@mx.google.com>
In-Reply-To: <6a2b40e7.4dd82583.3a5c46.e566@mx.google.com>
To: Wayen.Yan <win847@gmail.com>
Cc: netdev@vger.kernel.org, lorenzo@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 12 Jun 2026 07:09:13 +0800 you wrote:
> In airoha_qdma_init_qos_stats(), the Tx-fwd counter configuration
> register uses the same index (i << 1) as the Tx-cpu counter, which
> overwrites the Tx-cpu configuration. The Tx-fwd counter value register
> correctly uses (i << 1) + 1, so the configuration register should use
> the same index.
> 
> Fix the REG_CNTR_CFG index from (i << 1) to ((i << 1) + 1) so that
> the Tx-fwd counter is properly configured instead of clobbering the
> Tx-cpu counter config.
> 
> [...]

Here is the summary with links:
  - net: airoha: Fix register index for Tx-fwd counter configuration
    https://git.kernel.org/netdev/net/c/1402ecccf563

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



