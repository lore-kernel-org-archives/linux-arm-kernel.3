Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A63606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 00:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X6JS5wsW;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=azihWin7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=c4iBQ+UwOFy4X5YPlks+jc2xwGHej55He1MgtpRs7Ko=; b=X6JS5wsWUtkPs7
	K2XAiiq3srC8ZqPfELAgQX2tsZb40s7Yth8oTW9MTzLjcIVWml9+oTZFoxLI5mwcvKcpYaLbEUm2t
	kaUtK7p4f660c2wuBS9XtLYVoerHBTc5awFJd9mxXgIUSsv/5NuBtsDrg+0rbTMFDV1sgZGrVRkUi
	GQY8wVBPZryYRNyfriX1MLHrP6SuyMUKx+hndbjYkmU5Hex3XY/QZW1NInssdErYdVpqAfRVzH+XO
	GymYhTHzdLC+t7m3sM4h2dmuJ21fNKVqA9kmJuDOhqMoCxKdsR8MoHUhHIFxkfUfctGMqn4siTBaD
	xK5suu54gx3pfFMTjLnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMEBh-000000086Nc-0Nkf;
	Thu, 29 Oct 2026 00:40:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMEBf-000000086N1-0WnP;
	Thu, 29 Oct 2026 00:40:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D7BDD600DA;
	Thu, 29 Oct 2026 00:40:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ACD41F01825;
	Thu, 29 Oct 2026 00:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793234409;
	bh=c4iBQ+UwOFy4X5YPlks+jc2xwGHej55He1MgtpRs7Ko=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=azihWin7Fnf/E+YT9dK3r8KdLbROgbTTQp0qkk0Eie87I4Q+6ux586RFYKY9Ge/W9
	 Wi2xxteAwnF4wC/oT9FGHlCH+Cce/lH7ovEMDBKI1RKqRO4SN7QoWBlQpNR5s/YpYC
	 pSS63mTXa8/g+gqoxuLcxd9/QSgh5LB1S+qFrDRymrNwZPdUt8DaauOZpWf5dS/mCf
	 6VhcvGTeiPgVd0LPcHwccRafm6q2vy11vaWm8lwIFO831UHi52eo9zcw/sLT5qhsis
	 GeA54/IP0mHQyb5n3WOm4dCHLroEBB17XTrmznYkCFV2oTXhJ6Bf3W8Bt7rjXRElha
	 9cn795m3ZniGw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 814FE3AAFC4C;
	Thu, 29 Oct 2026 00:40:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2 0/4] net: pcs: xpcs: fix runtime PM and clock
 lifecycle
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179323440806.1500896.10740339691705828424.git-patchwork-notify@kernel.org>
Date: Thu, 29 Oct 2026 00:40:08 +0000
References: <20261023075214.1793922-2-coiaprant@gmail.com>
In-Reply-To: <20261023075214.1793922-2-coiaprant@gmail.com>
To: Coia Prant <coiaprant@gmail.com>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, edumazet@kernel.org,
 heiko@sntech.de, netdev@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 23 Oct 2026 15:52:11 +0800 you wrote:
> This series fixes the runtime PM and CSR clock lifecycle in the DW XPCS
> platform driver, a misleading error message in the Rockchip glue driver,
> and the MAINTAINERS coverage for the platform driver and its binding.
> 
> The issue was found while using pcs-xpcs-plat.c as a reference for the
> Rockchip XPCS glue driver (pcs-xpcs-rk.c). On Rockchip the CSR clock
> (PCLK_XPCS) is required for register access, which exposed two problems
> in the generic platform driver:
> 
> [...]

Here is the summary with links:
  - [net,v2,1/4] net: pcs: xpcs-plat: fix runtime PM initialization
    https://git.kernel.org/netdev/net/c/49d8bbc21244
  - [net,v2,2/4] net: pcs: xpcs-plat: fix clock lifecycle for !CONFIG_PM builds
    https://git.kernel.org/netdev/net/c/eea365ed283c
  - [net,v2,3/4] net: pcs: xpcs-rk: fix cleanup action error message
    https://git.kernel.org/netdev/net/c/e7cccfde6136
  - [net,v2,4/4] MAINTAINERS: list DW XPCS platform driver and binding under XPCS entry
    https://git.kernel.org/netdev/net/c/87b88b658b9b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



