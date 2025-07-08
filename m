Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B0EC71130
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 02:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lqoiz7JKe2bwCGrajjGYlNpaIerXx0K/hhQdRv38jYY=; b=PHhzLrRFsSvpEzGHs8OKeMexUm
	RfjaqAzgyYvLGhcq0RITocKYxME49XnVHBdSu3CGao9hu2JbY246fXkoJsHumOCyXwvCHMZtK2JNs
	5qcs6RKpiKSW2nwybLwspHWz6JI27eYDzwPZQ2V/BqYnba4xPTYa3UGYONUjNfZyM2vcSciwWi4ex
	tZZq23p3r1OnOQeskTS3Dc52RIC7YZbcyouFReO/lyXsw4nHxBVMm7bwAIUH3Jv3sByAJmQOpJkLl
	T/YucClz031NV9XBqFhnZMNmNFNicypKKW5jdhRbrvj323LLX7Z+vbh3u8QZwt6o3sWM/cjL86LbV
	06GCLYhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYxww-000000044bE-2eXb;
	Tue, 08 Jul 2025 02:20:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYxmo-000000042pz-31DC;
	Tue, 08 Jul 2025 02:10:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 494D86112E;
	Tue,  8 Jul 2025 02:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECC5AC4CEE3;
	Tue,  8 Jul 2025 02:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751940620;
	bh=bXK8Vbo1zdACd3ZW/ULDyQH1f9e6jRdr9Mb4rY6CHgM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=UP6Ty18x4RGP9fOidquag4eQonfL5u8sVJ5F2600jcB8s+SSm/b0FHOx8Wi1VMdBI
	 L+Hsf5CpZjkE5Eh23vxkt8oUtL4zvvX2nsDEh0bAbmIetQBIG14XNd5CJpaUW52zkQ
	 uAnaeONVQKyHe13oWoFDvYYD2P9g1xgRPLukxQ9rR6fnzNn0N24aQ0o2SdgOO7OcCw
	 kBiS+ljohGllM9rftHfO8D8m/VFMlXAbk8QObNFQ/20l7JRGChMR9McKxoOsPCPuXr
	 8y3j/vj/bQZzq/OuF4e+tvckWjPn+CdD/38vb38gC0TFaFiARTIeZFpksM3lYZcdlx
	 9PCWqFANoCxww==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3402A38111DD;
	Tue,  8 Jul 2025 02:10:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v5 0/3] net: ethernet: mtk_eth_soc: improve
 device
 tree handling
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175194064274.3543842.9948316724629188569.git-patchwork-notify@kernel.org>
Date: Tue, 08 Jul 2025 02:10:42 +0000
References: <cover.1751461762.git.daniel@makrotopia.org>
In-Reply-To: <cover.1751461762.git.daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: nbd@nbd.name, frank-w@public-files.de, ericwouds@gmail.com,
 eladwf@gmail.com, bc-bocun.chen@mediatek.com, skylake.huang@mediatek.com,
 sean.wang@mediatek.com, lorenzo@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
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

On Wed, 2 Jul 2025 14:14:20 +0100 you wrote:
> This series further improves the mtk_eth_soc driver in preparation to
> complete upstream support for the MediaTek MT7988 SoC family.
> 
> Frank Wunderlich's previous attempt to have the ethernet node included
> in mt7988a.dtsi and cover support for MT7988 in the device tree bindings
> was criticized for the way mtk_eth_soc references SRAM in device tree[1].
> 
> [...]

Here is the summary with links:
  - [net-next,v5,1/3] net: ethernet: mtk_eth_soc: improve support for named interrupts
    https://git.kernel.org/netdev/net-next/c/e81d36d48880
  - [net-next,v5,2/3] net: ethernet: mtk_eth_soc: fix kernel-doc comment
    https://git.kernel.org/netdev/net-next/c/d717d32f517f
  - [net-next,v5,3/3] net: ethernet: mtk_eth_soc: use generic allocator for SRAM
    https://git.kernel.org/netdev/net-next/c/04c7aaccdcf6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



