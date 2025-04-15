Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8550EC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 16:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GQEtuTEFH9V69dFmQEcxPRt7NfHTF91AAexlWFakgmE=; b=wPAabIMKZ9d0QJu+M6X5Icw9h9
	eLc2s+gdJK+Pc+PqZI1KAstqTgGjIW/oBsC2dwIatTQ9sNZNBJP1FKadXz08dV9qRdx489fq7k32f
	xVq1srPhsazu0VN+EviJAgvLyxVy+HuzJeQvoo4TU23eZ9Kcb2gb6rS49VkwT0RCZqIj63sQFU3JM
	it1hJFI6f8dUuLiwZhLI0vsBVbb8XXiNRetU/LygkoRRw9weceBDNXbxtmcjpTbD6RfEs1XJ62ehp
	eG7rO0x484a/VuWr8uyD9dEMFVmQ+zdPH18EYhEhWbZIqTI50bZvkvG4TEHlKylw7XoMaaO1NGwiL
	PX5asl9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4iqQ-00000006MaE-2nTb;
	Tue, 15 Apr 2025 16:09:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4iOK-00000006HZP-2SNT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 15:40:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2678C4A2F9;
	Tue, 15 Apr 2025 15:40:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09A2AC4CEEB;
	Tue, 15 Apr 2025 15:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744731604;
	bh=7KBpmcvDBu/KzzwX4IoFm1q8sj2SXnAZYc6au3Szlxo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ib/1seQyBnL2lBlJq/wLpmIomb86PnfCSgDHWETSzyCFBuhBsvsETHcz3oOgavwgJ
	 1lUbsKbj5hipvX5b63bclfP3UcSruBOMiVIANaOcJeQtly43wUYehAWMHcAoFk5oKR
	 7UweC9mSmF1tp/++Xs+3HZoQPEQVkZwemhAJVAsPSvSfGqCR1OHTrlS+PAeao0+UDo
	 lFgTCdaksFBA2pW5GYxjU4W+pSFvb1I3czQQ9eEsf/I1Tq+0/ZlqEIB+A/S2iEs2ub
	 RFdJubthdtadfLdV4Y0HzX1mA/sGN2RmSFc6l2Pw3plhqteprwvqD+ZZ/HzzNjfver
	 ZW9z9fNT1n24g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BF53822D55;
	Tue, 15 Apr 2025 15:40:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 net-next 0/4] net: stmmac: anarion: cleanups
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174473164174.2680773.17904225005838619235.git-patchwork-notify@kernel.org>
Date: Tue, 15 Apr 2025 15:40:41 +0000
References: <Z_zP9BvZlqeq3Ssl@shell.armlinux.org.uk>
In-Reply-To: <Z_zP9BvZlqeq3Ssl@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_084004_640729_AF0EA5CD 
X-CRM114-Status: GOOD (  10.71  )
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
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 14 Apr 2025 10:05:56 +0100 you wrote:
> A series of cleanups to the anarion glue driver.
> 
> Clean up anarion_config_dt() error handling, printing a human readable
> error rather than the numeric errno, and use ERR_CAST().
> 
> Using a switch statement with incorrect "fallthrough;" for RGMII vs
> non-RGMII is unnecessary when we have phy_interface_mode_is_rgmii().
> Convert to use the helper.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/4] net: stmmac: anarion: clean up anarion_config_dt() error handling
    https://git.kernel.org/netdev/net-next/c/c30a45a7e072
  - [net-next,v2,2/4] net: stmmac: anarion: clean up interface parsing
    https://git.kernel.org/netdev/net-next/c/a55ec9c811aa
  - [net-next,v2,3/4] net: stmmac: anarion: use stmmac_pltfr_probe()
    https://git.kernel.org/netdev/net-next/c/5956527e26ff
  - [net-next,v2,4/4] net: stmmac: anarion: use devm_stmmac_pltfr_probe()
    https://git.kernel.org/netdev/net-next/c/a1afabef915c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



