Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7650CC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 22:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ZM8zVW8NtosecpQk7WLlCuFU21DLVenC8HIHvAu3Io=; b=jjzZCW1pGmrZKhZtvEMGj9WuKw
	dk7tBHQmlEO6veCS39OvXHNpAq9trCY8rLgeDHz9vQ40QNEzlVverhDxatgkEqmVSLTHCyN/SBxRJ
	xpzR+zmDqodwuVvcXBY2eLEH6htgy0gII/HuqoefEafIuu/x8NGD5bE79vxWt+LMSF9MGyBiWzSoK
	F1iDbbWGquZhOWFnS1oKlkp+SMHE82D/2gCOGBYlyTSqlRnNi9ONzoX6SCn6F0GtMP/xvtuCteDeJ
	5vjVcBARGxlBG+V+KTCfwHT+bv4HwXlOIbVUidIJ2TZdqWjChptEHt8wDwjfJke8KyDlaYh9B7LTV
	PqqDhaIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9WtD-00000007iNw-0NnX;
	Mon, 28 Apr 2025 22:23:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9WpK-00000007hvQ-3l0E;
	Mon, 28 Apr 2025 22:19:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 275524516C;
	Mon, 28 Apr 2025 22:19:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C0BCC4CEEA;
	Mon, 28 Apr 2025 22:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745878790;
	bh=TxMhwn7cp9w0K/g0g69tL17XWFr1iuc73PU8ZOzh1vs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NuUYy4aUE66I9IE1M+lRnbwMpt9VnTfcHul8i50csGbSqZIItacXLie/5/FuW7l8H
	 lVelmmXsW6zLylokc7yopTAOcuwuVohTWMpvkimOZ8WuSuJbJx6HshS0pcDcpEjqXD
	 94DxjoY3puWJujUcwPseP/5KjGEPzHasoSoZ/sSfMdnN/ePROntkvqRd5FPAVMf/nc
	 T18fhnOyG1V2cEFsk+VQPrDDOKp211bMvx5qgiblD1qcAQTFTdRMF12+NSTjJLjMHI
	 44PnWlfeOcAv+uqj2wXUTlFeCvvzK+CB2lj1reQk9C01HHdus7pCYNbRVVwjzj2qiQ
	 XEkkAMMYGF91A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D213822D43;
	Mon, 28 Apr 2025 22:20:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: sync mtk_clks_source_name
 array
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174587882900.1063939.12238416302643279123.git-patchwork-notify@kernel.org>
Date: Mon, 28 Apr 2025 22:20:29 +0000
References: <d075e706ff1cebc07f9ec666736d0b32782fd487.1745555321.git.daniel@makrotopia.org>
In-Reply-To: <d075e706ff1cebc07f9ec666736d0b32782fd487.1745555321.git.daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: nbd@nbd.name, sean.wang@mediatek.com, lorenzo@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_151950_951540_87344569 
X-CRM114-Status: UNSURE (   9.26  )
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 25 Apr 2025 05:29:53 +0100 you wrote:
> When removing the clock bits for clocks which aren't used by the
> Ethernet driver their names should also have been removed from the
> mtk_clks_source_name array.
> 
> Remove them now as enum mtk_clks_map needs to match the
> mtk_clks_source_name array so the driver can make sure that all required
> clocks are present and correctly name missing clocks.
> 
> [...]

Here is the summary with links:
  - [net] net: ethernet: mtk_eth_soc: sync mtk_clks_source_name array
    https://git.kernel.org/netdev/net/c/8c47d5753a11

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



