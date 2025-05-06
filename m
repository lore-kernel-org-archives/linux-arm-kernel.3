Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A599DC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 05:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=elkHMi2vBDUR9o8Znwk2R41PResANzrCDX0H2IuZW38=; b=cV6NrXuMd3OUsyM8OD786f7JbI
	xZfzydOPcLOwU9rsyt6Bg69CHW9GjkT0Wtpyg6BlFGsn4B0CDbzXIs3y2pcN8IhLCZn9r80M+rpLs
	eElgQqyxLoJ12gCATVnffFUeg0Y4Z+j/ANXvdismrLD4TQCEvh/U5g0AFWvopPR135zDNxbSH7rR8
	OjZu27lGmMVdzb/dzKqyriJ4s5XYKWugv0dodSEmQ4r+hrVkaQ3ecBriit77kISJvczIpQ0YeAzy3
	TWoDMQRxaabnr9XQ4L2THLakSMuhfBDI5/afcMI2iCR13dm7H/qNAE6+L/NknItfoSmNVf0UokbGt
	rpzhJkcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCAf0-0000000AOUo-02QO;
	Tue, 06 May 2025 05:16:06 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC7Hp-00000009YxS-10Bt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 01:39:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3F501A4C380;
	Tue,  6 May 2025 01:34:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8404AC4CEE4;
	Tue,  6 May 2025 01:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746495595;
	bh=J6VCx58aPIj5qLD9UFq5VcZ5/9rOOJrDsTC8KP7EURs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dIaKC8P26H7DvCj/y0I+1KYUj0Al7QftxVLpD+HbitX+IJ0B5frvsOD+Obnhai/ar
	 AHglRqyWCV3UumGQCsk4FrlWAFoYaHx4SD76o/GR0Wm8RvQ62KTwUKc+cfdxbmA8xj
	 YFcmFw7/xbnFT2jxOf5eylTUTCcEyw7a1h5od0xyaubWDXFLeOqJEL/4yqnAKKnGOA
	 8hu78rxvivN+Rz7ZVICVBt6/gkUwxVREwzUwOdfvjEiCPcboD+KrEp06AtBXvSzAwL
	 8MvU9GMP/+VZXHkC7wh2bgsyxMjRW0LRhIHpBDGzorukQxdEv/MC05v4pMFqjsKxR5
	 ey1iG0FmsGojQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EACB8380664B;
	Tue,  6 May 2025 01:40:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v8 0/3] net: ethtool: Introduce ethnl dump helpers
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174649563473.1007977.7672899969747094787.git-patchwork-notify@kernel.org>
Date: Tue, 06 May 2025 01:40:34 +0000
References: <20250502085242.248645-1-maxime.chevallier@bootlin.com>
In-Reply-To: <20250502085242.248645-1-maxime.chevallier@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, andrew@lunn.ch, kuba@kernel.org, edumazet@google.com,
 pabeni@redhat.com, hkallweit1@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 linux-arm-kernel@lists.infradead.org, christophe.leroy@csgroup.eu,
 herve.codina@bootlin.com, f.fainelli@gmail.com, linux@armlinux.org.uk,
 vladimir.oltean@nxp.com, kory.maincent@bootlin.com, o.rempel@pengutronix.de,
 horms@kernel.org, romain.gantois@bootlin.com, piergiorgio.beruto@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_183957_338645_D8F91F23 
X-CRM114-Status: GOOD (  10.45  )
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

On Fri,  2 May 2025 10:52:38 +0200 you wrote:
> Hi everyone,
> 
> This is V8 for per-phy DUMP helpers, improving support for ->dumpit()
> operations for PHY targetting commands.
> 
> This V8 fixes some issues spotted by Jakub (thanks !) on the multi-part
> DUMP sequence. The netdev reftracking was reworked to make sure that
> during a filtered DUMP, we only keep a ref on the netdev during
> individual .dumpit() calls.
> 
> [...]

Here is the summary with links:
  - [net-next,v8,1/3] net: ethtool: Introduce per-PHY DUMP operations
    https://git.kernel.org/netdev/net-next/c/172265b44cd3
  - [net-next,v8,2/3] net: ethtool: phy: Convert the PHY_GET command to generic phy dump
    https://git.kernel.org/netdev/net-next/c/9dd2ad5e92b9
  - [net-next,v8,3/3] net: ethtool: netlink: Use netdev_hold for dumpit() operations
    https://git.kernel.org/netdev/net-next/c/63fb100bf524

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



