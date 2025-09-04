Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25CCBCA1015
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 02:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TufGZ/9EXrW5Od86RXaJrYhcHhyPtHoFjllhpJL4u9I=; b=L50CvFokj/N9sk+jVfmMBCv+Ck
	bRTgBzXLhyr+1eOqLlCm5H0GkjaIzxIaXgA4NvBGaOrGxNXcxxWwAQrnEt0wT1YlUocrJT4hE+Q6x
	+B541gMF7ALcKX7tCu4Qez5LA4P5dYW/e1VvnHvwt3By4BacgkUGib/kQog1E2tPvsd+MA69no5xx
	NFgq+1cjLMw7ApQRPcEkm6BQ+blaOT1Nl/O3shSPeSgvXovkJXLLxl2ok5qJroLXui4PvbVxoHxKk
	ELoqd181qzIksnmnXTh3v42op8L1wvf8HAinSmnWDjZPmJZZSTw8z5LlqWVkOyuU4gZmO/PvdzjRR
	eaWlP2Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utzRp-00000008Gt8-2j1w;
	Thu, 04 Sep 2025 02:11:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utxOX-00000007wY5-0QSg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 00:00:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E4E46023D;
	Thu,  4 Sep 2025 00:00:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E191CC4CEE7;
	Thu,  4 Sep 2025 00:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756944003;
	bh=I7w3dLpfScmtn7/wKU+AHG4udibaE0xMdWVzWJiexdM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HjpIsEzQmd0pScsMKbzSRUHOOHhU0XjCYRmiyOtcZWRbGkaG0EhrV5mlYjAoYG0Zf
	 4lgFrfdgEI9B6Lc6fARzbq/qyAPxEscC8zWM7pWQ3lb2atYrqmnn3LJevz/l+r7CEZ
	 Em84CIAKcxNfnhBfsGPIVQszgfFo9LSxs1llPt+wkXJCklRAsE1x8L4BKiAGzOCRw9
	 tJECtBfWJe//y4+2rp3fpVkG3fX0wUzK6KVcgIxUuVe9L+E8PYnuJiaCfJNk7Gha1P
	 AX5wWV1tnGh+J3bBvkI5jAGwcIiXKxuBAChj+M+L3hBh94tBH9DVzxc0kR+CBXsCRR
	 H5h6Xef+WPiSw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E4B383C259;
	Thu,  4 Sep 2025 00:00:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: thunder_bgx: add a missing of_node_put
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175694400901.1242165.16900024686479366326.git-patchwork-notify@kernel.org>
Date: Thu, 04 Sep 2025 00:00:09 +0000
References: <20250901213018.47392-1-rosenp@gmail.com>
In-Reply-To: <20250901213018.47392-1-rosenp@gmail.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org, sgoutham@marvell.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 david.daney@cavium.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
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

On Mon,  1 Sep 2025 14:30:18 -0700 you wrote:
> phy_np needs to get freed, just like the other child nodes.
> 
> Fixes: 5fc7cf179449 ("net: thunderx: Cleanup PHY probing code.")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  .../net/ethernet/cavium/thunder/thunder_bgx.c  | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)

Here is the summary with links:
  - net: thunder_bgx: add a missing of_node_put
    https://git.kernel.org/netdev/net/c/9d28f9491258

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



