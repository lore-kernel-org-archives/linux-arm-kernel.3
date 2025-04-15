Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62957C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 16:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8SvWX1xmEj+Zt9VVtCq3ghZlIn8OMH5akOB0tZlK7D4=; b=G1ISmj1IkMewpfa3XemfJaAmzF
	ouPGkon3ZrUM+qpCpONvGkRRgdHeUBK3ubjVVFlZC8TBckLw/O1POsHL11LXONgicWqv1hV3p3z/F
	z35NZO/U2lNbxzHEIQM1ZzTltGY8L96h93N/Na/DYBW73tChqNXY5BHdQc4YNggpbTbvFvXXVXVqb
	gUWPM5ceMIxEHIpSn70iyzRHLOzZwr6+xLI7vJlPF/9LMglrlpbUAsjRrOUMyTIjYqBSXDIMBESNK
	fbQu4S4DVSXfyj0XB1KfmJV2+tzNrTJxarnf38/1BOkfJToTeMaXwZADpraYT4HSeDwas/qe5w/6O
	Ylj0BWew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4isE-00000006Mwt-1mIW;
	Tue, 15 Apr 2025 16:10:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4iOL-00000006HZy-3kox
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 15:40:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 996064A347;
	Tue, 15 Apr 2025 15:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C15FC4CEEC;
	Tue, 15 Apr 2025 15:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744731605;
	bh=TTwmd1qwkjcOawvuF4ndw/Outr89qvs8u05lc+zv+W8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=AMeqfwmfD6A9pIDzu3d/lmYs1WsH0T9j6UvqjmHnx4SEQhytxzB6e1QvO8i48Yii3
	 8ElS2c3NgPgVOCI/xqx2lXz54ZLTbfWPTt7s5Bv6Gx+VzvLCdXzhNsobeFoJYcS+zh
	 vz0cyqL8vgBBW32ozO/XKk2sc+VNUVGGqAMFiV6UW/Sj1nU7TeVHHKxv967YysxwCf
	 5ab29NCzuhYCmZ7ZqdvarzZbDAhZMKDQ6zYtryOP7KXoaXaP93OTMlrzLjeWEmZcYd
	 yHQEoJ847f6DKOTWyHGZjpl/CicwY1tn626O4JUIRjVi6ABOyHWSB/dLUmewN23feX
	 kyLrtMUWmxVzQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADF113822D55;
	Tue, 15 Apr 2025 15:40:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/2] net: stmmac: ingenic: cleanups
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174473164325.2680773.1202751718118032665.git-patchwork-notify@kernel.org>
Date: Tue, 15 Apr 2025 15:40:43 +0000
References: <Z_0u9pA0Ziop-BuU@shell.armlinux.org.uk>
In-Reply-To: <Z_0u9pA0Ziop-BuU@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_084005_949672_0836720C 
X-CRM114-Status: UNSURE (   9.31  )
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 14 Apr 2025 16:51:18 +0100 you wrote:
> Hi,
> 
> Another series for another stmmac glue platform.
> 
> Convert Ingenic to use the stmmac platform PM ops and the
> devm_stmmac_pltfr_probe() helper.
> 
> [...]

Here is the summary with links:
  - [net-next,1/2] net: stmmac: ingenic: convert to stmmac_pltfr_pm_ops
    https://git.kernel.org/netdev/net-next/c/debfcb3f5848
  - [net-next,2/2] net: stmmac: ingenic: convert to devm_stmmac_pltfr_probe()
    https://git.kernel.org/netdev/net-next/c/96f8bf85d11a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



