Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC04D3B982
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 11:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FxwoKWgVUWd8vgrCSTcyuxyre0+1Kf9a8316J8oM978=; b=zEK+DEL637rgq2xm8JuptAesq8
	tdCLQW2p8NZuQDeLyBTqnfgBY2RrI05uOu2mp/dnd3aVxIDeVSmRv9LWe8qwNQQg4vUPHUn+M4rYS
	X2k+QyQoUYT6hDwpsHPMd5k2QC7egvlvzE5aYXg0zbTufEumJglgVdCN8/HsdHf+UztL6y45JUQxs
	un5rJP/ztmDe9u04Q4qDRt9htTOJd2R4gD2tuoQ5d5vz/FxHT/9xNclJZFJkTXLFWcBvNFsHeVSfr
	ntTIZNINZYyz1EVNl/mqjL6kAv/p1NAiqp8ceqT0gajxVbntonbdAkA2XIkn6JKGsUg1eyNcUcP/c
	841ht6UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFtTR-0000000ANjg-2MJX;
	Tue, 26 Nov 2024 11:11:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFtST-0000000ANd0-0mLq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 11:10:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6353DA41BDF;
	Tue, 26 Nov 2024 11:08:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF89EC4CECF;
	Tue, 26 Nov 2024 11:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732619416;
	bh=YSELgeIz82RADEql14/t1EXb+6i2e+P7ABdlJAwN9VE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rQmhsDtGHgZCzvVzZBt7fn2ztuz20Lk+A/h46VRqrCaegCebr1Zbxo2NZ+Ob0zdOA
	 UWzJpoSSu2iBALpetVFov1tDH/mgIgUgbGniciwikmzY+tueNM/DKk5WSAVk+1ACFU
	 +tivys9qA0izpv1MFc2g/RydJfJIBBqmEiXPfLSuTFOwx75/QdQ61Qwtm/hLd1FG05
	 tlaekR+3TJhzBcjRxfog2LP9GafXY1R68O+XECtmeLO/5DBPxFrf3FrXuiR6h3c49B
	 2jUtq4QF/6SGbPAxM7hhHuEbEr8gWRfsaHL/V8zDY2EInxH6UxD1FqfWHNUI9xGfEi
	 WXegTKljtYkAQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB00A3809A00;
	Tue, 26 Nov 2024 11:10:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: stmmac: dwmac-socfpga: Set RX watchdog interrupt as
 broken
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173261942880.352444.541353075631044825.git-patchwork-notify@kernel.org>
Date: Tue, 26 Nov 2024 11:10:28 +0000
References: <20241122141256.764578-1-maxime.chevallier@bootlin.com>
In-Reply-To: <20241122141256.764578-1-maxime.chevallier@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: alexandre.torgue@foss.st.com, joabreu@synopsys.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexis.lothore@bootlin.com,
 thomas.petazzoni@bootlin.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_031017_292604_1F2FE061 
X-CRM114-Status: GOOD (  11.15  )
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

On Fri, 22 Nov 2024 15:12:55 +0100 you wrote:
> On DWMAC3 and later, there's a RX Watchdog interrupt that's used for
> interrupt coalescing. It's known to be buggy on some platforms, and
> dwmac-socfpga appears to be one of them. Changing the interrupt
> coalescing from ethtool doesn't appear to have any effect here.
> 
> Without disabling RIWT (Received Interrupt Watchdog Timer, I
> believe...), we observe latencies while receiving traffic that amount to
> around ~0.4ms. This was discovered with NTP but can be easily reproduced
> with a simple ping. Without this patch :
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: dwmac-socfpga: Set RX watchdog interrupt as broken
    https://git.kernel.org/netdev/net/c/407618d66dba

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



