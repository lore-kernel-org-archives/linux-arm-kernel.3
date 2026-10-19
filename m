Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D5DCCF2DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 13:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hq4TxYElKFWdoI1/k3xWmiLfjsbCVTluQCz28pFbtlc=; b=2iPu3k4V/+rmNJcljp2333P0Le
	Zz4vBTZInAdQSo8LjAqz/NjB9jBHfJry7c1K1QYJwp10ZgsYgATaUy/ZbO6KbaPjBkhLeMFaHZ6Ma
	Xk/+XcNcDrwTN+Zz0KzWbeAZXVaxSsrp4ucOD8Hy2yEGYrrlHxTvHmHWsgnaKcprhUluv11KfjI28
	FFdgL4wQDzgrSHGUbVbrj+K6QqzBZfG86N6oOvtNP6Gh3ZGMyxwltLSt/JmFDQOr4qeSRGb+H4XnG
	tiokEvUeLTD43WaToBQrzd2nrZ+megTzwzacUPXMR3eYxWAGTrXIApC4EkY2P/7WGvWx/mwT+4hDF
	ZRvSqT/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xInke-00000007Z5e-3ddH;
	Mon, 19 Oct 2026 13:50:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xInkd-00000007Z5X-47bm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 13:50:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 67C7D43BD5;
	Mon, 19 Oct 2026 13:50:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46C7D1F000C5;
	Mon, 19 Oct 2026 13:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792417807;
	bh=hq4TxYElKFWdoI1/k3xWmiLfjsbCVTluQCz28pFbtlc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=FU+matu8/47ThpqbUiljddUJ3ighPHTBEl9uxkhTLT9VP6UNv93rLzULADUTMrHdP
	 Y4VxZYkLE1Xi8LZZCllwVANoD626cfTlgJcLrpF/Xli7/FGwEoBDzCYia6Ek9NY6Vk
	 NZ8uPq1qFxHBoYmdk9rmFwHpi1K6rrsC1QWc9l/q1fUH2OFel2TChSh6CpMZypfkUp
	 l/CAzuLk3OjLMtS5T5S2ud32d36Gx23gB6xHJ6/YagkTn3jozr1Ho8kk38kfq7rMy3
	 FXXMIMPchR43VoOvTyW+x6UbOFSUMihKjXcOASdltPkVXhHsPofvNobElRCIjQQGKN
	 +j4srvXrGBPvg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A50F3811A5D;
	Mon, 19 Oct 2026 13:50:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/2] stmmac: some XDP fixes in XDP_TX path
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179241780603.2650933.10407717867130544320.git-patchwork-notify@kernel.org>
Date: Mon, 19 Oct 2026 13:50:06 +0000
References: <20261012-stmmac-xdp-tx-pre-fixes-v1-0-05fd0c90f7e1@oss.qualcomm.com>
In-Reply-To: <20261012-stmmac-xdp-tx-pre-fixes-v1-0-05fd0c90f7e1@oss.qualcomm.com>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, boon.leong.ong@intel.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
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

On Mon, 12 Oct 2026 17:24:38 +0200 you wrote:
> - Fix page address lookup for compound pages in XDP_TX path.
> - Disable TX checksum offload for jumbo frames in XDP_TX path.
> 
> ---
> Lorenzo Bianconi (2):
>       net: stmmac: fix XDP TX DMA address for compound RX pages
>       net: stmmac: disable TX checksum offload for jumbo frames on bugged cores
> 
> [...]

Here is the summary with links:
  - [net-next,1/2] net: stmmac: fix XDP TX DMA address for compound RX pages
    https://git.kernel.org/netdev/net-next/c/2d5c08ec1532
  - [net-next,2/2] net: stmmac: disable TX checksum offload for jumbo frames on bugged cores
    https://git.kernel.org/netdev/net-next/c/667a375a5294

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



