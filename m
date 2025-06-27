Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB074C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 22:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ymUttXEQIzOw/xjmpsI3RHVUs/YKBLYoDxEEf0otHjk=; b=pNE3h/g92CKEoaGz5Z5Cpoz6uq
	nn7nnivd7vayogT/0mpDjMFiYDsIMKWcE0Q2OyxL/3aoayMGoefEAGT/VtRjnZRVoQ64nBzCw8Gvi
	lk6PV0ZzzYRYQqgaWCssmgBpIwCZbgJQP53EmSHeDEYl7rjKvZSxt6fFmjCVZGuNRcoGhgjrarugG
	sTao5gCGS62TZcOrKkvChfJn85oA9qNYWHdDsyvyiZH8YBSB8lJQSHPlg17m3u8F7z+pijBd0GfzH
	bdBGPO7twaXycTr7FEIjeK5YeSDQ1hJpcO3gw6bbJGAyRDe0AiOK7XXBKLt6TESBzNMykziAcOuOL
	xUB0gBPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVHlx-0000000FwRu-3jUS;
	Fri, 27 Jun 2025 22:42:17 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVHjd-0000000FwHf-3EFu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 22:39:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 819DBA530E2;
	Fri, 27 Jun 2025 22:39:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DCB8C4CEF1;
	Fri, 27 Jun 2025 22:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751063992;
	bh=tC2vIW1KfS8CnL2FBG9wDbx9ZyXXV7ai5+nzpmwJDIU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LTVInjYJxu8kXmclqrJt26Ca5DLFAjh72dl/u7V4JlFc1VMOJWZ6ukryUhO8UQ/eG
	 pcm5yO7mMMRdpHKiknFq9g5gDiJil5lqAhA39pjAdIINqVMMETZCaYEAfIhEgBJMY6
	 obFOHJCWxnR0jraquCE/py2GeaoMLf0GmypCRlYbppiQwiqyT0BGA5qIjjhRcqup7p
	 +5tq5/g20mvHmMitOMXe0Nwno/S9pjH2hrDV1eC024KTV0vkhoGoVk42dlWMj/47fR
	 N1eEafpOtZSbN5ZXmwazIV6f9jO2CMLK7iYg6TydvbjeoTPL9i4JbSbmoYFuaUCb3s
	 0prV94SUiHCtQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D2238111CE;
	Fri, 27 Jun 2025 22:40:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/5] Allwinner A100/A133 Ethernet MAC (EMAC) Support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175106401799.2079310.7398461677356212518.git-patchwork-notify@kernel.org>
Date: Fri, 27 Jun 2025 22:40:17 +0000
References: <20250626080923.632789-1-paulk@sys-base.io>
In-Reply-To: <20250626080923.632789-1-paulk@sys-base.io>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, linus.walleij@linaro.org, andre.przywara@arm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_153953_873013_82637473 
X-CRM114-Status: UNSURE (   9.54  )
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 26 Jun 2025 10:09:18 +0200 you wrote:
> This series adds support for the Alwinner A100/A133 Ethernet MAC (EMAC)
> and uses it in the Liontron H-A133L board.
> 
> Paul Kocialkowski (5):
>   pinctrl: sunxi: Fix a100 emac pin function name
>   arm64: dts: allwinner: a100: Add pin definitions for RGMII/RMII
>   dt-bindings: net: sun8i-emac: Add A100 EMAC compatible
>   arm64: dts: allwinner: a100: Add EMAC support
>   arm64: dts: allwinner: a133-liontron-h-a133l: Add Ethernet support
> 
> [...]

Here is the summary with links:
  - [1/5] pinctrl: sunxi: Fix a100 emac pin function name
    (no matching commit)
  - [2/5] arm64: dts: allwinner: a100: Add pin definitions for RGMII/RMII
    (no matching commit)
  - [3/5] dt-bindings: net: sun8i-emac: Add A100 EMAC compatible
    https://git.kernel.org/netdev/net-next/c/0a12c435a1d6
  - [4/5] arm64: dts: allwinner: a100: Add EMAC support
    (no matching commit)
  - [5/5] arm64: dts: allwinner: a133-liontron-h-a133l: Add Ethernet support
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



