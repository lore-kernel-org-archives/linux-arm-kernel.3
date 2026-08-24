Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4046C5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 18:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VC4G+XqTAfrFRT64hospUFqXl0HFoiSRWtgAhJL/a7Q=; b=gEz7AHOwb8/qWljKDTUifDbt67
	luk9ucJpuwwmYuTdqz+7ZJr8hOFVHYuBs3I9H+S+zHFkFlkmseYBW6Rpph3NQtL3MkuVrNpZTqsKC
	bMV40Aw0ulfbNBnU+CFfhAXn1merxj0j+md2FUgYIDvcZHJzzs7MQ6486H+gHG+MqScrslbQj2nZn
	ptW2cLh25DIiKJ7Lre/Rjl3970bbK9oRT19DT1REy26nAbUwrGr9FnAZc/HKdLTMtFFhiYZJvQzyO
	rAb/YM2tiBuA1GW/Nyt5CWxK/Xz0eyzy9WGPDMxPOxCLv/i130y8KRftJr8XnCygfru0UO/S06znZ
	i7p9fGcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyZII-0000000HFVu-0m2f;
	Mon, 24 Aug 2026 18:21:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyZI9-0000000HFU2-1nLm;
	Mon, 24 Aug 2026 18:21:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CE21143B8B;
	Mon, 24 Aug 2026 18:21:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF6FA1F000E9;
	Mon, 24 Aug 2026 18:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787595664;
	bh=VC4G+XqTAfrFRT64hospUFqXl0HFoiSRWtgAhJL/a7Q=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=asWIVPnDJTek2DU4bX3bTdXnsGHKhQxERRvr5tTvYCyhEWPtoUjvefBo1gyS1UW0c
	 qme9iVwF6OuNAv4rALq0+Yfbe8SiiVdJ8RTdEsOiFgTFIKUPGg9DcUoFYrSVzvtMkv
	 AccRbe9dGSIBTIwycaqHVW21yHOuY5/ZutfX58TL0zVHMMJydHLoIdRSSjHQCT++HR
	 AOP1axogqC8H9N5vYkOAO+mryC5l1cVUCqP7Q8RRf720hk4w1MO6WT0fqsNtPta5fZ
	 lyIuDqzXTu8HFeEeJvbuF1JW2MIREZJaMdP5TI7wCJeO3fzNmW2bXdMyxMF9IhV2su
	 R5dLvVnF8MjAQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 727BB3924A4C;
	Mon, 24 Aug 2026 18:20:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: ethernet: mtk_wed: increase WED v2 WDMA RESV_BUFF to
 0x80
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178759561210.3051903.7350962309805353332.git-patchwork-notify@kernel.org>
Date: Mon, 24 Aug 2026 18:20:12 +0000
References: <OSZPR01MB779537889255E2F606E47EABBCA52@OSZPR01MB7795.jpnprd01.prod.outlook.com>
In-Reply-To: <OSZPR01MB779537889255E2F606E47EABBCA52@OSZPR01MB7795.jpnprd01.prod.outlook.com>
To: Shiji Yang <yangshiji66@outlook.com>
Cc: netdev@vger.kernel.org, rex.lu@mediatek.com, nbd@nbd.name,
 lorenzo@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
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

On Wed, 19 Aug 2026 21:07:07 +0800 you wrote:
> Change WDMA RESV_BUFF from 0x40 to 0x80 to avoid CDM TX FIFO overflow.
> Without this patch mt7986 and mt7981 may have WDMA TX hang issue. This
> patch was pulled from mtk-openwrt-feeds GPL open source project.
> 
> Link: https://github.com/mediatek/mtk-openwrt-feeds/commit/07c87502e854b68b48544d101b6fe17ec059b97b
> Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
> 
> [...]

Here is the summary with links:
  - net: ethernet: mtk_wed: increase WED v2 WDMA RESV_BUFF to 0x80
    https://git.kernel.org/netdev/net/c/c0ef04232f9f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



