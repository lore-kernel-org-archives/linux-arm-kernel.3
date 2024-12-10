Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 815E1E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 05:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:
	References:Date:Message-Id:From:Subject:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=co3b7EwMmVY8On0bso7zdTITvfsL49D+z12tfCgQ8z8=; b=Op288JloaWjc5I1Ktw8kVD6WZK
	MCyRr5kq9rMjzl+qT71lA3PlnDR5TfYV9EGjunq9uC/5+kEDt3wdKFofXrfeFA0ggfNLG8LWJ+WGl
	ZF6oJs0D+wrAflE33QXVLWRr76juLL3QvxYIh0WB5szy4ZqhPIhmCWz1WAbJupPDIOki1vC1bSplL
	mSsfOpm8k+Xiyc4dd7UIgEZmaoC4/Mah8yOfYXTBfpsTk1T8Xb1PG4utxklNwB83QVmjUQAVXwANr
	1Cb8OLQSZXSjh2fwS9oPcw9KkVyBTgLJ+sNFac5mxeMU3lvqyWYISoEaDMHEwICT6g0kJT5TX0Adl
	8MyIPjAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKsWu-0000000AFnG-0xd9;
	Tue, 10 Dec 2024 05:11:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKsVr-0000000AFh2-05Ns
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 05:10:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 74BEB5C4CED;
	Tue, 10 Dec 2024 05:09:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CE6FC4CED6;
	Tue, 10 Dec 2024 05:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733807421;
	bh=3PFxSSpWAf1uej3O7h8d+RzULqKyQZ0CsWOcHahIS8Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=r5DIW0r/VhAd2ECaJf98oP2OK0PH5pluM0LmVmvuXQftBAz3Kvc0GBB1gYNAWofoU
	 OvWYB4nuOAJP48oZC8JU3OMa89t5wynMF/6vWpKf6mgKoLBg15ElQJcYnPRRIZZQ3g
	 7BPWUKVGpiTSTo1uzVTiyeFOTVmFlEn/wjsc5dX60ETAFfBFEj4dnZ0w9MnPa5tXy4
	 YO4s3JkG5/CuHuN3to7O8HnS3i3evzVxJWa7ivs39csiVplv63toxbTbTnwJfRexh0
	 QCrB7X697iWUdw0gmKR4deBPF9E0U5bVl8MpuuTTkwq7NjjMEoXt057QK6aOP1oc3L
	 /foaMsTnmJ8Kg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 716FC380A95E;
	Tue, 10 Dec 2024 05:10:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v8 00/15] Add support for Synopsis DWMAC IP on NXP
 Automotive SoCs S32G2xx/S32G3xx/S32R45
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173380743727.355055.17303486442146316315.git-patchwork-notify@kernel.org>
Date: Tue, 10 Dec 2024 05:10:37 +0000
References: <20241205-upstream_s32cc_gmac-v8-0-ec1d180df815@oss.nxp.com>
In-Reply-To: <20241205-upstream_s32cc_gmac-v8-0-ec1d180df815@oss.nxp.com>
To: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_211023_146484_9D2C1FD7 
X-CRM114-Status: GOOD (  10.39  )
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
Cc: andrew@lunn.ch, s32@nxp.com, kernel@esmil.dk, imx@lists.linux.dev, alexandre.torgue@foss.st.com, claudiu.beznea@tuxon.dev, edumazet@google.com, iyappan@os.amperecomputing.com, quan@os.amperecomputing.com, festevam@gmail.com, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org, linux@armlinux.org.uk, joabreu@synopsys.com, jacob.e.keller@intel.com, kuba@kernel.org, pabeni@redhat.com, richardcochran@gmail.com, devicetree@vger.kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com, linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de, keyur@os.amperecomputing.com, jan.petrous@oss.nxp.com, minda.chen@starfivetech.com, rmk+kernel@armlinux.org.uk, peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org, 0x1207@gmail.com, netdev@vger.kernel.org, fancer.lancer@gmail.com, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, vkoul@kernel.org, kernel@pengutronix.de, krzk+dt@kernel.org, emil.renner.berthing@canonical.com, shawnguo@kernel.org, davem@davemloft.net, hkallweit1@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 05 Dec 2024 17:42:57 +0100 you wrote:
> The SoC series S32G2xx and S32G3xx feature one DWMAC instance,
> the SoC S32R45 has two instances. The devices can use RGMII/RMII/MII
> interface over Pinctrl device or the output can be routed
> to the embedded SerDes for SGMII connectivity.
> 
> The provided stmmac glue code implements only basic functionality,
> interface support is restricted to RGMII only. More, including
> SGMII/SerDes support will come later.
> 
> [...]

Here is the summary with links:
  - [net-next,v8,01/15] net: stmmac: Fix CSR divider comment
    https://git.kernel.org/netdev/net-next/c/31cdd8418234
  - [net-next,v8,02/15] net: stmmac: Extend CSR calc support
    https://git.kernel.org/netdev/net-next/c/c8fab05d021d
  - [net-next,v8,03/15] net: stmmac: Fix clock rate variables size
    https://git.kernel.org/netdev/net-next/c/cb09f61a9ab8
  - [net-next,v8,04/15] net: phy: Add helper for mapping RGMII link speed to clock rate
    https://git.kernel.org/netdev/net-next/c/386aa60abdb6
  - [net-next,v8,05/15] net: dwmac-dwc-qos-eth: Use helper rgmii_clock
    https://git.kernel.org/netdev/net-next/c/37b66c483e4c
  - [net-next,v8,06/15] net: dwmac-imx: Use helper rgmii_clock
    https://git.kernel.org/netdev/net-next/c/839b75ea4d94
  - [net-next,v8,07/15] net: dwmac-intel-plat: Use helper rgmii_clock
    https://git.kernel.org/netdev/net-next/c/8470bfc83515
  - [net-next,v8,08/15] net: dwmac-rk: Use helper rgmii_clock
    https://git.kernel.org/netdev/net-next/c/30b4a9b5c335
  - [net-next,v8,09/15] net: dwmac-starfive: Use helper rgmii_clock
    https://git.kernel.org/netdev/net-next/c/b561d717a799
  - [net-next,v8,10/15] net: macb: Use helper rgmii_clock
    https://git.kernel.org/netdev/net-next/c/04207d28f468
  - [net-next,v8,11/15] net: xgene_enet: Use helper rgmii_clock
    https://git.kernel.org/netdev/net-next/c/fd59bca4d5ea
  - [net-next,v8,12/15] net: dwmac-sti: Use helper rgmii_clock
    https://git.kernel.org/netdev/net-next/c/1ead57775507
  - [net-next,v8,13/15] dt-bindings: net: Add DT bindings for DWMAC on NXP S32G/R SoCs
    https://git.kernel.org/netdev/net-next/c/91f10e589520
  - [net-next,v8,14/15] net: stmmac: dwmac-s32: add basic NXP S32G/S32R glue driver
    https://git.kernel.org/netdev/net-next/c/cd197ac5d661
  - [net-next,v8,15/15] MAINTAINERS: Add Jan Petrous as the NXP S32G/R DWMAC driver maintainer
    https://git.kernel.org/netdev/net-next/c/6bc6234cbd5e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



