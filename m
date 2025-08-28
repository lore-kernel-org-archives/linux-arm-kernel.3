Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35B4CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 00:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PHSJ+Uf/KZbNxBYYx40KbK83TUFWghYNLecEdAEzL24=; b=zetwh+OMlutIAk3dPr+LKLiTkm
	nheZ0dm7p+LNVU7T/cVHEM+nAYW4qn7zxCkkj0GgVT2ouUG32/rsxEI4GBGVKFIXo0Oq9LXfkbzt4
	5hMXotpsM7c3fYOfRp6IcnrrJTkNTLmiC4xJCnpRCfTOLOYx760yUcL3JSokMwOvnvxCV6yIvPzHw
	ZYph7svniw5DjxPuhOvQogvNsPcE47C+ZiUG3ZE+sLS5+mUb//aVHNh9clS7RKWPcvQo2uLpE8sR4
	JDFXssDMn3T0cpBfTnFomH1n+RydoNUObgB//1kim6joN9MkC3n5zV06f7azokartgL10VZcQmtx8
	/NbPrgDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urQUK-0000000HMgc-2Eak;
	Thu, 28 Aug 2025 00:27:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urQN5-0000000HLDk-3fqQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 00:20:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C488560236;
	Thu, 28 Aug 2025 00:20:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75385C4CEEB;
	Thu, 28 Aug 2025 00:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756340406;
	bh=aHeD1aY+qybOF2MyfLbGundw1HAEI2tqJvxtmi3Qw/U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LKmwfu7EHjfehihErSqcf5xhSZpGelriAcJqReGjZEWRHMG0ukUwzBfpAiGFjK5X/
	 woBVjMzQfva3EJQlyJAhKs+I3r4lDVdFeI0LP8ET2UXapzFdn8C0Y9yMS/5cUxQEsE
	 Zq/bqUdNiZyDXczcSxbSOlOCYXP+NfeZTX9pcLqkQOrPaX91xvo49vfSLNa6kSQfi3
	 5tREyjUtNSWv5mNH36Kbh7CcSSQ+8qzpAQXF2LSR2Xew55M07wlwiFqk8FrhNQPITM
	 DnLjDkPF5H/mbRi/WRq0nMgJGbtCzxnwMbC6oNItJpnuYKduwI84k/naMrj8n4dfDk
	 6D+oPjXxtuOfQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAFC9383BF76;
	Thu, 28 Aug 2025 00:20:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: rk: remove incorrect _DLY_DISABLE
 bit
 definition
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175634041376.884225.299755705945387138.git-patchwork-notify@kernel.org>
Date: Thu, 28 Aug 2025 00:20:13 +0000
References: <20250826102219.49656-1-alok.a.tiwari@oracle.com>
In-Reply-To: <20250826102219.49656-1-alok.a.tiwari@oracle.com>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: david.wu@rock-chips.com, jonas@kwiboo.se, rmk+kernel@armlinux.org.uk,
 mcoquelin.stm32@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
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

On Tue, 26 Aug 2025 03:22:15 -0700 you wrote:
> The RK3328 GMAC clock delay macros define enable/disable controls for
> TX and RX clock delay. While the TX definitions are correct, the
> RXCLK_DLY_DISABLE macro incorrectly clears bit 0.
> 
> The macros RK3328_GMAC_TXCLK_DLY_DISABLE and
> RK3328_GMAC_RXCLK_DLY_DISABLE are not referenced anywhere
> in the driver code. Remove them to clean up unused definitions.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: rk: remove incorrect _DLY_DISABLE bit definition
    https://git.kernel.org/netdev/net-next/c/705609dedea1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



