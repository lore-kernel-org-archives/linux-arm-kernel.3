Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E1C0C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 09:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xCjT1cG1V8R2NiZdozk7UnxEH7mkeu1dA8rHULc1hRI=; b=h8KMAvE7e7xOvJuOY7tpJYDhX0
	f/mWlVZ5vqE/YouiG3ADoc0VUpCp7k/HRcbuJmq9guYly1H4JDAe78nB0r9biFTIDnlARh2PED0gX
	mWKe3Zycwe911kuZO19cWCPpSd9Ed6lEVjoIMtf2m3OAZyB9xVe5RVPzcesWBjRWkk8id41MPqsMC
	AS6rG3uDoC0xTCgnfit4qgeHMffoh3GDNc3RitsPjwBbooonDR0kKBQ9baOJ4leyc0Ifq60OBNBuY
	5Jy1DFbzoVYEGe8SkiWYE19Hige4g34dB3QGuK9XKjy98YGEfuklev7ZtJlIyO1jqiqehuCSZOMNY
	6oNm8qmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5LHz-0000000COo5-12Pc;
	Thu, 17 Apr 2025 09:12:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Kwe-0000000CKlj-1ZrR;
	Thu, 17 Apr 2025 08:50:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F37F668430;
	Thu, 17 Apr 2025 08:49:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51613C4CEE4;
	Thu, 17 Apr 2025 08:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744879803;
	bh=TF9L75xMsJl/rRW4x9jHA8OF3aCS+Rflmlav7hk7J34=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=d7cMblumKw5PUaAaELfYAtBpe1o4sOiT5AzMbq+sIInTgwhjBZTAl3MT1q3nibiAZ
	 SksU5Vc106vHExpdOFRylG/goTMWsYyisHBVxfScrPrv+cYEg5gQ5B5v7O4OPpgWHR
	 UA9sKhqhqJnWjElEA4EHeJni9CM3QipGdnjpfkYsd1A1i+F/cGHC96HiRqrrZgzCso
	 nxMNYM5A0LCYHB25By/8mbhxrN5ShPKUPRyJaI6BBZa4a4OsUIKrn3ddCXxHLuLVQd
	 zaBcKeUVdfVjDf1B2hSwTvzQjJjGhMH2axfKoaBRpdqzVuEjLQjWwgK+iTccXMixAw
	 x9QCvvkxjDWog==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C043822D65;
	Thu, 17 Apr 2025 08:50:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v4] net: airoha: Add matchall filter offload
 support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174487984117.3994493.2854347625667503650.git-patchwork-notify@kernel.org>
Date: Thu, 17 Apr 2025 08:50:41 +0000
References: <20250415-airoha-hw-rx-ratelimit-v4-1-03458784fbc3@kernel.org>
In-Reply-To: <20250415-airoha-hw-rx-ratelimit-v4-1-03458784fbc3@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 dcaratti@redhat.com, horms@kernel.org
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
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 15 Apr 2025 09:14:34 +0200 you wrote:
> Introduce tc matchall filter offload support in airoha_eth driver.
> Matchall hw filter is used to implement hw rate policing via tc action
> police:
> 
> $tc qdisc add dev eth0 handle ffff: ingress
> $tc filter add dev eth0 parent ffff: matchall action police \
>  rate 100mbit burst 1000k drop
> 
> [...]

Here is the summary with links:
  - [net-next,v4] net: airoha: Add matchall filter offload support
    https://git.kernel.org/netdev/net-next/c/df8398fb7bb7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



