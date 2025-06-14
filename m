Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDF0C71135
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Jun 2025 19:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=01sY14H1lxh8eshQ8Dv5O6OAlJG5RICkr5xGGeXuGIQ=; b=xIf/QLxiVfsBMmWawJSjILrtJS
	seG9AklrkEEpwQdC6t3PBZv1yAZVgTslKFxCS+Qj7CysY5kM6HlvNmLhBX/6aduCthF6hRDTMbQcW
	1OHPBUlDbwtgLcYc4S6nc2U6qhimkdFsgUK4mqpfO3VHX3Gl/6wm5QPPq+3EUBHwOCnW6dfoz+r4h
	SPQnej2fhcUA7J1PJxLMmf4iIMNRhEjjwdIa3C0MWm4LRbI8bjrz1KWPR9iPlVZ/ftwfOplrIoiTi
	V7WdvBxlXIsIDklS3PU4/ivvBm3M997q71ooqZ1ty3JWjNgiyyBuHO3eLcVyln8XRucV1EQV+dzEU
	gqmePBVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQWB4-00000001iXW-3Fb0;
	Sat, 14 Jun 2025 19:04:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQW6j-00000001i7f-0nWf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Jun 2025 19:00:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D0D305C4D91;
	Sat, 14 Jun 2025 18:57:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 200AFC4CEEB;
	Sat, 14 Jun 2025 19:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749927600;
	bh=F7RYQQPryT0sa7wJgAyW69unFWlPTHeaut9xJUVW0wM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qnlc372Z6yk1pMCbnqRBUd4RD6u5uW8MWJwHtHtdqFEDB7NVXIHMvFzql4S+JrQQU
	 Z+RH5eEVTCfhiB/Il2PUiggLYnORmrTJLj1TjucJsu0Tg/PIAasC7fF1EA29avMJu6
	 4DFrMBE/pLz4MPlqY1DvD9ewXj2UaF7T+S/Cr27kTHJhS3atzryHDx8MBACANxJQlj
	 c7EZ3n79AIHSfmsNTFK0gsWzOasdjJNmLMM4Nemi154EJdsKv6StYECkIU8xemmvOM
	 ZtEuyX/KBP5f19IeXQ5M98Kd7DD/QYC+22ZLNSsOOgDU55L8Z+mi/7VwZnGAQozUzS
	 tg0cNNkZUmzvw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD64380AAD0;
	Sat, 14 Jun 2025 19:00:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: qcom-ethqos: add
 ethqos_pcs_set_inband()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174992762950.1151198.11331620801417396933.git-patchwork-notify@kernel.org>
Date: Sat, 14 Jun 2025 19:00:29 +0000
References: <E1uPkbO-004EyA-EU@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1uPkbO-004EyA-EU@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, pabeni@redhat.com,
 vkoul@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_120001_279844_6CD060C7 
X-CRM114-Status: UNSURE (   7.15  )
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 12 Jun 2025 17:16:30 +0100 you wrote:
> Add ethqos_pcs_set_inband() to improve readability, and to allow future
> changes when phylink PCS support is properly merged.
> 
> Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
> Tested-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org> # sa8775p-ride-r3
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: qcom-ethqos: add ethqos_pcs_set_inband()
    https://git.kernel.org/netdev/net-next/c/8909f5f4ecd5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



