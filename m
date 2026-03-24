Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C847F532C0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 00:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Wi1e8pFKZQtE5ZobXRDfaYjf6ZMx2oDA5/pfPnLM9I=; b=jYPMze/XDjGRfyJ71IBeOu9cZA
	m9+nhNEnSsZiAh50Rh1jG5s23EpGFF5xilGvTxT2+9T19pRO5Jd0VR4tkG8+BjRR3NSd9fo5geDGC
	rNuZ+HQhSz4mWs302Y9yeNW8xE0UsepITEEpjuK5V9si1iwfA6dlqJPAivJpd9B7w+PLYXC1apY3x
	fpEqHIYhBKbdh6BQh8Zk7AdnlhGTAksYm9CuLSslXNi1QwmbNEGUj6qssHXjV89t3p3/HF3UJ5nKE
	Ilg1MEj5ARa3L8hxb52o4QhmxN9CVmFLYyKv5iGVEtVHitSGXuDRIjQnhkmoJfoh4I9D92EKTjx88
	rcui+eKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4pyQ-00000000GNJ-3vnC;
	Tue, 24 Mar 2026 00:50:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4pyO-00000000GMn-3e0S;
	Tue, 24 Mar 2026 00:50:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 35FAE44504;
	Tue, 24 Mar 2026 00:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14178C2BCB3;
	Tue, 24 Mar 2026 00:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774313420;
	bh=JKi37m02ysGGaDX22rah6C5f382uv4n68JZXkVg1/pw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=EA1lPRk7femanXt0GavT4f4tPdaMa2ueHPgOVGMETEsdhpOojt20I3hrOri+XQedb
	 4K3UB+rQ3tDaxkHAe7Rv5nY70rL+aPqNR2IpSr82CgVpKNd3NgjAoCpyoiBx+zHhFh
	 A7DEfb/50zGe8OdpPck6Cp8clL8q2WnVmc4ht4RZwtT5nhl3q1nti85kI7X+i6lPdm
	 LXSBBpAsurBm/L8aQueHdae8FRc0uYQOk3tnJ4qq8SfLz8IXouTAjPIrILjofv37uF
	 9JZNehWFeJF/ndP2kZK9XMf4c1Hqx56/dSw7egIV8ezieQKCjXFZWAiEWTjmnv44BX
	 GVVTHo79shKdw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D04F3808200;
	Tue, 24 Mar 2026 00:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: airoha: add RCU lock around
 dev_fill_forward_path
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177431340803.395707.9019086790298315376.git-patchwork-notify@kernel.org>
Date: Tue, 24 Mar 2026 00:50:08 +0000
References: <20260320094315.525126-1-dqfext@gmail.com>
In-Reply-To: <20260320094315.525126-1-dqfext@gmail.com>
To: Qingfang Deng <dqfext@gmail.com>
Cc: lorenzo@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, pablo@netfilter.org,
 horms@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_175020_933315_06CCC399 
X-CRM114-Status: UNSURE (   8.80  )
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

On Fri, 20 Mar 2026 17:43:15 +0800 you wrote:
> Since 0417adf367a0 ("ppp: fix race conditions in ppp_fill_forward_path")
> dev_fill_forward_path() should be called with RCU read lock held. This
> fix was applied to net, while the Airoha flowtable commit was applied to
> net-next, so it hadn't been an issue until net was merged into net-next.
> 
> Fixes: a8bdd935d1dd ("net: airoha: Add wlan flowtable TX offload")
> Signed-off-by: Qingfang Deng <dqfext@gmail.com>
> 
> [...]

Here is the summary with links:
  - [net,v2] net: airoha: add RCU lock around dev_fill_forward_path
    https://git.kernel.org/netdev/net/c/1065913dedfd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



