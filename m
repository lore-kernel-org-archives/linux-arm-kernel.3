Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED9FD11190
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 21:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JUsKDV5dqV96b7D8Z93Tufo2CdOkGjE+eqUl38SJ3J8=; b=PBXvPPhFS6p0RIbeuHkns2n/D5
	IYbnluOcwci70dvVu0OHI+oxbTeikRJTlAHNLZfTHNgJE28Jp5Z0p3pmUi6I+6fzPnL4c4AYH8o7A
	BbG5uvPvCdykA1uGaHcYPvrCm9PR2SN5PkXWHvcGJBJLiECFDBjFybaM82/pL/ef87wyH0NON6mjG
	Ytb6+Uw4xB30i1s4Ee+75nR6Vll/4z1jrygZS63/2lyV/hXrzd7yoCLh0WhmmpEqc1oxYeAZLWQhj
	FmQajYq7/3nZQoAVeiz6ptslOQnlVZhTdRawUYnG65ZsFMRt3hniuBetM3DjxgKkyd/JvQlmyF3US
	5pbOpPUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7hji-0000000C2Fz-0m2o;
	Sun, 03 Nov 2024 21:02:14 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7hi0-0000000C1si-2Zpd;
	Sun, 03 Nov 2024 21:00:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8B056A41E33;
	Sun,  3 Nov 2024 20:58:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7961CC4CED3;
	Sun,  3 Nov 2024 21:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730667627;
	bh=4C8C8egVXHHPt9+3j41NEQ0VIgG4HvQ9pgQ+iqbD97I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=a9sf8l5GhAVXrZ9kCg1EK1L9HzgRkc29lMLTp6Z2wPR3LiFlH2wwe5MFGKcFmGMjE
	 HLeMYbsFLH2qFcE7UYIBmNR+rRQTmNLw4go8JJzc2cUC/ik9h+Quw2e+8I8Z6VODCI
	 KlKMTa2ikVGJthHB0EkZL9NP5RWzmm/r/vO0v5BQIWC0l4CDTVnsLfjcX2JgOkTlnM
	 g+iv0wyE3H8h5Xhc/JvPEjr2/PWEz2pVAsVlIXiwHb70UI8v+q8TcjGDcV1dseb3MQ
	 tNEIsUaGd3KP9DmciGQolGttt9wwEFLcV+0tWlm8x3yPjia2zx21aF53sQxu62vrGH
	 NqHZW066umzQQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33DAB38363C3;
	Sun,  3 Nov 2024 21:00:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: dsa: mt7530: Add TBF qdisc offload
 support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173066763598.3253460.11329332225402731134.git-patchwork-notify@kernel.org>
Date: Sun, 03 Nov 2024 21:00:35 +0000
References: <20241031-mt7530-tc-offload-v2-1-cb242ad954a0@kernel.org>
In-Reply-To: <20241031-mt7530-tc-offload-v2-1-cb242ad954a0@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: arinc.unal@arinc9.com, daniel@makrotopia.org, dqfext@gmail.com,
 sean.wang@mediatek.com, andrew@lunn.ch, f.fainelli@gmail.com,
 olteanv@gmail.com, davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_130028_737690_FA1E4CDD 
X-CRM114-Status: UNSURE (   6.96  )
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

On Thu, 31 Oct 2024 15:28:18 +0100 you wrote:
> Introduce port_setup_tc callback in mt7530 dsa driver in order to enable
> dsa ports rate shaping via hw Token Bucket Filter (TBF) for hw switched
> traffic.
> 
> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: dsa: mt7530: Add TBF qdisc offload support
    https://git.kernel.org/netdev/net-next/c/2e570cd187e3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



