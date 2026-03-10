Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B47FCC9AE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 03:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xqZhTvRFtzuGISMCU5NHhMjD9DbEtLmM9zdfMwZlja4=; b=nUvF7eoNzoPEYH9VqcFDUBZhlH
	U+kpqjl3BFbABg6kOONBQ0/K0lPTy5Fjas+3C0qxqSthRjZMc2r8QmhC0sNt83qAsDv/cnMQm0f5O
	EzM7GbVsOMqSOwQTulYbQ4tKh3o6g4oFPDulOPtYMYtJHnmEDbQUI4yZKBxTI2dKWHsiXaoOK4JnE
	PuXb8vuX1N6m2vIpj/MIci1CTPbmYoUQe5fxTIAjDFZ9GXnHlyen9LmtmF79Fad3lz8m79BrFpqiU
	ReTrz+jR+IgpBkC5OvunYxtvgQDbi9emblS0AoAkmY+1fhWIePErQXqmhnbIznoMAQUk+yS306aMf
	LqRseRPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznKp-00000008bi6-2OQp;
	Tue, 10 Mar 2026 03:00:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznKp-00000008bht-05ZJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 03:00:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 75D426011F;
	Tue, 10 Mar 2026 03:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BD9EC19423;
	Tue, 10 Mar 2026 03:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773111638;
	bh=0Cds6kc09BVIRVjCoSPKhdBQsuXH0Iml0FDgoBrHwWw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=n3yv+jr5PBzgHxFh9U6Z63J3WEC7wrixS11Co244TfLFocCf8sEUkmggqFyrqfJRX
	 VsBFMEhcx6eENrMKibiJvD0WRBFqfmwEjqWxCzLmFr3QOAzQ0Mj/AeU+vDtyrIY16U
	 t57l01dwH7nE+gDijjkg9s+unb+f3/rx6h06n3g4PWhyhkJ3x2xvFKzDyg5PvSjmQt
	 7G4+BqeFJ6FeULNDTFr8tD5ZOfTTLGh6mR9gLujLk8y/ULYPMT+KAlIgu+JM+LsuME
	 E+8sT21I6ynzFJYdkeMWo2EIBq5QHZOjVsGldaJ+5SGaa8rDCkhqQ3bp08dh7UwjIc
	 68XAcBzf+7tOA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CEDD3808200;
	Tue, 10 Mar 2026 03:00:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/2] net: stmmac: further ptp cleanups
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177311163503.2039470.12160246560923313829.git-patchwork-notify@kernel.org>
Date: Tue, 10 Mar 2026 03:00:35 +0000
References: <aawDiK7DjcSXSs1X@shell.armlinux.org.uk>
In-Reply-To: <aawDiK7DjcSXSs1X@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 pabeni@redhat.com
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

On Sat, 7 Mar 2026 10:52:56 +0000 you wrote:
> Hi,
> 
> A couple of extra PTP cleanup patches.
> 
> The first uses a local variable when setting n_ext_ts which is a minor
> simplification of the code. The second removes the now unnecessary
> "available" flag for the PPS outputs.
> 
> [...]

Here is the summary with links:
  - [net-next,1/2] net: stmmac: ptp: rearrange n_ext_ts initialisation
    https://git.kernel.org/netdev/net-next/c/b560d4434f98
  - [net-next,2/2] net: stmmac: ptp: remove redundant priv->pps[].available
    https://git.kernel.org/netdev/net-next/c/687e7863f027

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



