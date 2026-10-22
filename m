Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C8B606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 00:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xFhFDMFB;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bybPJTrc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ydO0eraG8WZOqDtntjgt0/RZkDKkzqBP3kzZ637E/uM=; b=xFhFDMFBoLf42fsMrv3UDqf6uK
	wYS1/pENoUX4NUFSGfGT2qJa+Rkkdda8dJLDOIWiNBfvENTVrcwRIZ5tuVxPchSjkNuW+fTmmYGU1
	enz0tz+CiCZsq1LGY+pvQqb4MA+ErWlsCFpyX/TBI+Ncqcj/n0MQgOQEbh3diJ0jJlAHne4ZazeJo
	l0kd98UbSld/WjpncbWgjpLJG4zu9QjHW7s2B3OW3zFX+mv+YGnX8TEyoMNO+30q7rj6wuxasVwOF
	3FvwT410jxTgIWH6mIYF8zangh4t+DbeuDUD7HebnA43qdZ9JzIZzSFGWvnfuRXiGyfBG+NvdWPbb
	iCwMr0dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJghQ-0000000D5vJ-3H68;
	Thu, 22 Oct 2026 00:30:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJghP-0000000D5us-1U09
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 00:30:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DC86A41FF4;
	Thu, 22 Oct 2026 00:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF6D61F000C2;
	Thu, 22 Oct 2026 00:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792629026;
	bh=ydO0eraG8WZOqDtntjgt0/RZkDKkzqBP3kzZ637E/uM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=bybPJTrcaRjvtcBX5J2JDrzVGmjeNy9U4LuVcwNJ28AOYdawmjm+PBTSe7V4wd340
	 GVnDFHryU3k2UUjmodK3UiWsWVxisu1g51LXmOyVfopvkPszfCbQuVobzfIUUwqZdb
	 fCvABp09JxBJSJqTHEYnaoeu7DEsMlUUa/7f9NeafaLXP4HoMpTM69gt/6zYO3XwTy
	 FG2fKX0DzgjqerdreAH6DBT4JIhP66hIeNg3DY8FDBALk1LrzakmrIUFudy+2QvZev
	 PUIV8FqP3PiUVUOyEI6EHNKbx1Gu4g2svCADb5FNOQ+MvLExrik165/bNBQxRBCoRm
	 LL3OuaZVXIZcw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B42ED380A963;
	Thu, 22 Oct 2026 00:30:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: sparx5/lan969x: do not clobber the PSFP cycle
 timer update period
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179262902520.1378903.18369274366620935912.git-patchwork-notify@kernel.org>
Date: Thu, 22 Oct 2026 00:30:25 +0000
References: <20261020-sparx5-psfp-cycle-timer-v1-1-00f2908f096a@microchip.com>
In-Reply-To: <20261020-sparx5-psfp-cycle-timer-v1-1-00f2908f096a@microchip.com>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, Steen.Hegelund@microchip.com,
 UNGLinuxDriver@microchip.com, horms@kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 20 Oct 2026 10:58:58 +0200 you wrote:
> sparx5_psfp_init() enables the periodic stream gate cycle timer update,
> which keeps the cycle start time of each stream gate within one cycle
> time of the current time. SG_CT_CLKS sets the update period, in system
> clock cycles.
> 
> Before this patch, the update is enabled with a full register write of
> SG_CT_UPDATE_ENA only, which also sets SG_CT_CLKS to zero. That is below
> the documented minimum, the number of stream gates (1024 on sparx5 and
> 256 on lan969x).
> 
> [...]

Here is the summary with links:
  - [net] net: sparx5/lan969x: do not clobber the PSFP cycle timer update period
    https://git.kernel.org/netdev/net-next/c/5a3dcad8e101

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



