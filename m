Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C8E8C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 01:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D1PmMsNXCgWxHKbBTBoMMfqQdfRp/EhkEhppZ2BFbTA=; b=InwTr2QZw/D2mwtgkNwJFuNUC0
	CYU1Vao2ZGeKTK82caqyeUse9JYhTrExrbUaeA50z+EYZEq1M3IPB+yJGyTO0XGKa1hjkfgIXv/rd
	pG3e0WnrkeSDcyCUxV6D0IEc0/hpKzFMzw3o9wJweix0I6oRG5TJrpkXRHoPaf8rNRRvIn787ZLTL
	/TKvoIQsa7Y1/apKGVnAIEv54f4oZBQgwHKnfzUR6NkSI42Mo9r1HBHO3eHZg0dGOXj8A2boijDrS
	atvwChKSV8xKR1mPdxXKHqx+gAs0AK6PY8CxHbL7kWMKPJUXRLAShX9J88oRc/i1N09YsH9ayG44g
	qLuLINOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYbMZ-0000000GnfY-1HuY;
	Fri, 17 Jan 2025 01:41:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYbLI-0000000GnUM-1dLz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 01:40:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A2C2C5C60BB;
	Fri, 17 Jan 2025 01:39:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 079B4C4CED6;
	Fri, 17 Jan 2025 01:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737078010;
	bh=nUDkxS+SGF5HsEiC9K3lpphe6D0MmMbjsns/C57QoOA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=t4Lwg1q08IwDzcCM3K+0chPwYs1wTXYjeypEtV2YcfEhdETnhRlSAmurTALOmHnBS
	 R77blJDNzrHegRhLVCCDuoXUqeAq2csQt0xx/kEj5Ovn7RALPe6M5NLpZqUBdgXr9G
	 lapL2Vb6+Zw28lAGQxO60RFgsPhQ/a6d1haPXSxWiuBoyVjRkMA6rDMcC6qOADFbUF
	 19usKybJhWNMosmDHStEWxsrWO4j5nVS/ueGSaogdMOXdquT/BHnsm6qLPYalct3UQ
	 i0Dz4bhHKy6UZpJAvVPPRgNrCoWLZ3cYTRcX3BzBXe//jBSfdVxm3RjyYAKjvYqxIH
	 HOK00wjfH06Eg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E66380AA63;
	Fri, 17 Jan 2025 01:40:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/9] net: add phylink managed EEE support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173707803298.1652211.8068749856450177077.git-patchwork-notify@kernel.org>
Date: Fri, 17 Jan 2025 01:40:32 +0000
References: <Z4gdtOaGsBhQCZXn@shell.armlinux.org.uk>
In-Reply-To: <Z4gdtOaGsBhQCZXn@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, bryan.whitehead@microchip.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, marcin.s.wojtas@gmail.com,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, pabeni@redhat.com,
 UNGLinuxDriver@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_174012_474573_E7286DFB 
X-CRM114-Status: GOOD (  10.40  )
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

On Wed, 15 Jan 2025 20:42:28 +0000 you wrote:
> Hi,
> 
> Adding managed EEE support to phylink has been on the cards ever since
> the idea in phylib was mooted. This overly large series attempts to do
> so. I've included all the patches as it's important to get the driver
> patches out there.
> 
> [...]

Here is the summary with links:
  - [net-next,1/9] net: mdio: add definition for clock stop capable bit
    https://git.kernel.org/netdev/net-next/c/3ba0262a8fed
  - [net-next,2/9] net: phy: add support for querying PHY clock stop capability
    https://git.kernel.org/netdev/net-next/c/a00e0d34c036
  - [net-next,3/9] net: phylink: add phylink_link_is_up() helper
    https://git.kernel.org/netdev/net-next/c/a17ceec62f81
  - [net-next,4/9] net: phylink: add EEE management
    https://git.kernel.org/netdev/net-next/c/03abf2a7c654
  - [net-next,5/9] net: mvneta: convert to phylink EEE implementation
    https://git.kernel.org/netdev/net-next/c/ac79927dc84f
  - [net-next,6/9] net: mvpp2: add EEE implementation
    https://git.kernel.org/netdev/net-next/c/b53b14786ed8
  - [net-next,7/9] net: lan743x: use netdev in lan743x_phylink_mac_link_down()
    https://git.kernel.org/netdev/net-next/c/a66447966f03
  - [net-next,8/9] net: lan743x: convert to phylink managed EEE
    https://git.kernel.org/netdev/net-next/c/bd691d5ca918
  - [net-next,9/9] net: stmmac: convert to phylink managed EEE support
    https://git.kernel.org/netdev/net-next/c/4218647d4556

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



