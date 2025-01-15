Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AAE7C02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 02:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OmZkHxZgYszr9OJLzBc7+VLA9WrD/JWMgUvE0CavqbY=; b=na2pWOPyjT6Qv4dmQA7xv7qkZG
	CGas069GMlZ6yCDB8TungHIbObhhQ+p2eNuBZcnrlg4FMDNVwbh4JWtKKFyELRXLHiBH6ZQ/5lVDx
	ZPNM+NCC+cRt+BevpHZHaZf7G9Lk8z+22RmxJJ4IV3YpTRpklzAGX3LSroeobt7lYHOAqS703GMZ5
	rWCc3P3huO04vYtHaWIZp8XpAXEoH1GvL5tf9DPgEjODc+8vS0tkQnfm70cF4edXkG8JteLayGtGg
	7P1hCUH7Al5hRimK0hmRkANXXqSPoik44NDF15hZPRWJng414S+HEuyszFbRRCekf0b3DcE88j7uC
	+qfyi5NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXtRK-0000000ARl8-2wjS;
	Wed, 15 Jan 2025 02:47:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXsEX-0000000AIiT-3xQD;
	Wed, 15 Jan 2025 01:30:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 789F35C5A8A;
	Wed, 15 Jan 2025 01:29:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBF51C4CEDD;
	Wed, 15 Jan 2025 01:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736904613;
	bh=JGayQbeENovujuBJWgRZ/GamXKwMqxtIrxDsX3uD4PM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=poCMdomjGUuv1enZWrMvQBGikq7XqoWdPgtThSf6VzWj1cHh6JoKhVxbdVGVV5Ikg
	 5oizYvsuhFMUEDjOVaFAvsIREsVuQIWJI17F0inIkQrpxtB2W8hS/8kMDKB4r2bHQA
	 jC/kW3Joug10ioV5ozO8enrCq6Ybc5t92fwjCG+rGoArewA56P0xfQFTuDtPSK4ewu
	 0wgZiobEWDpWuaU3zbC/xzlXm7UFuoPY6xjkWL0On2mGgWwzv1T0sB+WqsPqTGDpWx
	 cprgUbxTRDIRj9yv6OcZAm8QfTHoSmIH1Yye3D9IUgvo3u3nxqkSdxITZWNGMEbRFa
	 qk6GtI/rG+6zA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB9DF380AA5F;
	Wed, 15 Jan 2025 01:30:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: phy: Constify struct mdio_device_id
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173690463579.211072.4197459392952353174.git-patchwork-notify@kernel.org>
Date: Wed, 15 Jan 2025 01:30:35 +0000
References: <403c381b7d9156b67ad68ffc44b8eee70c5e86a9.1736691226.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <403c381b7d9156b67ad68ffc44b8eee70c5e86a9.1736691226.git.christophe.jaillet@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: michael.hennerich@analog.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, florian.fainelli@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, rjui@broadcom.com,
 sbranden@broadcom.com, richardcochran@gmail.com, kabel@kernel.org,
 daniel@makrotopia.org, dqfext@gmail.com, SkyLake.Huang@mediatek.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, arun.ramadoss@microchip.com,
 UNGLinuxDriver@microchip.com, lxu@maxlinear.com,
 piergiorgio.beruto@gmail.com, andrei.botila@oss.nxp.com, heiko@sntech.de,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_173014_021832_F075BC14 
X-CRM114-Status: UNSURE (   8.65  )
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

On Sun, 12 Jan 2025 15:14:50 +0100 you wrote:
> 'struct mdio_device_id' is not modified in these drivers.
> 
> Constifying these structures moves some data to a read-only section, so
> increase overall security.
> 
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   27014	  12792	      0	  39806	   9b7e	drivers/net/phy/broadcom.o
> 
> [...]

Here is the summary with links:
  - [net-next] net: phy: Constify struct mdio_device_id
    https://git.kernel.org/netdev/net-next/c/b01b59a4fa87

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



