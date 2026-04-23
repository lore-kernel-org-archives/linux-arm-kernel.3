Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7824F99342
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 07:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/tfN33UMY+KMx9ykML6PND5yEfqWCQ8iASPsUUFTe/g=; b=yuOYoBei0vEKA7NIflv23S0ria
	zhQsG+eaIb7Ytg7Es5tIFkRDyPVBYg4i69/TG+kr7iURPCfsHpQOrfr691HPgx7KYu7/f1ld9kiH3
	PHkrTCLAbVfdlpgnNj+Lh41cZbknlttvXDQ1tc04FqwPwL7e+yII3OXS/XgCTn1hS2U41ixYVpXRe
	lofQvmraf+cQZlc8lRxsGE5vw3t6d3icdG6c15opztMImFt/UVWjtBs8HBVWdtrKxAs3FWM9iyh9d
	dZ4tqMg3VTboeSTxWMdxAdN+jvO3Pit/ysP+jpOsXWvSjwWdQG7g/ji615P440pNLEiSSvzKCPShk
	Sb2T0Qug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFoMs-0000000B8vR-0rmA;
	Thu, 23 Apr 2026 07:20:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFoMq-0000000B8vE-1Ygw;
	Thu, 23 Apr 2026 07:20:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2F45C60052;
	Thu, 23 Apr 2026 07:20:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D93B5C2BCAF;
	Thu, 23 Apr 2026 07:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776928846;
	bh=SmX0sRFqnNZjqfPDFK0N1hGVs5C10+dJXyOfzNRMxfc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=UwL4Ig2gxvdLNTuHsGl5Lj61OCLBOKz4TZeYg2kFtbuw5HADzBVF0QHXcGm6TPv9i
	 UoXiWy6ve4yhch7xEQcOynojCN14pDhh8vRUPgUJjLBG16MKtqWSz2DgnkbcMcTcZt
	 /kqIOeCC9shdsr6BAM0YW0VPTHDhfutEY9adoBYNaPedWPdq81G8btclQvLlnK1G5l
	 u5t/28VO0PZCvdGZAJcuNhhysicjQbVHj74sYZ51lvlvQF3gFJ97qXSIZUTkT1PutU
	 9MBN9nWH06M1eiI2WjMbwDYN5JMZ87QnBLr6Zf7UwFTFwryUXzNrT0OlSEFJ/LCE3o
	 MwvWptj7BW/bA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id E07CA380CFDB;
	Thu, 23 Apr 2026 07:20:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v4 0/2] net: airoha: Fix
 airoha_qdma_cleanup_tx_queue()
 processing
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177692880880.14264.2972373340507100909.git-patchwork-notify@kernel.org>
Date: Thu, 23 Apr 2026 07:20:08 +0000
References: <20260417-airoha_qdma_cleanup_tx_queue-fix-net-v4-0-e04bcc2c9642@kernel.org>
In-Reply-To: <20260417-airoha_qdma_cleanup_tx_queue-fix-net-v4-0-e04bcc2c9642@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
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

This series was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 17 Apr 2026 08:36:30 +0200 you wrote:
> Add missing bits in airoha_qdma_cleanup_tx_queue routine.
> Fix airoha_qdma_cleanup_tx_queue processing errors intorduced in commit
> '3f47e67dff1f7 ("net: airoha: Add the capability to consume out-of-order
> DMA tx descriptors")'.
> 
> ---
> Changes in v4:
> - Drop patch 2/3 to move entries to queue head in case of DMA mapping
>   failure in airoha_dev_xmit().
> - Link to v3: https://lore.kernel.org/r/20260416-airoha_qdma_cleanup_tx_queue-fix-net-v3-0-2b69f5788580@kernel.org
> 
> [...]

Here is the summary with links:
  - [net,v4,1/2] net: airoha: Move ndesc initialization at end of airoha_qdma_init_tx()
    https://git.kernel.org/netdev/net/c/f329924bb494
  - [net,v4,2/2] net: airoha: Add missing bits in airoha_qdma_cleanup_tx_queue()
    https://git.kernel.org/netdev/net/c/3309965fe44c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



