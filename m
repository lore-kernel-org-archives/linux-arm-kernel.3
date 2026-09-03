Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C29C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 09:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bkxJ54lLa7UyJpsWCW4xrgS9S6PmuGVbCHPuaNKsEG4=; b=O5e59O5je43sWk4pHVqv4poaiz
	C73Ujj2b/faGsLRiZuJtnzSWh2tu//w2f5NMunr5GrJNnRMo++u8kW7VvTvsYrRQ72q+H6e7cz7z1
	gH1W5PgYb9aRlklyFp4P4r9qNhOM+EdRzukth/FS118MZAyDYe6ybSIXrd7Ab2/EkH0GRybSoShF5
	lhFxqWYayYtLOFpVsU8LUucUtawUFSHwxHtJKtvBFjJLKagMC1VDMxIBMDIC37/RidKC+58jYwSNK
	EIlFT+aG+pBhYA4rJ5nK93Z3bIzyTXu/PzUgnXez/eTbCo8bOCkRPBlYOTOTYAoP7UwGCZRltoO2V
	W1rzksvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2468-0000000GzqK-0ApF;
	Thu, 03 Sep 2026 09:51:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2467-0000000Gzpl-2MjW;
	Thu, 03 Sep 2026 09:51:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B0CF2600C8;
	Thu,  3 Sep 2026 09:51:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 653581F000E9;
	Thu,  3 Sep 2026 09:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788429066;
	bh=bkxJ54lLa7UyJpsWCW4xrgS9S6PmuGVbCHPuaNKsEG4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=cCiYQ0kdK+jvzDycJdh7ASVvlsp5IFdadQUlLhoPglE8C4BdzWlC+W6dyDClnDT8b
	 gO5f8tgNgMSsUqVoEI0TQyGzQ+I1kiV97pLqVtln5YH0s860hf5jVdG8uiAPOQUCyq
	 Q/ib87eKIcqzgKp+lj9npoqG5Cr27EdPZ8hQ51p+5k7ndaOXrv6VJT2XwLchwxbD9W
	 NmuSbWoQxO+RZjldfjetbcVrhDGuHAV5eGdxbt/AVHNKGVH7rYlIyNn5fwkaTo718G
	 YaDkTVgViRzxRthTA0NrKOwdvKGXYg8X5v+D8XFJNFfspbainCxc+Vpf8HKQBeUu10
	 KfwojBIUgv36A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 198433811965;
	Thu,  3 Sep 2026 09:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: airoha: enable RX_DONE interrupt for RX queue 31
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178842900765.3234406.8351313053019359790.git-patchwork-notify@kernel.org>
Date: Thu, 03 Sep 2026 09:50:07 +0000
References: <20260830-airoha-rxdone-rxq31-v1-1-830a91503f2f@kernel.org>
In-Reply-To: <20260830-airoha-rxdone-rxq31-v1-1-830a91503f2f@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
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
by Paolo Abeni <pabeni@redhat.com>:

On Sun, 30 Aug 2026 14:28:27 +0200 you wrote:
> RX queue 31 has always been allocated and filled by airoha_qdma_init_rx()
> since RX_DONE_INT_MASK spans queues 0-31, but none of the RX_IRQ*
> _BANK_PIN_MASK values covered BIT(31). As a consequence the RX_DONE
> interrupt for queue 31 was never enabled, airoha_qdma_rx_process() never
> ran on that queue and its buffers were never reaped.
> 
> Route RX queue 31's RX_DONE interrupt to IRQ bank 1 so that the queue
> is drained and its buffers returned to the page pool.
> 
> [...]

Here is the summary with links:
  - [net] net: airoha: enable RX_DONE interrupt for RX queue 31
    https://git.kernel.org/netdev/net/c/7db28abbea0f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



