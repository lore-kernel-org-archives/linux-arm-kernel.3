Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD0FC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 02:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QglPjN+Y9FqfG1iGaKMEP3GPviV2LkC1ngq8tDZb2fo=; b=U9skRQK/ZSxHChKkxDqqVi1Xao
	HKkndF51K2ETN/WRQ0X0lQrLb8ONDXY7bMnxp7T54lt677ZYnngQOUjnZo/7ebHSKgWmIsF2ILems
	o4wssNIsUpRcC2XOQn/GUj7Uu1Xnf1YqTau/T8jG47Wh630e+zqW5eJq9JPK+DwyRDa8XNkznBYfQ
	n3NNDvqTLXy2IJ10DPKRc+bLMacajCz7o034hZ+BotbCghQ2gfVIOuqJvekMaR8PnTcBPPGlZLB04
	EuEpsCGmRfHMSKE/+umWnmP1V7NN2OhTfNlPDqcBAQhJVBsOp3AxKoN7G8yNJr4RdB5JkOo8nQd4h
	37NFRQkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thfu5-00000002G4t-35KO;
	Tue, 11 Feb 2025 02:21:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thfsf-00000002FuG-4BRp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 02:20:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BA1835C60C9;
	Tue, 11 Feb 2025 02:19:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20754C4CED1;
	Tue, 11 Feb 2025 02:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739240409;
	bh=/GN4N5nnO94WYMURaR0RvvgyUUFidE5XpUnXxRw733s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hvWg+K0vwEV6OgFY2ctLrbT7/PP0BbBN+qlXZiX4Cgy41YQDEKl5XuXNmqAxcUycj
	 J//rAqWqvB/0jZfsw9CCLtZCoAIT0BBC6P66/QxCVlPqlg0bbXKuWnBAz89aDdHYtk
	 cjYZSdz6Y4jb896OAawwfUPnSlI6lzPqmsDZmV4r0x46RsOHzFWFHOdV5J5B+J9+M9
	 UZvwD9sMFveF8Y/xBRlwwT+ZXi/jrtmDULvG/H52fUwaC0puBuYFypNh6bZLgFPCEI
	 2YZbkbpZpr0yw3QSeQzVrJqO4VdJMQ8KNrXlXnZU4rI9oufbkA3HL3KePxv+0Pwz7E
	 Ft/wnWNrrbjmQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB8ED380AA7A;
	Tue, 11 Feb 2025 02:20:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v1] net: stmmac: Apply new page pool parameters when SPH
 is enabled
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173924043750.3915440.1883546430698083121.git-patchwork-notify@kernel.org>
Date: Tue, 11 Feb 2025 02:20:37 +0000
References: <20250207085639.13580-1-0x1207@gmail.com>
In-Reply-To: <20250207085639.13580-1-0x1207@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, xfr@outlook.com, jonathanh@nvidia.com,
 bgriffis@nvidia.com, idosch@idosch.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_182010_087504_7A4BCE66 
X-CRM114-Status: GOOD (  11.19  )
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

On Fri,  7 Feb 2025 16:56:39 +0800 you wrote:
> Commit df542f669307 ("net: stmmac: Switch to zero-copy in
> non-XDP RX path") makes DMA write received frame into buffer at offset
> of NET_SKB_PAD and sets page pool parameters to sync from offset of
> NET_SKB_PAD. But when Header Payload Split is enabled, the header is
> written at offset of NET_SKB_PAD, while the payload is written at
> offset of zero. Uncorrect offset parameter for the payload breaks dma
> coherence [1] since both CPU and DMA touch the page buffer from offset
> of zero which is not handled by the page pool sync parameter.
> 
> [...]

Here is the summary with links:
  - [net,v1] net: stmmac: Apply new page pool parameters when SPH is enabled
    https://git.kernel.org/netdev/net/c/cb6cc8ed7717

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



