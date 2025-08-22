Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A79DCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 06:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aYO2fVq9+M5LMxT/LaAcCCTSEhmxWpnVJ/4nVCvDTrM=; b=jpZuZ6WAFaPw+QZegBrrJEfi+z
	soZbLckR+A484f03v3jTjdBrCvWs2BJxtfv05xqsMTbD9bT54PTnrikodY7Rhy8wsA5bXtxhZgPhB
	sC6ITc3//fuCoEfwbZenc0oSjJ469l5LIFfN9u5Vijt/0UzA78AUc4DW71XfRysMxPjZ9aISfmIjT
	1T5uXzm2LgVHwBtyFrKLyPeLQLN+ueXzcFR/QBERpYigj3MFdkFVb29gVS8zjtWG/irucMI3Sl4eZ
	P3MBhxAtJfZ1LzFYR99SHpN1kLZPQIKeZLz5oaTMDsm484+ifDX6DG+wCFtVblPPejrzZdWCzqW2G
	+FichFEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upKs8-00000001e3M-3qWb;
	Fri, 22 Aug 2025 06:03:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFfi-000000012sx-1SY0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 00:30:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E964C41A0F;
	Fri, 22 Aug 2025 00:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C636BC4CEED;
	Fri, 22 Aug 2025 00:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755822621;
	bh=7BDziKGy0nYnSWBVNd9Y5a/fWiagJtMenNbERVY62z4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=r4VCFcVUOqFKQasKbMSVD1e7GJJ7Yq94Zh7XZXHQEfnBc460BPXaFvSUBnvI+mQHW
	 LMF4ggA8+sTKBOqBwJudBQXKKupmlUClsHOwmTVXuyw8nENcN/92rfGYytfIjkOtwW
	 ChxO81ClVPUvous5/b7+/yb3PnOW5h/v0WIswBFcsGhOxqWoQwk2AzRKONdOPHXisW
	 USggvjcyYHZpTUvC8jtA0Thv3GEnb+/0Dc3rCE2S/emYyzyR+Sum4HaOyYQ3cdiKSH
	 lB5xdqylwz+Gg+LnLkCqfwm+ytgBHwrAV2oILe2Rcp5FleispZDaHBjVnch834IGVF
	 hXg//iKHfAPDA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33CF3383BF68;
	Fri, 22 Aug 2025 00:30:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: fix stmmac_simple_pm_ops build
 errors
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175582263074.1251664.13209370832398636375.git-patchwork-notify@kernel.org>
Date: Fri, 22 Aug 2025 00:30:30 +0000
References: <E1uojpo-00BMoL-4W@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1uojpo-00BMoL-4W@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_173022_414532_8BB74FA7 
X-CRM114-Status: GOOD (  11.08  )
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

On Wed, 20 Aug 2025 15:30:40 +0100 you wrote:
> The kernel test robot reports that various drivers have an undefined
> reference to stmmac_simple_pm_ops. This is caused by
> EXPORT_SYMBOL_GPL_SIMPLE_DEV_PM_OPS() defining the struct as static
> and omitting the export when CONFIG_PM=n, unlike DEFINE_SIMPLE_PM_OPS()
> which still defines the struct non-static.
> 
> Switch to using DEFINE_SIMPLE_PM_OPS() + EXPORT_SYMBOL_GPL(), which
> means we always define stmmac_simple_pm_ops, and it will always be
> visible for dwmac-* to reference whether modular or built-in.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: fix stmmac_simple_pm_ops build errors
    https://git.kernel.org/netdev/net-next/c/dac72136aa6b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



