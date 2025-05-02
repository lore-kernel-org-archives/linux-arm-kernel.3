Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC60C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 01:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zWRLpd70Pw2Z1tGsUt/C4/LhwY9AF1goBXiQ5nt0vCw=; b=GGxwzG7y0c0Ya8Ngbg5HrY8Js+
	qd+/LTDA6/9H9NsTTpCBD1rmVhaYRA2Icf0Po16UmJn+quN0DSHsgNWeiXrwfNivYXP9x9/iK438e
	tlfrPvZov/uxhdnvgeHX0aCt1OHIUDyktebAVNMp7LOd+duMcrKN/YCe2YTEa5hvU3y0sTEazEoMB
	6ej0NJ6/8lAro+v+vJwvksqkcDVXWNjiDD2xgzktJz8d8AHTk/GE0EDGnkqU9dtZ2Rnm6LOw2JpM9
	6u3Yo/ZVr5hYwj+Fia96gseaE8ko+H0KPN1HiMk+/XXTJz238r1f1OfHk3Yodu57/qGwFJsRg/2Zi
	t0HXNQVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAen6-00000000SJP-0dNT;
	Fri, 02 May 2025 01:02:12 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAelB-00000000S8L-1h2f
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 01:00:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0195DA4C327;
	Fri,  2 May 2025 00:54:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63442C4CEED;
	Fri,  2 May 2025 01:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746147611;
	bh=HMPgr40VH5mX1QcwLj1gZeZsZHk8igfKOvu5EQAD8sU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KVmqGC3jBsRdqt844cN3DDUqVStk3m7giI8iDRrHZmF41qMsk2Z4hCdRCdFV8zriU
	 nnu37wTENDZP57E2me7MprbRbFSVazZokTRdlDbR3xgi4JZ7sR8ieHCFP3TSSL7Wor
	 qKh+KBapyx3Gb4gYrydpEnYy2RvCjnfoGSniPh/upBYOkZooPhY25j60oRWHebgMrt
	 XbqO1n/cgXjWMxFGNUgx0gIbkNB85IiMo3c81nCdY+Sl7HvVSFnrirn51BXHPJxT7E
	 BjWXMdM6WPlVFHyuZSVqpaX2um39kVVwPzSqgcpr36Rx578U4BtCD+Y+lyMhIM72gY
	 5ttmDumUIy9gg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE693822D59;
	Fri,  2 May 2025 01:00:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/5] allwinner: Add EMAC0 support to A523 variant SoC
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174614765024.3121766.5842492946410657006.git-patchwork-notify@kernel.org>
Date: Fri, 02 May 2025 01:00:50 +0000
References: <20250430-01-sun55i-emac0-v3-0-6fc000bbccbd@gentoo.org>
In-Reply-To: <20250430-01-sun55i-emac0-v3-0-6fc000bbccbd@gentoo.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@csie.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, mripard@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, andre.przywara@arm.com,
 clabbe.montjoie@gmail.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 krzysztof.kozlowski@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_180013_508237_FC3B9AA8 
X-CRM114-Status: GOOD (  11.80  )
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

On Wed, 30 Apr 2025 13:32:02 +0800 you wrote:
> This patch series is trying to add EMAC0 ethernet MAC support
> to the A523 variant SoCs, including A523, A527/T527 chips.
> 
> This MAC0 is compatible to previous A64 SoC, so introduce a new DT
> compatible but make it as a fallback to A64's compatible.
> 
> In this version, the PHYRSTB pin which routed to external phy
> has not been populated in DT. It's kind of optional for now,
> but we probably should handle it well later.
> 
> [...]

Here is the summary with links:
  - [v3,1/5] dt-bindings: sram: sunxi-sram: Add A523 compatible
    (no matching commit)
  - [v3,2/5] dt-bindings: net: sun8i-emac: Add A523 EMAC0 compatible
    https://git.kernel.org/netdev/net-next/c/0454b9057e98
  - [v3,3/5] arm64: dts: allwinner: a523: Add EMAC0 ethernet MAC
    (no matching commit)
  - [v3,4/5] arm64: dts: allwinner: a527: add EMAC0 to Radxa A5E board
    (no matching commit)
  - [v3,5/5] arm64: dts: allwinner: t527: add EMAC0 to Avaota-A1 board
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



