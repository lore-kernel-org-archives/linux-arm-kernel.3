Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35965CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 02:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=65Ps9qXcJmkYN5naDnSeSEAYjvtgLNJPf7+BDIuqQwg=; b=h4RpN4E5vXnpMkxlcaq+crKgfT
	FJL1nnmdRGOrrgEKUxrUwSjpv921Y66iEOm9WMiICl54+bKI1KpcR0BrpLOEql3KH2aMfpAlEzVAV
	T5sGc13CqKE7XlbjUiybt2EdbvqmcATz0DRntHVBPVPKctTnAu5iHDgu7PSHhJRu4vQK/pGRDnP25
	WDJEigkKa3feAIMBlc4lROiL8K85lnJQbPOe+wIA520AMPMHSuyOvaZ/gfv4Y/FeLJ4tCYNZyqD8d
	CsKT2H9mjWw5xsyN2xPnw29zIzWh6Q3EQ8gYiwVnEwJv/WKEVGf+l6ZXl3uU2pj08t8svgiPfghdq
	fgDYoAXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGT8m-0000000CtjO-0KrK;
	Wed, 05 Nov 2025 02:20:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGT8j-0000000Ctim-2Zc6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 02:20:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D8A06432AD;
	Wed,  5 Nov 2025 02:20:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0C8EC116B1;
	Wed,  5 Nov 2025 02:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762309246;
	bh=Zr+j+565XvfLm2SsJQls3yEiyOWPm+Rp4hCYDk/hfMQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TTlt6/mfwNYAeXcYZVsj04yfi3BxoCxKnbDh12OvrwUbwinCSls2Ya7CGR5y1z6wc
	 L33AsUzJEkNoiKSPXmfxh0eFHmzssZI3uMzSr5XgmkP8eAOGyMu5hzJojGJ5i/CTrG
	 LXmAsWHcL2KyCSad6aqSk8gvxKtPYQkNretC3L/J/Osc4Ztpup9Ggqa53ot/5bvnnE
	 Xghw62eAUx2/MuSatdVi/2lTkz6R6UQH3qZxJS8dNtb+Fp2sjB+yloQ0BcteWU0GZE
	 kmuROI8uLR/tuEt+hryeFHMcKPjUpaqhqU07S4zDEEq5bq3bzr57KjGWxltrmqMiuZ
	 fLgyrBpuInHgA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE89380AA57;
	Wed,  5 Nov 2025 02:20:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/4] net: altera-tse: Cleanup init sequence
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176230922050.3062547.8083675540294624198.git-patchwork-notify@kernel.org>
Date: Wed, 05 Nov 2025 02:20:20 +0000
References: <20251103104928.58461-1-maxime.chevallier@bootlin.com>
In-Reply-To: <20251103104928.58461-1-maxime.chevallier@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux@armlinux.org.uk, horms@kernel.org,
 boon.khai.ng@altera.com, alexis.lothore@bootlin.com,
 thomas.petazzoni@bootlin.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_182049_675007_BDA62D78 
X-CRM114-Status: GOOD (  10.70  )
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

On Mon,  3 Nov 2025 11:49:23 +0100 you wrote:
> Hi, this is a V2 for Altera TSE cleanup to make sure everything is
> properly intialized before registering the netdev.
> 
> When Altera TSE was converted to phylink, the PCS and phylink creation
> were added after register_netdev(), which is wrong as this may race
> with .ndo_open() once the netdev is registered.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/4] net: altera-tse: Set platform drvdata before registering netdev
    https://git.kernel.org/netdev/net-next/c/687452051886
  - [net-next,v2,2/4] net: altera-tse: Warn on bad revision at probe time
    https://git.kernel.org/netdev/net-next/c/dd2619d38d7e
  - [net-next,v2,3/4] net: altera-tse: Don't use netdev name for the PCS mdio bus
    https://git.kernel.org/netdev/net-next/c/9350ea63fec6
  - [net-next,v2,4/4] net: altera-tse: Init PCS and phylink before registering netdev
    https://git.kernel.org/netdev/net-next/c/055e554b8fff

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



