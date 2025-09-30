Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C702CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 01:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ht1hp6Obw1goNKNuK06ncf5Q8+B6RPLGT+MboUwz+LE=; b=K/K+n6YmA+KVrcSm3o7qcfaYx5
	tIxkK9320Vd9RRSLtoIlxwvPFpM2VWj0wXJGjAm/hxOSgiV6udFOd2yLQex0wJHS1inny9bnp32+u
	Najp3odmLYK4JI364JETEAzqCHqQkLvqM7bn0Jr91qTrhU69fBnsxypKoGF90OBirt4hJMwDf1CHt
	kPKuzyDFvff+oJKYKQxPxrRYBXnf2mt8lyitUxFeaM7MVDOlRTaZoh3VgdIt6f6HWpGjYANO2q0Ih
	oHwpWQSmACtpp8E4/9GuN2KAFC2Hn2wQ0JiD2j1YQ0/pIpfi6wSoT3bh6xjNKIqJZdkso2RbwWnTg
	avYkCXCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3PVu-00000003pIQ-1BMV;
	Tue, 30 Sep 2025 01:50:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3PVr-00000003pHm-1gUo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 01:50:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 73932402AA;
	Tue, 30 Sep 2025 01:50:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F8F6C4CEF4;
	Tue, 30 Sep 2025 01:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759197042;
	bh=fmcYjWJAnGdhbsMUxYEUP6vCOJjyb2KhW72GCar/ySs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=F2d+73AKmrnqDc7leXgfFj8Ctj5ugwep7vPk45YGtVuyDgqU2H/TyHTucnswLXSq2
	 Wkjv07XWjUdSg/DBJ56ecR4SRsYSfNGm67CWRMgIaQX+rWDhBy62n1peZyw2ZFWn3a
	 tOHo8qlPPBsN/mnWLSIdrjLzQBkUqJQhPgCbJ4LccSzWKOfMYdBAIxgY2UAJ2USNXA
	 Lhrer1U2Pwa/D1szx7USSgVbnWT2HPoVkWCkmFnTgT5z4f8gPOVfeEVhS3nWXdWfMG
	 USbIerc7boAKmG9Q2iIYUtSF6dD2jYOzWSHoExc6KgGteHuEHt1E17ovQMzeY4w2oX
	 26aCfJqcn8kDg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EADFB39D0C1A;
	Tue, 30 Sep 2025 01:50:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: stmmac: Convert open-coded register
 polling
 to helper macro
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175919703549.1783832.10169355846256119327.git-patchwork-notify@kernel.org>
Date: Tue, 30 Sep 2025 01:50:35 +0000
References: <20250927081036.10611-1-0x1207@gmail.com>
In-Reply-To: <20250927081036.10611-1-0x1207@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, xfr@outlook.com, horms@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_185043_461069_7F85B4F2 
X-CRM114-Status: GOOD (  10.76  )
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

On Sat, 27 Sep 2025 16:10:36 +0800 you wrote:
> Drop the open-coded register polling routines.
> Use readl_poll_timeout_atomic() in atomic state.
> 
> Also adjust the delay time to 10us which seems more reasonable.
> 
> Tested on NXP i.MX8MP and ROCKCHIP RK3588 boards,
> the break condition was met right after the first polling,
> no delay involved at all.
> So the 10us delay should be long enough for most cases.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: stmmac: Convert open-coded register polling to helper macro
    https://git.kernel.org/netdev/net-next/c/9dd4e022bfff

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



