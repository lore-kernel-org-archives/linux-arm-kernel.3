Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0310C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 01:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l4UlN0Wafho6MahmKxGDM1wRAp7sFrpVKSoHrCpTA4c=; b=Np32isp/PIk7w0HZAbY38W+QZw
	QRwyh9GiL6fnbFNFcuexVqU+rbOpT44Tu95/+JKz/dlNkuxcntblrRtx0zaMFrWX4O75JJuyT2XxI
	gaB2isvh91DFCYYGUnp0oQC3sleLsQ16/mTLynBIUz7x6TtX+XG/M5YSG1X1+kBAGCt1JlBVFy3wk
	vsU5e2pKd9OhBD3tv9dxVccsDC3MeRfJufYa5b72N5pTUGrZOhjpdP8GlAaBPohSB4efzoDFVVRPV
	c9+inb9yTbPb80cqdvswGTUX6+/EuoxmMm6NbVYauqmYNxRkbu+M773b7EaDvgFNsgDoXznxYLNMN
	rJChm7Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua2Z4-0000000DTpe-2oGI;
	Fri, 11 Jul 2025 01:28:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua2Qv-0000000DR84-3PYq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 01:20:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 83F6347155;
	Fri, 11 Jul 2025 01:20:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F2D8C4CEF4;
	Fri, 11 Jul 2025 01:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752196811;
	bh=IHx4h69R13Or67ZMOMaSeRoVxPzmcWG/NZh6P4Ei+UE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NIN+1oRO/ktlMLvxpr5oyhzKdiKGbY37jGX1lxWxCpJkzHZ++lY+dmePCONpYbsoU
	 1FTjG8FW1ThT69hHy4BW4BxdBeWnACSykXHqLKShlqHZGufGNYWZUjj2d63oOMUfEf
	 8sM+J+1Q47VeVnzSHkcdCnUgbRVHs74LbjCLjSSgGjM5HYykkNs/uj6OH3EiNb9ycg
	 ysjFsmQQbHC8pWtSlRE1Mh9btbyasQVJkb8fy2IfvB+6hC5D+fcg9JR5xFNxq4fTAn
	 0Ar+E8cdOe5XdB/SAXEi/WHWrbKwGpAtGZljUN1OsSe0o3kPLx7v+wjqX9FmawNXPL
	 ly+HdBmwlqvIA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE060383B266;
	Fri, 11 Jul 2025 01:20:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net-next v4 0/4] net: ftgmac100: Add SoC reset support for RMII
 mode
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175219683324.1724831.15355320324094175037.git-patchwork-notify@kernel.org>
Date: Fri, 11 Jul 2025 01:20:33 +0000
References: <20250709070809.2560688-1-jacky_chou@aspeedtech.com>
In-Reply-To: <20250709070809.2560688-1-jacky_chou@aspeedtech.com>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 horms@kernel.org, jacob.e.keller@intel.com, u.kleine-koenig@baylibre.com,
 hkallweit1@gmail.com, BMC-SW@aspeedtech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_182015_763681_5E4D8975 
X-CRM114-Status: GOOD (  12.71  )
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

On Wed, 9 Jul 2025 15:08:05 +0800 you wrote:
> This patch series adds support for an optional reset line to the
> ftgmac100 ethernet controller, as used on Aspeed SoCs. On these SoCs,
> the internal MAC reset is not sufficient to reset the RMII interface.
> By providing a SoC-level reset via the device tree "resets" property,
> the driver can properly reset both the MAC and RMII logic, ensuring
> correct operation in RMII mode.
> 
> [...]

Here is the summary with links:
  - [net-next,v4,1/4] dt-bindings: net: ftgmac100: Add resets property
    https://git.kernel.org/netdev/net-next/c/fc6c8af6d784
  - [net-next,v4,2/4] dt-bindings: clock: ast2600: Add reset definitions for MAC1 and MAC2
    https://git.kernel.org/netdev/net-next/c/4dc5f7b2c0cc
  - [net-next,v4,3/4] ARM: dts: aspeed-g6: Add resets property for MAC controllers
    (no matching commit)
  - [net-next,v4,4/4] net: ftgmac100: Add optional reset control for RMII mode on Aspeed SoCs
    https://git.kernel.org/netdev/net-next/c/af350ee72e9d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



