Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8332C369B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 23:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQIZFlCPibizKXhvar99W1K7dgV/OfJMMxgvyW8K1Fg=; b=XbzkHvbL8SYTQYsTtypvmiZBc7
	Wxl3yAG12zz0H9yZnwWlkcFnCN1iMq3urjjz45/mxcnlPZdb5Kum3dY60fvu8AVD2fEJ/bTuWfE5h
	MV+YlfQhNfJDJqoBK9aJxJhmVyOojkfCNd6apm81l3vzT/3MJmbokRLnC0dkiGIkr6wNA6UgSqn8D
	Y/OE2fLo0X5hTuPw+ge6QWXEtuP9sPbgiGCVlm0viEmdOBrhhfF+6djE8vf4xpTOrViUyMNCe71EU
	qJEAF7SOsfwdz2FrcZjtMPLKpt27vLAjBaMgRay7+ZJ6AVNj9iSULywQCscJ0i37wabYyB/jpO38n
	vodPezhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4T0O-00000003sIw-3UHS;
	Mon, 14 Apr 2025 23:14:20 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4SwE-00000003qUp-3Aur
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 23:10:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 18B2EA4A374;
	Mon, 14 Apr 2025 23:04:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20F20C4CEE9;
	Mon, 14 Apr 2025 23:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744672201;
	bh=kROQQEO8+TMrf324dpy5mOF7Dx1PBVtIvpcK+Zvgr6k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YGgW25A5QjKiqLBGOiVjcCLGCGCVU8TouC3ZDc/kEnH6l/JvRuu7b89W+brlQ36wX
	 tKU9p1auYdALhGA0HeHXDaCdTp9DYeM72EJWDNXJi73yYBLzAm4lv6S2IrPmg27vtq
	 FnUXH+o8SEaw4JQmHg3qPnzJ8YCesmqsyiEP1YrYsPdOU3VhVtkZlGi9mhfE+juMee
	 yiYxc52A57Y5kUSWG3IOAyEFHnk9iZdbxhKY9bUuSJmHXNXX8KriIZFehIaJRhcHSn
	 bxkN8H+QjYrklSGXur4Pcodd6LJpZaQ1j6j438hRRorm+6QSFHyl9ImMAOH1X+9d4c
	 dttKUc3uYoWRw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C6C3822D1A;
	Mon, 14 Apr 2025 23:10:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/2] CPSW Bindings for 5000M Fixed-Link
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174467223899.2068134.1491793248862918118.git-patchwork-notify@kernel.org>
Date: Mon, 14 Apr 2025 23:10:38 +0000
References: <20250411060917.633769-1-s-vadapalli@ti.com>
In-Reply-To: <20250411060917.633769-1-s-vadapalli@ti.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, rogerq@kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srk@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_161002_866365_E4652759 
X-CRM114-Status: UNSURE (   9.48  )
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

On Fri, 11 Apr 2025 11:39:15 +0530 you wrote:
> Hello,
> 
> This series adds 5000M as a valid speed for fixed-link mode of operation
> and also updates the CPSW bindings to evaluate fixed-link property. This
> series is in the context of the following device-tree overlay which
> enables USXGMII 5000M Fixed-link mode of operation with CPSW on TI's
> J784S4 SoC:
> https://github.com/torvalds/linux/blob/v6.15-rc1/arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-exp1-exp2.dtso
> 
> [...]

Here is the summary with links:
  - [net-next,1/2] dt-bindings: net: ethernet-controller: add 5000M speed to fixed-link
    https://git.kernel.org/netdev/net-next/c/f9c1120d9b5e
  - [net-next,2/2] dt-bindings: net: ti: k3-am654-cpsw-nuss: evaluate fixed-link property
    https://git.kernel.org/netdev/net-next/c/8b36a102c1a1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



