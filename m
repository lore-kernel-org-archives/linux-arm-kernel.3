Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D361F532C3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 00:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W42TGNZXgBzgvvD6V66mPRhj5aNQsES7mK15otvuWnU=; b=rcpWUNN3K86JHQ3tE5LJDwWwN+
	ASIx0/xnGwRtR4GD2RdNti45R9AZz5N6Tkkg27tVfEHE6Yk8ILXhNdNY5zyJtif9yQri/BZlkUpb2
	EUH2rJHT9I40JFapi84LF3Aei1tl1162hNnXp4BBgG3nihlyEgozXW+UjwhmT/fRS8PZPIkXhZKbs
	3gZwQloaPL5tpGjzcE0PFEcKCdFhxBW/eQ0CM1UXnFwQhx94nXvy0/YVGO++UZa311rRHiLyAJCIZ
	I3Q8brDnQWr6u7oqlyH4LeZ2XgO306y1GNa9TIL9EaTSBtF/QEADksdBaWBowsAKLd1PBcrMzaa5S
	ENiDTyOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4poo-00000000FWM-1msL;
	Tue, 24 Mar 2026 00:40:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4pon-00000000FWE-1hyL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 00:40:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6308960120;
	Tue, 24 Mar 2026 00:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16F0AC4CEF7;
	Tue, 24 Mar 2026 00:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774312824;
	bh=btYs4VEc0poy2Koo3Piud4wH+ItfAcitrk7kH+kgg4Q=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=otgPlMp8nLSa9QtK2QV9+4EArr7VD2cGlymo/MAOl9xOxt+d2wFXF6O7E/wlwtLwy
	 /QmeFsU6DH3Fy2GlmcIlH1l3/Y6HFx3dOipUKcI5h0i1cZRxjylLjh9PhXKF04jq3Z
	 xidLVVloQFWBfFTCi7L951RRBgoidIjgr7o8qfaz0oBRcPJUJ66oeVJkhWbFKsDQA3
	 CN8T2IQBLb1t+ofJc5govdyN+23scnt6JYIXcz+aWF6chqMUWaQ2VxVFC7b9iDbd+8
	 ViXMCX+hGRY0fuXizhO0y6GIuZUfHCToZaOwPVwAKoh4suNBFlH/GYSLUmJ2rBeE3r
	 OY4iqA/CaVFbg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CEE93808200;
	Tue, 24 Mar 2026 00:40:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 maybe? 0/5] net: stmmac: improve PCS support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177431281229.391430.10437162930638421849.git-patchwork-notify@kernel.org>
Date: Tue, 24 Mar 2026 00:40:12 +0000
References: <abrNYVfZ1Iwff2EI@shell.armlinux.org.uk>
In-Reply-To: <abrNYVfZ1Iwff2EI@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mohd.anwar@oss.qualcomm.com,
 netdev@vger.kernel.org, pabeni@redhat.com, vkoul@kernel.org
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

On Wed, 18 Mar 2026 16:05:53 +0000 you wrote:
> I am losing track of what version we're at, because each time the
> series is reworked, changing the approach, which changes the
> patches quite a bit, it makes it difficult. We've gone RFC to non-RFC
> back to RFC and then to non-RFC again.
> 
> This series is the next of the three part series sorting out the PCS
> support in stmmac, building on part 2:
> 
> [...]

Here is the summary with links:
  - [net-next,v2,maybe?,1/5] net: stmmac: move default_an_inband to plat_stmmacenet_data
    https://git.kernel.org/netdev/net-next/c/9a475dc71c38
  - [net-next,v2,maybe?,2/5] net: stmmac: add struct stmmac_pcs_info
    https://git.kernel.org/netdev/net-next/c/7d5a2da501e0
  - [net-next,v2,maybe?,3/5] net: stmmac: add support for reading inband SGMII status
    https://git.kernel.org/netdev/net-next/c/083757866735
  - [net-next,v2,maybe?,4/5] net: stmmac: add BASE-X support to integrated PCS
    https://git.kernel.org/netdev/net-next/c/68cff4fff61f
  - [net-next,v2,maybe?,5/5] net: stmmac: use integrated PCS for BASE-X modes
    https://git.kernel.org/netdev/net-next/c/365c62c8b530

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



