Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467B2C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 11:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bm2dXKLp3LTMDc8Qpu6pqZp/K1dyJwz6AZGGD6z8t/M=; b=Vecdaz59YnT/GAMTtRZPEZJAsb
	x4K1GlC0w7EkBPSlfHu5mxwMZpS9ahmqC1Rs+WB0NSExsjmiWiN1bi+rtgTUI5iALBKDJynxntSP8
	RTX9Opj4oXRO5HRj3A3sY9JTsgDGmabOHGaueZm78bV8cra1cVZuc1UV8dCV7uHiOsBFxaGsuE8cu
	l8lakT2bjBz59U3V+xSBGw13sz+0y1Rd85Elbs+sMpztUQNjV2PAsan/QivWmKS69AffpyNHA2LWv
	HalyFtFfmXwCeH5AB8OVa9Q2n2RcREJuOjy52LUzN1Ckm5QkOGM1jaDZriozBMoBF5TsgmNSXEDhS
	JewNj08Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx2ot-00000005hPe-1lkj;
	Tue, 25 Mar 2025 11:51:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx2n9-00000005h9j-44hZ;
	Tue, 25 Mar 2025 11:50:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 61FD15C4BC9;
	Tue, 25 Mar 2025 11:47:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08523C4CEE4;
	Tue, 25 Mar 2025 11:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742903399;
	bh=ZZdZYmOj1ovGoh5945Z2dttRqyMKc3WTfbIx0vwUbGU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gGJRZLy1WGT9Tlf+yIt17XTtbRhH1gW691Kv6DYWjKAY4BItY+DhyvHWMw5kkvaoL
	 KKsPEXE9qRjWO3l1qgg7swuhUQzYBPxB1XcIvus+PE/QNvk+bvElBA9WlxrowNC+3J
	 Y/E1Rxuk9kjweHN8UdkGlc5m2rSLwZIvT/4rpNOvPNwFhbJQndITX5eMQtV83H0FeO
	 S6YgvuRJjN/6+ry/NbXtK79Sr+qsVpn1E7JVmhX4DfDtQ5yTeMmIqsK6sizO53MYAZ
	 txFuebDaPwmCa22+MNq5Qg9wExdULRD/Zznoan+rsGvmEgpC921giO5iaFVjMikx8c
	 dcr43+rM0WDCQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71530380CFE7;
	Tue, 25 Mar 2025 11:50:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/7] net: xdp: Add missing metadata support for
 some xdp drvs
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174290343526.531918.1341302638467898392.git-patchwork-notify@kernel.org>
Date: Tue, 25 Mar 2025 11:50:35 +0000
References: <20250318-mvneta-xdp-meta-v2-0-b6075778f61f@kernel.org>
In-Reply-To: <20250318-mvneta-xdp-meta-v2-0-b6075778f61f@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: marcin.s.wojtas@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 linux@armlinux.org.uk, ilias.apalodimas@linaro.org,
 kojima.masahisa@socionext.com, sgoutham@marvell.com, gakula@marvell.com,
 sbhatta@marvell.com, hkelam@marvell.com, bbhushan2@marvell.com, nbd@nbd.name,
 sean.wang@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, kys@microsoft.com,
 haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
 s-vadapalli@ti.com, rogerq@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-hyperv@vger.kernel.org,
 linux-omap@vger.kernel.org, michal.kubiak@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_045000_064088_469DE20A 
X-CRM114-Status: GOOD (  10.42  )
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

On Tue, 18 Mar 2025 12:46:04 +0100 you wrote:
> Introduce missing metadata support for some xdp drivers setting metadata
> size building the skb from xdp_buff.
> Please note most of the drivers are just compile tested.
> 
> ---
> Changes in v2:
> - Improve commit logs for each patch specifying xdp headroom size for
>   each modified driver.
> - Link to v1: https://lore.kernel.org/r/20250311-mvneta-xdp-meta-v1-0-36cf1c99790e@kernel.org
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/7] net: mvneta: Add metadata support for xdp mode
    https://git.kernel.org/netdev/net-next/c/07b2fbffaaea
  - [net-next,v2,2/7] net: mvpp2: Add metadata support for xdp mode
    https://git.kernel.org/netdev/net-next/c/9a45e193c88a
  - [net-next,v2,3/7] net: netsec: Add metadata support for xdp mode
    https://git.kernel.org/netdev/net-next/c/a5fec3c88142
  - [net-next,v2,4/7] net: octeontx2: Add metadata support for xdp mode
    https://git.kernel.org/netdev/net-next/c/33bfff8fc8ba
  - [net-next,v2,5/7] net: ethernet: mediatek: Add metadata support for xdp mode
    https://git.kernel.org/netdev/net-next/c/74fb1346bc77
  - [net-next,v2,6/7] net: mana: Add metadata support for xdp mode
    https://git.kernel.org/netdev/net-next/c/c313d35f60c1
  - [net-next,v2,7/7] net: ti: cpsw: Add metadata support for xdp mode
    https://git.kernel.org/netdev/net-next/c/b3a54be70ca6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



