Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B296AE937E6
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 21:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K+Dwia5F1fROPOiEKHIdoK6R/eAU4mV4nLaqB+VcWLY=; b=Ptec3lf/H27DiwDdgnIa7w5zw4
	js3hcY1Obu6ZMUqOSOO1XsHB3m4MD2iAYBjsGr0Q7TtI5Q89aEo+VWspXwcpPM4D2GaCYX3looGl2
	cGohz4nRG2JKbczP4rkOzTH+38PdfD8eu3OB5Qi9pPRzmo1iK/iFAQq8f6EtwhwqyDR7yM+/ULrA8
	MSUWtu1y6RKbx83Ir9yrHFrPK4Y6hY4ZD5PtCCaTMMtukPoCcoN+eyaIiZk6KDxq9d9uEkxaHRdyJ
	I0Xdt23pu5Rqgzei+B+LWMzo+71BY98cAh2AYyN9W3MEp+SLp8hCRwDi4ctIbbHBqaXO4G7pn/dZ+
	kAU0fbgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC1vH-0000000EgZA-0EgH;
	Sun, 12 Apr 2026 21:00:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC1vE-0000000EgYc-2BLD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 21:00:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 394E46132D;
	Sun, 12 Apr 2026 21:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDB71C2BCB1;
	Sun, 12 Apr 2026 21:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776027646;
	bh=0kkJrf/sN/KJLKD6+Jn3pIHPTyPnQFMi7rT5ASifeck=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Of/8gkvDKzLvqeqmi3RpmPjplsfAiGHyiFtQ7k9pY8OvPRasn+GfTas3tnW/92VUJ
	 4dQyC90LklTrT/QvQ6nyN7fZIBH1r9nvvTbGVj7IZPp/2pkkSuU7/c7e82KwHNcu9A
	 bXHXJZ0+ij3WllG5yGP9fnhWJQQK35bGnLkb6Oz9wRQJxqYRViZye2HimjimGWyc2f
	 haIN/B9W5J0TjB+TacJAnM19QBnlbLD8hnb3hnDYPOMaN8T71Dd823m8IKfDnl33fG
	 nDAq2I4nBveMUcmrKvQtVYpuazWBXYnW3ETDr+CvP2YZUgFyifHZZEqpsEyZFPEt9r
	 ShHx06a3EmAyg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CD403809A8C;
	Sun, 12 Apr 2026 21:00:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/3] arm64: dts: imx8dxl: Add SolidRun SoM and
 HummingBoard
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177602761904.3408407.18432734570452504880.git-patchwork-notify@kernel.org>
Date: Sun, 12 Apr 2026 21:00:19 +0000
References: <20260409-imx8dxl-sr-som-v2-0-83ff20629ba0@solid-run.com>
In-Reply-To: <20260409-imx8dxl-sr-som-v2-0-83ff20629ba0@solid-run.com>
To: Josua Mayer <josua@solid-run.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 yazan.shhady@solid-run.com, mikhail.anikin@solid-run.com, ada@thorsis.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 vladimir.oltean@nxp.com, conor.dooley@microchip.com, krzk@kernel.org,
 netdev@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com
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

On Thu, 09 Apr 2026 14:34:32 +0200 you wrote:
> Add bindings and description for SolidRUn i.MX8DXL based SoM and
> HummingBoard Telematics.
> 
> Modify SJA1110 Ethernet Switch bindings to allow SPI Mode 0.
> 
> This patch-set is based on v7.0-rc2, because rc1 was experiencing
> deadlocks with imx8qxp clock driver.
> 
> [...]

Here is the summary with links:
  - [v2,1/3] dt-bindings: net: dsa: nxp,sja1105: make spi-cpol optional for sja1110
    https://git.kernel.org/netdev/net-next/c/600f01dc4bd0
  - [v2,2/3] dt-bindings: arm: fsl: Add SolidRun i.MX8DXL SoM and HummingBoard
    (no matching commit)
  - [v2,3/3] arm64: dts: imx8dxl: Add SolidRun SoM and HummingBoard
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



