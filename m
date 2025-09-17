Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0838CCAC59F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 22:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SnDUWyPlRWo33P0lkjafK4L7WoDQ3dNe36UYyhK4jpM=; b=rDkiPBzxWDQ8VmRi7JM4UodW3A
	P9FYegakrQFtyyOT0F3aI5YueSIVZzJU0G/oXeW/AqSfj0SQS57nvnlzpR842yebhfCSn2FEv2dQK
	4T/sqmUyk69IHR8+7XWou+9oh4Vp2PszGbWeyM4Gxy38/W8M1kWbOK9WnCZ4bAqaYGXwZVIx/Lu54
	xSBDizdfI/j1heoA+i1OK5qtHc5G9RRRlgBGybw1LpaPCLsIJVCBl0IN5Za+Wx+Q1X14O6uO4QzyS
	WZR6SXhDl8WAw894Q8V9mUpgbRFIkyCYYGFMalZjKKEHVgh+hazHS8L9EaU5nrTROiokLB7z8IciF
	jaC+ntdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz0Vn-0000000FDdj-3M0h;
	Wed, 17 Sep 2025 22:20:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz0Vl-0000000FDd2-2UnL;
	Wed, 17 Sep 2025 22:20:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A681A419BD;
	Wed, 17 Sep 2025 22:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E17BC4CEE7;
	Wed, 17 Sep 2025 22:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758147624;
	bh=UAXtTYSSZXwRncb6qHR46TFy6fZj+ssxz42YvkNnIos=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Rw09I1uCNEqwlDcoHmLxffqhGJuSYrqsfILM2GsfGu91XQDQL69XpD16n5/tCEARD
	 kSYmvF156axjFpN7K6cstRnL8OMaZqHJ/asvKIe31HssvMj4mqYzSNZzxL+iqnK7vH
	 CNoIIl89cN0GOr/ve7Cz3m4c8nzcqjeNrv5hpU3TG1P4IPlzkg9EjF/oVj3ASiVCeU
	 5ez0vme/bXEhj7+PW0Q0BCu922cvFc/r0GKwxweaOqq1Lju8qr7ceqV8s/T8As6liD
	 UzfAOcYHGfMKswCLzF6aWeIDjnuHiRpsq1XWSS7Lhikq5z/AE2F/WVyT3NYNXY6J9L
	 fBnS8LG50mqtQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3402D39D0C3D;
	Wed, 17 Sep 2025 22:20:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] net: cadence: macb: Add support for Raspberry Pi RP1
 ethernet controller
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175814762499.2168096.11472987759617415372.git-patchwork-notify@kernel.org>
Date: Wed, 17 Sep 2025 22:20:24 +0000
References: <20250916081059.3992108-1-svarbanov@suse.de>
In-Reply-To: <20250916081059.3992108-1-svarbanov@suse.de>
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, florian.fainelli@broadcom.com, andrea.porta@suse.com,
 nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev, phil@raspberrypi.com,
 jonathan@raspberrypi.com, dave.stevenson@raspberrypi.com, andrew@lunn.ch
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_152025_652247_24D9771E 
X-CRM114-Status: UNSURE (   9.88  )
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 16 Sep 2025 11:10:59 +0300 you wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> The RP1 chip has the Cadence GEM block, but wants the tx_clock
> to always run at 125MHz, in the same way as sama7g5.
> Add the relevant configuration.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> [...]

Here is the summary with links:
  - [v3] net: cadence: macb: Add support for Raspberry Pi RP1 ethernet controller
    https://git.kernel.org/netdev/net-next/c/dc110d1b2356

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



