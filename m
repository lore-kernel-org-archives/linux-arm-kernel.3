Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E801910F9318
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 03:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xq0jpX/GmgZ6+baOBn7EZFXwSouztqVdpgRdqbI3SiI=; b=Jqa2jB99okxcItMXA99ACe+s4a
	M0n7B0QN9kcnW82vVLRL3BxHeTwJ9UjitXrrY1Odns2sP0rqIJVBWqdzEqDmhoBaoy6VQ9T544j1U
	g4pvO050xf1ivjLI5ffQIkV4FJfg7IyPlSanzoepZ4Q0sQNTT8UmE8SjlzbmhY7PGARfPZwttqiXt
	ut9Z9NQPl6cvIq0xLFS7u+XyLJwXFBUjSAux9n05Etmigh6if8K2D3btAnr8vtOPxFne0lzeZH4OE
	Pf5XNWhBgH3vwnXOGkBruymRgPwDuVb+bQsuZLFUkYpKRzbCKpTUCfsBM/CU+TW8dJBdPtZr0Q5MV
	/lAE9foA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7m7z-0000000DtDF-3t2o;
	Wed, 01 Apr 2026 03:20:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7m7y-0000000DtD9-3RYy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 03:20:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D93C5600AD;
	Wed,  1 Apr 2026 03:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89B17C19423;
	Wed,  1 Apr 2026 03:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775013621;
	bh=aUSRSDwAprZUGjJG035g+sUqRo6NQqcdjqTDSA/goZM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=onNkqnsA5vBC8Yh2W9929sN4fnZMRbaJZDiAl/c/3OZbRivUldF8548sLx6kqpmWU
	 QYCKqjI9rVdx6yTI7shSFGDeGlh8PpaXEL8J5+JepeH5sikV/MS5+1Esl8ign4cZ5I
	 OCYdsoV293EYPUJKveNAQ7mBwGhGDqW4LMilYTq0FEieiNDqFzxHbl9z0LjwVEy6uT
	 lNaIIndbJORybC77AwYeqInOnpwVC06nrO1k8QQpV6dCV4FY8yMVU2aTeCNkgq83UR
	 Iqi3huwiGOQtOa9eXvvRnlCj4/J7CkmapvM/QlAuiNDQ3RBdiTni0DrpV0sOF9bhgu
	 z1wiaYB3ymlSQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02DD23808203;
	Wed,  1 Apr 2026 03:20:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4] net: stmmac: skip VLAN restore when VLAN hash ops are
 missing
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177501360479.3053582.8123053098284273856.git-patchwork-notify@kernel.org>
Date: Wed, 01 Apr 2026 03:20:04 +0000
References: <20260328-vlan-restore-error-v4-1-f88624c530dc@mmpsystems.pl>
In-Reply-To: <20260328-vlan-restore-error-v4-1-f88624c530dc@mmpsystems.pl>
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, ovidiu.panait.rb@renesas.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Sat, 28 Mar 2026 09:55:51 +0100 you wrote:
> stmmac_vlan_restore() unconditionally calls stmmac_vlan_update() when
> NETIF_F_VLAN_FEATURES is set. On platforms where priv->hw->vlan (or
> ->update_vlan_hash) is not provided, stmmac_update_vlan_hash() returns
> -EINVAL via stmmac_do_void_callback(), resulting in a spurious
> "Failed to restore VLANs" error even when no VLAN filtering is in use.
> 
> Remove not needed comment.
> Remove not used return value from stmmac_vlan_restore().
> 
> [...]

Here is the summary with links:
  - [v4] net: stmmac: skip VLAN restore when VLAN hash ops are missing
    https://git.kernel.org/netdev/net/c/48b3cd69265f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



