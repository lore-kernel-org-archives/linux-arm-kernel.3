Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B9DCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 22:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NksBILaSkBw9UGEAQRbdCqPJAkRvqdBt4BJqiMaC01k=; b=T0LfZenL6nsPaWMakwmfDjEQDZ
	6Rwd1HDJ5b96oAcBhhXitErexL/rK2Rqtedc61sGrzzqkxk+0jTi1xVDCrsHayF8FFfIzvoMP8Q8J
	Tn+SaIxqVLZr5jh+QdEmZvv1EJpECvImwvhkyYUUoF2H0OthMvdl+6q+sWzGvZ+8BfAc5dm1MgJ8y
	qlIJFOpsfxCtxNKfGzGfDodv0wXxKTiPaa4kWBWzSoXFTJ9ZiXTvOqh2Hwkh6tsyoR3djtjSxKdwm
	NDAm8Em98hoEYklVP1upfuEsX7+GwkpBXSq3pSRaOYxhAqBDZNaRHHrBq8St3t8InpSXtKeAh0/cH
	gTVK7mPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2Gno-00000004yCG-2NUT;
	Fri, 26 Sep 2025 22:20:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2Gnm-00000004yBC-2Xco
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 22:20:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 61DF343FEF;
	Fri, 26 Sep 2025 22:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CCF1C4CEF7;
	Fri, 26 Sep 2025 22:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758925229;
	bh=Mn3UMaJfnruXtRtYCrhAg9D+oTiCU8m67M2/1hao6II=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BKRrWxnVjbC9fVex2Q0QqOjaUUpQQZvcOO3sm32kWHQWuUS35HPoCEX/eNSRBoDaP
	 2PqDTLb3ZPVD/5ulHwbPb2ELHUPoF4YGigYibE+tTVWBXjvHTNz5aRkFbCbyRTBmvM
	 IhsXIQr0iEj6E5nCEM7uL9uRJ2L9u32HDgr4xz7gLBJVyuvpuxfOnXw+uaQ797Ef/m
	 ogWWIfVzbDMzUmuY8PVllaGFgt1VBWJlPR9RqYeT3t411LpXUmydMmQ4DuHk7vcL+m
	 bppaMUvfPn2CArUCuGjaMZTzXC73NG6s46oJ3U0pdpD+gYgGGexg5lmMA+RWpHPUWV
	 vhfQvpvRDFcKw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADDFE39D0C3F;
	Fri, 26 Sep 2025 22:20:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/3] Mainline Protonic PRT8ML board
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175892522449.77570.18183487624787267544.git-patchwork-notify@kernel.org>
Date: Fri, 26 Sep 2025 22:20:24 +0000
References: <20250924-imx8mp-prt8ml-v3-0-f498d7f71a94@pengutronix.de>
In-Reply-To: <20250924-imx8mp-prt8ml-v3-0-f498d7f71a94@pengutronix.de>
To: Jonas Rebmann <jre@pengutronix.de>
Cc: andrew@lunn.ch, olteanv@gmail.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, shengjiu.wang@nxp.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, kernel@pengutronix.de,
 vladimir.oltean@nxp.com, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Frank.Li@nxp.com,
 david@protonic.nl, l.stach@pengutronix.de, o.rempel@pengutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_152030_662726_97D9FAB7 
X-CRM114-Status: GOOD (  10.55  )
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

On Wed, 24 Sep 2025 10:34:11 +0200 you wrote:
> This series adds the Protonic PRT8ML device tree as well as some minor
> corrections to the devicetree bindings used.
> 
> Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
> ---
> Changes in v3:
> - Add comment on the intentional limitation to 100Mbps RGMII
> - Link to v2: https://lore.kernel.org/r/20250918-imx8mp-prt8ml-v2-0-3d84b4fe53de@pengutronix.de
> 
> [...]

Here is the summary with links:
  - [v3,1/3] dt-bindings: net: dsa: nxp,sja1105: Add reset-gpios property
    https://git.kernel.org/netdev/net-next/c/8d5868f8c1b2
  - [v3,2/3] dt-bindings: arm: fsl: Add Protonic PRT8ML
    (no matching commit)
  - [v3,3/3] arm64: dts: add Protonic PRT8ML board
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



