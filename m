Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B20B5CF8861
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 14:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y9cSHkxCNNUPK9Z0s8Y7a4PgyKvgRSiib9ZCZfxYe8o=; b=eMuq9lE2CtUX8TvPTbt2azcd0s
	ZeG87AKcAJNVK8W7n+VKXC0dO3hYUqI9b3LFidxKm1lUgscye1pu/rTirIAXpyjmHrLiMAUPJqrat
	krjAIQrkuhxopSf9XXiHNTm2fiYL6/BYD/GzRBtDrgoB3czkk7Ft7Y4zxwA0TdIX/E47u6wGhUPxL
	VgVwxMaLkyfDfNL2iAAVF6j3DBRine9K751CHFuXUQJ3MbOWfYTXJ4xVHxDxW9VtxS1s6KO+YwKSB
	dUOc+zERdm500Rf6na7aiUlelLxtzhht47Y1UXttrHRwKrAtyePo1mMKlZoKVo4uYLpUXZwJitCIJ
	dHFxpIzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5gT-00000006qbr-35vn;
	Thu, 20 Nov 2025 14:30:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5gR-00000006qba-2xCR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 14:30:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BE20D60131;
	Thu, 20 Nov 2025 14:30:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D225C4CEF1;
	Thu, 20 Nov 2025 14:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763649050;
	bh=G0UVsRqQ7j8J9S16cmfX+j6Xm8Cx7ey9TFc+hgOvBdc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BY9YcLo9PfgLCtt2rd0kgNyiwsySVweY8KcCyA6BZwyH6QSGzWolRG59qQBleVOdV
	 2YPw73f5oaRWHYMp8PsWt758sIPRvImjds+2QvxjNT3pk8FpD2uAENbsyJmyTcmAko
	 K4Wc5H8igZzgX7q8zgD+GXWCcXiKU69+OnaDj0cUCcVtMqR6Ln8u+cpMdxpjs1DkLs
	 Vz0b8JopsN8zGBq7Ln7dQ2vhkJy4GWNtl0fKvy+i5uXY5FB8T7eu3rMobUPWuwSwx0
	 kSia1/X5hInvUYSppwsSJLpqago3Xi67ZiQLZarj/c/x/AGqDoRprp63jB4vlrxvEJ
	 7Rim3ehM+vlsg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF1739FEB77;
	Thu, 20 Nov 2025 14:30:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v6 0/6] Add AF_XDP zero copy support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176364901575.1647241.5550367394642830810.git-patchwork-notify@kernel.org>
Date: Thu, 20 Nov 2025 14:30:15 +0000
References: <20251118135542.380574-1-m-malladi@ti.com>
In-Reply-To: <20251118135542.380574-1-m-malladi@ti.com>
To: Meghana Malladi <m-malladi@ti.com>
Cc: horms@kernel.org, namcao@linutronix.de, vadim.fedorenko@linux.dev,
 jacob.e.keller@intel.com, christian.koenig@amd.com, sumit.semwal@linaro.org,
 sdf@fomichev.me, john.fastabend@gmail.com, hawk@kernel.org,
 daniel@iogearbox.net, ast@kernel.org, pabeni@redhat.com, kuba@kernel.org,
 edumazet@google.com, davem@davemloft.net, andrew+netdev@lunn.ch,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srk@ti.com, vigneshr@ti.com,
 rogerq@kernel.org, danishanwar@ti.com
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

On Tue, 18 Nov 2025 19:25:36 +0530 you wrote:
> This series adds AF_XDP zero coppy support to icssg driver.
> 
> Tests were performed on AM64x-EVM with xdpsock application [1].
> 
> A clear improvement is seen Transmit (txonly) and receive (rxdrop)
> for 64 byte packets. 1500 byte test seems to be limited by line
> rate (1G link) so no improvement seen there in packet rate
> 
> [...]

Here is the summary with links:
  - [net-next,v6,1/6] net: ti: icssg-prueth: Add functions to create and destroy Rx/Tx queues
    https://git.kernel.org/netdev/net-next/c/41dde7f1d013
  - [net-next,v6,2/6] net: ti: icssg-prueth: Add XSK pool helpers
    https://git.kernel.org/netdev/net-next/c/7dfd7597911f
  - [net-next,v6,3/6] net: ti: icssg-prueth: Add AF_XDP zero copy for TX
    https://git.kernel.org/netdev/net-next/c/8756ef2eb078
  - [net-next,v6,4/6] net: ti: icssg-prueth: Make emac_run_xdp function independent of page
    https://git.kernel.org/netdev/net-next/c/121133163c9f
  - [net-next,v6,5/6] net: ti: icssg-prueth: Add AF_XDP zero copy for RX
    https://git.kernel.org/netdev/net-next/c/7a64bb388df3
  - [net-next,v6,6/6] net: ti: icssg-prueth: Enable zero copy in XDP features
    https://git.kernel.org/netdev/net-next/c/c6a1ec1870e6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



