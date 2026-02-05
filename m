Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04222EA7945
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 02:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZfidOsO/VHGdE1fQw9kPWdkQ7z9vRrXo9b9tsQPg1U=; b=RHo4gj33vocgk+UtrGJhOCASmI
	vlPNlRRQh/ZQ7YDStzExr00sC3sGMAgTGGf8g1s7n3on3UeI3mcGV2IPeEpJPHz6huv80AgCwsq7v
	7l2ZeEOi/Oyc4Gri+4zRmKf+cfVudvXdkZL3rzgih9Dg4cTPLPyyXzFGCngaA7Rlj9bjf/gxBFGI3
	V8k9mOJdQhmr8bd1E9XdJouWNxHut7wh05FRZ1fxPUo382UL/d5KrU5TdTu/bMjR3vdNIymunoNrd
	D7gODy5DsDov4AgsmzfI0C4sMudMLqgsYNRmEcjFEXWyarQdSRmkw0bQLnKimEemps7/AuK8ZfAbL
	nDVUQYzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnoyb-00000009JJR-3o26;
	Thu, 05 Feb 2026 02:20:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnoya-00000009JJC-1s0Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 02:20:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 59894600AD;
	Thu,  5 Feb 2026 02:20:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09301C4CEF7;
	Thu,  5 Feb 2026 02:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770258011;
	bh=Ckmx0GKVNpOSKyHt5m2XWiZUVYGFKxGhni8kQ1Gktb4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=N2o6vatDJbzPlSdkxwhmk91jq9i3M8ppchl4fJIc0tNapuejOR+vc7OsLApIJ6Q2l
	 OjLIBg11mF9MfPOQqlN80qxbxHBvGDA927XWE1qxd/R/hEgfePuVXRaEQwGBZC1d7I
	 OMRL1+1aTaidkNzdQwxhS0E1dnvZSlTFDw86DLQI3B4Y5FCD/ejUxYqAR/oWg67XOT
	 MPR3LJoszYSmajzVqJa5iviYdinh1T0poJUMcjbKhDKSo3rAvhq3XNlHe3WmOaxsE+
	 xq+ANUbmCMUazXKxrBRHhvoSlOenAjOWM5BFQ0/9nLqaG6vj02lWEPRrXeTgzmd6/J
	 R428Efxptc0KQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 481973808200;
	Thu,  5 Feb 2026 02:20:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v13 0/3] STP/RSTP SWITCH support for PRU-ICSSM
 Ethernet driver
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177025800908.129535.18427051023918224853.git-patchwork-notify@kernel.org>
Date: Thu, 05 Feb 2026 02:20:09 +0000
References: <20260130124559.1182780-1-parvathi@couthit.com>
In-Reply-To: <20260130124559.1182780-1-parvathi@couthit.com>
To: Parvathi Pudi <parvathi@couthit.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, danishanwar@ti.com, rogerq@kernel.org,
 pmohan@couthit.com, basharath@couthit.com, afd@ti.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alok.a.tiwari@oracle.com,
 horms@kernel.org, pratheesh@ti.com, j-rameshbabu@ti.com, vigneshr@ti.com,
 praneeth@ti.com, srk@ti.com, rogerq@ti.com, krishna@couthit.com,
 mohan@couthit.com
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

On Fri, 30 Jan 2026 18:13:42 +0530 you wrote:
> Hi,
> 
> The DUAL-EMAC patch series for Megabit Industrial Communication Sub-system
> (ICSSM), which provides the foundational support for Ethernet functionality
> over PRU-ICSS on the TI SOCs (AM335x, AM437x, and AM57x), was merged into
> net-next recently [1].
> 
> [...]

Here is the summary with links:
  - [net-next,v13,1/3] net: ti: icssm-prueth: Add helper functions to configure and maintain FDB
    https://git.kernel.org/netdev/net-next/c/4c8566a12f14
  - [net-next,v13,2/3] net: ti: icssm-prueth: Add switchdev support for icssm_prueth driver
    https://git.kernel.org/netdev/net-next/c/eea65b87493e
  - [net-next,v13,3/3] net: ti: icssm-prueth: Add support for ICSSM RSTP switch
    https://git.kernel.org/netdev/net-next/c/eca327ae9aa6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



