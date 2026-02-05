Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C44DDEA7969
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 05:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jr4joJG0KFRqL1+/AqIPqgBDpU7YvZW4zblEW74fOBM=; b=KJleiqkmym1Y3eHH+btP2QeCGD
	4Xp/e11cZ8s+oR8VVEwcpjXNlEYpCA34wfRle8vfKo5B7wHGwHJgfFTqEzJ+li8ia5oPYAzLu6x+K
	IZ7J9qyCisivb2tiASaS3nE6DXTVoc2Z93Hyqcb0HrfqJoe/xknnkyqjOGY/588YBM5MS5Bss32xa
	zw3cOLwP8w9COpoUSjvS/SuFdHaAoDIny/QEB+O0BezDCIPNDO4uKVBkN1a2xN22mZMdp4jHEFFqD
	ELHUrBjVIGnq3YFBGgQQZNxfKowT/ZM1mK6EvEULTP2VUWRFG9jkKAILvqlAoN+qMsS6G/H07PRjj
	Sx0MonMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnrTl-00000009QpU-17Se;
	Thu, 05 Feb 2026 05:00:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnrTh-00000009Qos-30RE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 05:00:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ECE9B44487;
	Thu,  5 Feb 2026 05:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAE6AC4CEF7;
	Thu,  5 Feb 2026 05:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770267627;
	bh=Ugwf7nuySvJF0pm1EZ6sYChpkqrG6unVjUpZaqu1rqk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TJgo7JQx+lazQiQ1XhvOHdzF8+jsz824b6KYy2ao9gY9WRIG3OIcXz9/vE2oFX+Ju
	 fyw1TcMkhjKVnLNdMv0dCAJoXbgmjscU52Ke/ws/ETVtowrAP8gu/6c3C9tjHGb32B
	 mKyfYmKjZ1n6Nyn4T1042T+6cOUlp8OjgHvTUUDtCEAql5jioCiDNN9pdU2FJsTzSW
	 hymWQurh+xvwATFyG3R2lTy8sky0Lf07FQuQFgoMIAioLBb437t8CwUNiofuerzRIO
	 m1O8nODDuJ/+Ycv8Gas1GhTNjmzmOFAwI137AB6EYj1eNbxiraQyOGbUaWYDmVzKG3
	 MG7gD5t3I3XEQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0B3143808200;
	Thu,  5 Feb 2026 05:00:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/4] net: stmmac: fix serdes power methods
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177026762582.167759.9447025168347496232.git-patchwork-notify@kernel.org>
Date: Thu, 05 Feb 2026 05:00:25 +0000
References: <aYHHWm5UkD1JVa7D@shell.armlinux.org.uk>
In-Reply-To: <aYHHWm5UkD1JVa7D@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mohd.anwar@oss.qualcomm.com,
 netdev@vger.kernel.org, pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_210029_779831_35F1EDE3 
X-CRM114-Status: GOOD (  10.15  )
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

On Tue, 3 Feb 2026 10:00:58 +0000 you wrote:
> The stmmac serdes powerup/powerdown methods are not guaranteed to be
> called in a balancing fashion, but these are used to call the generic
> PHY subsystem's phy_power_up() and phy_power_down() methods which do
> require balanced calls.
> 
> This series addresses this by making the stmmac serdes methods balanced.
> 
> [...]

Here is the summary with links:
  - [net-next,1/4] net: stmmac: add wrappers for serdes_power[up|down]() methods
    https://git.kernel.org/netdev/net-next/c/3302126a9b2b
  - [net-next,2/4] net: stmmac: add state tracking for legacy serdes power state
    https://git.kernel.org/netdev/net-next/c/9bfcf5460b70
  - [net-next,3/4] net: stmmac: add missing serdes power down in error paths
    https://git.kernel.org/netdev/net-next/c/3019a1333e66
  - [net-next,4/4] net: stmmac: move serdes power methods to stmmac_[open|release]()
    https://git.kernel.org/netdev/net-next/c/61aaa6253714

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



