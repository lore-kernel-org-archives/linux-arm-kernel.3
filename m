Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E063CD5BBF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 00:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D6QnQXTvJExnlymJ4cP5MMMFglbK7wD3z3FYtMP6sJ0=; b=IyePsGYSPdUbhYLOAYvMN2VZAw
	5CtC9t2PlFV9+mpn6+IgHP7sgmehk7C0wYrW0Fa6qLTNCoxhV6ItPEjmyNNriMewtxlRa+NsEvPHg
	TOb7tOJau9nyvaLARODxR8CxVSH4zV+Q6b25SVlzIYEp5qjgPEViee+QPp/d0b1frT0qzt2wlw1zq
	+m6EQRavJnmuqZjz8rNCGDv+0CHhNeqb9PFKMcljNAi+uXsv1BnAY6t2tv/rD1400nQdn5HqF3zAL
	mYrEobEiKwMTDcIv64BV2L/+TZSTsKTSIjvc1uwezzB4o0AMBjaeVQNwYuAAHsjeV6dif+Nb2lWtg
	nu+yF8tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQaPl-0000000CKzt-2cNw;
	Sat, 23 May 2026 00:40:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQaPi-0000000CKz9-3Kbc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 00:40:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E02541753;
	Sat, 23 May 2026 00:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00AB41F00A3D;
	Sat, 23 May 2026 00:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779496826;
	bh=D6QnQXTvJExnlymJ4cP5MMMFglbK7wD3z3FYtMP6sJ0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=L2Bw9LnqHGlTteARH4uklnFG4+DupmCxk/UwKcqcQ+TF7NqR/9IhZfr89zjx9Itp0
	 CITwIuCJGKOiURI1ojPbUWNV2cR/zKLWyX50RqCvZ92BDNr3EBk67JYGb1zyEmp8as
	 +LAgXOC9leAXpXv5HYvNNY7XxKnYJpSnI2DCmv2FV8gkoFAsrtX57Ii3g31Js0dlDn
	 1QdI5WbHI4ZBXn8w9f69dMw1Ati3izVhO9YhP7mAQPIUvFW4MkLB16iA5/kBr4T0YB
	 MBrmPFmgXxlg4oULvMxvaNbv9FAAfOVPEt3Iufpt1IdbmB8011pFb7bCEoWG9fT7oo
	 ynZEE2HboMqkg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 19748393100F;
	Sat, 23 May 2026 00:40:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] net: stmmac: mmc: Remove duplicate mmc_rx crc
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177949683463.1426243.3180007956000869179.git-patchwork-notify@kernel.org>
Date: Sat, 23 May 2026 00:40:34 +0000
References: <20260521-xgmac-mmc_rx_crc-cleanup-v2-1-7d9de09f5898@gmail.com>
In-Reply-To: <20260521-xgmac-mmc_rx_crc-cleanup-v2-1-7d9de09f5898@gmail.com>
To: Abid Ali <dev.taqnialabs@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_174026_856645_E6B93787 
X-CRM114-Status: UNSURE (   9.33  )
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

On Thu, 21 May 2026 16:32:46 +0000 you wrote:
> From: Abid Ali <dev.taqnialabs@gmail.com>
> 
> MMC_XGMAC_RX_CRC_ERR is clear-on-read, and just a single read would
> update the mmc_rx_crc_error counter.
> 
> [1] commit b6cdf09 ("net: stmmac: xgmac: Implement MMC counters").
> The duplicate read appears to have been unintentionally introduced in
> the intial MMC counter implementation. The databook does not mention
> MMC_XGMAC_RX_CRC_ERR needing the additional read.
> 
> [...]

Here is the summary with links:
  - [v2] net: stmmac: mmc: Remove duplicate mmc_rx crc
    https://git.kernel.org/netdev/net-next/c/fd1cdeddd7bc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



