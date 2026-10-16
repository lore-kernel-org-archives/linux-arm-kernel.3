Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166D4CCA490
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 23:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Czw/lh14HoM3oBp7m7rksbbW1fhyazY+7Yq29EDqtac=; b=chr6BJT/sS1bpNkjqeOME56UjX
	JxFfHBm4E8FBzzT6KGzCHtmBgbYsUG5B6VZZJGBU5hCeF3EKWavtjzwd8PtI4jz/n9YgmIog77qto
	4iJqE29MREIVJmulc1bKT0XNaE9ejNHDtW/ZoYz/tXTL/7jKLb5DTw2iK/et6DjXpmxo9z6xCnfy/
	NvIJbL8boqTg7LLzsTZMtoWUXTN236vLhRq5zcC28Fe9r8+aiOmGjraKQiiLDOaZRzWoBNXhN73l0
	gAwmnKw399uYizLLNrn5uBkTzQZueXyHZa0BjKquChLOf6R2jAow459PzKej1ISQ/a774B056yx7I
	qQRz6K4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHrgh-00000004DQ6-2KAQ;
	Fri, 16 Oct 2026 23:50:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHrge-00000004DPu-3CA7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 23:50:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5782D60238;
	Fri, 16 Oct 2026 23:50:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07E5B1F000C4;
	Fri, 16 Oct 2026 23:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792194607;
	bh=Czw/lh14HoM3oBp7m7rksbbW1fhyazY+7Yq29EDqtac=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=kXfjNq8t04Hiwf5WEPapYRF4cLesZZRXjvLQwH+3vKnIMagMVAa2M8VhTW7N7Pq1M
	 OTVlWPKtPfSQXSQbLsCglZpdHvzpgGfb5t37f2vPu0kqeb56c2AS63uJNZFo0W/gcT
	 72Ffk5CKCM4tGylliXhZqYsStfze1vCi4YiH4t8yp8CFAMYYB0dRo+rVVPf9xEvGjh
	 AbdXi3ZzTYKRO743Sl+DPoBTw5jMcdCB8aRA5FHhvBI7X7WPpyPrVbJARCAEjyHlI2
	 Z2N+TtmryiWaaD942/jdo1mA0aq3Yc6I8BG9AiunFpFx4fJhZgkcJXe92pMw7mPXke
	 PuNnkI/GhQqJQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F1581380CECD;
	Fri, 16 Oct 2026 23:50:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 00/13] ARM: dts: imx6ul: Extend VAR-SOM-6UL and add
 DART-6UL support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179219460577.1014323.18259783279842882110.git-patchwork-notify@kernel.org>
Date: Fri, 16 Oct 2026 23:50:05 +0000
References: <cover.1791487179.git.stefano.r@variscite.com>
In-Reply-To: <cover.1791487179.git.stefano.r@variscite.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank.Li@nxp.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
 stefano.r@variscite.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 hkallweit1@gmail.com, linux@armlinux.org.uk, shawnguo@kernel.org,
 qijian.guo@nxp.com, francesco.dolcini@toradex.com, josua@solid-run.com,
 ernest.vanhoecke@toradex.com, mehmet.fide@screeningeagle.com,
 Markus.Niebel@ew.tq-group.com, maudspierings@gocontroll.com,
 hvilleneuve@dimonoff.com, eichest@gmail.com, netdev@vger.kernel.org
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

On Thu,  8 Oct 2026 21:37:40 +0200 you wrote:
> VAR-SOM-6UL already has mainline support on the Concerto-Board with
> i.MX6UL and i.MX6ULL. This series extends that support with additional
> module configurations, the Symphony-Board carrier and i.MX6ULZ variants.
> It also adds support for DART-6UL on VAR-6ULCustomBoard with i.MX6UL,
> i.MX6ULL and i.MX6ULZ.
> 
> The 90 new DTBs describe reference configurations with alternative
> storage, wireless and audio assemblies. These choices change the devices
> connected to the same SoM interfaces and require different controller,
> pin or device-node descriptions: eMMC versus NAND, SD card versus SDIO
> wireless, and the available wireless modules and audio codecs. They do
> not enumerate every possible combination of fitted and unfitted optional
> peripherals. The four existing Concerto DTBs remain available with their
> original names and compatible strings.
> 
> [...]

Here is the summary with links:
  - [v5,01/13] dt-bindings: arm: fsl: Add Variscite i.MX6UL board variants
    (no matching commit)
  - [v5,02/13] dt-bindings: arm: fsl: Add Variscite i.MX6ULL board variants
    (no matching commit)
  - [v5,03/13] dt-bindings: arm: fsl: Add Variscite i.MX6ULZ board variants
    (no matching commit)
  - [v5,04/13] net: phy: micrel: Check RMII clock select property presence
    https://git.kernel.org/netdev/net-next/c/5babd12ed114
  - [v5,05/13] dt-bindings: net: micrel: Fix RMII clock select property type
    https://git.kernel.org/netdev/net-next/c/1b93cd0f6584
  - [v5,06/13] ARM: dts: imx6ul: Extend VAR-SOM-6UL and add DART-6UL files
    (no matching commit)
  - [v5,07/13] ARM: dts: imx6ul: Add Variscite WM8904 and WM8731 support
    (no matching commit)
  - [v5,08/13] ARM: dts: imx6ul: Add Variscite storage and wireless options
    (no matching commit)
  - [v5,09/13] ARM: dts: imx6ul: Extend Variscite carrier board descriptions
    (no matching commit)
  - [v5,10/13] ARM: dts: imx6ul: Share Variscite PHY clock and update PHY options
    (no matching commit)
  - [v5,11/13] ARM: dts: imx6ul: Add Variscite i.MX6UL board variants
    (no matching commit)
  - [v5,12/13] ARM: dts: imx6ull: Add Variscite i.MX6ULL board variants
    (no matching commit)
  - [v5,13/13] ARM: dts: imx6ulz: Add Variscite i.MX6ULZ board variants
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



