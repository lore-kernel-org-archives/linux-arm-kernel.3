Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9320AC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 01:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X/Kn4S97r1DRpKkBc3Oujt7LGplnSgsaJdi5sRAi7J8=; b=i2y4/3zvEvrbX8OrSrthTe7IlE
	AaF514SXDu3593TfQLFZ+9OZ8dVIeNvWSrUzxSxPK5p2WHqngoQ2NIb5/dzPTUWly7Hv6FXrSk/JO
	EwRfsdK6/Ne1mJMmvhAcsI8VHttxM8PNQCN8d4xMlVdzqXPPHqDlSDEFvqWmbz2NhkfUp/FaPFdZb
	oNl4/IObmSKry0l9FV7rMPlH/FI1S+bAiE2sbWU5n+zeFDAz8OBdMBDiMGDqXDXPxqNCiysLGdwGw
	gAwsBo5CIQJZujIAWyI62q8RQQNu0e4bpzxcB/dRTje7xsTxA5sozQFEE97+i/vxc7Oz0PGY2vVLZ
	NYhHtBkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAeyQ-00000000Tp8-2SVa;
	Fri, 02 May 2025 01:13:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAeue-00000000T3O-10kS;
	Fri, 02 May 2025 01:10:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5C1F35C59F3;
	Fri,  2 May 2025 01:07:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CD73C4CEED;
	Fri,  2 May 2025 01:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746148199;
	bh=g3TIEEz6QIKR/QtPPbov0pjIsuJaIQiZ5zX0ImOQ65g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RNIiQfyQKMbYJr+GH0Rg9tJL+SfU8HzfFSU53WmiuS/eKPNLNssZLHslpq9AeETch
	 1oBb3PNIIYka9ke7+pgw7oQOret1+EHAe8znJUnmGrEstpInsEuznvlPaKf+RgxQ5l
	 KmN8uCEAeNuyYVWi0DLwz5HWFWKZ6CeKw9K4fQPBK86+dlllMIHtMOA1X/huso+go2
	 SkE1tbzmbex0LwOrN1krervmIKyWEhtZOiu7Yv8xreYaSG8Wqk7soF4kD0mEikdkm/
	 l5T9zoPpjHweE4N6u91hDDXgTcllhw2hBOnJtTam7SRZWS+SesJBri3iXPNu0q/HnX
	 qncipP+9cadAg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CD83822D59;
	Fri,  2 May 2025 01:10:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: ethernet: mtk_eth_soc: add support for
 MT7988 internal 2.5G PHY
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174614823799.3123530.13600729204126295734.git-patchwork-notify@kernel.org>
Date: Fri, 02 May 2025 01:10:37 +0000
References: <9072cefbff6db969720672ec98ed5cef65e8218c.1745715380.git.daniel@makrotopia.org>
In-Reply-To: <9072cefbff6db969720672ec98ed5cef65e8218c.1745715380.git.daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: nbd@nbd.name, john@phrozen.org, frank-w@public-files.de,
 ericwouds@gmail.com, eladwf@gmail.com, bc-bocun.chen@mediatek.com,
 skylake.huang@mediatek.com, sean.wang@mediatek.com, lorenzo@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux@armlinux.org.uk,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_181000_323429_23A7AB5F 
X-CRM114-Status: GOOD (  12.36  )
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

On Sun, 27 Apr 2025 02:01:29 +0100 you wrote:
> The MediaTek MT7988 SoC comes with an single built-in Ethernet PHY for
> 2500Base-T/1000Base-T/100Base-TX/10Base-T link partners in addition to
> the built-in 1GE switch. The built-in PHY only supports full duplex.
> 
> Add muxes allowing to select GMAC2->2.5G PHY path and add basic support
> for XGMAC as the built-in 2.5G PHY is internally connected via XGMII.
> The XGMAC features will also be used by 5GBase-R, 10GBase-R and USXGMII
> SerDes modes which are going to be added once support for standalone PCS
> drivers is in place.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: ethernet: mtk_eth_soc: add support for MT7988 internal 2.5G PHY
    https://git.kernel.org/netdev/net-next/c/51cf06ddafc9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



