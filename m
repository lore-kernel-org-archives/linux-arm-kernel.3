Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5202C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 15:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+r9/FyBsy8/jgfY/gOegZKB/ya2zFVA1MGqKZ4aNDJg=; b=dMoh+kxk1Kr3epofX9DHLncNaO
	pJr1c6mf6oIkSxxrtYHQ2jGBLFDYHLoSIUXnZ/xswQ4u3iYWU7qHS6Puxr8xQE/LCbUMm1P9jiJJ3
	afbuAXs13t8E27VMP7LE/CkVsGAczwE3iRFQddoyogtIz8eK9FVX/jGJ4DMEjNtbKplS3Py8yikHp
	Cnc69dB5BoiwDzihVu0KNRVCC/hlDh8ShBMnITEpth4kxZ2K/SUkgYRZ7XY8IP78nLOkJYCG1LR18
	j2+h9OdiZSEUoRzjCJf44DnPYzYnLyb/js0QyEljBdwGrpGETYEyWNQLSS4pB5BBOkDJfQzNhJAq6
	cLB5AqwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuYRu-00000006HdY-43Qc;
	Tue, 18 Mar 2025 15:01:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuYQB-00000006HF4-2eGS;
	Tue, 18 Mar 2025 15:00:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EB62A5C58BF;
	Tue, 18 Mar 2025 14:57:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8457EC4CEE3;
	Tue, 18 Mar 2025 14:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742309998;
	bh=r0NrzcNDxEAo6t+Xoz4A+ZsjzVa5mHQEjDvSbM8+ItM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Y7BIYDHM86vWww2amj46/mLjgIS9Pd+7uQlOXialHBqRDb8TRbN8eHCTUEXr44qjw
	 aOIsxiBVjuJYca07fp8YJLOmvV2xbFRNjwOTK8w5dGpjOC458+667lzGFnKd2sgF/1
	 MEqYnxpu7gk3iP8HTvN1PWsLX0tL2Uj55mHuE+F3f28JLUTnj9Z4g7dyNsZ3F+4/H6
	 R50JhgxMv4KAL7casbv0AMtCC8Z+tM+JYOUVRCDLWi9HIqN1ZRbUBrCJxUCMly60Ol
	 WGvhYD4LhyMINquvspNJGrgYwK7dKnt2Dl9H9NLPMMwWUBPcz/3jkWkeTnNeNlWhPd
	 3mvxeqCe3WO5Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33FFB380DBE8;
	Tue, 18 Mar 2025 15:00:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/9] net: stmmac: remove unnecessary
 of_get_phy_mode() calls
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174231003400.344268.9977818669398853411.git-patchwork-notify@kernel.org>
Date: Tue, 18 Mar 2025 15:00:34 +0000
References: <Z9FQjQZb0IMaQJ9H@shell.armlinux.org.uk>
In-Reply-To: <Z9FQjQZb0IMaQJ9H@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com,
 wens@csie.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 jernej.skrabec@gmail.com, jbrunet@baylibre.com, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 martin.blumenstingl@googlemail.com, matthias.bgg@gmail.com,
 mcoquelin.stm32@gmail.com, neil.armstrong@linaro.org, netdev@vger.kernel.org,
 pabeni@redhat.com, samuel@sholland.org, vkoul@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_075959_709932_4B2541FF 
X-CRM114-Status: UNSURE (   9.02  )
X-CRM114-Notice: Please train this message.
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

On Wed, 12 Mar 2025 09:14:53 +0000 you wrote:
> Hi,
> 
> This series removes unnecessary of_get_phy_mode() calls from the stmmac
> glue drivers. stmmac_probe_config_dt() / devm_stmmac_probe_config_dt()
> already gets the interface mode using device_get_phy_mode() and stores
> it in plat_dat->phy_interface.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/9] net: stmmac: qcom-ethqos: remove of_get_phy_mode()
    https://git.kernel.org/netdev/net-next/c/8ee1c926f31e
  - [net-next,v2,2/9] net: stmmac: mediatek: remove of_get_phy_mode()
    https://git.kernel.org/netdev/net-next/c/46f84d700cb8
  - [net-next,v2,3/9] net: stmmac: anarion: remove of_get_phy_mode()
    https://git.kernel.org/netdev/net-next/c/e3ef12172a83
  - [net-next,v2,4/9] net: stmmac: ipq806x: remove of_get_phy_mode()
    https://git.kernel.org/netdev/net-next/c/f07cb4b4b481
  - [net-next,v2,5/9] net: stmmac: meson8b: remove of_get_phy_mode()
    https://git.kernel.org/netdev/net-next/c/3e5833060efb
  - [net-next,v2,6/9] net: stmmac: rk: remove of_get_phy_mode()
    https://git.kernel.org/netdev/net-next/c/9886718ad1c5
  - [net-next,v2,7/9] net: stmmac: sti: remove of_get_phy_mode()
    https://git.kernel.org/netdev/net-next/c/3e2858bb3f59
  - [net-next,v2,8/9] net: stmmac: sun8i: remove of_get_phy_mode()
    https://git.kernel.org/netdev/net-next/c/3d9e9dfce04c
  - [net-next,v2,9/9] net: stmmac: sunxi: remove of_get_phy_mode()
    https://git.kernel.org/netdev/net-next/c/00d2c3c07124

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



