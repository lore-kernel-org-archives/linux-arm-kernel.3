Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC427D637DA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 03:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0cjutd52pESS819lrn/coTD2PWtaft3frXUGfzphBsI=; b=VrgI+FWhKFy0Bg+JHPAFbJx8N7
	sPpsMh/gwtKiP44vfUkicqtdR4X9WnGPeuwlmbzd+3UhQmRtnREH9TGwzO4bTORnckmngqidP+nsq
	7JljzUY1OO7V6uZ2xOWvPrqCM6RmDmUPWUbp5XgpxSlnaCFWifseBEg8C8lwz18QkXHqhOCZoCiJz
	QsUkE0tYhArPmi0cEAxrNYDzCVHRNpxem7Y8mT9R7igRIQ1Lms6M4eaXqkdXr2dQHQHkUn0ULoCXB
	AT2Bbzf5B14Si3HDwwZ9mkLY7RvEQj3WApITNrMXo/NI/TG5nBgSQi6tSWmGYVBePFtKrzau+uUL3
	gJ6fd4vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBQ7t-00000008d5N-0dYF;
	Thu, 14 Nov 2024 03:02:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBQ65-00000008ctV-1lIS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 03:00:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 90699A40296;
	Thu, 14 Nov 2024 02:58:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E7D6C4CEC3;
	Thu, 14 Nov 2024 03:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731553240;
	bh=gbZQqgoltqwkJ/vm5DodVYLPZVBiaTAp0vA2MvKuZCY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gxN/j0XaazZWoNHJvyJSihstQrqhcQOZvPzddr12uATiXHq5rSBCPMVGZ4CZP3AqE
	 dL15FKoPgsUl+LaHeAJdczLcq5c72YOHYxT8W1iCGzDVlPTAv7cHGA7qhsrGYZlxwK
	 6N8FLtmcCDyIowDk2Fw90UmQ+G0u0Tn18g526479BYde1KQGWeDa8lpBXZO1D/qRTJ
	 7zmqGwtos4+10aMTth6i+GWDf+RIgChvImDR3szcWa78Dp7LMsTx9Y7U6ErbxhI49S
	 AJMqxYvNhR6T80xxPtB49SQoUAPIoxUJX2Dwe+BuNyldjPjoxlvjaC5qFYQP25ZJQN
	 5jsQWsJ+NmU5g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF5F3809A80;
	Thu, 14 Nov 2024 03:00:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v4 0/9] Support external snapshots on dwmac1000
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173155325074.1464897.8509953412141339085.git-patchwork-notify@kernel.org>
Date: Thu, 14 Nov 2024 03:00:50 +0000
References: <20241112170658.2388529-1-maxime.chevallier@bootlin.com>
In-Reply-To: <20241112170658.2388529-1-maxime.chevallier@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: alexandre.torgue@foss.st.com, joabreu@synopsys.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
 alexis.lothore@bootlin.com, thomas.petazzoni@bootlin.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, daniel.machon@microchip.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_190041_544267_B545EA09 
X-CRM114-Status: GOOD (  10.63  )
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
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 12 Nov 2024 18:06:48 +0100 you wrote:
> Hi,
> 
> This is v4 on the series to support external snapshots on dwmac1000.
> 
> The main change since v3 is the move of the fifo flush wait in the
> ptp_clock_info enable() function within the mutex that protects the ptp
> registers. Thanks Jakub and Paolo for spotting this.
> 
> [...]

Here is the summary with links:
  - [net-next,v4,1/9] net: stmmac: Don't modify the global ptp ops directly
    https://git.kernel.org/netdev/net-next/c/80dc1ff787a9
  - [net-next,v4,2/9] net: stmmac: Use per-hw ptp clock ops
    https://git.kernel.org/netdev/net-next/c/13e908800c0d
  - [net-next,v4,3/9] net: stmmac: Only update the auto-discovered PTP clock features
    https://git.kernel.org/netdev/net-next/c/0bfd0afc746c
  - [net-next,v4,4/9] net: stmmac: Introduce dwmac1000 ptp_clock_info and operations
    https://git.kernel.org/netdev/net-next/c/8e7620726beb
  - [net-next,v4,5/9] net: stmmac: Introduce dwmac1000 timestamping operations
    https://git.kernel.org/netdev/net-next/c/477c3e1f6363
  - [net-next,v4,6/9] net: stmmac: Enable timestamping interrupt on dwmac1000
    https://git.kernel.org/netdev/net-next/c/774f57d6562d
  - [net-next,v4,7/9] net: stmmac: Don't include dwmac4 definitions in stmmac_ptp
    https://git.kernel.org/netdev/net-next/c/85cebb7279e8
  - [net-next,v4,8/9] net: stmmac: Configure only the relevant bits for timestamping setup
    https://git.kernel.org/netdev/net-next/c/62935443214e
  - [net-next,v4,9/9] net: stmmac: dwmac_socfpga: This platform has GMAC
    https://git.kernel.org/netdev/net-next/c/b818268d9250

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



