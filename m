Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7820FD877E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 14:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gloVP7W4XnzcaPKcQMq6SkAwd0uoliGoIUm/+/4vklQ=; b=oGxJkqQ1GcpiqGqO8Vb8my0Btg
	p3762TSxcPnR3qTgxNJDnSpOHu46M6baWGncdBp64N8DHx5SB6uLbz+28jGK2PbgZ30vxhHdrB4bZ
	mnNr+KUm0UOfBNskJ1bVG5+SgjH4vurzRX17dOhfJcA+BkSukXiJ4524ClkUny5P/mFv5HeWSJO76
	IPiE5CVOvJZhn0JMaV2swH0Y3SDDpG36ZOkZVxMWJxkGpxeUW9Kw/Pxnzfm0u4zSUegBaU7pRbjCV
	42SFuybAUWjt8Kev5Ap/GrZu4IyNkG6yLpgTaZkKUMX6Xvo2CrrLJAJt6A4rYMTTU792LUqmtDaCJ
	CwagEAOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2VHK-00000006Ynj-49as;
	Tue, 17 Mar 2026 14:20:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2VHJ-00000006Ym5-0HbT;
	Tue, 17 Mar 2026 14:20:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4F64E40A21;
	Tue, 17 Mar 2026 14:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DDE7C4CEF7;
	Tue, 17 Mar 2026 14:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773757212;
	bh=D2Aan5I7KojlHJH7qZQt//XX4gVyE0icMzOg2NEGLaM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gWL+w+xJlXiWCmAVanWn/LV8gq2BaExdXjjrGDliYxfj7NmvIr7uxUC0P9Y/1nXnV
	 /+TDR7m/onBPIaQt+hmUUw8XogTkiCbq5kzSCiLK/HWHOS1FJbtvGwn5sAD/OkfDXH
	 qfQt+EC1ydBEG0I+qvscm/khmZzg46jmmcl95XgULH7ATypgh9Ak+Wa5bF8b23Ti8T
	 mOxxzDkIZoO+r2nOtfef3yPvsofVvDDolYXuCkbgEU8bz0EAHyhLWViuriYYD+Kxux
	 FVDDcUjUwaVs2TF9Y/4lcAQha9nDOvg6WF6cutFQezqI17FFMy6XR6bybSC0FX9JEs
	 dahZz2PWC2TRg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA0483808200;
	Tue, 17 Mar 2026 14:20:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: airoha: select QDMA block according
 LAN/WAN configuration
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177375720454.3643902.13747371433230269339.git-patchwork-notify@kernel.org>
Date: Tue, 17 Mar 2026 14:20:04 +0000
References: <20260313-airoha-qdma-lan-wan-mode-v2-1-7d577db6e40c@kernel.org>
In-Reply-To: <20260313-airoha-qdma-lan-wan-mode-v2-1-7d577db6e40c@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_072013_136995_83ADFD0A 
X-CRM114-Status: GOOD (  10.72  )
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

On Fri, 13 Mar 2026 17:28:36 +0100 you wrote:
> Before this patch even GDM ports were assigned to QDMA0 while odd GDM
> ports were using QDMA1, so, based on the DTS configuration, both QDMA0
> and QDMA1 can theoretically receive traffic destinated to the host cpu
> from LAN or WAN GDM ports.
> Airoha folks reported the hw design assumes the LAN traffic destinated
> to the host cpu is be forwarded to QDMA0 while traffic received on WAN
> GDM port is managed by QDMA1. For this reason, select QDMA block according
> to the GDM port LAN or WAN configuration:
> - QDMA0 is used for GDM LAN devices
> - QDMA1 is used for GDM WAN device
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: airoha: select QDMA block according LAN/WAN configuration
    https://git.kernel.org/netdev/net-next/c/8737d7194d6d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



