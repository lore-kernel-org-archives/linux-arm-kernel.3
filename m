Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E7BACDB471
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 20:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AMcpquJMVliWCyVZpJVdP+uhF1fM/B/VVl+0HBiNrFY=; b=AnZrboFywcnfnfeHHnJtUDPD2H
	0clcIFjoHHF5zyVdpu7woUYXxaHltJ9kkF5JaNw0pLA1msFMEX8MKfOY0GsBshO9YOcQVVx2MG//T
	JHwVqMxbmGii8UuCFUd4OSoXFRifKc599nVEwH+uy3WZUWTx0Wlry2KHQ1UOAqmRU1iDzugI/4OEP
	RXnSwaakjNWBdggRo9wKi0O3bAIsuEL+54/UTBin/KXZgaRR1T/HxaUYqe2PeO15DI6CN2ezKIPOi
	r2mS9un0xPO5el+bxSR0TFxnqvvPBorlwKJo3SM7hGBHy8j9uJyl2BysmQb5m0uv4jHRPyAwAQ77l
	ZNX0geTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7uy-00000006rJA-06or;
	Tue, 23 Jun 2026 20:40:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7uw-00000006rIw-3aOZ;
	Tue, 23 Jun 2026 20:40:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EE362601D6;
	Tue, 23 Jun 2026 20:40:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2E041F000E9;
	Tue, 23 Jun 2026 20:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782247221;
	bh=AMcpquJMVliWCyVZpJVdP+uhF1fM/B/VVl+0HBiNrFY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=BkKCGoEO1hf3YhviPT1C0bP64ZqgQsZrhgVcMF4kWb6E1AiTeKELbfYTqw60uH921
	 2tWluMaDcn8Af9ijoAvovMewR+9AM8EucJ71jDxPr35ogKyycGLxbxyjBpLXnJdqYZ
	 FOhXCamRTtkP4CvMp4E+nwN+iZe4x3c1D++WkCs8P1N/iPf0j67dYYNNzTWdvY1ZKR
	 E+nP+5HzW6Xu+5KCX4Nhj24RyLKYp4vtO+0M+UTXoe78kryuGbsK0LbEDubAVr+LUW
	 MO/dzhnjTL4rdGenFKQeT59s30Z/uK1Hae8uYi3KLvpTGK7zpP3y4/y8aaoXtFM/TU
	 pEL1k50X6lkWQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 568D43931005;
	Tue, 23 Jun 2026 20:40:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 net] net: airoha: Fix TX scheduler queue mask loop
 upper
 bound
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178224721075.2409533.1841899511926101005.git-patchwork-notify@kernel.org>
Date: Tue, 23 Jun 2026 20:40:10 +0000
References: <178187479434.2400840.1312143943526335838@gmail.com>
In-Reply-To: <178187479434.2400840.1312143943526335838@gmail.com>
To: Wayen Yan <win847@gmail.com>
Cc: netdev@vger.kernel.org, lorenzo@kernel.org, horms@kernel.org,
 pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
 andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
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

On Fri, 19 Jun 2026 21:12:06 +0800 you wrote:
> In airoha_qdma_set_chan_tx_sched(), the loop clearing queue mask was
> using AIROHA_NUM_TX_RING (32) instead of AIROHA_NUM_QOS_QUEUES (8).
> 
> Each channel has 8 queues, and TXQ_DISABLE_CHAN_QUEUE_MASK(channel, i)
> computes BIT(i + (channel * 8)). With i ranging 0..31, this causes:
> - channel 0: clears bit 0..31 (all 4 channels) instead of 0..7
> - channel 1: clears bit 8..31 (channels 1-3) instead of 8..15
> - channel 2: clears bit 16..31 (channels 2-3) instead of 16..23
> - channel 3: clears bit 24..31 (channel 3 only) - correct by accident
> 
> [...]

Here is the summary with links:
  - [v3,net] net: airoha: Fix TX scheduler queue mask loop upper bound
    https://git.kernel.org/netdev/net/c/245043dfc210

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



