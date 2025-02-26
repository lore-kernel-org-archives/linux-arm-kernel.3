Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D21FC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 03:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wT6mjGF6Jzl9qbo1sP+eO22G+rC4dD5n7mC6FAQO7dw=; b=1KLhAN48lCroSr6jqER8glSWZY
	tLLqtDqbvAwN52EjsDWHIVQzJ71fplnoBBKv74XjpRvUZDXCKQMLMwOhVwhuTu+YNhq8dQiJ3312f
	zcU9Unnz7Y1/Pv/zKs68/66cGPV2lwEkC7NlpVCppt0ZiDV6ZBA9TOsauQyrz8FuWIBlg5ZoEbfM3
	3btXRBUfxacatruMLhAmLO0ZgHjUFvgzWHKH4JBokNr7WeRnAkTjfLhOgHMN0Ruh/1G7JtGPrsA+K
	oeTPjKrRy4QnanZdHz1ltF2WTEeATbrCd+OlDN5FthAYJxCpUCiC9oUN1GH3MNv/MVs50XMJHDaMB
	DpPaNfDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn7pu-00000002GY1-1xeu;
	Wed, 26 Feb 2025 03:11:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn7oO-00000002GHm-29q0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 03:10:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 96F8361215;
	Wed, 26 Feb 2025 03:10:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B799DC4CED6;
	Wed, 26 Feb 2025 03:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740539415;
	bh=EaM8nAcknuTEqgSWtgRX+O1SPtlqPr1RuKMMFdHdR3c=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ENi69153t9+nKAboDE1j2k8m0xn5XVkoy5WArA25idCLXE2KRrnFftC1EokGlxaGZ
	 HhjBkzsCoFgm5soPcgidtOi1reK+q/VjngzTolfKYOhz+3UW+e6XTMWNjqrH2/bTWg
	 KASP/xdUFXcC8rsghNLTUEux9I2YsUXC4ZTDzIhKpUAoSb9Z78kGapkU6IECtml4vT
	 LtAx0o0rMDgTNrfKFoqUG1GzqFR3FZMANtDESWNIv9qNchraqzj4T0IowJXlXAOoro
	 umW9L0O2kvaBNRRoHQPAvZ32HOi3YxIYY9jrZxRmF2JBiYMu2zD/oEEKRCqLaXhe7Q
	 oIOfkpy0lf3jQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADC8A380CFDD;
	Wed, 26 Feb 2025 03:10:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 0/2] net: stmmac: dwc-qos: clean up clock
 initialisation
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174053944723.217003.15797703887455778925.git-patchwork-notify@kernel.org>
Date: Wed, 26 Feb 2025 03:10:47 +0000
References: <Z7yj_BZa6yG02KcI@shell.armlinux.org.uk>
In-Reply-To: <Z7yj_BZa6yG02KcI@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
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

On Mon, 24 Feb 2025 16:53:16 +0000 you wrote:
> Hi,
> 
> My single v1 patch has become two patches as a result of the build
> error, as it appears this code uses "data" differently from others.
> v2 still produced build warnings despite local builds being clean,
> so v3 addresses those.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/2] net: stmmac: dwc-qos: name struct plat_stmmacenet_data consistently
    https://git.kernel.org/netdev/net-next/c/cff608268baf
  - [net-next,v3,2/2] net: stmmac: dwc-qos: clean up clock initialisation
    https://git.kernel.org/netdev/net-next/c/196b07ba9104

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



