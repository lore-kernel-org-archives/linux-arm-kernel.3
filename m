Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A76CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 01:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S5LYpMJDN1k5jY2tX78ATAm75la/orQ3Kb0Ybo0bzFQ=; b=u73oIPoyyNqoYx9f92u/WJmh1m
	RheasEp59LRirEulGEXfCfLhPMbodfdPaOjXu8u3Sg/q7S7//JxAdwOaL85pX3sl/oYRf5L8O0KMP
	V9V9ppvxofRa10xB7Mn3ImhrFuv8fTjCkqFELzwDn6UUhPx30kZ+IoR+E5PNddT6PdVB+Uc8iYYNY
	w4sL2gLl7FlOv1TPXbT4ye6sN3sk+5asWtFcZBiuIS3kSk1zTPYS/Ob6OEMGWJicHvJKaY5zmph58
	SH58aTj+h/NWDLzNVdH0o5bf9/slMxOUIbR14ub+FEC2INpziBDElmmAkVC8hmwd9DiwTTiFkKSAF
	+uINKqeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGp99-0000000EiJ1-3ldX;
	Thu, 06 Nov 2025 01:50:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGp97-0000000EiIb-09qr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 01:50:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DD1EB44AC5;
	Thu,  6 Nov 2025 01:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6027C4CEF5;
	Thu,  6 Nov 2025 01:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762393839;
	bh=+CpauvWxUAeAbBhY+KwbWJbUc6znqf2/3SzfMYIefwg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=EwSp6s/6wOxA1uHgV1DR6JWi96a4zq1ccibOac6TTlMwCaUz2igewx3Yil6dzZ3M5
	 kXpB2knPh29JsckxMa+XyoaaKD0EadM2l9WvuZ6Qro8Ru+/PNHjx57LwkxMI33Yl1g
	 q05HvVhSmthDtQ2I6ilNjNy+6P4C2Fz/8CNlX8gkOne7adLNDvQZjAoXrkedHgyk+r
	 6tiqvOD7CWS09VY4YxxWeN/uaq/ia7M+hK2NBs8I+ognqNbPGDY4187eOkS7fsCVJr
	 3v56ssQ94JTiE7olV8Q3RQLtu7hjsHyf73TpGkCNsGRwznzcGq9FtkorLD1SnB4Amb
	 /qRaLJB8dghJg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BAA380AAF5;
	Thu,  6 Nov 2025 01:50:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: ti: icssg-prueth: Fix fdb hash size
 configuration
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176239381274.3828781.8725039572661781707.git-patchwork-notify@kernel.org>
Date: Thu, 06 Nov 2025 01:50:12 +0000
References: <20251104104415.3110537-1-m-malladi@ti.com>
In-Reply-To: <20251104104415.3110537-1-m-malladi@ti.com>
To: Meghana Malladi <m-malladi@ti.com>
Cc: h-mittal1@ti.com, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org,
 edumazet@google.com, davem@davemloft.net, andrew+netdev@lunn.ch,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srk@ti.com, vigneshr@ti.com,
 rogerq@kernel.org, danishanwar@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_175041_099096_4EC9C1A9 
X-CRM114-Status: GOOD (  11.63  )
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

On Tue, 4 Nov 2025 16:14:15 +0530 you wrote:
> The ICSSG driver does the initial FDB configuration which
> includes setting the control registers. Other run time
> management like learning is managed by the PRU's. The default
> FDB hash size used by the firmware is 512 slots, which is
> currently missing in the current driver. Update the driver
> FDB config to include FDB hash size as well.
> 
> [...]

Here is the summary with links:
  - [net,v2] net: ti: icssg-prueth: Fix fdb hash size configuration
    https://git.kernel.org/netdev/net/c/ae4789affd1e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



