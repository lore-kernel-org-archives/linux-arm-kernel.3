Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8766BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 12:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XX3v4t0O/6G/ZeFz11aF/CvpBJ2neHMQh6fpzFr4ImE=; b=VCupoUyB15F0EL+pI7nKgV6iuL
	fMUhlgag8N140ui3oNgFxzv5Tw1NIv6kZBmOmOOxsyl7rg9Y8gOojszOEs0sfzuBb2Iqh/7fKe0Yn
	uvfXJ52IMPOSkWV1132sjPY/vGcGegOw2DuSDXvMDU444sDQ0mGGaIwIz75ZSyjvB35XNciDNCvKy
	lXJ49s2PlDYcVhsRUBhnR3DdUa6BHTsNQVHSRGJBi1HrIjN6NVwjUkx4la7aFvHqMWao0q9P0S5A8
	GGmSJm4HpsOrWIiOWTviBLY+FX9CRPHtqrSWRlVP9C79MeguCNeG6EZvWeRHppxdGcgBMNvRLXJ0F
	iciO/6WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTgMs-0000000CsTT-1HsW;
	Fri, 03 Jan 2025 12:01:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTgLe-0000000CsKs-0783
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 12:00:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D88FB5C6367;
	Fri,  3 Jan 2025 11:59:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED47EC4CECE;
	Fri,  3 Jan 2025 12:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735905613;
	bh=odP2BkPztbf1tMUCZCw5XXafrdKd+ljA9eJbV3FSjCE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GtKjHgruS3HUX318rvH9uI9GGrpAvNn0h+oIhuhTAPHYdLRPaO/sCbmdCktGSQ1RH
	 IMVmqsk8ahwLOaT7QAzxu0WLmLJKaL6z3BNHHx6VehO/IWYDhWz7co/STr6+VXjnrQ
	 +sIbHX5U4LHqJl+vpMjLto/fRcW+qgh5CgdhEVcEeTpMJX713v5gb/HuqF+h5AksCd
	 na4UMesohNhcZQZRx86ev15kSlxhG8Lp69TKqesVb/03RdtRygb9UdyqPPGFvy+0i5
	 KYiqNVHXyhtW5X2hyKA/7fdqKiOSsIdOBPffPjaypKenMHHtrcONUuBf4VYpLWk/At
	 iXkUwlLoz5rWA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE270380A964;
	Fri,  3 Jan 2025 12:00:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v5 0/2] IEP clock module bug fixes
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173590563352.2193961.16212593963664558130.git-patchwork-notify@kernel.org>
Date: Fri, 03 Jan 2025 12:00:33 +0000
References: <20241223151550.237680-1-m-malladi@ti.com>
In-Reply-To: <20241223151550.237680-1-m-malladi@ti.com>
To: Meghana Malladi <m-malladi@ti.com>
Cc: u.kleine-koenig@baylibre.com, robh@kernel.org,
 matthias.schiffer@ew.tq-group.com, jan.kiszka@siemens.com,
 dan.carpenter@linaro.org, javier.carrasco.cruz@gmail.com,
 diogo.ivo@siemens.com, jacob.e.keller@intel.com, horms@kernel.org,
 pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, davem@davemloft.net,
 andrew+netdev@lunn.ch, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srk@ti.com, vigneshr@ti.com,
 rogerq@kernel.org, danishanwar@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_040014_113554_6E2C4300 
X-CRM114-Status: UNSURE (   9.98  )
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

This series was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Mon, 23 Dec 2024 20:45:48 +0530 you wrote:
> Hi All,
> This series has some bug fixes for IEP module needed by PPS and
> timesync operations.
> 
> Patch 1/2 fixes firmware load sequence to run all the firmwares
> when either of the ethernet interfaces is up. Move all the code
> common for firmware bringup under common functions.
> 
> [...]

Here is the summary with links:
  - [net,v5,1/2] net: ti: icssg-prueth: Fix firmware load sequence.
    https://git.kernel.org/netdev/net/c/9facce84f406
  - [net,v5,2/2] net: ti: icssg-prueth: Fix clearing of IEP_CMP_CFG registers during iep_init
    https://git.kernel.org/netdev/net/c/9b115361248d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



