Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EBFC02196
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 11:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q2nD6qQg4OuL7f0lF9pPo8chqQJ34mDBlCtwTI/DFmc=; b=cxaLAqxsHNl00iwpaZOnbluvYY
	+4qra1KlavU1MzbDsG6Ooc1iPbUQ7I+J635oLTACSH8y5M7MHnu3k3IvzJnlSZvOTy81C0OjWzpdX
	sSKoOG5tq/gkEHczlU2YdgV3/3eBB7i62VVVE8dz1mHLRL9DkHx+oCegPVjZbSoGX1Pt+NhyqWBWZ
	rNOznoYwYC2Xdf5ReXU8ldGl1+WVzaolsTkylryMM+tnAPO8iB89cpl5WYvUXOVdJRdctapi/ayHq
	XCVUVOfcoHH+XdDF6C2XgLfNHEp8+g2QniY2gvvoV2a5HU7fSdUaOrZwjmCOomWgb+LkA9cdjEis9
	SKef7JUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg0BW-000000069hF-3mka;
	Thu, 06 Feb 2025 11:36:42 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzcE-000000062ps-2s9v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 11:00:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B039EA4410A;
	Thu,  6 Feb 2025 10:58:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 577F2C4CEDD;
	Thu,  6 Feb 2025 11:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738839613;
	bh=lpTq10HbuJat5mBzaHY7lLZhSBugc0nzpDwYi/R8+iQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ax4G5C+hTI0afgJ6/cr2y/a4AUwUJ4g+kNwm8Dsa3XpeD9nt/pgkpsTVS3tRZlbwf
	 8VLnoip3vbmsLgZWgteQ5HZtN4FHNanLP0WNF1N/bomBqY+NrqtQalLYRQdypUUWuG
	 gpV3om44hnB8MaDMGeM+NvKoJovBoZQ2Av9qZiNPWNvAcnJI3ujRjAJL2C/bnmithC
	 d966pUTv+lvT/VRHvDDvPjMp6qLkyW36A5lHWrbWiFuU4pCI3LvHUSbx7lyC11DyZm
	 eIHgm7+RchhLBXeviGRS4c0riVHwtI9xwQuIxHnt5ImsKKPCzAH6y0yy9U/vbHSqdp
	 cyOLrWyAJTT2Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33F0F380AAD9;
	Thu,  6 Feb 2025 11:00:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] Revert "net: stmmac: Specify hardware capability value
 when FIFO size isn't specified"
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173883964070.1434316.3945736866379293001.git-patchwork-notify@kernel.org>
Date: Thu, 06 Feb 2025 11:00:40 +0000
References: <E1tfeyR-003YGJ-Gb@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1tfeyR-003YGJ-Gb@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_030014_793911_51D8C6DE 
X-CRM114-Status: GOOD (  10.74  )
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
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 05 Feb 2025 12:57:47 +0000 you wrote:
> This reverts commit 8865d22656b4, which caused breakage for platforms
> which are not using xgmac2 or gmac4. Only these two cores have the
> capability of providing the FIFO sizes from hardware capability fields
> (which are provided in priv->dma_cap.[tr]x_fifo_size.)
> 
> All other cores can not, which results in these two fields containing
> zero. We also have platforms that do not provide a value in
> priv->plat->[tr]x_fifo_size, resulting in these also being zero.
> 
> [...]

Here is the summary with links:
  - [net] Revert "net: stmmac: Specify hardware capability value when FIFO size isn't specified"
    https://git.kernel.org/netdev/net/c/2a64c96356c8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



