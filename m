Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1231CC87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 19:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lgp4XbPSBGZ/nyQklTwjyvG0jLZ6UIZYS7A5GtDvLoc=; b=nd8w4k4N+mlHiyZ35Knc1OTeZh
	4mgSARvMA1o7hhmyn0CkZ3+JXWrRI0HNJ1/z5Agee8cth5v0QX6ZG73HB34pdg94ZZtZc7Hz2s1Sj
	K0Bet+7rzWnIgnSzo3OgWtKTyhX7VwuIR/jsQlbxAftxdfAERocVm1lIiblDvegTSZfTBJv/oO6GA
	Gm2U1yoEJapSsHGxcSo9An8+ik2KvtoDlYEhT1wULbBi9xdiy+S0n2VSf33MZWBfBGwn9yPqdUFzY
	yH0nidlrVAIC1SCQfNGnKseXfUVvRtJIWrk4Vjy/8ht71PDoUxiIxnY0wAD1LoUc3nBlKKo4yDbLg
	Fef3d1DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukSpL-00000003Xeu-0xgQ;
	Fri, 08 Aug 2025 19:32:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukSmo-00000003XNf-2xrz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 19:29:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6066A5C6B2C;
	Fri,  8 Aug 2025 19:29:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08ADAC4CEED;
	Fri,  8 Aug 2025 19:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754681393;
	bh=CiCDLFP0XbUo4Ghv+kqOOeZMQP6GmlGXuHQJyu0BoUo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nzvfd6TWNGPVP/CzLfSavkL3tBvZNDjEauHvQZ0OzZfJTOyu8A/1pnCgl2zVWM9qm
	 r4IIzyO0xVVPSwZ0IAQ4qych+wPww+GXMJiaF3HQrFOzSXQ1IM/Nm23FAYMdVy+zF4
	 GL2Y+VYdZQifx5znCXVpI35dGbz1V7jXrp+wv2kyjVJUri5Er6VXvGvArC+wLc8PW3
	 MlygcpXM4L4EeWuQHwKRPmq8nCruwpPQ87/9WIZD+RmXvbETIUQndq0y+Qx4nj+Nr9
	 Pz4dkXFb4ZTq+Zu2F3DSyht+LlXl2chrWjuRoneuZnWdUNohWkV5zyo8w7rCNKGW7q
	 QaWfimKB2hBRA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7104E383BF5A;
	Fri,  8 Aug 2025 19:30:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v3] net: ti: icssg-prueth: Fix emac link speed
 handling
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175468140625.242168.262371954250110213.git-patchwork-notify@kernel.org>
Date: Fri, 08 Aug 2025 19:30:06 +0000
References: <20250805173812.2183161-1-danishanwar@ti.com>
In-Reply-To: <20250805173812.2183161-1-danishanwar@ti.com>
To: MD Danish Anwar <danishanwar@ti.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, m-malladi@ti.com, h-mittal1@ti.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, srk@ti.com, vigneshr@ti.com, rogerq@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_122954_783280_85D774BF 
X-CRM114-Status: GOOD (  10.73  )
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

On Tue, 5 Aug 2025 23:08:12 +0530 you wrote:
> When link settings are changed emac->speed is populated by
> emac_adjust_link(). The link speed and other settings are then written into
> the DRAM. However if both ports are brought down after this and brought up
> again or if the operating mode is changed and a firmware reload is needed,
> the DRAM is cleared by icssg_config(). As a result the link settings are
> lost.
> 
> [...]

Here is the summary with links:
  - [net,v3] net: ti: icssg-prueth: Fix emac link speed handling
    https://git.kernel.org/netdev/net/c/06feac15406f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



