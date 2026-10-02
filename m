Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CBAACA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 10:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r4INfRqpxT7YhPd+W06NysuXddY9wGvptiUPCAUf84Q=; b=xEfe/1OKLQm8nZavSU465szzJu
	GGmG9FCFJnywuT4tlYnaL3qC+FEnXoA7zpwpMMakRkHxRSlNYtGlzAnkBaLJUD+1a8TRN9kXBm5iO
	eKVdKn2ER6QwBoTfkq7bc2dyyVCGAJftvzIomrf3tgYilXJHjIrnJnxNfNrf1MSYKuA5lLDMqHL+I
	AeVhjM7uWhUEFG51nHZ8edUCTDH8kirC1g6lqCrDJE5BSF6+DVBrsdlq/BaaTsE+0T4rgDzHap3p2
	MhfEAdyRiMpiyzdtUAYJSSE7HpG4W9o6nsgWVqssFKXYKuPF8jq1lehaiXP8i5zqTD36cBQOOaIaQ
	2Hw1oNAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCagS-0000000BLmG-2nwy;
	Fri, 02 Oct 2026 10:40:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCagR-0000000BLlw-3jHX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 10:40:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E20E542B62;
	Fri,  2 Oct 2026 10:40:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C041A1F000FF;
	Fri,  2 Oct 2026 10:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790937606;
	bh=r4INfRqpxT7YhPd+W06NysuXddY9wGvptiUPCAUf84Q=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=lyCuXvLvrukBpLA5Oi0fuVfgDeW7EReHHvoKZu6zcpIWq/1NDdNVlVB11rBiizCn7
	 ULtta7vJTQso8vCLmTCzRS+obSLOuhGqjYEI2V+SXCV7vkIWWN7Rq3YtdzhcUYSPJh
	 8d2mJlulPkrCQCG1TaesS9XxTloiQ9iL4b3PWTTgZzMn7JAj3Zcs3FvzxycawVB1lj
	 brOGbKH8dvgzsZGDa2SemNmROVp+X1U8YPbzRDc0n3fj1DrHYhpKuF+flS9nXmzFCS
	 A0TpJHnOHU6a6+oE1c2RhRnnJWnQNh8Oj+Sve7hRxLGqT7CS8Q6O2UbmFtFksdRlrP
	 yW8ECfZto62Wg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B448C38119E9;
	Fri,  2 Oct 2026 10:40:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/1] net: allwinner: remove dmaengine_desc_free()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179093760553.3349832.499337152312400934.git-patchwork-notify@kernel.org>
Date: Fri, 02 Oct 2026 10:40:05 +0000
References: <20260929190640.3516766-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20260929190640.3516766-1-Frank.Li@oss.nxp.com>
To: Frank Li <Frank.Li@oss.nxp.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, wens@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org,
 bartosz.golaszewski@oss.qualcomm.com, andre.przywara@arm.com,
 phucduc.bui@gmail.com, arnd@arndb.de, kees@kernel.org, liyouhong@kylinos.cn,
 Frank.Li@nxp.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, imx@lists.linux.dev
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
by David S. Miller <davem@davemloft.net>:

On Tue, 29 Sep 2026 15:06:36 -0400 you wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> dmaengine_desc_free() is designed for DMA_CTRL_REUSE. If DMA_CTRL_REUSE
> is not set, dmaengine_desc_free() will return -EPERM.
> 
> 	if (!dmaengine_desc_test_reuse(desc))
> 		return -EPERM;
> 
> [...]

Here is the summary with links:
  - [1/1] net: allwinner: remove dmaengine_desc_free()
    https://git.kernel.org/netdev/net/c/71a77ab76e74

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



