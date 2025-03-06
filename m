Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2BB9C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 03:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y/S9iTTXtmazQs+vYzu3eZBRJwFtVdn7Gq+IQOYW0Qw=; b=HIyenDSa6xUyTN5fsFXCOoWmPJ
	kWbOFj/3DRvVqep2cb9/O2GwDdFKESMz9e/DW7PvziZwyHSYp5LtN4Ex2cUS3XDsSyu/SF8G0Et2U
	7Nx37/dPLICz1YaZGVfuKxsxBZ/aDLf6KM2pk6Ep2LuQ/vG2I1PfZzSpIk7RV/jGBBgTAoD/BWash
	EL99C4jkTu5QQy+M1eYpP+Di7JIiLv3UQkrt2ln74wj9MC2f8vp9zoVgUhniYk6WpnDLxZfAwb1ev
	8WqTIViHJb/5idmwZ7PHd7EnWYkj8Rn0tP4VYhganET/A+/HnUwB2mk6bMqykpdcvMRHnxxGbaO2t
	FfkEEiqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq1nr-00000009v1I-04GK;
	Thu, 06 Mar 2025 03:21:43 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq1mF-00000009utp-0FHf;
	Thu, 06 Mar 2025 03:20:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BE9ABA45B8A;
	Thu,  6 Mar 2025 03:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AC6FC4CED1;
	Thu,  6 Mar 2025 03:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741231201;
	bh=ldpseiZdwbk12xd//hJkl8SkTToSHiL6VywDH4TCwFs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KaxBoBekBiKcBUHabZEgWALw3F8Nh0J2upfew+y2V3QUsiTxcdEA7qE7laE8r3NdC
	 Z71TwxipZfcyfoeHwawduMzD+HtzyE9Kz9aaujw33rKOSAm9hmLiCYcvg0hAwnjiy+
	 UCMZ4yVWvFyHBfwhsLEk+oZGXGw3/OYaolfEH2KtKkKj3221/5vN/IuKWZS3XLXtXb
	 H/dN/11RyUrP+2SIiwA1UCzJsFN3U6SJKgxgfrtTM5+U4qbf0XjERz7IWJnNeeUnJH
	 7ub25Q7J5GY8V8WPDyMt58J1i9p7Wn4iGPiD5Ull9lbfaCKTmN8NqIPZpNemXi4ljx
	 EKkXF7nn/WOyQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71D08380CFF3;
	Thu,  6 Mar 2025 03:20:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 0/8] net: phy: move PHY package code to its own
 source file
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174123123425.1112346.6998420178306205592.git-patchwork-notify@kernel.org>
Date: Thu, 06 Mar 2025 03:20:34 +0000
References: <5c5e60b3-0378-4960-8cf0-07ce0e219c68@gmail.com>
In-Reply-To: <5c5e60b3-0378-4960-8cf0-07ce0e219c68@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: andrew@lunn.ch, linux@armlinux.org.uk, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, edumazet@google.com, daniel@makrotopia.org,
 dqfext@gmail.com, SkyLake.Huang@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, richardcochran@gmail.com,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 robimarko@gmail.com, kory.maincent@bootlin.com, rosenp@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_192003_182666_51C4B472 
X-CRM114-Status: UNSURE (   9.84  )
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 3 Mar 2025 21:13:05 +0100 you wrote:
> This series contributes to cleaning up phylib by moving PHY package
> related code to its own source file.
> 
> v2:
> - rename the getters
> - add a new header file phylib.h, which is used by PHY drivers only
> v3:
> - include phylib.h in bcm54140.c
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/8] net: phy: move PHY package code from phy_device.c to own source file
    https://git.kernel.org/netdev/net-next/c/61dc9cae8727
  - [net-next,v3,2/8] net: phy: add getters for public members in struct phy_package_shared
    https://git.kernel.org/netdev/net-next/c/2c8cd9783f46
  - [net-next,v3,3/8] net: phy: qca807x: use new phy_package_shared getters
    https://git.kernel.org/netdev/net-next/c/947030f3c32b
  - [net-next,v3,4/8] net: phy: micrel: use new phy_package_shared getters
    https://git.kernel.org/netdev/net-next/c/890fe6841d81
  - [net-next,v3,5/8] net: phy: mediatek: use new phy_package_shared getters
    https://git.kernel.org/netdev/net-next/c/dc5a6164feda
  - [net-next,v3,6/8] net: phy: mscc: use new phy_package_shared getters
    https://git.kernel.org/netdev/net-next/c/e0327e9f8597
  - [net-next,v3,7/8] net: phy: move PHY package related code from phy.h to phy_package.c
    https://git.kernel.org/netdev/net-next/c/e7f984e925d2
  - [net-next,v3,8/8] net: phy: remove remaining PHY package related definitions from phy.h
    https://git.kernel.org/netdev/net-next/c/a40028497769

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



