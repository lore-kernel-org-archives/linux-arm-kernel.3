Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C72FC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 01:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5PCv+zzqyt7JPtLj7/mHqgbjtjsnZValcQyNR3dvTHk=; b=tbhuedrfPwhk+zlCqET4fnz/Tp
	hLheHxxeAFelXjn6yrG0RqS9foyyz/jAllTYR5OiGQfXUMuTFympHHWj9ErEYbYNnrO+Qa/SnmvQx
	77rI4bVedjO44chVSCXZ1Jq1r+joXWPJGs0QXwOfkpQhLD32tF9GxaNP0rFTcAZAaNe6vSIKWWGaK
	ETwFkopbtGCHXdI0yWeoAvcvGnxzWS09pWGLD1YoJvQuYpHGD4GatVVn6CtE/jgjPouTMnLVzFqUX
	9eJ+WujlM3J+LYaWQoDJLq1HS4OvwcGGzjdFhj2xI2JxU55/pYijnDeq6LERdz/ZlfgV+/4wSP/U9
	t2uYfrxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTscH-00000004Ncz-1zwq;
	Tue, 24 Jun 2025 01:38:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTnKO-00000003tG9-0MBV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 19:59:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5375043A9B;
	Mon, 23 Jun 2025 19:59:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29058C4CEEA;
	Mon, 23 Jun 2025 19:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750708779;
	bh=VZ3m66PTUnHfamACT4jCJE5I9AkGJuqWAgQW73lk4PU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DMfBvUyZ1gJ59ihAbsJRkaCldcfa4DgHj1AKsy7+7ecI9YWabflDOktQ7N8EtaPH6
	 RFzjP6xo6Hda+ltWdQT7NmjK4n5H7zmqcncQk/Xbe2tJ2EpfSBnsPL3V+1JL8AbEm5
	 Xlhz4sjTR6jewDNCHL2Sf1GhWY1vGzMJTaFVdQSsCqSJbrTboh4erdZTZahlJZ2Fzk
	 SGBRQL/3BGyRwuI+YZyS9RcaL4lFVcaoNNSDdwnIFvVN7G6+UYgm0qzRz7YAXX67+o
	 LATSXASzIQp4kzOki2zTE+OuE9oCIKttZpT0wEG6sQAa5hiv9f6jar3DDQ70HMOfpu
	 44g381Kw0BK1A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7336C38111DD;
	Mon, 23 Jun 2025 20:00:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: lpc18xx: use
 plat_dat->phy_interface
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175070880626.3280891.5905917830342989849.git-patchwork-notify@kernel.org>
Date: Mon, 23 Jun 2025 20:00:06 +0000
References: <E1uSBri-004fL5-FI@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1uSBri-004fL5-FI@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com, vz@mleia.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_125940_148250_F3548DBE 
X-CRM114-Status: GOOD (  10.86  )
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

On Thu, 19 Jun 2025 10:47:26 +0100 you wrote:
> lpc18xx uses plat_dat->mac_interface, despite wanting to validate the
> PHY interface. Checking the DT files (arch/arm/boot/dts/nxp/lpc/), none
> of them specify mac-mode which means mac_interface and phy_interface
> will be identical.
> 
> mac_interface is only used when there is some kind of MII converter
> between the DesignWare MAC and PHY, and describes the interface mode
> that the DW MAC needs to use, whereas phy_interface describes the
> interface mode that the PHY uses.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: lpc18xx: use plat_dat->phy_interface
    https://git.kernel.org/netdev/net-next/c/9f22c3ddb8cf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



