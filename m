Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9135EE83047
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 03:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DZiH5ys5WzvfY92cz50nnsUu46mc+G+u+RB2cwEN/yg=; b=vlSqh5pwz85bJXfaDrm2iXXrWQ
	5XMHDUgEfc2ZP3Z3QT0olE45Xph7NQoYFOFIZdVqTApd58gY+e0E/tyn6CxG6YPMnM1rVhu/QFJnr
	6OEJyR67BA8GfwKVbKb0QplHmafrHZuEqg7JLcFPrFfdffE0xwVm424ukI0Hmy0yh5IbqQLNUBwwc
	nTzqQDYvK4ex+Wt+5bjDJbcfFsPrcwYPxA7JBVJh/MBaWmzJKcBSPIWipNB5UQP6Dpwtoeb0KUi5k
	MAvSaT3iLoZxIBi9zJJDFTvVS9i7xZ3vFUAzQ3dqBYPt9DBWOwRmjpwmSrNpXkJKedoLuCzC2fkHN
	MHcs1nfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn6xh-00000005zUn-2UwK;
	Tue, 03 Feb 2026 03:20:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn6xd-00000005zTU-1rPk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 03:20:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7707060129;
	Tue,  3 Feb 2026 03:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 232B6C116D0;
	Tue,  3 Feb 2026 03:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770088816;
	bh=s3JCSBIzTmNuGCJD/5jI8VEjBvBh01FRCXRjgvKtYSs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PZfBRAww5iTqwTfzWKc1ZpiXM8dsP6EZvLuhd6/8ir78k6TBj8UfMCSOT+mm2b6db
	 CThEcJQ+PqaqUiUSrzU4MOlvHCPsqLEPB6fT7yVag4dhux/yzqndDN5YUH74gpqbgw
	 41Rwuo8iGvmIV0oSoXAcEMtJq8gdeml2VOMfX3NpaPaVbvXvZOzuV33CFhmwqhnxkg
	 Jd7BXmt1MgyFw/rf5vbP5M7ItcVHtJg9DEryuWb+p2OiwbNjnUL9SITILgsyJzTM9C
	 k2Ip7bcWA3w80nI+Frz5uPzTI06uVFgOLEtnYAtgWhk32GHJpCtE+rowjXGcbi5mGd
	 fhOea7ogcAqIw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 16DE43808200;
	Tue,  3 Feb 2026 03:20:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/3] net: stmmac: pcs preparation
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177008881287.1295553.6986810799216029120.git-patchwork-notify@kernel.org>
Date: Tue, 03 Feb 2026 03:20:12 +0000
References: <aXyRlFw7ZuhRPiKo@shell.armlinux.org.uk>
In-Reply-To: <aXyRlFw7ZuhRPiKo@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 30 Jan 2026 11:10:12 +0000 you wrote:
> Hi,
> 
> These three patches prepare for the PCS changes, which, subject to
> Qualcomm testing, should be coming in the next cycle.
> 
>  .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    |  2 --
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 18 ++++++++++---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c   | 31 +++++++++++++++++++---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h   | 24 ++---------------
>  4 files changed, 44 insertions(+), 31 deletions(-)

Here is the summary with links:
  - [net-next,1/3] net: stmmac: clear half-duplex caps where unsupported
    https://git.kernel.org/netdev/net-next/c/83957d6cae5b
  - [net-next,2/3] net: stmmac: move most PCS register definitions to stmmac_pcs.c
    https://git.kernel.org/netdev/net-next/c/eb4a1fda2c2f
  - [net-next,3/3] net: stmmac: handle integrated PCS phy_intf_sel separately
    https://git.kernel.org/netdev/net-next/c/69a586e8866b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



