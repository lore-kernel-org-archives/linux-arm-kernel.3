Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A23FC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Jul 2025 00:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NWPtqSAvUDq+Z90hPAae2yj5eqnyBWI/XNam5wEHclc=; b=QWWpqhNBRJQb0obzMAwwZ41r0r
	nnpGzHNJMCcQnI24l3dk2sVrdKErd4kE7V7ZKNOjPuNNkyztUrzlwOfadkWXAEArmRIDbOwPx6q6P
	sQh+Rvz6WYDP4A5/1HsYC2Eh3Jbbw17Da2UNt/lLBjkTEOpdJDQ6PvxFaWRx9/EpMPo2MyR7MbtgQ
	R4Srthod8qmG/oXW3sc5Q7eax1cQW946pXGtJ7VpiICfR2eUXWi06gI3QbcuiOz4F0X8XiwQ9oSAy
	se8rQVDFL1A1aGnHmcN9+xAsjrYENm3lp9Iyk/H8pX52rz6GllfrX5sPGOGABDFXrYpNLbVIR+p7m
	i/I1HKfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufSN0-0000000AvLn-3xqv;
	Sat, 26 Jul 2025 00:02:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufSKU-0000000Av2G-2VUT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 23:59:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 74D0543C5B;
	Fri, 25 Jul 2025 23:59:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45D3EC4CEE7;
	Fri, 25 Jul 2025 23:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753487997;
	bh=aWagL43nzO3VnFNpASht2nxBuHJFMqurTi8Xfa3eL1Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jesXExFDdeul9WCN5G39/ib4nkocPTDnI/yeEIpfsW8Lz+DJykYp2TOdeGmRjGptT
	 x92BA46355IUA7dRi7Y8UMlSR36Pf2O0t1buP5Z9ZSRIea6lJu0LxYw0y8Tf4UDLEW
	 FGMqBmM0WEu4R5RARdWHsW/B0kg9E1MxNu90rJ5XI4jFgmQWfCh3A+DSuwAizPP3zx
	 tERKyuOmyQT6oOGb3dUneQaDjnjTWs7//Dmak4RGSTX3OGcV3PlqVreruRpxinVTrb
	 okRPYR1MXiNUH18pMY5ZuKYOak2sSkk0apz9PeRdBXCCph5YfZlOE1Qy01gsYFRcUx
	 +EhKf9EJ/C2jw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAC74383BF4E;
	Sat, 26 Jul 2025 00:00:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/4] arm64: dts: socfpga: enable ethernet support for
 Agilex5
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175348801475.3451765.4389353168084644772.git-patchwork-notify@kernel.org>
Date: Sat, 26 Jul 2025 00:00:14 +0000
References: <20250724154052.205706-1-matthew.gerlach@altera.com>
In-Reply-To: <20250724154052.205706-1-matthew.gerlach@altera.com>
To: Matthew Gerlach <matthew.gerlach@altera.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 dinguyen@kernel.org, maxime.chevallier@bootlin.com, richardcochran@gmail.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_165958_654975_68300084 
X-CRM114-Status: GOOD (  10.04  )
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

On Thu, 24 Jul 2025 08:40:47 -0700 you wrote:
> This patch set enables ethernet support for the Agilex5 family of SOCFPGAs,
> and specifically enables gmac2 on the Agilex5 SOCFPGA Premium Development
> Kit.
> 
> Patch 1 defines Agilex5 compatibility string in the device tree bindings.
> 
> Patch 2 defines the base gmac nodes it the Agilex5 DTSI.
> 
> [...]

Here is the summary with links:
  - [v2,1/4] dt-bindings: net: altr,socfpga-stmmac: Add compatible string for Agilex5
    https://git.kernel.org/netdev/net-next/c/92068a32f978
  - [v2,2/4] arm64: dts: Agilex5 Add gmac nodes to DTSI for Agilex5
    (no matching commit)
  - [v2,3/4] arm64: dts: socfpga: agilex5: enable gmac2 on the Agilex5 dev kit
    (no matching commit)
  - [v2,4/4] net: stmmac: dwmac-socfpga: Add xgmac support for Agilex5
    https://git.kernel.org/netdev/net-next/c/a5e290aab8fc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



