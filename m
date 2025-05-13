Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71637C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 01:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jVHNlNX/dXRcjSONR7k2PLFj/IcCjNjonxX0bKUHaKs=; b=X5C/CLjsnepXQdHWrJZa3J98YE
	sdlHFmQn+epg9VJv/d/KaKinaz9GI85MxItZaq0KZHkDKmMH7FSCN3dVfGeEEh1rWmBhIO3rNxT34
	i+bIWiocp3Z90OTvyCIfwPUw0f5g42OZEyD3z3N97PV2ddmuD7JMwXWzqavhZNDppdiCSSaVKllWO
	kKO1x/PmnVkP5LpXOxSf1XmYbEcVx0/BPw+XQDG9EFbvtFtuTFhtvknLQr7QPzdDbfZJ9FOaEDOLp
	kvXwMzirAYaXovC5Bc0o1cqW+LCfkoV7yqlmwUirQFxC8rC7Y0yEM1yiEJjkt+vCILOa8wSd11R5V
	hst0CF/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEeLc-0000000B3Iw-3MgA;
	Tue, 13 May 2025 01:22:20 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEeJW-0000000B2sp-0rBD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 01:20:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E1A0BA4CB4C;
	Tue, 13 May 2025 01:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8649EC4CEE7;
	Tue, 13 May 2025 01:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747099208;
	bh=Gwv8IJluwhkLe7Hm576RB+85+3tduL9ekdWBKgtmVAc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=K/1H3WOKXSUhEkXbxo80jO37hrPgDOaduOvljmHihT5WjyX5ImsBaU36+416bm4Eo
	 CslRg2DZydXaMu+Rx11C79w+t7w7T5lyLLgOyvDdaq7pIG7gf5fvlSegC3SJWFHp70
	 B1iw4R6w8zd/ZMvZOb56/W5bam0N26wD0fR4ZK5mA3ZQcbdcmEE2khXeGRdff8TwCm
	 w1FnHebLA7rJ7nx0Jdla2hRp1MGfJmhSbQgnKIvG8FzhhvHbLxdV4/koHGYybc+gSj
	 4o4buXd5ggzLGovqChc6k2oCoI/3PmMG9nQVB4xZKNmE6wuegyJOeZjgA51xQ7oykE
	 V7CbEvmxblH2Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D6D39D60BA;
	Tue, 13 May 2025 01:20:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: ixp4xx_eth: convert to ndo_hwtstamp_get() and
 ndo_hwtstamp_set()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174709924600.1134434.410408698956541065.git-patchwork-notify@kernel.org>
Date: Tue, 13 May 2025 01:20:46 +0000
References: <20250508211043.3388702-1-vladimir.oltean@nxp.com>
In-Reply-To: <20250508211043.3388702-1-vladimir.oltean@nxp.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, kory.maincent@bootlin.com, linusw@kernel.org,
 kaloz@openwrt.org, linux-arm-kernel@lists.infradead.org, andrew@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, richardcochran@gmail.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_182010_325670_FAA97739 
X-CRM114-Status: GOOD (  11.68  )
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

On Fri,  9 May 2025 00:10:42 +0300 you wrote:
> New timestamping API was introduced in commit 66f7223039c0 ("net: add
> NDOs for configuring hardware timestamping") from kernel v6.6. It is
> time to convert the intel ixp4xx ethernet driver to the new API, so that
> the ndo_eth_ioctl() path can be removed completely.
> 
> hwtstamp_get() and hwtstamp_set() are only called if netif_running()
> when the code path is engaged through the legacy ioctl. As I don't
> want to make an unnecessary functional change which I can't test,
> preserve that restriction when going through the new operations.
> 
> [...]

Here is the summary with links:
  - [net-next] net: ixp4xx_eth: convert to ndo_hwtstamp_get() and ndo_hwtstamp_set()
    https://git.kernel.org/netdev/net-next/c/c14e1ecefd9e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



