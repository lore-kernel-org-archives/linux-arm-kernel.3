Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1815D6AAF7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 18:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mcz69fr8YiW8vuEp4DdTVkV2dU8Ifm5gTNqijiaxLVs=; b=Rii6aZlDcGmR6SCnA26VyXAdKR
	tPyaBX/kgtAEqAzftKNkkEKSzng6kHld7XwJASUBsCEEzXg2Ro0mUNjP6zei0FwHCkNDiFthm/tPd
	dgB3Qe0hXXkIaGY5/HaJ1r+iOLwyI/Dc6ybY79JAwHRkSm83f/Gve0jiIaAsKCylwaJMEvpbP+rY+
	pgmx+xpCrKrPsK3Yb0kMhk7rJSkky1zVPORYPcRShsBi1yC3saxU3RNHY7/s0o249O1UiEcX15h2L
	lTm78u4ydZpLeuL4Fq6Np0yLNaSNySLYjCV/BdC73kW2Mg9gV4sDSWIwJtTJwsYL9tPUIg9kkaZkQ
	Px0SY8aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8MyA-00000000g9j-2TZn;
	Thu, 02 Apr 2026 18:40:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8My9-00000000g9B-2tlI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 18:40:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1518E60123;
	Thu,  2 Apr 2026 18:40:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAFF6C116C6;
	Thu,  2 Apr 2026 18:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775155240;
	bh=pmcwFe1wHetLptQwyfU3HCeP9GSzNzMSqxhSN5vyyo4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=eg/qIUmHH0zmmJTDhNc6+zkD4z3hZZ/uP9DfdAk1Aq9DtrvXoz4k58M7heedS8qpL
	 eNy71ongaIVLZ+962RRrwgzBeyDovEvg4/yQEYwrKKZmm8qYSWLmwMgqp0CfOWaeP5
	 +Wcrt5lx1ysm/XBhI6xmKizYyezqF7s4skIOFmzbvCu8J6J1rek/5dGoc+Cj23pgLt
	 BIrUbARdMiz3lDwov9b7j6jqarriuniRf7sAlxRSwWdKMUhLlslck0O/kaBVuRsnQj
	 0zM02fBVHjSRozus5bPVaLQVy5fa43wV5PvbH3t57t5kFQVVGGTo68QwqcZufQY/VI
	 cjAGPZsHWI0QQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FF843809A09;
	Thu,  2 Apr 2026 18:40:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 00/14] net: stmmac: TSO fixes/cleanups
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177515522304.572495.5047092891296862297.git-patchwork-notify@kernel.org>
Date: Thu, 02 Apr 2026 18:40:23 +0000
References: <aczHVF04LIGq_lYO@shell.armlinux.org.uk>
In-Reply-To: <aczHVF04LIGq_lYO@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 boon.leong.ong@intel.com, pabeni@redhat.com
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

On Wed, 1 Apr 2026 08:20:52 +0100 you wrote:
> This is a more refined version of the previous patch series fixing
> and cleaning up the TSO code.
> 
> I'm not sure whether "TSO" or "GSO" should be used to describe this
> feature - although it primarily handles TCP, dwmac4 appears to also
> be able to handle UDP.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,01/14] net: stmmac: fix channel TSO enable on resume
    https://git.kernel.org/netdev/net-next/c/989a9c20f63e
  - [net-next,v2,02/14] net: stmmac: fix .ndo_fix_features()
    https://git.kernel.org/netdev/net-next/c/afe840ddf15c
  - [net-next,v2,03/14] net: stmmac: fix TSO support when some channels have TBS available
    https://git.kernel.org/netdev/net-next/c/e32820264c29
  - [net-next,v2,04/14] net: stmmac: add stmmac_tso_header_size()
    https://git.kernel.org/netdev/net-next/c/f799b5dab9c9
  - [net-next,v2,05/14] net: stmmac: add TSO check for header length
    https://git.kernel.org/netdev/net-next/c/6732e474f880
  - [net-next,v2,06/14] net: stmmac: add GSO MSS checks
    https://git.kernel.org/netdev/net-next/c/c05a81cbee87
  - [net-next,v2,07/14] net: stmmac: move TSO VLAN tag insertion to core code
    https://git.kernel.org/netdev/net-next/c/3f6a6eb9ef21
  - [net-next,v2,08/14] net: stmmac: move check for hardware checksum supported
    https://git.kernel.org/netdev/net-next/c/b55dfb173ce8
  - [net-next,v2,09/14] net: stmmac: simplify GSO/TSO test in stmmac_xmit()
    https://git.kernel.org/netdev/net-next/c/2e4082e4b739
  - [net-next,v2,10/14] net: stmmac: split out gso features setup
    https://git.kernel.org/netdev/net-next/c/c04939cb9851
  - [net-next,v2,11/14] net: stmmac: make stmmac_set_gso_features() more readable
    https://git.kernel.org/netdev/net-next/c/6ad004442897
  - [net-next,v2,12/14] net: stmmac: add warning when TSO is requested but unsupported
    https://git.kernel.org/netdev/net-next/c/f8c70ab540c1
  - [net-next,v2,13/14] net: stmmac: check txpbl for TSO
    https://git.kernel.org/netdev/net-next/c/33f5cc83bbbd
  - [net-next,v2,14/14] net: stmmac: move "TSO supported" message to stmmac_set_gso_features()
    https://git.kernel.org/netdev/net-next/c/0f96212a5142

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



