Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5BF310706E9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 16:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d+NqtKGJpBPyB269HxSHsnIoiplF0ickkbgOfb6jppw=; b=hDsWGGiBE8Z8Y8ghckkPikU08K
	70ER/pHJbUVuz/gEmb0KGjnfSOrWvvuhdO7jR1yJFuV3VznS1frmGHpsspOXTtrVGxBKhzLRcoJAm
	38g2r2C4ikf3of3VbYwjsxF16Sg/XN+Sv1Mn6sQV9YSoB1w96me1/yE88rmTvOrkbgrAJH/0dmXoc
	Z5IX2K9WEt6KiurSX9ztWG5RCtwIdgLa/D3OI5FKlqfAHP3bGgAYa1yCjRI9NivLMyvWreKfquXc9
	HISRs1dE1yPH1rJI2BbCTkogYOffjFR28IiD9WwbrbVSkgolbq5+Twit5y5gwOxZFasLzGVB+tv0j
	dgY1UEdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1SBu-000000020Pj-0LeC;
	Sat, 14 Mar 2026 16:50:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1SBs-000000020Pd-3uHe
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 16:50:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E6F9D600CB;
	Sat, 14 Mar 2026 16:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97B02C116C6;
	Sat, 14 Mar 2026 16:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773507015;
	bh=C3bv/cpFRHoc6ucznQhWA3TBbqy2kVsBUcYIx9yO+V8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=EPrUC2Fmi/yncgZXB4Cv7fgSekMsKgengVm2R41RpxZrFeP+A6WzSYXwevf4tijNg
	 83I2iER0xLy/9DKO7vTbF9BmpXSG8jquVRlSGDopF0vVYz0Sa3st95BOC2nfL956Hv
	 YlupVu9V2NSTz0m/sB+6zwsqZ8S2HQiCoXsVatY1BT9ohNQ4hV1KkVrafm5ssuyZcv
	 DKDtXhWgkNfRzwh1fYz2J/dXWIL1JObp0TXmPSM65/qWCaQYsh8DvltEwUOn0CG+6n
	 A1fQsK7LRtCTAQZffBQ3QX9ydCzVS6aUoNM666jkVx5qO3V52IbCcc8qLh+nFuKYrI
	 lLuNA+h9xaLiw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02F523808200;
	Sat, 14 Mar 2026 16:50:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: avoid passing pci_dev
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177350700978.1730865.6008377263416026243.git-patchwork-notify@kernel.org>
Date: Sat, 14 Mar 2026 16:50:09 +0000
References: <E1w0evI-0000000CzY7-1fyo@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1w0evI-0000000CzY7-1fyo@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 pabeni@redhat.com
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

On Thu, 12 Mar 2026 12:13:52 +0000 you wrote:
> The pci_dev is only used to provide the ethtool bus_info using
> pci_name(priv->plat->pdev). This is the same as dev_name(priv->device).
> Thus, rather than passing the pci_dev, make use of what we already
> have.
> 
> To avoid unexpectedly exposing the device name through ethtool where
> it wasn't provided before, add a flag priv->plat->provide_bus_info
> to enable this, which only dwmac-intel needs to set.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: avoid passing pci_dev
    https://git.kernel.org/netdev/net-next/c/f807b5b9b89e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



