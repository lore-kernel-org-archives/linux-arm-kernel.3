Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1352E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 18:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W4t2rLeJPPFsjEvkjlVgNQs2piwJ6laYNqFlFrxfMDY=; b=b7Av5QKTGNMp4mOEWhWc03F1HV
	JVZ6EYiRlZvV2PLW+azkx6bE/zjybkK1ErEvUmveyUQCrWdHDJcoxeYNeQnSFoJ6QQ0y4uLY0A6+u
	XZnjBLqs2jSB2aegHRj4LoM2iR1oCNrk16Aqo+J3n3Sj8gMYU8k0H95lCEoGK5mXwGoavuIbS70/O
	hRmOA/KgAOsqFuY4+4mDZBwB605KVuh4PhNNECZUuGAKQO4mSgg8At7yxSvu4tJhUd3PEogozIKZt
	nARpoieqQM78M9nX+1LX60c2jJkM8w2zDQe0fzUK77IjT1f8BI7k+UxURImgshD87Gb27Ht9L/lWN
	zPpEhkGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPnWa-0000000Aa74-3VgR;
	Mon, 23 Dec 2024 18:51:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPnVO-0000000AZvb-2cj4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 18:50:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 07F9A5C5A9F;
	Mon, 23 Dec 2024 18:49:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 835EBC4CED3;
	Mon, 23 Dec 2024 18:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734979812;
	bh=NH8cm01y4TohlhDTWom0A4FVC6Z/AeDlJSvGBZtizHU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=O6hg/C1rQmNnnOdlQxObtBNox0FSgSDz/mczHP0yGc91C/yAFHIovtQMcMVGMKjbN
	 sCOkuPfzp6+Hr3DSKNQEvI9hpC8mp2mcQ7BOCdv+uHRkO70a2S+iQwoFeQ8obnwv9S
	 9ku0ATubmIMEussYDgadNHGOi735WT9sHqLLouMhlxzMtnSig/IvA2YEmK1mR7BYXC
	 aunRSgznwyKdMr7oF0uZBlIYr3APU8zgd5s5SIghPzAeO/sl07y6tlEKfirzOzw0wV
	 ycvCC/s+AOs+huoUBVYy7g32uDzofx5ZKjIwc9B9CJ0nfpBY8Otc8pm4OAN4ipPxi7
	 5+RvO/z1w9Egg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C973805DB2;
	Mon, 23 Dec 2024 18:50:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: ethernet: ti: am65-cpsw: default to round-robin for
 host port receive
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173497983102.3929264.4619401793020862332.git-patchwork-notify@kernel.org>
Date: Mon, 23 Dec 2024 18:50:31 +0000
References: <20241220075618.228202-1-s-vadapalli@ti.com>
In-Reply-To: <20241220075618.228202-1-s-vadapalli@ti.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, rogerq@kernel.org, horms@kernel.org,
 dan.carpenter@linaro.org, c-vankar@ti.com, jpanis@baylibre.com,
 npitre@baylibre.com, stable@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 vigneshr@ti.com, srk@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_105014_715237_F74DCFE0 
X-CRM114-Status: UNSURE (   9.62  )
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

On Fri, 20 Dec 2024 13:26:14 +0530 you wrote:
> The Host Port (i.e. CPU facing port) of CPSW receives traffic from Linux
> via TX DMA Channels which are Hardware Queues consisting of traffic
> categorized according to their priority. The Host Port is configured to
> dequeue traffic from these Hardware Queues on the basis of priority i.e.
> as long as traffic exists on a Hardware Queue of a higher priority, the
> traffic on Hardware Queues of lower priority isn't dequeued. An alternate
> operation is also supported wherein traffic can be dequeued by the Host
> Port in a Round-Robin manner.
> 
> [...]

Here is the summary with links:
  - [net] net: ethernet: ti: am65-cpsw: default to round-robin for host port receive
    https://git.kernel.org/netdev/net/c/4a4d38ace1fb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



