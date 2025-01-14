Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9E3C02187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 00:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ows9fxQ6w2ckFKFCGen0ggdwFhqcknQQA6+yfxi0nP8=; b=BdTaUgQ8grody0O489gQTdDY2b
	vZssJ4ZpXJsCWEj/9jr5c/200/EC7QQ5mLvWLo/3Gu3A8eDj47bEZcNzPQx6eQaNGUoxjG4Pvz45z
	J350tyAmkEz52CC4HuNLeQZ3RFECMNrJ3kbcLCnOCsEqt/tlIV2ABwbW5ZwtGFxMKv9T9Gg3U+tIs
	I7ibWZpwr7a08vAq1rtuXre0HsyBB6dxsPF1StM2d4WqPVJA086PlyAYkmPKK5yUs5Va3a/2HKXu0
	LKRn9b+l10XboCZAqaoQzgJ3kYven7LA7Hs+giwYjI5nehyxLCUBQSliWR7yfLltOScP/QDByiBCe
	NOiZSXpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXrKi-0000000ACx9-2ENX;
	Wed, 15 Jan 2025 00:32:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXptU-0000000A0k0-0OOX;
	Tue, 14 Jan 2025 23:00:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8CCFE5C5A36;
	Tue, 14 Jan 2025 22:59:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6275C4CEE1;
	Tue, 14 Jan 2025 23:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736895618;
	bh=D5byHkrsv5SQKGj+WNn8RIZStWX8kI1/PrV5PEzZm0A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=quIcSx7cgD9A0L0E/uqHwoCdImsh9ACOP++R5pFgHKNafz+KOv0mwHJEPYQF3bW6G
	 qnrNyhNrh2e8RFl2eINBY/KgYhslh8JU+ltk3f6fm0YPtImVEsc6ZbQ/sBK7cb5nPI
	 26Lv8hjZku8e0P0a+/bNrvuu34V7B2pih16SKkl61kqTWyKnIPnA+UoXymheUljAVV
	 E67N09LHwf/AZSXnPqEE83eVvbs4jrd7FgOrEPM4Zsiu341YhtkZ7tw1Y1m735oaYl
	 fsbp4J+yy4b0dTugw/+xhTPAgE5rvf2BPDUwv/Wkqpo++RfTl3i4Wq3OdyaXAQ3r2C
	 XeG0w/NzVljeg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE4F380AA5F;
	Tue, 14 Jan 2025 23:00:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: airoha: Enforce ETS Qdisc priomap
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173689564173.170851.2258072492624534440.git-patchwork-notify@kernel.org>
Date: Tue, 14 Jan 2025 23:00:41 +0000
References: <20250112-airoha_ets_priomap-v1-1-fb616de159ba@kernel.org>
In-Reply-To: <20250112-airoha_ets_priomap-v1-1-fb616de159ba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: nbd@nbd.name, sean.wang@mediatek.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, dcaratti@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_150020_176244_C670F4A0 
X-CRM114-Status: UNSURE (   6.62  )
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 12 Jan 2025 19:32:45 +0100 you wrote:
> EN7581 SoC supports fixed QoS band priority where WRR queues have lowest
> priorities with respect to SP ones.
> E.g: WRR0, WRR1, .., WRRm, SP0, SP1, .., SPn
> 
> Enforce ETS Qdisc priomap according to the hw capabilities.
> 
> Suggested-by: Davide Caratti <dcaratti@redhat.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net-next] net: airoha: Enforce ETS Qdisc priomap
    https://git.kernel.org/netdev/net-next/c/b56e4d660a96

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



