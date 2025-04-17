Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6441CC369BD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 01:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K6/YzSGmP1nORzi8Rm5oKh3XxVb1fUILbgmVJg6Jam8=; b=guLixeHHuWlXo3T969efOjuDPt
	zya/a74udsAX27RrySdKwUQ3il/duZ1foT9MC+PrnrZi4Eopn4o71+plpbyl9CQvdUJLzx3uUVxcV
	uRxvA79mJ28by12ev4n4a+1gqXRL6GXby3JSrmUdnQX93//tRRZLv8sEWfVAeyGw3oi49KREV2K06
	YOlwZeM5JE6J5aOPozaDCULv6YcI9gisRSCpMdr3pLvK8DiRkH5BXXHlk+Du7Zni876A0KVC2uTvD
	yeSzjhaIHfVFMErazzvJSGdSy7aqZt4fyu/YR/wcggF7D+EGz1v2S1/mTIcew5wb7Rf5ZPnwSbwsq
	g2jVnWYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ENV-0000000BTSQ-3Kgm;
	Thu, 17 Apr 2025 01:49:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5EEu-0000000BSUJ-1CpL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 01:40:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7946B4A3DA;
	Thu, 17 Apr 2025 01:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 738D0C4CEEA;
	Thu, 17 Apr 2025 01:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744854027;
	bh=nKwR+3jYPBI/0L4UPSEMt8dNksHHNBW6YTloUwWu/5E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=t3VTKc+3MIMpjnSv3Gt3L8oNdhinKffD6WdAgSSrzV9SR/eE/rpF/GK2KIwQp6x/U
	 qHgteXKk8sn4S1259HB/hczQhVWQCLXn2BPOZ/r+opmoUhsfe4rBe792XIX+J7Q2S/
	 cuhUptnMpc65Rb46G68QT6nZ5ZBbUs/k2nybjHt6QuwP/s7FHFpy3chrxxuIMIP6GI
	 fOyKy9janZgxQXiNiz7l1yIz+ly2PBm9Mm2Xz9fxsATmhzkb0MYzSCYL/rSCEki1gL
	 Rd1T411D1kGwTmuuHNRiaVSadN/OT4B0IE7zs+W3elqCHb9ac88Sqn4ANhjJHAPhd4
	 81ucT5tGe1MgQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE3EA3822D5A;
	Thu, 17 Apr 2025 01:41:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: intel: remove unnecessary setting
 max_speed
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174485406520.3559972.9842565280064480120.git-patchwork-notify@kernel.org>
Date: Thu, 17 Apr 2025 01:41:05 +0000
References: <E1u4dIh-000dT5-Kt@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1u4dIh-000dT5-Kt@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_184028_344031_AF955239 
X-CRM114-Status: UNSURE (   8.95  )
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

On Tue, 15 Apr 2025 11:13:55 +0100 you wrote:
> Phylink will already limit the MAC speed according to the interface,
> so if 2500BASE-X is selected, the maximum speed will be 2.5G.
> Similarly, if SGMII is selected, the maximum speed will be 1G.
> It is, therefore, not necessary to set a speed limit. Remove setting
> plat_dat->max_speed from this glue driver.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: intel: remove unnecessary setting max_speed
    https://git.kernel.org/netdev/net-next/c/978d13b26ab3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



