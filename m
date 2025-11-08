Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C86FCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 03:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sB2ioxHCNI5b6MHRv2+Us9SQhASeWWSYUz/U+g9J0Oc=; b=QqvfdTLL1S7qgnAoF8bUvc21QF
	hPw2L0Dslbt6SKbDxzTPfnCoj9vp+phUrzXodrTEvtDCgSDk0t6YMdGUvgeHe6W5YeWPDNoi9T22W
	sjXC7KoXANiAwa32a6uDpKCelWHV61eRDAZ3mCo9g2txZWB40S9qOVQpC3hyn0PkmZ6Nw3FgD3y24
	AiL/g+AUDwaB3JazgdRtURbXd3d0wh/RqHIIRJZKIH/ATosYAKrQ9jl1z5vlsolSkdj4x4SsrHSKG
	foU7m0oR/R5FyTaAk5KO1qIj5282V7NogR/QZZJSZTrgjJiq8xjXyslfeew4tgAlbiK8GgU9931Zt
	XHNjOeeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHZCD-00000002ELz-2CDF;
	Sat, 08 Nov 2025 03:00:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHZCC-00000002ELZ-1gZB;
	Sat, 08 Nov 2025 03:00:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 894A0601CF;
	Sat,  8 Nov 2025 03:00:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56FB7C116C6;
	Sat,  8 Nov 2025 03:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762570855;
	bh=00lq9mTgEdaXm1TiWcCpC7BbocJlckplKnaVhHwJplM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WrXYuzHz+2VPuTxZOOasO4YmKvVFeGcQqABRgyeUpsFxX6T9r8WvQHxpZmMS7CyQh
	 2TLiKu467MaK6QgEzctbpSOlWVBO6EGWdfkfFVlsBNaFACW8fbN4OlKeQi4ITKSlbn
	 xiZCDO0urPGyDRtNhiI5xB8Q24JdTflW12qzWzFyN4kO1bevBTJnTZMweSjLDDW0yR
	 zbpYtAyu/S3g5YteRfxNhk/dCry4xNSnJAxC1wCWzOndoo/SlaAGKESpUvKH8tdXyr
	 2108EsZJP+FW7HfytpBtcB3avviqe085krqJ4+BiqRlSQnIp2oi6eNZ9aEnD2FpPq9
	 6Gr7wTk2+DeJw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADCDC3A40FCA;
	Sat,  8 Nov 2025 03:00:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: airoha: Add the capability to consume
 out-of-order DMA tx descriptors
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176257082729.1232193.2974398557983419520.git-patchwork-notify@kernel.org>
Date: Sat, 08 Nov 2025 03:00:27 +0000
References: <20251106-airoha-tx-linked-list-v2-1-0706d4a322bd@kernel.org>
In-Reply-To: <20251106-airoha-tx-linked-list-v2-1-0706d4a322bd@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 xuegang.lu@airoha.com, jacob.e.keller@intel.com
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

On Thu, 06 Nov 2025 13:53:23 +0100 you wrote:
> EN7581 and AN7583 SoCs are capable of DMA mapping non-linear tx skbs on
> non-consecutive DMA descriptors. This feature is useful when multiple
> flows are queued on the same hw tx queue since it allows to fully utilize
> the available tx DMA descriptors and to avoid the starvation of
> high-priority flow we have in the current codebase due to head-of-line
> blocking introduced by low-priority flows.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: airoha: Add the capability to consume out-of-order DMA tx descriptors
    https://git.kernel.org/netdev/net-next/c/3f47e67dff1f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



