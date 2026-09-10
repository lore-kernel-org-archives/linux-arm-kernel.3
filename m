Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D90AC79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 02:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mx6UGT3LIpnPAYN185YxCNFaJMqNkLiz8yLgGMh8ifo=; b=J3AuE6qa+AG75yUucfGG4q4NSU
	DHpklR4l1LyOJdZePOC3yufsG9dbmCC/EBnztMVQzYUGiCEfBAAAbl1KiTVoFOQYzfyDGZFyMicpz
	9iAdb968g+nL335JmsorCLrCaSTqjMo+IYAsBQ5dD7fgLo/1NC3Duo3yyh9vfUDkKw3878CzRiOjd
	l2VrCjeujdqZOtBW8CSsNQF6by/1xc2fnG//oyn3IAa87JBU+47/VCWw39o3KC5X8AUs3zmKH65xL
	v3RfXE1n52NmqeUVrgwdJMhbjd9qxoL0i/xZL35oZBgsBkRpbL5w8LK8GhT+yLdMWPFCYPAdOENLV
	2WiCbyQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4UZB-0000000DFFc-2qyo;
	Thu, 10 Sep 2026 02:31:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4UZA-0000000DFFN-01y0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 02:31:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 29090600CB;
	Thu, 10 Sep 2026 02:31:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D43871F000FF;
	Thu, 10 Sep 2026 02:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789007466;
	bh=mx6UGT3LIpnPAYN185YxCNFaJMqNkLiz8yLgGMh8ifo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=C28JvL1HLKvUb4uqaRKfCWYegoGE3ScjbNlK+WEdzvZ+/Dc3yBsTwZhtogX0LqHu/
	 63s+3GlX0wvjmgSoib69EbcPv86/wGYAr8k/bwXeb0HghHidF6VWeOMRB7NddmAFvK
	 Gg164kk0fIcqYksPLUz8CAepaewaoCwbQUOMv/03hilmJtlWdoNzigru0e6x3LbJ2A
	 6mQG0OUMEElReJiUpgX+BYU4reQL+CR2Zg49ZHonIwsNgCV4Oxvvdth79oJWDzAUi+
	 8/d2EE62tJxqKYiU7PgfDHpS2yXsy/U9rgm/hJo9msjf2hz6pE2hJ1PMhctcVXYeie
	 //9nvbRHwdEgw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0C3A380CEC7;
	Thu, 10 Sep 2026 02:30:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: stmmac: initialize ptp_lock at probe time
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178900740464.1158570.11551563086535432629.git-patchwork-notify@kernel.org>
Date: Thu, 10 Sep 2026 02:30:04 +0000
References: <20260904-stmmac-fix-ptp-clock-init-v1-1-df70eb1eb04d@oss.qualcomm.com>
In-Reply-To: <20260904-stmmac-fix-ptp-clock-init-v1-1-df70eb1eb04d@oss.qualcomm.com>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 richardcochran@gmail.com, Jose.Abreu@synopsys.com, netdev@vger.kernel.org,
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 04 Sep 2026 12:32:55 +0200 you wrote:
> priv->ptp_lock is only initialized in stmmac_ptp_register(), which runs
> during __stmmac_open(). However, the lock is also used while the
> interface is down and has never been opened: tc_taprio_configure()
> invokes the PTP gettime64() callback to compute the EST base time when
> offloading a TAPRIO schedule, and stmmac_get_time() takes
> priv->ptp_lock. Using an uninitialized rwlock is undefined behaviour.
> Move the rwlock_init() to __stmmac_dvr_probe(), together with the other
> private locks, so that ptp_lock is always valid regardless of the
> interface state.
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: initialize ptp_lock at probe time
    https://git.kernel.org/netdev/net/c/0338c68e22ab

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



