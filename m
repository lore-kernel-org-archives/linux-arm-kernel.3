Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F112F606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 08:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=heF143sN;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nZGt2aDR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rtzthx3ba8HYK/lc4AJv6lc9xFK8BTkYMFeeTL3XLl4=; b=heF143sNIbOYOiY+7cdLtMNB5x
	OQubhKD4cz33aXxCPVawmBq4xurTOhqE7qdv9vfMgGJqGefeGZ2BKqHRKuOHb4KJkY4V02EPxhyvg
	iQpGBPBBN1QZt3vtsvc5MnUtcDsZvGP/f9dZyGlAQ60I+OuIdL7d6kh7H+h0S2AaHERruklWQ5OsA
	XzSie36GZrYwI4j4T7g9xAcYlDnP+oIPSjj2oQDFtoRvchqHfVtuYDwqtonJNHCQ5FL6/F64e30JZ
	VCarFZx5L2zl/IrDQnyGOGBXuxX7lqIvpC7XaMGcPYkuZyiFrSHmgzh9Ac5NmVnTvYUZPwjF6Ht/I
	ugLGpD8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5EX-00000009BP3-1hNp;
	Tue, 20 Oct 2026 08:30:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5EV-00000009BOr-264V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 08:30:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DF369439BD;
	Tue, 20 Oct 2026 08:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFB1C1F000C4;
	Tue, 20 Oct 2026 08:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792485006;
	bh=Rtzthx3ba8HYK/lc4AJv6lc9xFK8BTkYMFeeTL3XLl4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=nZGt2aDRKt9woM/MBYw/bBKmosh2c7HnhtSioqcaeEkibSQ7+f5C1w58tJXUI4G7q
	 Kef/KmTg+ZyfDS/v4b4CsTBaIIM1PzRdx59FDiV44TrLgv+DxdqsZFwWPS2oBLzjoe
	 kgk+vKNeTGZQXoXv5BL/wvnoVZRHg3erAsNL5G+G3S29muaZl5x3/XwwMmbwbTVaQB
	 yHOg0F+w109KhE6SGYiOK4fm5aSwHcNP6p7S7A80HFk5rJi1gq2dfJ68uouZytbhsC
	 yvl3ATcIQt44QHnymYHrP45VSLym7VbfbraqZEd0bLvdx7274sE/pDJ7kwVQSBKtal
	 YndnDkKQFBUaw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B44093924FEF;
	Tue, 20 Oct 2026 08:30:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: stmmac: xgmac: do not treat TBU as a TX event
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179248500525.3578847.17015469413547290153.git-patchwork-notify@kernel.org>
Date: Tue, 20 Oct 2026 08:30:05 +0000
References: <20261013024747.2688984-1-zhangfeionline@gmail.com>
In-Reply-To: <20261013024747.2688984-1-zhangfeionline@gmail.com>
To: Pengfei Zhang <zhangfeionline@gmail.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 joabreu@synopsys.com, chenchuangyu@xiaomi.com, horms@kernel.org,
 zhangpengfei16@xiaomi.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 13 Oct 2026 10:47:47 +0800 you wrote:
> Commit 8d07a7930434 ("net: stmmac: xgmac: Do not enable TBU interrupt")
> removed TBUE from the default DMA interrupt mask, but did not remove the
> TBU check from dwxgmac2_dma_interrupt().
> 
> TBU is set whenever a TX channel runs out of descriptors. Since TBUE is
> not enabled and only enabled bits are cleared, the TBU status bit is
> never cleared. As a result, TBU stays set on every idle TX channel,
> regardless of whether there is any TX traffic.
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: xgmac: do not treat TBU as a TX event
    https://git.kernel.org/netdev/net/c/305deb54c6c2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



