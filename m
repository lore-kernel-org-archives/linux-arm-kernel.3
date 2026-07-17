Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D8AC44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 11:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U58275oukP1SolzSMput4gUq2ByL4S8Tv7evc9xcQOY=; b=pcKAPCl1UCA0FqJFKPrBIHn8xa
	sXxTNEG567QDceFjXWkEWiriXNjzLT6fGEMvIKXs5Np1lY52i6gU68Ayts7WWAFnVNfFleL5o2FKu
	bQwKYGCBplSdEKQDpjWAvDZupDt34QsFBfLD971CdoDf5kc5lT/BgBFy9heSCNZU6oXK1kZZ1ZW1E
	B5B1uL8wvyggYFbAc/NAjb/6x2FkaFZQBzVKJKJ0dwHo3x08aP/4odPmB3UnIYuzN5q2TNS2QvaEP
	gi17VQEw7WQXf1dukMjgwRq9iPTsURjf1t0gMdpORzPq/DcIFKojL/0RJ055y8oTwRZthhmmt0NGy
	dNglwCZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkgcV-000000028af-2O8q;
	Fri, 17 Jul 2026 11:20:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkgcU-000000028Zu-0ltG;
	Fri, 17 Jul 2026 11:20:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B499A400A2;
	Fri, 17 Jul 2026 11:20:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 968991F000E9;
	Fri, 17 Jul 2026 11:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784287241;
	bh=U58275oukP1SolzSMput4gUq2ByL4S8Tv7evc9xcQOY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=aMDIUGESsXHOGXMaJev4GSLHQsQ668yYYW5b2Xuf5s8cXkJQmB55qLHU0LLYg/IKv
	 fXp11aI2KBPNZXlYd38bhvg2X8wg3F4VwrzEbwZkizaaOUvBQoYpQu63sgP1C97QbS
	 cjPOsd3F0X77GOeLP4DRPT6hPTdqIUTVo2e3TUX6eWvuk/YM7JMQfS/T7zgcrs7hgS
	 ajka9CMPpOzWt4g0zfnCB39OzGG1Pr/DuKEvVenPPTlBOrGFnI++0h8HKSYt0oT2Is
	 e1vL7B38tdND700lZh4SMScR685anb6AC4BPQC80jPS8aOkqyrPzHeVsDEicMXSwMH
	 /Tf6JjaBhSrsg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 569BF380CED4;
	Fri, 17 Jul 2026 11:20:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: airoha: add preliminary support to
 configure
 tx hw QoS queue during flowtable offloading
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178428721388.1673922.11887998955572978468.git-patchwork-notify@kernel.org>
Date: Fri, 17 Jul 2026 11:20:13 +0000
References: <20260703-airoha-hw-qos-queue-stub-v1-1-ef253ffdd093@kernel.org>
In-Reply-To: <20260703-airoha-hw-qos-queue-stub-v1-1-ef253ffdd093@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
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
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 03 Jul 2026 13:02:17 +0200 you wrote:
> Add the plumbing to program the AIROHA_FOE_QID field in the PPE FOE
> entry with a per-flow priority value during flowtable offload. This
> allows the hardware to steer offloaded flows to a specific QoS queue
> on the egress QDMA block for traffic forwarded between two interfaces
> via hardware acceleration, bypassing the kernel forwarding path.
> The priority parameter is currently always zero because netfilter does
> not yet provide a mechanism to pass the skb priority field to the
> flowtable offload driver. Once that support is added in the netfilter
> subsystem, the driver will be able to extract the priority from the
> flow rule and map it to the appropriate hardware queue.
> 
> [...]

Here is the summary with links:
  - [net-next] net: airoha: add preliminary support to configure tx hw QoS queue during flowtable offloading
    https://git.kernel.org/netdev/net-next/c/9df92875d6d7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



