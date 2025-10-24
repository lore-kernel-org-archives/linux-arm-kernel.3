Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C0F1CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 00:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2mywD2eokzS9C8bEdrUWL/AblRnTX0WcPpyKJwms7CE=; b=KG073NJDKGmwFbRLvRrU4vtMBZ
	SL+IHoxHX5BlWNBSjK4JLutik4LWVU86Ivm2dFEw1qhIgnBE3c99Jvwoi4dknap7lakX8dflAN1Yn
	3p7/LyiC3yVEVGnCzTGaF4rkTwU6DtSrF+N8AmxFS8xLJ0fjRtLZnaEf3j+mvJ2yfq+4OVNV5Hv5A
	zmUiydpcXqApIkV1tGazLCslHvkJecB03m28349BeSz1SgtobcGX+G0XS2eswJ5OTMfq3AS4qs5Sa
	m14rjBRGChah907diaUoK7a5FiRKLfZB49MKtCIBhs7AfCkg8Yk1EjfjlT5WyajbVDnakiwMw0/3w
	WYej8vcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC5hP-00000007uGQ-1fZI;
	Fri, 24 Oct 2025 00:30:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC5hN-00000007uGG-3Ak4;
	Fri, 24 Oct 2025 00:30:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D2878641B1;
	Fri, 24 Oct 2025 00:30:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C8CEC113D0;
	Fri, 24 Oct 2025 00:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761265828;
	bh=IL31NnCzzZqbqIiX9Q/5Q5IvEscFeF0zSTzAPWrAkA4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=p4OmMeXe56DC/0+vH2lbnoyXGuDofoHurZZoIgf0s/Jsu3W4uETm2rJrKloVn4Pxd
	 PSjC65v7FTVV4Mw0/quY2zU1pHtMHFR8vOu7arygz9NxZnheKHGAkXiVRkBYW2NHKm
	 HAYxrvi98fw9R8jDaXVepCUjbz78uNKcDXn6MhHSdQRvrPN5bxpE+oF4tMz5jlFPaE
	 wJCnt+2v7h90/AyDIKke4D8wH+NboQrnQ/h1zc+TUAmgQBHiNFyRIZTrRwEDIePuVg
	 xeDJWQGW0rf+kwWzeWinEcVaOvdyVrtkNzRK9Yb1jOtR8yNohEXHUtsXhzHXLpvg4Q
	 gzQm6HHU2nyFA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF843809A38;
	Fri, 24 Oct 2025 00:30:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: airoha: Remove code duplication in
 airoha_regs.h
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176126580849.3301171.1340317563476712267.git-patchwork-notify@kernel.org>
Date: Fri, 24 Oct 2025 00:30:08 +0000
References: <20251022-airoha-regs-cosmetics-v2-1-e0425b3f2c2c@kernel.org>
In-Reply-To: <20251022-airoha-regs-cosmetics-v2-1-e0425b3f2c2c@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, horms@kernel.org
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
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 22 Oct 2025 09:11:12 +0200 you wrote:
> This patch does not introduce any logical change, it just removes
> duplicated code in airoha_regs.h.
> Fix naming conventions in airoha_regs.h.
> 
> Reviewed-by: Simon Horman <horms@kernel.org>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: airoha: Remove code duplication in airoha_regs.h
    https://git.kernel.org/netdev/net-next/c/99ad2b6815f4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



