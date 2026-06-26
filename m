Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC478CDE018
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 08:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xf3kAwe5ywIQY//rN3h6sBdlm1lF9rusVsWktLYdFkk=; b=Ldd2O30BNxLBM1Fzc8tiAgffo6
	1Y7pgiTh4TuZIkuOSCSw0GD7TmgwoA8GQYOsYeT7bHwvX8mhhvz8DyynYggZWe16/25T2LrcoocZb
	T4tgcd7ba0whMapwNEoWNjf2VWZA9pNlxanW0NVUFYuRJO2nDatX9QuW9ExCTiFU5XuCYkEKzVdyA
	7uClVfznir/MFiA2vULVkwSVqGb35Ze3y9cq9Ag/W1GMc5BFoCysUuGoZp23agygHhqvgHy4jhKjG
	bgBmZ4Kg199DFOZBjiqARMbeUnlv2WQTioO34Zgo9pL8Uq2UlvbxeX9D9ui4ILvOENKouAFxCDsPD
	Yggf6nBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1oR-0000000AnJe-3F51;
	Fri, 26 Jun 2026 08:21:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1oP-0000000AnEU-1jzo;
	Fri, 26 Jun 2026 08:21:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6C90A6021E;
	Fri, 26 Jun 2026 08:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B0AC1F00A3D;
	Fri, 26 Jun 2026 08:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782462080;
	bh=Xf3kAwe5ywIQY//rN3h6sBdlm1lF9rusVsWktLYdFkk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=aA/AaODJC9hNx87l7DWmFqF1ycvUQDGXM6GzZfkNDnaN83wpqMr7NjTKa3W749koe
	 hwI7hQleW1NVEl2PH70tTqE+TBtvDm8AwRL2dm6Hcj+k9PQxhyaItrC9HsLeyyIqR0
	 zndpM5dfZUZ+rxd7ac/2X/rhEe3gGN3uSkL1j5ZvFuZKkz4qiMsVS0UdRBcW255bmd
	 B7KThCYiQMxkacYR+Lx1CIiiqfC6QKOcMNcIWeEeOhqYwGxKSKPiOIfXmLesV17yR2
	 Odx/7NmU+bJ7ZzRHg/3Xun0PK3w6/xBip2pDM77MGz/xkgB+IWxpgu7gJukMW3wPcN
	 lLNjFjZn/RKUw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5695239389E8;
	Fri, 26 Jun 2026 08:21:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v9 0/4] Introduce ASPEED AST27xx BMC SoC
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <178246206701.3816447.15009741745882675380.git-patchwork-notify@kernel.org>
Date: Fri, 26 Jun 2026 08:21:07 +0000
References: <20260609-upstream_ast2700-v9-0-f631752f0cb1@aspeedtech.com>
In-Reply-To: <20260609-upstream_ast2700-v9-0-f631752f0cb1@aspeedtech.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: linux-riscv@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
 catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, krzk@kernel.org,
 alexandre.belloni@bootlin.com, linusw@kernel.org, fustini@kernel.org,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 soc@lists.linux.dev, conor.dooley@microchip.com
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

This series was applied to riscv/linux.git (fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 9 Jun 2026 10:47:17 +0800 you wrote:
> This introduces initial support for the Aspeed AST27xx SoC and the AST2700
> Evaluation Board (EVB) to the Linux kernel. The AST27xx is the 8th
> generation Baseboard Management Controller (BMC) SoC from Aspeed,
> featuring improved performance, enhanced security, and expanded I/O
> capabilities compared to previous generations.
> 
> AST27xx SOC Family
>  - https://www.aspeedtech.com/server_ast2700/
>  - https://www.aspeedtech.com/server_ast2720/
>  - https://www.aspeedtech.com/server_ast2750/
> 
> [...]

Here is the summary with links:
  - [v9,1/4] dt-bindings: arm: aspeed: Add AST2700 board compatible
    https://git.kernel.org/riscv/c/34efd73379ff
  - [v9,2/4] arm64: Kconfig: Add ASPEED SoC family Kconfig support
    https://git.kernel.org/riscv/c/df6f379eb4ac
  - [v9,3/4] arm64: dts: aspeed: Add initial AST27xx SoC device tree
    https://git.kernel.org/riscv/c/e77bb5dc5759
  - [v9,4/4] arm64: configs: Update defconfig for AST2700 platform support
    https://git.kernel.org/riscv/c/512cef2af615

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



