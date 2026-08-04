Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943E2C55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 21:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EkNRpLkFQbklpXhlhpSbYoouuppf1lhtf6KMzefUN9A=; b=zjrFQQjfcgM372uOO9U5IUGKCs
	eYrpyvV+8MFUjbdzrsM+tek/viwuyzVshkzItVRhCCgPYfBPQw4imIHPpVwdgpKPvRgISNHAU9FDP
	90V2Oq7ok/OnlToW+s/Nc2skRs8W8n+jT5aq0uWTqzeidSJnlkVrK184BkKXuPm4lK0tJRQpPoUwa
	0qX3hbLhLy/W5QeVuYejL/jErnMUremx6RPpkE0H6+8OWxhNNbz/XjtpNn6ZkHg2HG/EgGK+4ilKX
	C0HJIElfymqXPPg3G92LtBlvyxErHfhUxHZTKaYo3JlbExPLEAi13eP2+vkbnSEFBIkLewo1ba5Ak
	ma1bWBBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrN27-00000002q2z-2kft;
	Tue, 04 Aug 2026 21:50:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrN25-00000002q2h-30om
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 21:50:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E80F4180D;
	Tue,  4 Aug 2026 21:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5013E1F000E9;
	Tue,  4 Aug 2026 21:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785880245;
	bh=EkNRpLkFQbklpXhlhpSbYoouuppf1lhtf6KMzefUN9A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=GFTbfl04sWNuT/qvwrHvc+GheIIpTIE0Q19QLDg3GkRZT7TCpNtSz+nieqjStPwYs
	 xFW0n1qSkAHAxTbNmyBY2hY9fyeXRzK3pRIrUP8pCGc+s/EnvitJ5HFpTn/dhwfoLu
	 N6VjDbObW8WuZqq2tff13gRwuqu/QiiJ6OLAVbcWjoFNy640quOraLlKRPV72IdXv/
	 KQke4yHFpamL8TYP9CbjL9VGRHvteJ+0oOHgxnqTnfzHWSaw35gwSyjC97QF09ZuRH
	 P80y9CBP+wwyKJc/FxK9kHC1/3YsJk3l+7U/nYUEKXyLWF4RrACOvIWMOUgvMdYEcT
	 OnLfnPgdTuQ6Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id E9494392664C;
	Tue,  4 Aug 2026 21:50:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: stmmac: remove ptpaddr/mmcaddr/estaddr "safe"
 initialization
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178588020564.3802025.2220394407123145162.git-patchwork-notify@kernel.org>
Date: Tue, 04 Aug 2026 21:50:05 +0000
References: <20260803135745.12600-1-jszhang@kernel.org>
In-Reply-To: <20260803135745.12600-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon,  3 Aug 2026 21:57:45 +0800 you wrote:
> These so called "safe" initializations aren't needed any more from
> sometime, but the unnecessaries are obvious after recent clean up
> by Russell. The code will correctly initialize them after getting
> the correct stmmac_hwif_entry by calling stmmac_hwif_find().
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> 
> [...]

Here is the summary with links:
  - net: stmmac: remove ptpaddr/mmcaddr/estaddr "safe" initialization
    https://git.kernel.org/netdev/net-next/c/95a390ce6aee

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



