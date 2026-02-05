Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7112ECD993
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 17:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7xI8SFJHpey4TdHsrtO3s1OYVeR4rk6YLvO0+Hbg4Go=; b=FH0TWY3QvNdSafMhiI6XHcnGmj
	M0XxH+NfKy6bsTeYATI+HxGaSsDBs7a1nIuZgQ2q33els0RSNW/XuAF8E+DPjtnZ5x9WxqMsuXjZ2
	vWr4EeiUeuXVB65JGKczjFIumfO6JeqcnjD9h0jD4YaFcmvHGfJ9VCRzuaflhEk+d6JSKlS3zwtU6
	0wxO1+clndlCk0xdjrICStSBBCc8Ibfh0vLUMZLOxbKycBAI1Lx83ecTwkEtEL+HGSR6LqoqqILER
	bEnixnBfGC10ae3La/G9OweyicPIHtMiDs6N/nn4npTdy0UDpITxXULxx7wJeNBeNZjkt7kbkrYmA
	Ho2bJb4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo3L1-0000000AJJF-0q7w;
	Thu, 05 Feb 2026 17:40:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo3Kz-0000000AJIj-1xUM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 17:40:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AA4BF4406A;
	Thu,  5 Feb 2026 17:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86D56C116D0;
	Thu,  5 Feb 2026 17:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770313216;
	bh=PlcHdDqlGOyoVV/PwNUW7cRCJ2IJFzAj92C8MJ6HqrA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NhIK2MM/FKJsRSf1wVPRCASRwziq9qpHvgaRa7SmsXH9VjtuwPwt5gUlV5TUXm+Xz
	 XkslV/OC7bOdgcdu5XnNDhLnN1zusH261fVj9jivft7BFPwHw6GAvRmxnBvZiCMWoS
	 +/r90Q6CoUCXAHM5APn68uTzZC+BlE5J4QEbtmpGPfmMrK6S6wAisEY7FvbwIV+KBa
	 8CHtvOKErI+swfHIpywk0Bvau1Y+/T8PZDUIHwJ/yMGWd9iJL8ngU/hWcuerhaMG1y
	 IhjbkBAqVmxF5rw/5ZgB8J6SzFNguadKPF/9EnsBxOldLurmdbxMCAQ8Ip9SCFb4lq
	 Oi5ocOrUzolNw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8524B3808200;
	Thu,  5 Feb 2026 17:40:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: imx: fix iMX93 register definitions
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177031321407.505259.5073683709420571661.git-patchwork-notify@kernel.org>
Date: Thu, 05 Feb 2026 17:40:14 +0000
References: <E1vnaGl-00000007i9f-0ZMw@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vnaGl-00000007i9f-0ZMw@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, imx@lists.linux.dev,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 pabeni@redhat.com, kernel@pengutronix.de, s.hauer@pengutronix.de,
 shawnguo@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_094017_531089_D5C424E5 
X-CRM114-Status: GOOD (  10.28  )
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

On Wed, 04 Feb 2026 10:37:59 +0000 you wrote:
> When looking at the iMX93 documentation, the definitions in the driver
> do not correspond with the documentation, which makes the driver
> confusing.
> 
> The driver, for example, re-uses a definition for bit 0 for two
> different registers, where this bit have completely different purposes.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: imx: fix iMX93 register definitions
    https://git.kernel.org/netdev/net-next/c/7e7fcfb0798a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



