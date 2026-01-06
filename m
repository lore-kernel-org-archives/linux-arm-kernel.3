Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56184CD0427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 00:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kaku5bTbOS/1M+TiwtW8oSpyhukokApeS29fwNk+Cy0=; b=Ij/FPmQnSXCmAUjYwrWzg5VIj4
	uR5HABwyED0CjfPxc1JbCl2XKq1zraMOYIl2RfIpq2erfj4QCoPmdc66TSqKixTYnNa5dLGdOrHeJ
	3zRgDUB4SIq/jTm4aV8e21gU40+AVeN4XUk0nEYi6K7he5YLBxSZznofQxe7uz1LABi8VZgvHPFeR
	9X/zi7qEvQH5G+zsQCKlLiePl0uKT6HvNgHi/+X7I/DTfq8qYm3sAARYtJBWjLZd74+52SPzZuOdp
	7U4GjHYRzya9OY05sn2x+ADLLs6xlJN6Zi6mTDr1WUpvHnBYq3OMs7xSy4Azb0HqsVEVjqzLLa+og
	xoCEaq+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcv11-0000000CGTE-26yN;
	Tue, 06 Jan 2026 00:33:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcv0z-0000000CGSr-1Jpc;
	Tue, 06 Jan 2026 00:33:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0A59644146;
	Tue,  6 Jan 2026 00:33:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1AB8C16AAE;
	Tue,  6 Jan 2026 00:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767659615;
	bh=43Yo18+TKFmz9SxuJ+aN5IMhsbRVzkzo4rD++TRu42I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LXCHUxMHXJGIDkva0ui+kC946OB1yUnd2EYeznCoO3bspcWv3nuDg/hTIFZHrZn7R
	 VpzdmtkXBhRBjeOMn2kDQ0LEMLxFocF+m1Qwu/e+WkGrGZI++n+ix3RmDBF1kMSSMV
	 MamGL1i04o21VzV6PRq+3BO3R4Dm001gjdDZ3fQyQFfM/wrgmRAul6IQbVHKdGFmrg
	 3qR8vsnpz6cNQu1jnM6iReCHg9ze4uxo/hUWSdyFVGM0LtA4GsDuBd9saNCNq8gECR
	 3j1r0YHsyIkbknXs0ERzrpQ9HQAa5EHrrqcERQohoARoTDhbLqfn5eG8003SXFeQ+n
	 9+CBRa0vyO+fg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3C3C5380A966;
	Tue,  6 Jan 2026 00:30:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: airoha: Fix npu rx DMA definitions
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176765941378.1341185.10653064219768375586.git-patchwork-notify@kernel.org>
Date: Tue, 06 Jan 2026 00:30:13 +0000
References: <20260102-airoha-npu-dma-rx-def-fixes-v1-1-205fc6bf7d94@kernel.org>
In-Reply-To: <20260102-airoha-npu-dma-rx-def-fixes-v1-1-205fc6bf7d94@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, kuba@kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_163337_377635_AFE6AD59 
X-CRM114-Status: UNSURE (   9.14  )
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 02 Jan 2026 12:29:38 +0100 you wrote:
> Fix typos in npu rx DMA descriptor definitions.
> 
> Fixes: b3ef7bdec66fb ("net: airoha: Add airoha_offload.h header")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  include/linux/soc/airoha/airoha_offload.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> [...]

Here is the summary with links:
  - [net] net: airoha: Fix npu rx DMA definitions
    https://git.kernel.org/netdev/net/c/a7fc8c641cab

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



