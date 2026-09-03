Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7BBC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 09:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/UG7zMVZVaj57JKaT/NgSm3yz88db2K0TI/06GsPpNc=; b=SleUCTD+czM4LfL+NyF1z+6r8t
	Hl6y1v7Mdz2zT54/OuDiUbwGul0ci+GEobUznHg4+sjEcF1t82P4+SA1AaAfNhGokRGKMCkO+tpJd
	5WBE147VKBP2hy50JQn6RidLXUZA9rHalUET8LOq8hWjqcY5Zy50/O52UtF8n/HG0zQx0ec+nIHw+
	P7VZEGPA+wne2tgK1Mgoe5iX9sThO9B3lgmwIXhkpapigq8Lv46TlysqWIkd4vFuOmBAMhiSR4asJ
	CUgwAQbq8LxOuMnLnUz38NT7zznQyKXbChNyUYw+CFEJavmkGBG2Iqvi17hKsJfWvSsLv8QqSdWuk
	99Q4EqIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23Jl-0000000GsZm-0CJc;
	Thu, 03 Sep 2026 09:01:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23Jk-0000000GsYd-0CJC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 09:01:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CA34742EB7;
	Thu,  3 Sep 2026 09:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB7F91F000E9;
	Thu,  3 Sep 2026 09:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788426067;
	bh=/UG7zMVZVaj57JKaT/NgSm3yz88db2K0TI/06GsPpNc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=A4YDmv6dvoVogcMTXsrbyKW5pUL5wkQ7Mh/n/Kpq3gW2iN11xBWFcLhgFTZXkbj05
	 RAmoL7fZ/nbRUw6CgmlI7z9QUpDBmN3lYMA3YCH/6JaQEdFZ1RPYrYACv6/ntH5ph7
	 arm2nm+OJKhR/tlbPXVrvoZ+a/PVO0kPRtmR5jkbQl64TIGm7j0E0C6QCH4tdVGFf6
	 Czw6Bd0etlvE9tYErEpV6rtmhAnm0mXCOf+bocoOOBDGnXNV6MIvnNubm8G3w3pUoM
	 RFuAlsCeieY6D8os01ZUdn6CnQ9YMDY49y6YO/UO2Ztbp+LVJK7CbCPd1EELPj1Dhp
	 0GqqEqLv52NZg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 62B133811961;
	Thu,  3 Sep 2026 09:00:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/2] net: stmmac: dwmac4: Auto-discover UC filter
 size
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178842600911.3208873.5559894421239346742.git-patchwork-notify@kernel.org>
Date: Thu, 03 Sep 2026 09:00:09 +0000
References: <20260831070121.349778-1-maxime.chevallier@bootlin.com>
In-Reply-To: <20260831070121.349778-1-maxime.chevallier@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: andrew+netdev@lunn.ch, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux@armlinux.org.uk, thomas.petazzoni@bootlin.com,
 alexis.lothore@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
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

On Mon, 31 Aug 2026 09:01:18 +0200 you wrote:
> Following my attempts to get clean ethtool selftests runs on stmmac [1],
> several issues were found with the unicast filtering.
> 
> [1]: https://lore.kernel.org/netdev/20260827134004.45ffb57e@kernel.org/
> 
> This lead to the discovery that on dwmac4 platforms, the unicast filter
> size is always falling back to the default value of 1 entry. On older
> variants, the size comes from devicetree.
> 
> [...]

Here is the summary with links:
  - [net-next,1/2] net: stmmac: dwmac4: Read the UC filter size from hardware capabilities
    https://git.kernel.org/netdev/net-next/c/384ee2379a66
  - [net-next,2/2] net: stmmac: dwmac4: Use the full perfect filter ability for UC filter
    https://git.kernel.org/netdev/net-next/c/6815415d68b9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



