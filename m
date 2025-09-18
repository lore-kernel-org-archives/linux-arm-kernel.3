Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06143CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 23:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zpz5cxwth4w/idMC7pe29tL+xH9NQL+t5tllvekVq98=; b=rUNKxMB9nT43yivHSvy1ocuwcx
	aZA3m2VFMgfiuudRaJvySE6gyQp4LGcR+SYWnpAB56UPqFHkl/n7mAl7h6qjMF2mjoJx3ZhNSGiJj
	sial28NyzW7Xl/k9AZYZ+4s+Wt03gTnQV+nuA6IY/xwYatdwmH94FEEVC+pxtS7zntpSrp2PHEu3X
	aBu/cY5E5MFmXZE0kums4n3A20afZCC2mzE7tZhLOadLdRLeS7cAK53jy9hwhONxVnHbMnx3dZytd
	wj5dL0++g7giWuZq5D2679i/N0xJcA/MqNPiU3N2C6VrxxwAg6Zo7ICiDNTrHxtHmlnB7HLaaij3K
	CCRrfgaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzNbq-00000001NMw-3Ozz;
	Thu, 18 Sep 2025 23:00:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzNbp-00000001NMo-3EUG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 23:00:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 35EEC60220;
	Thu, 18 Sep 2025 23:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D069DC4CEE7;
	Thu, 18 Sep 2025 23:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758236412;
	bh=105+uIrZkp6sYq6I8RVsLwvaVqaw324FP820a8j7Sp0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ttuu17Z6PrS2qFmdevl8TXGALCzKOF1C865rSoBUB9GRcTKp/cX7uwQDaNo+2CKd3
	 7hmGnaCiYZdwFO5Vic7/fh4xd4d/eO74sveed1bXpxMOLSfZbsvERx7Y8GVoKBnVqY
	 9ZaxWfN2c2zu2c80EnL9Lppn52utq43vfSVPJKBqzUq5q4vFuoRS1C6dN+2/1QD3ne
	 5Jkt/fDH3KLW4ElaobjdvOTZWfiDh2Hu36WHsV5Z6zbMc39q64x8nLx12u5EelOdo2
	 Y6tulpgwfdMPLrNq4la+uIb6mSoujKZJ6aLLtKxTnie7vh/RFmSqQjhyd47//3BVkh
	 blIHYzJjRdThw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEAB39D0C20;
	Thu, 18 Sep 2025 23:00:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: ethernet: microchip: sparx5: make it
 selectable
 for ARCH_LAN969X
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175823641275.2980045.9948655412326093035.git-patchwork-notify@kernel.org>
Date: Thu, 18 Sep 2025 23:00:12 +0000
References: <20250917110106.55219-1-robert.marko@sartura.hr>
In-Reply-To: <20250917110106.55219-1-robert.marko@sartura.hr>
To: Robert Marko <robert.marko@sartura.hr>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, Steen.Hegelund@microchip.com,
 UNGLinuxDriver@microchip.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 luka.perkov@sartura.hr, benjamin.ryzman@canonical.com
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

On Wed, 17 Sep 2025 13:00:24 +0200 you wrote:
> LAN969x switchdev support depends on the SparX-5 core,so make it selectable
> for ARCH_LAN969X.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>  drivers/net/ethernet/microchip/sparx5/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [net-next] net: ethernet: microchip: sparx5: make it selectable for ARCH_LAN969X
    https://git.kernel.org/netdev/net-next/c/6287982aa549

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



