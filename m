Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58440E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 11:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1HL3/42R2ctg9ARJpBqESpV9lntyAez78x+zirIUE44=; b=BDljGVGr3qwW+/9MPnlHXUcwJ3
	YyYPKekJ0kkMgmgvKzocJE4hoxbWjyV5BvreGAqcLJwVIHF1YQ4YfZn18TZSyTzKKq/yDiBGo7D8e
	8YY4OsPaAOM0Jg4pXp03wlHOHMuQT8bAZM7nar1cuubQlZOEbcy31Z0FruqtswnOk60gK/dDblZMZ
	Lfo5QxA7nseJ9hZCdJM1I/wsxpKl3ATJbZPhJzqYTeBaPTw51OUYQOioocnbTXkZPun2LcE5jhbwA
	nm4fCfNylSD4nhDFEr29b1EKkHad4dFegjBtvrvhUid65BSGzrdRUJHHA5kov0yNlbnZAiihPM0NH
	6ea3RTSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8ET-00000004fAB-42qJ;
	Tue, 07 Jan 2025 11:58:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV7wS-00000004bQu-0SDx;
	Tue, 07 Jan 2025 11:40:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 66A725C60AC;
	Tue,  7 Jan 2025 11:39:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36963C4CED6;
	Tue,  7 Jan 2025 11:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736250011;
	bh=VZsqylYrFcdy7rVu50r2zA8B698Fb8nwUwjNptFXD4c=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=r540sbn0QfP0pxOq6ybHGoGDckuiCe/53bQM4ECL3et2rQ8iCtkrwK9vrsqA2blfJ
	 5bG0euoOLVi7KZ4JKvtiGEwGHCnM5fjXWA+Ke1I2J1mCIsYX+6g4YPb4tf6OAS89y7
	 tLwB8r2RY1RbUVG4K57YQwWEA8zbIMHhCn2dTUYt6Jb+3HYk24Qgb3JKmJEDMLJbDG
	 NlQXqMlLnHpaswjhl1kJ0cIiiXvdWM8DGf6zElne3sGGxcvmmatBNDk6iE4/cIBTtm
	 Ceq//Cwk1mKA0F5dyPS8gwZEcPQUUJLsCxgEM6kLsoILehI41faURyLIbKNI36U4Jr
	 hKgYyo9tXwQBw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADFDD380A97E;
	Tue,  7 Jan 2025 11:40:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/4] net: airoha: Add Qdisc offload support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173625003251.4120801.586359106755098449.git-patchwork-notify@kernel.org>
Date: Tue, 07 Jan 2025 11:40:32 +0000
References: <20250103-airoha-en7581-qdisc-offload-v1-0-608a23fa65d5@kernel.org>
In-Reply-To: <20250103-airoha-en7581-qdisc-offload-v1-0-608a23fa65d5@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: nbd@nbd.name, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, upstream@airoha.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_034012_188644_28B9E66E 
X-CRM114-Status: UNSURE (   7.51  )
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
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 03 Jan 2025 13:17:01 +0100 you wrote:
> Introduce support for ETS and HTB Qdisc offload available on the Airoha
> EN7581 ethernet controller.
> 
> ---
> Lorenzo Bianconi (4):
>       net: airoha: Enable Tx drop capability for each Tx DMA ring
>       net: airoha: Introduce ndo_select_queue callback
>       net: airoha: Add sched ETS offload support
>       net: airoha: Add sched HTB offload support
> 
> [...]

Here is the summary with links:
  - [net-next,1/4] net: airoha: Enable Tx drop capability for each Tx DMA ring
    https://git.kernel.org/netdev/net-next/c/5f7955903804
  - [net-next,2/4] net: airoha: Introduce ndo_select_queue callback
    https://git.kernel.org/netdev/net-next/c/2b288b81560b
  - [net-next,3/4] net: airoha: Add sched ETS offload support
    https://git.kernel.org/netdev/net-next/c/20bf7d07c956
  - [net-next,4/4] net: airoha: Add sched HTB offload support
    https://git.kernel.org/netdev/net-next/c/ef1ca9271313

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



