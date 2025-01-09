Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D72E77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 11:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xo1FEEMogRIXBaxbfZKPmaJiAryjxmInWb0lF9gL1do=; b=h7twkCJlJZn2WlCjaWR7hp9XeY
	m27EKZaBb1LxmzaK3/22Uzajnaqx5oSIo7uPBnoLOGygxvqSzKnCOcrl+mWhKIrnpHTNtJnknud3E
	f2YoOHu/bJTPPzWsGdE69k8JKcgJb+WhrvR4yyklqmj+Tj0eAavye0IQjKvv252fvhojxvAISdN6o
	FAvFT2t4WAhbOg9yOW9r1Q2O1JCxAAWU+7bjLsuqZYrjFdz9VO0XhvljaSlxncPA9X74NEnEiUxuO
	qfTzl0A3S14yVQJUZhtw3lHir8zDvv439NEzONMdARLhs+MOb1nwQ7XEphsAnqFwiptMrdSSAJBcW
	64KthZ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVqdp-0000000BhYc-21PL;
	Thu, 09 Jan 2025 11:23:57 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVqaB-0000000Bh0K-0Za2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 11:20:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5C766A4192D;
	Thu,  9 Jan 2025 11:18:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EB56C4CED2;
	Thu,  9 Jan 2025 11:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736421609;
	bh=1+uVbB8YTOqsluR25SXjrfcOS+SdHfqDiqn5pXsqIyQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=m4msATGPnS6sQKsZ9Rg60S69s3I/DfEk90I/oRZvnOP8hBuT3IJaz/6Y2P1qJXKSJ
	 3YMQhu4GdkvPwMtQ5Q1sikGMsenlOq4/XTeZevbCKRzpgO2rP+XAF5rxRjRqmjjkMM
	 QRBEYf5xph516Fn8/ycWklBIP2BAjSoWFKF+zI+kGKwkmbl0LA2zGmjoof6j3uHeqV
	 6WBL1ojwjOrF2KB5feG6vEMdnKTUwD9uMeEJslN7+MbojXLiBOQJutUMYmaxvYwtTz
	 ariwDAvwoBPcEnUThOUN2shIVBK7+U41DvVsrHw5f7BOC5LrdFjyt1D9SN1tR9pz4w
	 uTqTIHu/hTgRQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D173805DB2;
	Thu,  9 Jan 2025 11:20:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: stmmac: Unexport stmmac_rx_offset() from
 stmmac.h
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173642163126.1285771.10043021879258168083.git-patchwork-notify@kernel.org>
Date: Thu, 09 Jan 2025 11:20:31 +0000
References: <20250107075448.4039925-1-0x1207@gmail.com>
In-Reply-To: <20250107075448.4039925-1-0x1207@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, xfr@outlook.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_032011_236359_97393E18 
X-CRM114-Status: UNSURE (   9.35  )
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
by Paolo Abeni <pabeni@redhat.com>:

On Tue,  7 Jan 2025 15:54:48 +0800 you wrote:
> stmmac_rx_offset() is referenced in stmmac_main.c only,
> let's move it to stmmac_main.c.
> 
> Drop the inline keyword by the way, it is better to let the compiler
> to decide.
> 
> Compile tested only.
> No functional change intended.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: stmmac: Unexport stmmac_rx_offset() from stmmac.h
    https://git.kernel.org/netdev/net-next/c/e62de01008bd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



