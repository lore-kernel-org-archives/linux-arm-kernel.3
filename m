Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74850C02181
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 20:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9lubXMh0Pr60nLEXhdVg1KsaEsGbCfYZK4IUyxULTeI=; b=kMrSZjloX0IzJSC5CaTL/kYoLW
	+6FjtBJ+KPkB3n+U3/ug0bhWT/FZR7fwgsutAHPA3R7MfjHvE/Y+qh32D1xp4Jn4zupmoUOgHAt2O
	My7SqNmNXhoF6tercgUkkYDNHU39bYE4hQzt2UUxLyQxWSTFiAKVOVygwxgmiIB//O7HBCTWih4bz
	WrlhNHTfbt/o1vccwiyFDVavu2F696a3nSdU2F2IOVwxyrtHHJXsBVxN5Nt7GDNgAqQGegAiaLp3D
	w71lpGW8RL41l8PfMoauVsfUu6ceC7uxqrn8Lfexmp8j0Pn2yBVrmJzhpnOHXLyDHXEirbH/yobGM
	iFMLw94Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZy7u-00000006Nfy-20Wc;
	Mon, 20 Jan 2025 20:12:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZy68-00000006NJf-0Rkw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 20:10:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BA64D5C5A97;
	Mon, 20 Jan 2025 20:09:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9AA3C4CEE0;
	Mon, 20 Jan 2025 20:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737403811;
	bh=xcgzJ8GUf9rqfS8dk9jTNGkkqhrZ7aqAeGSP8qPm5UE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nXSFI/kwDkGArDabWY40dcJWvdgFVxBAO7myQEdpbsj39T5deX/y5CZwEgi5/nB6R
	 oVf4vGAxmPe7I8XAGTx/6SAfNrw01qDlaY/06pmboQ0RTRVoIzIKddhpboSzy31gWf
	 okExTF6OsgKniCUUZGpkkzDivBYLNRym5r6v9qXpJxPnXoKWlxB8VgjOKfOFo1tlLw
	 2DedVe7ryuRx+MQ6HsV8fdNb79nE3+bLb8tQS7eA5oeNCRxlfgE9K8OqUvTHGYCn69
	 bRxrfoQNE2cHRwpOniH3WgS/kVUZcoxCm0OGEXn+22IsCUqyBTGq/mw+53h97CAnPt
	 bBr3Du7iEOpuA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BA9380AA62;
	Mon, 20 Jan 2025 20:10:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v1] net: stmmac: Drop redundant
 skb_mark_for_recycle() for SKB frags
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173740383476.3638218.15431747804261791679.git-patchwork-notify@kernel.org>
Date: Mon, 20 Jan 2025 20:10:34 +0000
References: <20250117062805.192393-1-0x1207@gmail.com>
In-Reply-To: <20250117062805.192393-1-0x1207@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, xfr@outlook.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_121012_188255_22B8E5A2 
X-CRM114-Status: UNSURE (   9.30  )
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 17 Jan 2025 14:28:05 +0800 you wrote:
> After commit df542f669307 ("net: stmmac: Switch to zero-copy in
> non-XDP RX path"), SKBs are always marked for recycle, it is redundant
> to mark SKBs more than once when new frags are appended.
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 ------
>  1 file changed, 6 deletions(-)

Here is the summary with links:
  - [net-next,v1] net: stmmac: Drop redundant skb_mark_for_recycle() for SKB frags
    https://git.kernel.org/netdev/net-next/c/ba5f78505fb4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



