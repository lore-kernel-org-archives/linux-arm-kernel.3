Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A965C982CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 02:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=li15oYlICv8i8lV73C2z5ZeiWResEhyWp7ANMJzmvVw=; b=Fw8AjhOOcygEbqgQEmcOGWQP/j
	gAv0MmZuRx0L7zrUJ8+PRFAkBFJFHYzhF145H6GPIv7LQM/Ueooz0N0oaVElGJSE8Sks/XyLhpGCB
	SAq4mK10qHQDvs2QhBWjHCaBoMyLBk8+qzjNsqPvmxMOCMaZuUU10VsaLcEb7wWcyjkX1dSGsLKfF
	6GSJLWtaIiZ3t/Cjpnzoa49qU3znTrHRzEjRGu5YvgTuFY1rAr9krQArSdjcn/tpFLoY5RiGZuc4c
	3t0eIrdEP0TFSpfKOjMinxH67/mbXAl8+j0UfCHUMj/HJs+U4gd734qkj0hW+lR94FMTQngm9pIll
	xJWuyaPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x71kZ-0000000ASIy-2l2r;
	Thu, 17 Sep 2026 02:21:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x71kY-0000000ASIs-0X8w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 02:21:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CDF26602C5;
	Thu, 17 Sep 2026 02:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 847D01F000FF;
	Thu, 17 Sep 2026 02:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789611680;
	bh=li15oYlICv8i8lV73C2z5ZeiWResEhyWp7ANMJzmvVw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=jJFg83k/QimEjwIwIdCO3QX3CR6n8s7nMOdUg42L7OhXQkihh9KQNbM7IN7/cgShB
	 Wj8hPRIL+aftxB9QkeihBOstPqdcNkS0grc5Cl8i/AXWvajOe7GQ7ToRw9Dd/If1Ay
	 2jziUUU0zVVbFSkygAD7tYpvPuSHHoCe1o2SZkNJvI0BO7pf7OuQZ1Ke3R9QPovSFX
	 jq088U6pYWRZpWS/Gnn1Q0DBc/IS3v1RVQXQxzU6mlRf9Vht/2U4ctdFDz/UGfDRT3
	 d7LZCcF2TlaqPJmmMiPqvWeSUqCcXr6GgT+oQFLehufYRnLf1Z8/KRAMdNlh24cDyQ
	 jZhfdwz1pyKVg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93C2A39E9609;
	Thu, 17 Sep 2026 02:20:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v3 0/2] net: stmmac: restore previous state if
 tc_setup_dwmac510_mqprio() fails
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178961161438.3379718.7817224106290688172.git-patchwork-notify@kernel.org>
Date: Thu, 17 Sep 2026 02:20:14 +0000
References: <20260911-stmmac-tc_setup_dwmac510_mqprio-error-path-v3-0-a76b1e2547c1@oss.qualcomm.com>
In-Reply-To: <20260911-stmmac-tc_setup_dwmac510_mqprio-error-path-v3-0-a76b1e2547c1@oss.qualcomm.com>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 0x1207@gmail.com,
 olteanv@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
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

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 11 Sep 2026 10:58:28 +0200 you wrote:
> Restore previous mqprio qdisc configuration if
> tc_setup_dwmac510_mqprio() fails running the following configuration:
> 
>   $tc qdisc add dev eth0 root handle 1: mqprio queues 2@0 2@2
>   $tc qdisc replace dev eth0 root handle 2: mqprio queues 2@0 2@2 fp E P
> 
> Propagate FPE preemption-class mapping errors in
> tc_setup_dwmac510_mqprio() and tc_taprio_configure().
> 
> [...]

Here is the summary with links:
  - [net,v3,1/2] net: stmmac: propagate FPE preemption-class mapping errors
    https://git.kernel.org/netdev/net/c/90e4b849dfa6
  - [net,v3,2/2] net: stmmac: preserve real_num_tx_queues on mqprio setup failure
    https://git.kernel.org/netdev/net/c/02fffd1939f6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



