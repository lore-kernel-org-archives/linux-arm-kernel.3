Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F4D0C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 19:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bWfEZHBrPVgEMS4pcbEBB6VvvkZHbk79FoVzCwVqC+E=; b=zDaZwP1+sFPkGHbqR5ck4w//C6
	04ZWRhuCHQqa7pbfTSyM663FB8Rn4OaibZ3kMtvBKGsy4h9esGp4X4mT3UVkjsDK5dIxpewDTd9GD
	W18AFiGsNPAVVUNDuRJ4Hk/HDvv90yptABCCiQ1b0PQN/vg9fvsP1wyFlSm+R0ye5jYzIFW9yqUgn
	2P11wYF0kJWA27a9zOGpR6Q3HcTDlsw0r+utDMskWqGNDC5NFEEP5XJvVh3eqozvs/virraoR6zAm
	dEzoSfCG5OThRusJihrK1yEqvcgvo2/R5WcYkYJqgBVfoNal7gEF40ZqWazlGgVhnb+1PKMLleucO
	OVY2YAzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9qMw-0000000AdRm-3igy;
	Tue, 29 Apr 2025 19:11:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9qL2-0000000AdAq-14FH;
	Tue, 29 Apr 2025 19:09:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 252E568469;
	Tue, 29 Apr 2025 19:09:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C66BC4CEE3;
	Tue, 29 Apr 2025 19:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745953791;
	bh=Fj8Qwh7Oglt89U7CUjfhi1ViJF/tP8Mruv6gVmeBzPg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=lryuYrrmUsoDN64rRhIQZsAD/VNGrOdczSxzGkxhMeKAlUiAGK8QTadyyTpuXb/TV
	 tfHZpwOJEobn/m2qv16SIwL3YLt5dVEkh7eCUBKl0eACtBxTM1KsaYTrTwx81Q7ktA
	 9IpA6PZfZ6LenIINM7J19yOwCyKMQDXiGRUfYOZ8ZKZEufpr0yCBke2XkxMt5omi8I
	 vATm2tXosgQ2gAG2HiRnmitKo/xOPHDCreA9Rtk93suM/W44p626R/NgXbqswfftZC
	 hPu8bV+Wy9dseac/ADH9Q8cFMzjCT7YkGAdtuqg0GAhxZYd6MBvEtbaOiSw+AmMvej
	 xriR+W6ABymlA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C623822D4C;
	Tue, 29 Apr 2025 19:10:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] net: mdio: mux-meson-gxl: set reversed bit when using
 internal phy
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174595383001.1770515.9085640338016632104.git-patchwork-notify@kernel.org>
Date: Tue, 29 Apr 2025 19:10:30 +0000
References: <20250425192009.1439508-1-da@libre.computer>
In-Reply-To: <20250425192009.1439508-1-da@libre.computer>
To: Da Xue <da@libre.computer>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, christianshewitt@gmail.com,
 stable@vger.kernel.org
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 25 Apr 2025 15:20:09 -0400 you wrote:
> This bit is necessary to receive packets from the internal PHY.
> Without this bit set, no activity occurs on the interface.
> 
> Normally u-boot sets this bit, but if u-boot is compiled without
> net support, the interface will be up but without any activity.
> 
> The vendor SDK sets this bit along with the PHY_ID bits.
> 
> [...]

Here is the summary with links:
  - [v3] net: mdio: mux-meson-gxl: set reversed bit when using internal phy
    https://git.kernel.org/netdev/net/c/b23285e93bef

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



