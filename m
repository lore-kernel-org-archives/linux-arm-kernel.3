Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C977CC5AD05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 23:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E68RC5/twtj45/6fLwKWYu9o2XCVT3SNadk/AlttQoU=; b=DaZchdqMuT4IwuMwSE3AO0K2QT
	oH8tAXwHqCzDSJTUIXs/wxNNpEdWkuFHDIaoWfAspAyacqqnokKjA3XUyKwIiT8lI60f+3Qw/zot7
	CbcOLrTCX6sa2/HOgnKmcNT6dGOpbC9cAqVzXgDPZOcZAaRpPBS0h8/pzmXXNYWKg1qEmq492dgx2
	dREVG3qWB+mzp0M5yis22Y8XOdTSGr9K3/CNptt1VRWgNoIuCd1wgB3aSA435GZOOGM1RgjiG9R9m
	Fymc3vBopY7fGGCSL0eEAEH0N+z3HpM4yueF5VHBHhE8NK5Sn1E9F3XIiwjJ2w46OsBTG7SKM5yAH
	Crh3WlUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsULV-00000008t7L-1MJK;
	Fri, 07 Aug 2026 23:51:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsULU-00000008t78-0l7W;
	Fri, 07 Aug 2026 23:51:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B19516001A;
	Fri,  7 Aug 2026 23:51:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 679961F000E9;
	Fri,  7 Aug 2026 23:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786146680;
	bh=E68RC5/twtj45/6fLwKWYu9o2XCVT3SNadk/AlttQoU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=WUC8caj14GrS2ZXOk5NAHt9JGHTxA7DYCs+67r5KXEzPjr7eG6bG0ki7+C4MPV4P5
	 v8Ds8ZGmuhbLbWES/MWP3hSKOvjLF/HTlZrDUR2lVNcHwu8v9BzaR1pr89MAfFlUYQ
	 FNt77GfGoM2JC1I3HXTwew2lawfK14SiGYA7AVyFBeTCVRnyuMgIvFAOYYzm2LsWwg
	 qybtk/eGi9uE2+v8DjEki0cjn+WEkV1zjmBT2EgbPjJrv9MiBMgYYF5aMKEeej6vbA
	 4RRV83VopF0lF3G75vHJuq594JY5vkHiu89P5+Ayhw8US/SgNJQ41j5AFGYWAh0k8q
	 12G4kF19tiLYg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1992C380CEF9;
	Fri,  7 Aug 2026 23:50:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2 0/6] net: dsa: mt7530: fix remaining swallowed MDIO
 access errors
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178614663864.2467553.3447104731237010807.git-patchwork-notify@kernel.org>
Date: Fri, 07 Aug 2026 23:50:38 +0000
References: <cover.1785811140.git.daniel@makrotopia.org>
In-Reply-To: <cover.1785811140.git.daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: chester.a.unal@arinc9.com, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 lynxis@fe80.eu, hkallweit1@gmail.com, linux@armlinux.org.uk,
 rmk+kernel@armlinux.org.uk, sean.wang@mediatek.com, Landen.Chao@mediatek.com,
 f.fainelli@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
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

On Tue, 4 Aug 2026 04:10:17 +0100 you wrote:
> The original series, "net: dsa: mt7530: fix swallowed MDIO read
> errors", landed on net as its v1 [1] just before its v2 [2] was sent.
> This series started from the fixes in that original v2 which its v1
> had not already carried: the two standalone patches that original v2
> grew from the Sashiko AI review of its v1 (the mtk-lynxi read check
> and the regmap IRQ serialization), plus, split into patches of their
> own, the companion fixes original v2 had folded into the
> already-applied patches -- the unchecked bus->read() in core_rmw() and
> the unchecked PHY_IAC command writes in the MT7531 indirect PHY access
> functions.
> 
> [...]

Here is the summary with links:
  - [net,v2,1/6] net: pcs: mtk-lynxi: check regmap reads in mtk_pcs_lynxi_get_state()
    https://git.kernel.org/netdev/net-next/c/5cc65c01cdc5
  - [net,v2,2/6] net: dsa: mt7530: check bus->read() error in core_rmw()
    https://git.kernel.org/netdev/net-next/c/573d6e3afe3d
  - [net,v2,3/6] net: dsa: mt7530: error out on failed PHY_IAC command writes
    https://git.kernel.org/netdev/net-next/c/1c95dcb7e923
  - [net,v2,4/6] net: dsa: mt7530: check CORE_PLL_GROUP4 access in mt7531_setup()
    https://git.kernel.org/netdev/net-next/c/1ae63b018d3d
  - [net,v2,5/6] net: dsa: mt7530: check command register writes in fdb and vlan cmd
    https://git.kernel.org/netdev/net-next/c/f67b0bae07fe
  - [net,v2,6/6] net: dsa: mt7530: serialize the regmap IRQ chip like every other user
    https://git.kernel.org/netdev/net-next/c/dd52b3df25ed

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



