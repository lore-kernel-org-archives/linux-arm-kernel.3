Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16FF2C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 20:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sr+w2hWrCnxGYTSVd6z6KraK2mueMYx1uU1g9Ov8dM4=; b=344KY4eIEX7Cw/VuH4q1SgI54T
	pDGLryeCJhie6laa9M55dP1rh9f4X+y3fslcW3DH9YJlgS1oII0dGgIp+Adfv4JWf0Ydrm78vj4fS
	5xkpDgF7dooxuaz43ZSrFT/B3RfLGVzDzV6NTDkHulyBb+tZ2OhUgqKvsbfvvBntuj+ZMQKz7Co/x
	C6HJDM0aDe2iO7WMGiL17W0rgdt1JxU7ZicaLzvSKEjCQJMtBN+Ez7mLCGN8ifCscj6hR8CR9rAy5
	mzELa+pgO3PrZMLPAb0ut3+6lx0F8POdhubbQ4DLkkOheewVhq7oSJFuTAS5WGgcN8IKe/8V6FOgM
	fU3wmS2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukTqJ-00000003e0r-1xiD;
	Fri, 08 Aug 2025 20:37:35 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukTPY-00000003b1l-0cIv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 20:09:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 53563A56AE3;
	Fri,  8 Aug 2025 20:09:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2373C4CEED;
	Fri,  8 Aug 2025 20:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754683795;
	bh=R9ARUg6hADbe4gWjEj8z9gYzk+3IYd7xP8j1sB2nbkk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GsxPMHNs3VwJpBNrpHFo8Y2qZEXE39NmuGsMnHns61vPS7j7BLfDbMD376xTbscYo
	 CgltIAjwxC1mLQN6ga8l72KUshxWyYwyr1YwUO1MV3WlblyT7f4UADbElLpmLlSnQR
	 USA9i3KQuH72E9KzluxlHS4CF44xqRrZOyFYma4rnxo60IubDxwxRGoKPQD0UKiaDx
	 MyRgb+XExAnHreTLSJ4f8Ul1Nx7xqeLKCtVLdYElZMQwf5kENIbuIoa9rxetmGf78L
	 P3mm9/yA0BX3tHnvqod6Hf5lJmE5bbkziXZUM8QWnDjaaCvrG+RGMtSAnLz842X0gD
	 ZCGyHIMvwSX5g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71036383BF5A;
	Fri,  8 Aug 2025 20:10:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: ti: icss-iep: Fix incorrect type for return
 value in
 extts_enable()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175468380825.252401.12949749636646106003.git-patchwork-notify@kernel.org>
Date: Fri, 08 Aug 2025 20:10:08 +0000
References: <20250805142323.1949406-1-alok.a.tiwari@oracle.com>
In-Reply-To: <20250805142323.1949406-1-alok.a.tiwari@oracle.com>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: danishanwar@ti.com, rogerq@kernel.org, m-malladi@ti.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_130956_260507_F19EA02B 
X-CRM114-Status: UNSURE (   9.57  )
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

On Tue,  5 Aug 2025 07:23:18 -0700 you wrote:
> The variable ret in icss_iep_extts_enable() was incorrectly declared
> as u32, while the function returns int and may return negative error
> codes. This will cause sign extension issues and incorrect error
> propagation. Update ret to be int to fix error handling.
> 
> This change corrects the declaration to avoid potential type mismatch.
> 
> [...]

Here is the summary with links:
  - [net] net: ti: icss-iep: Fix incorrect type for return value in extts_enable()
    https://git.kernel.org/netdev/net/c/5f1d1d14db7d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



