Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C860DF9D0C5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 11:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8CuHpoJMmm/eTipaRhGEwIxqjGQ4qli3GNAsKwX/ME=; b=CgyI8GnBrXCRceFHwPTTp8nx6L
	CIICKwRfIeaERwrGBTi1NLbsamtVeNsyZW0EQWd5dYVhWJIQkvA21scLZrtUfiXq2B7ari62LC+Sh
	vIZDm8Var97+kIb8UXzdrcvJRpKjb5EvPGKuCbOs5gRaTqtEjaga3Jk+w2fr7CiBi3zxW3wPoXMdc
	u6c/0w/UgNWfWrnS3byssncgOWkeWalsZjfTaC9uAiHAwy5GeiZZdNmkE/qbDWN0k4xUcG2D4cEwh
	KlwNfskN7RaAGyxc1uB5S4bKKhnMdynrwmZ1rLrEOoX2KJmlNc4Vu09MzdRcmmjaCOBLlCvv4M1MT
	bfCuAO0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCc8E-0000000HFC5-1Gt7;
	Tue, 14 Apr 2026 11:40:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCc8C-0000000HFBb-1Zya;
	Tue, 14 Apr 2026 11:40:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2B9F660128;
	Tue, 14 Apr 2026 11:40:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5D60C19425;
	Tue, 14 Apr 2026 11:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776166834;
	bh=B3BglmvRt8X/jgxHSb6URI9mj88QwlUxQhBzS+va8rU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FU4pYPFnthk4cT9SVYY2n9sh7zY/ThkDQBv3UpAF6uqFug2Ee7N/IIjrZ8Qfwv3Y3
	 /ilxmuXrxUKx0wjEJHr3HmcSL/t5D9eQYoCT12SQ/KN17yAtGcI1eo+XApI/lm3Nh+
	 n8bPmr1aH2+nZuXkw2cATloIvz0latJjTIvq/8sebOvYL43I7HNVygxeieekFSsJET
	 WbwO6KMGTzZKbZZmZvP0BiUeJnhEPwFjVpX5dG1gnjedOV3DIIh4OtB5JqnGs77vzn
	 eph+32ZqnfYAd8QE0Re6J/QELvmHBIKG9RQqCNb7huKhfxb/3R0T5+AH0eXAevtd+E
	 rCjOfHbD7Prwg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9F153808205;
	Tue, 14 Apr 2026 11:40:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: airoha: Fix VIP configuration for AN7583 SoC
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177616680555.841978.4384575148487022724.git-patchwork-notify@kernel.org>
Date: Tue, 14 Apr 2026 11:40:05 +0000
References: <20260412-airoha-7583-vip-fix-v1-1-c35e02b054bb@kernel.org>
In-Reply-To: <20260412-airoha-7583-vip-fix-v1-1-c35e02b054bb@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
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

On Sun, 12 Apr 2026 09:57:29 +0200 you wrote:
> EN7581 and AN7583 SoCs have different VIP definitions. Introduce
> get_vip_port callback in airoha_eth_soc_data struct in order to take
> into account EN7581 and AN7583 VIP register layout and definition
> differences.
> Introduce nbq parameter in airoha_gdm_port struct. At the moment nbq
> is set statically to value previously used in airhoha_set_gdm2_loopback
> routine and it will be read from device tree in subsequent patches.
> 
> [...]

Here is the summary with links:
  - [net] net: airoha: Fix VIP configuration for AN7583 SoC
    https://git.kernel.org/netdev/net/c/1acdfbdb516b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



