Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F29C8C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 08:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7o7uwFNCO2tDJrAQJgjB/tULGXjD64gbJfysYTaXg9Y=; b=fPMLOfMhPV7Md8Mr5KqyzmgmFf
	tnqt3RhTctMpwhviEvPXdNFTtRUZJ0PKqViQUJuNO6C0Ti+Hx5TS3HUeqNTr6YYcNhX7WBBgZoFzh
	ewFZIvFdZTRpSaIb3Xckyo+KAHedJk06FaDb9CuHY879HP2uVj+wb3h4TooRO3qyvEi8K5tan1pPB
	ZNNKNSx6Yuwiv+BM6Ylg6YEKqgHmf7xY8RQ2bK30CoGV4wr90AGkgHHUTjRwdRrOAU1TUsXPxXcpJ
	LpYTpr63D328TG92mQVt4Gxj7KDtbGSZ99ZdMAToZwedSQGNowh6ih+176TqsaHhodCA0OiRM/6D/
	LnSmYWBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5Yk-00000008kjf-0OJz;
	Tue, 21 Jul 2026 08:10:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5Yi-00000008kj8-3v4l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 08:10:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1CCEC60A98;
	Tue, 21 Jul 2026 08:10:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C61D51F00A3A;
	Tue, 21 Jul 2026 08:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784621435;
	bh=7o7uwFNCO2tDJrAQJgjB/tULGXjD64gbJfysYTaXg9Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=OIQlFZzGu6nXEeX7zUKxUmeixYUNwwBPBfLC3WUiXMDaIbPqUIoj7xxdtmgOnZFYw
	 XgHvGvHRcEg2cMV53r2NEhiQAr42byyOco43xB2xFo8XupTm2vJzItiTCojOeM7RwY
	 gR/tm47ss+RFAXVJ4bsLc5GHimx1GQcaEVpq6KEImk83JHYpm+itxOH5vLii+cg86c
	 xYHvNeZ6svvD/913PwuX3AoHU1WkhUYTaUi9Go48zOtDIu3AFqpQNBdh9D/9FY8gYh
	 iHcBjiktihSuSS8UuoSExGF/DdfnKI7K3VZXBNiUu5u6OVJbKkLi8HAHGlCRDI5XZ1
	 eCdL/+lbabH7w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A473924A2B;
	Tue, 21 Jul 2026 08:10:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: sparx5: configure TAS port link speed
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178462140540.147087.2700463429502862758.git-patchwork-notify@kernel.org>
Date: Tue, 21 Jul 2026 08:10:05 +0000
References: <20260707170531.1129866-1-robert.marko@sartura.hr>
In-Reply-To: <20260707170531.1129866-1-robert.marko@sartura.hr>
To: Robert Marko <robert.marko@sartura.hr>
Cc: daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, Steen.Hegelund@microchip.com,
 horms@kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 luka.perkov@sartura.hr
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
by Paolo Abeni <pabeni@redhat.com>:

On Tue,  7 Jul 2026 19:04:48 +0200 you wrote:
> On the TSN and RED variants of LAN969x and SparX-5i TAS (Time-Aware Shaper)
> is present in the silicon.
> 
> Currently, the driver does not use configure it at all, which means that
> the TAS_PROFILE_CONFIG.LINK_SPEED[1] value is left at the default of 3
> which means that its configured for 1 Gbps.
> 
> [...]

Here is the summary with links:
  - [net-next] net: sparx5: configure TAS port link speed
    https://git.kernel.org/netdev/net-next/c/80d8e1d428e8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



