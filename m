Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F07D43352
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 12:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FFWyQJtIcPWayv5RkZglbuPvNAZtXSBS0Lub8UO4q7c=; b=I1uOF38E6TgOHWbMR2VZkD58dz
	KHfbOvV4udJC1U5J2KAJWoxcAqodbxxgMwzSiSHftmNvLeMOgVPuWEhEHMc3C8QeFLSgEBEVgUeAJ
	g7Fkhlbu6VjU4WTWjJEnkLIOQ9VeAB5kU3lDyxYLK8iykZjunQKb8bnju32DW4+ljaUnwhyFwwOqP
	c48874zUIJGCnqrvuxYBYsAS2IS4vzjj5Vs5GJ7W5rrZBJqGIQh7Agq8eNqgBM20P/DoBP0CUAJek
	A0nCUc4XDD2gvFy3THbPfsVq+OR0xLVwYPhAt2P7oRwoVhOjzsNc3I/m7s5TulMoVkD4DGU5yA0oo
	GflnkU/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t91q3-00000006xtz-3Ml4;
	Thu, 07 Nov 2024 12:42:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t91oJ-00000006xbp-10MB;
	Thu, 07 Nov 2024 12:40:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C1F075C584D;
	Thu,  7 Nov 2024 12:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EF80C4CECC;
	Thu,  7 Nov 2024 12:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730983226;
	bh=VZ/R76eZ40KfZxIQM47Eo9NR0UwGvAKmLQ8wW76gHE8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RmtHNgc5aEh2jxi4LKZXroPeeq47lr+t5xy/sjX88jCya+GqX/J23XpfTXiHkbo+P
	 RkA8aL9tmby/TCWLNUuHku7wuB8l63MMBCBNrFM9wX0+3Ymg8fydtjGDkRIgzVX6Bs
	 vtTE28ikWXgdpm4UILIzcRJ+/JYjeuX3+/r+CFtodst2X9BkJa/4/cYOlCgl/3nuRA
	 AwcqX74NgvsR86bxTMveB+M1h+M5NmIk9+D7LGHotpxVd3EY36gpbiOP9OVqkOg2Wh
	 IYM2FJN7T9qe5mjoTjKMgcgO82f1BhXBcVrVaHb8TJwEvm0CQ4uES1rNlZP1vHwC6v
	 88HD52YJcLtBQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70F763809A80;
	Thu,  7 Nov 2024 12:40:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net-next v8 0/3] net: wwan: t7xx: Add t7xx debug ports
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173098323525.1650074.3036692889717501713.git-patchwork-notify@kernel.org>
Date: Thu, 07 Nov 2024 12:40:35 +0000
References: <20241104094436.466861-1-jinjian.song@fibocom.com>
In-Reply-To: <20241104094436.466861-1-jinjian.song@fibocom.com>
To: Jinjian Song <jinjian.song@fibocom.com>
Cc: chandrashekar.devegowda@intel.com, chiranjeevi.rapolu@linux.intel.com,
 haijun.liu@mediatek.com, m.chetan.kumar@linux.intel.com,
 ricardo.martinez@linux.intel.com, loic.poulain@linaro.org,
 ryazanov.s.a@gmail.com, johannes@sipsolutions.net, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com, corbet@lwn.net,
 linux-mediatek@lists.infradead.org, helgaas@kernel.org,
 danielwinkler@google.com, korneld@google.com, andrew+netdev@lunn.ch,
 horms@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_044027_715079_36644C8E 
X-CRM114-Status: UNSURE (   7.66  )
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

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Mon,  4 Nov 2024 17:44:33 +0800 you wrote:
> Add support for t7xx WWAN device to debug by ADB (Android Debug Bridge)
> port and MTK MIPCi (Modem Information Process Center) port.
> 
> Application can use ADB (Android Debug Bridge) port to implement
> functions (shell, pull, push ...) by ADB protocol commands.
> 
> Application can use MIPC (Modem Information Process Center) port
> to debug antenna tuner or noise profiling through this MTK modem
> diagnostic interface.
> 
> [...]

Here is the summary with links:
  - [net-next,v8,1/3] wwan: core: Add WWAN ADB and MIPC port type
    https://git.kernel.org/netdev/net-next/c/495e7c8e9601
  - [net-next,v8,2/3] net: wwan: t7xx: Add debug ports
    https://git.kernel.org/netdev/net-next/c/61329a1152dd
  - [net-next,v8,3/3] net: wwan: t7xx: Unify documentation column width
    https://git.kernel.org/netdev/net-next/c/238f2ca1e61f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



