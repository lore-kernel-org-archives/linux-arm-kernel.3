Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05492C5B559
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 09:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uy7DFkSmFPW7H9+8/4gphY0bPpgbRbIny2w03fheG0s=; b=eybj84WGqSopxoOpFtVAKz/Npw
	gNfA1/ZXjnklXG+iNdtUDp+4c2Ts/IPIK8ek1oMgRxNK6lETtgKf6RpzQAF1UHTa06rITYPoYO5g7
	xw1WJJlkUm1dI+XsXZ4idvjcGQxk4awD69Glp0Cow1i09WJXgWJpICjQ8DtcRYW1nSTgvDNLiuWQm
	N5M+QpFFKYxlLsfCljJb7x3Xs/dhD7shacmijS5ui+iY+03tkH9O+xcH8cU6BmHZMW4HA2vvgog4s
	Kx29SPnHoVbKsvm9X2rbdV0KI32EUvsrewlZC88K53c+ew9urvHeLvcqE5e/c3l71dBdkYoX9Yxta
	8roCOgNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN6WI-0000000F7kJ-0Ndf;
	Thu, 05 Jun 2025 09:04:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN6S6-0000000F7NC-2Pgf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 08:59:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CB2DC614B8;
	Thu,  5 Jun 2025 08:59:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 779C7C4CEEB;
	Thu,  5 Jun 2025 08:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749113996;
	bh=I9daZlx9d09m2s2x+V99tZsfbDCZbh3nml8Mrei8RJ4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BGhJSCVP9DVWnHhtP1CMrgfBMq9wZ/Wlstb4aPOw1PolcOh8//tYO/5loL6b8gmL8
	 Uaglr/tK6HdKPAzzNuT2aR47Ddo79e+0xOh/aiXOMhFoNlso8t/3XPp+C/2KubzPZl
	 442FxOP9gDmpah2V8DFAvMqxTxdPC6v4hbwz8V8gT3+NrcH+syPleCP6ZUzxqC0eSS
	 EUW4v4uhnaf+PgRGcGJjXC3jRT5C+eqxDNV4EE06rwcKmGoLiLpQPSG86cEJycJGUw
	 MH7HMMcS8wvNS0AYH6/JoV2UlN+V2T4AJUJ7ja/LvHWcp8C7NhN+iEGMVPFAQjHLUi
	 AMvJ673dTHNWQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADEFB38111D8;
	Thu,  5 Jun 2025 09:00:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: ti: icssg-prueth: Fix swapped TX stats for
 MII
 interfaces.
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174911402850.2989876.15623013112591980583.git-patchwork-notify@kernel.org>
Date: Thu, 05 Jun 2025 09:00:28 +0000
References: <20250603052904.431203-1-m-malladi@ti.com>
In-Reply-To: <20250603052904.431203-1-m-malladi@ti.com>
To: Meghana Malladi <m-malladi@ti.com>
Cc: horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
 davem@davemloft.net, andrew+netdev@lunn.ch, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, srk@ti.com,
 vigneshr@ti.com, rogerq@kernel.org, danishanwar@ti.com
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
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 3 Jun 2025 10:59:04 +0530 you wrote:
> In MII mode, Tx lines are swapped for port0 and port1, which means
> Tx port0 receives data from PRU1 and the Tx port1 receives data from
> PRU0. This is an expected hardware behavior and reading the Tx stats
> needs to be handled accordingly in the driver. Update the driver to
> read Tx stats from the PRU1 for port0 and PRU0 for port1.
> 
> Fixes: c1e10d5dc7a1 ("net: ti: icssg-prueth: Add ICSSG Stats")
> Signed-off-by: Meghana Malladi <m-malladi@ti.com>
> 
> [...]

Here is the summary with links:
  - [net,v2] net: ti: icssg-prueth: Fix swapped TX stats for MII interfaces.
    https://git.kernel.org/netdev/net/c/919d763d6094

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



