Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9BF6C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 08:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rrkfOSxLddbUOfL7Xbg9jSW10/8qwrLgWoRjxVeerfg=; b=y6b2NCB+aGZMMBYXIvQAcN0CFV
	p05LtSViOWan+PdY4rgGx+ya5hvZra74l0ZpqF+e5i30Fz3vqus+3Qdm7z96bUwdKgGpxcrYAmD3x
	KYb3R0FnsIHx8F0MHedV8Mlwe2yBVzaBFNwhyPzKA++wjawR0gl+ZV8+HR8gMOi7r6AU+tKNYr97R
	AnTDREQOug0r3NKHlPL93MliitD+1JPLNDNEvW5HJRnt3T7B9gQsM1K8WGwkSZQdbbzCG8TWVuqLM
	LD3kkFjMBiQiIHMkgh8qCdy1/6gXfbe4zF+uJ5H6y9oC4j6NungxGWBFs99IxTcDvt5iJ6iXDfnNL
	KblyVGkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4aUu-0000000Dnag-3ENE;
	Thu, 10 Sep 2026 08:51:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4aUu-0000000DnaS-0Qph
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 08:51:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A008343DE9;
	Thu, 10 Sep 2026 08:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EA5C1F000FF;
	Thu, 10 Sep 2026 08:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789030267;
	bh=rrkfOSxLddbUOfL7Xbg9jSW10/8qwrLgWoRjxVeerfg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=E911ouiRnshT0fokrv1wwThNADwZuO2rPqVJ1hyoIxweNQqRAZhFdHEnCV/Tlzgmx
	 /sQi3zDFo2Lf36ml3fujjZITB+9yXQZgV3xPJFiFfwSnIxw0k0P5mVRd36A+zQifsj
	 Z+k2IO26sE5BW3MDxkX1tfKqScUkQzMf15J+3Rb9VytLDDnrUSN1eFiXuiiOlVyB0/
	 g6GdW833z3eLuK/jqHSQqyQnmtC54vxJ0YS23I9CEYgwpJBfhTUNIbRoTXuKL+M9rM
	 dLuPeTjjaM4DVV3hsY6lCypzQVn+si3xmNGjWD7reOW4i45CbDjt8uHKuGk8uwhNB7
	 KTzJx+GgUBytA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 569A0380CEDF;
	Thu, 10 Sep 2026 08:50:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/5] net: stmmac: Add common RGMII delay
 handling and DP1000 support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178903020504.1290091.17816102096772468224.git-patchwork-notify@kernel.org>
Date: Thu, 10 Sep 2026 08:50:05 +0000
References: <20260907-dwmac-ultrarisc-v2-0-9a39bf8db313@ultrarisc.com>
In-Reply-To: <20260907-dwmac-ultrarisc-v2-0-9a39bf8db313@ultrarisc.com>
To: Jia Wang <wangjia@ultrarisc.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, maxime.chevallier@bootlin.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 peppe.cavallaro@st.com, joabreu@synopsys.com, chen.wang@linux.dev,
 inochiama@gmail.com, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, sophgo@lists.linux.dev,
 conor.dooley@microchip.com
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
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 07 Sep 2026 15:46:49 +0800 you wrote:
> The UltraRISC DP1000 integrates a Synopsys DesignWare GMAC from the 5.20
> series with fixed internal delays on both TX and RX RGMII clock paths.
> 
> For boards without PCB delays, "rgmii-id" describes the link. Passing this
> mode unchanged to the PHY would enable another pair of delays and break
> RGMII timing.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/5] net: stmmac: Add common internal RGMII delay handling
    https://git.kernel.org/netdev/net-next/c/cc54f9667188
  - [net-next,v2,2/5] net: stmmac: sophgo: Use common RGMII delay handling
    https://git.kernel.org/netdev/net-next/c/7d1cbb9ba933
  - [net-next,v2,3/5] net: stmmac: eic7700: Use common RGMII delay handling
    https://git.kernel.org/netdev/net-next/c/345d78e30980
  - [net-next,v2,4/5] dt-bindings: net: Add UltraRISC DP1000 GMAC
    https://git.kernel.org/netdev/net-next/c/8dbfb46c233a
  - [net-next,v2,5/5] net: stmmac: Add UltraRISC DP1000 GMAC support
    https://git.kernel.org/netdev/net-next/c/c6ff098cb63a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



