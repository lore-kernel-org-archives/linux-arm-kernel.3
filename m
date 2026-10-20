Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E1F606A325
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 11:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bqBlc4t+;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kJIqhAk6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WNzvN09+u5OQMM8RhOHb4xncYgXuaiHDoxMOmi2ghBc=; b=bqBlc4t+HruDt/x5YuMc1DHLzf
	AJRNRySavavpUCwG7UGnVkKYwFeQFpB7m0odbZlmjhDJkn/JiLUrrIvqoiYA/jKcbzQ28+24cVtAc
	bXhmr/r59Gk18VY32OKEKnPtEKFYVbv23l8myAKW6w+UqahdjrdMxNKv619KoCbqnAzf/ORnZU13s
	5qP25AV7+JvzufmwKTBjrz+mracnVN9Pg66vzsmefwSDWYq83Vg6otusKn3HIQgAg/OXSzCsm5Y0q
	22YULvEmSxxNo+vCFjuS6X/AEyacSyDSG1ls2tONyDPqHsBo5MSs90OtwaaMG34TiUwTGiZgWTaEW
	FMeMn+sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ82l-00000009YEp-1rxe;
	Tue, 20 Oct 2026 11:30:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ82k-00000009YEe-1eQW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 11:30:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DD14540837;
	Tue, 20 Oct 2026 11:30:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE5681F000C5;
	Tue, 20 Oct 2026 11:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792495809;
	bh=WNzvN09+u5OQMM8RhOHb4xncYgXuaiHDoxMOmi2ghBc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=kJIqhAk6H6ec91Q6x6d3y9lW6WVAYFdoNpQY4/ZsPFMqh+WjK6MYqaJy8o9kZ0RKG
	 ofurGH6xE/3s5ipG9LRlBEFD6FefkcGQaWJNZFtaEBXWZR4LuRCs+3MdgsuQ8Tl1eq
	 AS0DnYJpGW17IAankHeNT18GiEICm9/+oUXPdw/RiJ5e9ud3LVSUHj89jDyn9XT7pI
	 n5KsVGXxw577oOv+AAOPlUIITO/sVPvC7nlUOJYums8jmGYRdxppVDRW8ykMeclKiD
	 CfiHQwIxDEfrgvggywVkQoQMifFzNUYyWizS2IRBCej33pYbSYbFI3578NjYkRNzs9
	 AM/WjrgeCQ3qg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B44B53808209;
	Tue, 20 Oct 2026 11:30:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: stmmac: avoid duplicate XSK TX completions
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179249580829.3679022.10463877602062629830.git-patchwork-notify@kernel.org>
Date: Tue, 20 Oct 2026 11:30:08 +0000
References: <20261013-submit-stmmac-xsk-tx-completion-v1-v1-1-f21b9d098e62@gmail.com>
In-Reply-To: <20261013-submit-stmmac-xsk-tx-completion-v1-v1-1-f21b9d098e62@gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 boon.leong.ong@intel.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 magnus.karlsson@intel.com, maciej.fijalkowski@intel.com, sdf@fomichev.me,
 bpf@vger.kernel.org
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

On Tue, 13 Oct 2026 14:35:42 -0600 you wrote:
> stmmac_tx_clean() reports completed AF_XDP TX descriptors through
> xsk_tx_completed(), but leaves their buffer type as STMMAC_TXBUF_T_XSK_TX.
> The slots retain that type until they are reused for another buffer type.
> 
> On interface close or XDP teardown, dma_free_tx_skbufs() walks the entire
> TX ring, not just the dirty_tx..cur_tx range. stmmac_free_tx_buffer()
> counts the stale XSK_TX slots again, causing xsk_tx_completed() to advance
> the completion-ring producer for buffers that have already been returned.
> This publishes completion entries without matching outstanding TX
> reservations and corrupts completion accounting for a socket which stays
> bound across the teardown.
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: avoid duplicate XSK TX completions
    https://git.kernel.org/netdev/net/c/daac93975b8f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



