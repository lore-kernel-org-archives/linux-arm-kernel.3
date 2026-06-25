Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A13ACDE001
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 16:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LGBo2vf5YhWLqWr2lTqOOyhPJy8D4/FOwRNjsyPwlAw=; b=KGnL826LfzShczKS/dnWOhObqb
	usieXDaBrUh0vmCW+kODOZCf3hJsJ7pJBxcSbFlDsNS367IRvy/qCpjhAgO2li0pQwwkh0CF1FPwL
	PhQ1Oq43QhzyKXihVBdfcW38ar4wtHvDPhDEI2v/7Qlv/CesXrOeyImGdGjsjmkomj903y0uXqnFS
	FNLcM4mdJ+okkQSjfLz6VCCHQqPDCHBz5LNDXrvMNuWR7qhGVY880yNIdunrnOIs07PooYkSYKK7w
	RZbS6ZXcXBhx5e71dHEJMybYLeTT6TP18iuK4BSM9rqi1A/FtMaMt0DOXkkiuH16c90zvVCuuNmgS
	0gUteDyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcmpB-00000009T5N-1nJb;
	Thu, 25 Jun 2026 16:21:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcmpA-00000009T5E-2BpH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 16:21:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 13E8240B71;
	Thu, 25 Jun 2026 16:21:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8C061F000E9;
	Thu, 25 Jun 2026 16:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782404468;
	bh=LGBo2vf5YhWLqWr2lTqOOyhPJy8D4/FOwRNjsyPwlAw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ikqMxPyqHXeNLjjVPGzWundaHYDRIPj2Iv983MLxSlcNsDXVawdAthu910VhKzErK
	 a0nchwckRMPHDXVdS5ay8Ez9rPwq/wHQgFWLqg0KcihDmEKJg6E8UqY4o/CMiPokkG
	 OJ8pVzzNizLvatWF1iQWns7BHpw7tGMJPQlGfOTzD9lsC2sqD2pLuUEbUFmxoKDeWb
	 dH/GAXeWB6vk6w3/DTmwckAk8eV2XG0D7nfPMEfjt+hDFPVp0v1saRGvKLtlx7tGt6
	 EsxKpIWKE0D3VQSEkutqydIrFGiQJUNPDEJf1gprFkuANHttP4ONB63w7bsOjW6ic6
	 y4MXHjDhnl1uw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A363AD449A;
	Thu, 25 Jun 2026 16:20:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: sparx5: unregister blocking notifier on init failure
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178240445557.3803792.18219919431428523826.git-patchwork-notify@kernel.org>
Date: Thu, 25 Jun 2026 16:20:55 +0000
References: <20260623115714.2192074-1-haoxiang_li2024@163.com>
In-Reply-To: <20260623115714.2192074-1-haoxiang_li2024@163.com>
To: haoxiang_li2024 <haoxiang_li2024@163.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, Steen.Hegelund@microchip.com,
 daniel.machon@microchip.com, UNGLinuxDriver@microchip.com, kees@kernel.org,
 horms@kernel.org, bjarni.jonasson@microchip.com, lars.povlsen@microchip.com,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

On Tue, 23 Jun 2026 19:57:14 +0800 you wrote:
> sparx5_register_notifier_blocks() registers the switchdev blocking
> notifier before allocating the ordered workqueue. If the workqueue
> allocation fails, the error path unregisters the switchdev and netdevice
> notifiers, but leaves the blocking notifier registered.
> 
> Add a separate error label for the workqueue allocation failure path and
> unregister the switchdev blocking notifier there.
> 
> [...]

Here is the summary with links:
  - net: sparx5: unregister blocking notifier on init failure
    https://git.kernel.org/netdev/net/c/483be61b4a9a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



