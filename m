Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE12CA100C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 00:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GeRKERZ0evfgAxjm0vuxFozXypYwz2mEgHs6GaYYQj0=; b=MJGpsK6/aCGP4cxfO+HgPSJ1VP
	EPK+ZrrWSxRIgGR+AVt+xbYZCVnUmWKoqVucKn9FVuoPeuTnCh17RwD7Ahx9Ie5VnTF/uj550gY26
	Jili2Qhmm89O9eu+qYX7+OznMDS4jaqd15ABEVjBRjfO3m4J1uw69xYePDitvnUE+2qRy1DcoWu9r
	KW5UNTCCg1q5cOSugzJycJVfHQ8T5h2STjR11bBTQ0v8gsfoP1PxQMHuKoJMZW0aRb4XtXH1rNw2S
	eONIrNAQOQ62ZiyjIpQYFGh1PMKiZGcw+1nMt0cxxb1KfwXQAT96rAowA5BEULn66E6gn8eC77y9R
	Eo/2Y2Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFGC-0000000EYOr-3PKZ;
	Tue, 02 Sep 2025 00:52:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utB0j-0000000Dlma-2WWa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 20:20:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0C0CD600AC;
	Mon,  1 Sep 2025 20:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B526DC4CEF0;
	Mon,  1 Sep 2025 20:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756758016;
	bh=b+CTfrXwA9iq3oHu9AuIj6WOquP0sdHtMd5L2jfSAxM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZTjx7sdHI81a8UjX9R+dyR6cLXTuRipnmdXqZLRnYgq5n/o6cZQRUp5kvQ5PDk5Aw
	 vwbibTrTJRszJiAAAPJiRB9WW1Fb/6zInJGWg7QfVnhvHZX8nVJWpmKnAVopTGAzEs
	 5i/OapC15ltlCkg/yFtueqAg5cZdZdGWmp43mfSXHpLSz2HjBXxSYgNyvUT3AecRdl
	 TtBpreoRMIybgEFrtIhCSyhU4VoTaAjammkp1ZyzBe43zoxyzT+whiMaZPP+y2/caS
	 MawuCsPYyjlGRDPB1g4n84SHxUrYzsS3KAsDQIZkGCxXK4No8Wfih6tfObJf6Bt0Bt
	 Vi8dWHYLKBPhA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADCB7383BF4E;
	Mon,  1 Sep 2025 20:20:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: mdio: update runtime PM
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175675802230.3872744.15747918532068269574.git-patchwork-notify@kernel.org>
Date: Mon, 01 Sep 2025 20:20:22 +0000
References: <E1urv09-00000000gJ1-3SxO@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1urv09-00000000gJ1-3SxO@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
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

On Fri, 29 Aug 2025 10:02:29 +0100 you wrote:
> Commit 3c7826d0b106 ("net: stmmac: Separate C22 and C45 transactions
> for xgmac") missed a change that happened in commit e2d0acd40c87
> ("net: stmmac: using pm_runtime_resume_and_get instead of
> pm_runtime_get_sync").
> 
> Update the two clause 45 functions that didn't get switched to
> pm_runtime_resume_and_get().
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: mdio: update runtime PM
    https://git.kernel.org/netdev/net-next/c/ec0b1eeece28

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



