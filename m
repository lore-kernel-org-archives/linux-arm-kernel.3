Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C53B10AB838
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 01:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w3SMzl110oCfDPITW4AHEvNNItFKeElG3dLTy5N38z0=; b=N9uxruI3bvSsbtHXPknKr6xzh6
	cfpXe3/Ysx5BtWr31NxeJaMHcJ1+bfdq6qupTWO79hX1PCssE6fLpcNFcYoXC2T32TkNYG35ZVVe2
	gLID1lOoBIo6YGD1NPh9JoI7yW8uIcXPt096+EJ+G1mLqy6MhKkYgGAOdbFMHLI/N4alm1l1PmSfA
	Da3F298kOYIGjsIVvbcBjHMTTwCHfhE+G/Jf38hc9i4BoKq1DY2mCZNgOXUVByKMoSHoZy3AT/ilc
	Ti996EXXx2L+aGS0710zecuI9lIko6N4bBKOjKms2pfhzoYbn76NlwN8fKsxXBePxSQ/QVeWnqr5U
	tcf16A7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5vs8-00000006TmV-1p9V;
	Fri, 27 Mar 2026 01:20:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5vs7-00000006TmM-0WSk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 01:20:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 14FAE60121;
	Fri, 27 Mar 2026 01:20:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B446DC116C6;
	Fri, 27 Mar 2026 01:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774574421;
	bh=+mbG3eLMPAF0Yt2+SNkDC2ssfDgwkGm8vxuXyXfcop4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=iCfhDqzkhmcNkYGWkj09iFJq6rCEDt1dbAqTatJbEGc1rBoXetzKDZOXuLpBFjiME
	 a9P8LcR9NdgAj8rW2IuLq3wUmWDVOgSGvBI3IBLemkAhxfETD+8YAB5qMQUx0mXxQQ
	 Z1KX0X7a0FY5C/oSovuXJUNuz+9HL9vMTvfhtdmSwUO6tI3WhvJ9uUYU1trF5TKJ1U
	 iq0MgVZUAAMKnMtahTCAX/2yMy7tmHEqIv/Bb+X3JWttgSheCwjeNIi2kSQ0wu+ypW
	 49ihEaPrekoIUMIhBS9G/ZYoXAGC2NF/9eFI+t9r0qQjQGVlVbbvT4QGfSW740gtBt
	 XrNoUx3Y3OyPQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FF6E3809A07;
	Fri, 27 Mar 2026 01:20:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v15 0/3] Add support for Nuvoton MA35D1 GMAC
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177457440804.3248049.2435571505438713021.git-patchwork-notify@kernel.org>
Date: Fri, 27 Mar 2026 01:20:08 +0000
References: <20260323101756.81849-1-a0987203069@gmail.com>
In-Reply-To: <20260323101756.81849-1-a0987203069@gmail.com>
To: Joey Lu <a0987203069@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, ychuang3@nuvoton.com,
 schung@nuvoton.com, yclu4@nuvoton.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com
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

On Mon, 23 Mar 2026 18:17:53 +0800 you wrote:
> This patch series is submitted to add GMAC support for Nuvoton MA35D1
> SoC platform. This work involves implementing a GMAC driver glue layer
> based on Synopsys DWMAC driver framework to leverage MA35D1's dual GMAC
> interface capabilities.
> 
> Overview:
>   1. Added a GMAC driver glue layer for MA35D1 SoC, providing support for
>   the platform's two GMAC interfaces.
>   2. Added device tree settings, with specific configurations for our
>   development boards:
>     a. SOM board: Configured for two RGMII interfaces.
>     b. IoT board: Configured with one RGMII and one RMII interface.
>   3. Added dt-bindings for the GMAC interfaces.
> 
> [...]

Here is the summary with links:
  - [net-next,v15,1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton MA35 family GMAC
    https://git.kernel.org/netdev/net-next/c/8454478ef9ab
  - [net-next,v15,2/3] arm64: dts: nuvoton: Add Ethernet nodes
    (no matching commit)
  - [net-next,v15,3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family
    https://git.kernel.org/netdev/net-next/c/4d7c557f58ef

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



