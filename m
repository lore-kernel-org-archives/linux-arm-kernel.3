Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6562BFCC9AE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 03:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mQMzd6CjnzUQ1DX9YsKtVM5AIItcAK4+ehNCUsyk/t4=; b=UXhWA+vOJWY/lLmfuGzoaPGeK0
	470ipkkbvZZrPz5oXQXBLGp8ZwjtZKqIiRyy2gH8SXD2WmxdOAsSoHes8A0NRbii50TmDWx/prlaS
	c7agIJDlHLcOnyWuTvIPpLCpWHs6KnteutMpavir3+Ho/+O4MOhRTNEeJUfdBgqY+JWUHv8KEGsvr
	1Bx/Lee9qsg7SnjqWwKFDaZ422XB7TUKG0DYdMjaIub7Reev/CRAqPhUDliLSF1CGtJaglxE+gW0z
	Rmx2ZBL35w7Y/ICiEiPTRsxDuJMc2TKoY/UBEnzLEiNPMUQ4kD94+Snf2Qk/KOhOXcwoLA4SezPxB
	+7JC4wMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznKl-00000008bgf-1BwW;
	Tue, 10 Mar 2026 03:00:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznKk-00000008bgZ-3itl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 03:00:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EF02460097;
	Tue, 10 Mar 2026 03:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E8ACC4CEF7;
	Tue, 10 Mar 2026 03:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773111633;
	bh=VSUwhH1hBaKFIVPCypOuL5S0XwPeD6ulUIg5BptrmTY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=o77oV0ymMg+21gSWAkR87WeRBhwiJ/7/X8c2th1iD+dFlZDLIxO/IdXrkH6lq9Hjd
	 iHpB5SbgYakQamGuuniPiWR/3JZlics7y5aSu0t1t1e7lKbRjQXWR6eZI4bPy04KbW
	 IMErCtQ5vFWEzPHQDIocgV4DuUD19dOyTEQWGopoMWeW3uSUqKcNP2j0J2IIl8n6OD
	 +0a9Fd9s9XuSKeggxClMesNq0YCaa40BhvtLBBsv3Av3WVDVudomod8PcOgvm5tB/A
	 CN9zRxf1aBTHmhcuTRs8ImerDRakiOJJlbHALTT2ZssXpc8xVwDpv7sBkb7Sx5T9gU
	 QeRe2eXIuXFlQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02D8E3808200;
	Tue, 10 Mar 2026 03:00:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: remove stmmac_dwmac4_get_mac_addr()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177311163054.2039470.4262235716273124396.git-patchwork-notify@kernel.org>
Date: Tue, 10 Mar 2026 03:00:30 +0000
References: <E1vypJM-0000000CSiJ-48yO@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vypJM-0000000CSiJ-48yO@rmk-PC.armlinux.org.uk>
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

On Sat, 07 Mar 2026 10:55:08 +0000 you wrote:
> stmmac_dwmac4_get_mac_addr() is identical to stmmac_get_mac_addr().
> Remove stmmac_dwmac4_get_mac_addr() to avoid this code duplication.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac4_core.c  |  4 ++--
>  .../net/ethernet/stmicro/stmmac/dwmac4_lib.c   | 18 ------------------
>  2 files changed, 2 insertions(+), 20 deletions(-)

Here is the summary with links:
  - [net-next] net: stmmac: remove stmmac_dwmac4_get_mac_addr()
    https://git.kernel.org/netdev/net-next/c/c127d4087930

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



