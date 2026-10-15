Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FEECCC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 13:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HWTfC5K89lkNZnNgOaqM40wk6WYWlsj4gyMe+x+8pqM=; b=zeBvnI9Feb906MxVznoGald9V4
	2rgf8LAhsdjLjE0kEiV7BqIKE7FhRzjbpF/2brKXSCSvLpRqDpW2uzC0ulhGZHy/Y6oe7/qjq5mOG
	snUzV8AkZ9EBIe0AU4sLeamPLNgOFejwWkeBqv5A+O4kB2yDEAUGLVJ/H9w0c5wSLZedvRjQvRG3n
	rJ+NdKjh0l7jiVQLhpDHJFUuhLOVxhWhj9WD2G5acekDKzBFYpJ+4r+wUgotikSnjMIJbbWm00Gp5
	kA4pAm/tQ5i1bc9gzt3DQkZQ8BsU2IDjXlaQxB3Tvio78TAxhhN5cCYwPArIsLtn+YBJiKU6mzy5j
	TTbxNr8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHL45-00000000Cdq-3oH5;
	Thu, 15 Oct 2026 13:00:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHL44-00000000CdJ-1JfV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 13:00:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 95419601F7;
	Thu, 15 Oct 2026 13:00:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47E871F000C4;
	Thu, 15 Oct 2026 13:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792069207;
	bh=HWTfC5K89lkNZnNgOaqM40wk6WYWlsj4gyMe+x+8pqM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=RumX4an3dTCHK4ViRVTayHHYmg5HJtRca1lrJQj825qt7U67pZT1FVF2jteowr+t8
	 2tC95Crv910KGDMzgmKkHjNh367CJOlHUOrT1jmTzi5yolLtKRPj9gV6Yz4r7l1Vvx
	 afZ2Fk+PlCcLHuTOrq1huWtD2+FbB9BoEw/LPrbM/QJKkueuaGHGYz7xDngZO2Ol8S
	 V0bSkZAEtCVKW6dmv8cU9V43TEzA097Qj47Ow38Cms7FgPBKt/6ebQzAmD3hbzHtl0
	 VvP0NUkvy8j08wtRp50850wnx+l4GiPka3UyMtW6LaA8Hm/VQ1vCF0Do4dUW6uEhb6
	 XIcIQsnB9km6w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A30B392EA77;
	Thu, 15 Oct 2026 13:00:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v4] net: stmmac: dwmac1000: clear the RGMII status
 interrupt
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179206920579.3420246.7646480278225164720.git-patchwork-notify@kernel.org>
Date: Thu, 15 Oct 2026 13:00:05 +0000
References: <20261009201709.1917585-1-iav@iav.lv>
In-Reply-To: <20261009201709.1917585-1-iav@iav.lv>
To: Igor Velkov <iav@iav.lv>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 rmk+kernel@armlinux.org.uk, daniel.machon@microchip.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Fri,  9 Oct 2026 23:17:09 +0300 you wrote:
> Since commit 2e2c878a3141 ("net: stmmac: remove SGMII/RGMII/SMII
> interrupt handling") nothing on the RGMII path reads GMAC_RGSMIIIS, so
> RGSMIIIS stays pending behind GMAC_INT_MASK from the first link change
> on. stmmac_resume() resets the MAC in stmmac_hw_setup(); the reset sets
> GMAC_INT_MASK to 0 until dwmac1000_core_init() writes the mask again,
> and the pending status storms the line:
> 
> [...]

Here is the summary with links:
  - [net,v4] net: stmmac: dwmac1000: clear the RGMII status interrupt
    https://git.kernel.org/netdev/net/c/aa07285705f8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



