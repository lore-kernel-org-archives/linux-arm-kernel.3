Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD76E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 03:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0+OgxgrqO8x5NYDaBqlclgwwEvlkGwwVZ5+LTqpGf24=; b=UbliA01o748NNZOwTrXAk2mK/4
	zZVE1HUHiv4ZV3SE9pgHaLnAhjlQOvNldzRi5fep8VlNAutqzCj2gHo7LOQTGpcNvVaPxcSJJLM5F
	vVTo2cVb8vxm2blnqGLb9dOtN9xxl/Xniudei31xWSxZ4hUYaVyF2XxWeoq12eLYO2vcXuO4sya4A
	Zve+yghjqzK+zfeBAFc281lUvIKkPuSl7BqlDCzT4J28lrzowIi7NUtIBQhZxWQC9UX+JfqjjtUAp
	aPRpN5p6za4RAAVMKm8LC0WSX54htDKFq+hR1qDdgODu+zTiq2hNGB64RfNxWHrzO7kvsRm0JnUsu
	8AAO214A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOTjf-00000003oKl-1Qwl;
	Fri, 20 Dec 2024 03:31:31 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOTiW-00000003o9t-2GU3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 03:30:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8B556A42AB1;
	Fri, 20 Dec 2024 03:28:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEF1DC4CECE;
	Fri, 20 Dec 2024 03:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734665417;
	bh=YM6IcQzvMh0nBVLALsAQctJoSxEV75NUYhaBmFHz60s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Q4dNOESBlhZ+2RJ/IQZ38XF9PvrHb4IidwHQR6RZyr1gnbyWj6mGf0AvB/FYv8Uq8
	 IfnSileWj1bYPN5X4mWBiocbLggz4X0IJ3c+pGexAl12E7XsbxvmM58dRpWv4VE0Wp
	 KOZtXG3qWIu46FRK+2rTj2YqLg2kor+7EdU3jebgWxjqdjVg04BJLK1A1h2JOODBLR
	 w+3NiloaUsLwly8dRbENkPp5gc+sv7JJQbK7ZZfyd8HUB2H5yceMm+taXiSmbj/VdW
	 exmcQj6xlGedPElRr1VuVlKA3h/xxVGEoV2Iwms0SC34kp0Ax3hSdM74iuhfPJsHPW
	 r5u8ED7b7fzlg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE053806656;
	Fri, 20 Dec 2024 03:30:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v1] net: stmmac: Drop useless code related to ethtool
 rx-copybreak
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173466543521.2462446.17820764757552771854.git-patchwork-notify@kernel.org>
Date: Fri, 20 Dec 2024 03:30:35 +0000
References: <20241218083407.390509-1-0x1207@gmail.com>
In-Reply-To: <20241218083407.390509-1-0x1207@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 horms@kernel.org, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 xfr@outlook.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_193020_644688_DC32AB8A 
X-CRM114-Status: UNSURE (   9.84  )
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

On Wed, 18 Dec 2024 16:34:07 +0800 you wrote:
> After commit 2af6106ae949 ("net: stmmac: Introducing support for Page
> Pool"), the driver always copies frames to get a better performance,
> zero-copy for RX frames is no more, then these code turned to be
> useless and users of ethtool may get confused about the unhandled
> rx-copybreak parameter.
> 
> This patch mostly reverts
> commit 22ad38381547 ("stmmac: do not perform zero-copy for rx frames")
> 
> [...]

Here is the summary with links:
  - [net-next,v1] net: stmmac: Drop useless code related to ethtool rx-copybreak
    https://git.kernel.org/netdev/net-next/c/5c98e89d96ec

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



