Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E131D60D0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 02:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bS/bszskaunQtn5O7AbK7xxz4UVQi1a2URjfDpmGlac=; b=IFV8KupOzF+P81WzVZytLamcEL
	l6kzU5mEkzusL+wTMYOQOeTeRa6B3FOvj1T69EXypu7FqrI7byocQbn/tjLYxSMYGgD25uQIBOz45
	fiWLTH9YQGfGYvFEhxKZaYrCpUHSXfJemIVKn3QnfRz5yykQcg1RDxMvWoUdwvCbgZdwqXUgSwaSa
	Zz1JmEgnJbq121hTvHw7OBnsJtEuN7CoDgjveLC7UcfUMkp4PPzRXBZzYJQBhlkneH/es98Gernwh
	1dooMLmqxyuCm9Zm1iN5FOAz4ZHrd59GcnoUJOMlJz3dSV/pvSViMacjdPA4mQoCIptfusu6RcMZA
	Efli/+1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDEKy-0000000BDnT-0zmB;
	Tue, 19 Nov 2024 02:51:32 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDEK1-0000000BDbX-2Tva;
	Tue, 19 Nov 2024 02:50:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 59C1DA420EF;
	Tue, 19 Nov 2024 02:48:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89230C4CECC;
	Tue, 19 Nov 2024 02:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731984631;
	bh=Ha7SmjzU6kR5PF91UXf7/vsCWz9jCADUb7sKYfiQKOw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=iyPwiOH4DwAjUgaW0/QsMig8E5CmdC1IOhb16uDY9SB+WqGhYSKeWMeHo3JSVLIl2
	 xqtFGYKmxvII4BqSnJMJ03MHO7iKoe+cjmw6oCLLsfJiPrSaWlGkZaW/L+SSH6knwD
	 j1FQTg2LycmbBif2FcI+oWI9l6A9CfZkomFfBEFEw5rcnNLUi8DWTfvHNuS9ycsqNr
	 rUv5skuBLxqS6W0A2guirjx3ngg/yk+e6bRc/rQ5JFGIWEmNP9WRBKnDtUyTNGC/y5
	 ZAxLcHSvUjksmlzABrAYJBI6Afd7MXMB7Qxxkd6uBtwFRinElJMVqVXCc+KhqLnbV/
	 2CQymSQGBNqVA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33EAF3809A80;
	Tue, 19 Nov 2024 02:50:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net-next,v2] [PATCH net-next v2] net: wwan: t7xx: Change
 PM_AUTOSUSPEND_MS to 5000
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173198464299.82509.13521106386231402848.git-patchwork-notify@kernel.org>
Date: Tue, 19 Nov 2024 02:50:42 +0000
References: <20241114102002.481081-1-wojackbb@gmail.com>
In-Reply-To: <20241114102002.481081-1-wojackbb@gmail.com>
To: =?utf-8?b?5ZCz6YC86YC8IDx3b2phY2tiYkBnbWFpbC5jb20+?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: netdev@vger.kernel.org, chandrashekar.devegowda@intel.com,
 chiranjeevi.rapolu@linux.intel.com, haijun.liu@mediatek.com,
 m.chetan.kumar@linux.intel.com, ricardo.martinez@linux.intel.com,
 loic.poulain@linaro.org, ryazanov.s.a@gmail.com, johannes@sipsolutions.net,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_185033_697772_0A21CAA5 
X-CRM114-Status: UNSURE (   8.38  )
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

On Thu, 14 Nov 2024 18:20:02 +0800 you wrote:
> From: Jack Wu <wojackbb@gmail.com>
> 
> Because optimizing the power consumption of t7XX,
> change auto suspend time to 5000.
> 
> The Tests uses a script to loop through the power_state
> of t7XX.
> (for example: /sys/bus/pci/devices/0000\:72\:00.0/power_state)
> 
> [...]

Here is the summary with links:
  - [net-next,v2,net-next,v2] net: wwan: t7xx: Change PM_AUTOSUSPEND_MS to 5000
    https://git.kernel.org/netdev/net-next/c/a0c80d5108ab

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



