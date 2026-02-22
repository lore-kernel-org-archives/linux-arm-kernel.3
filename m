Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDCDC636C4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Feb 2026 22:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/+5/rg89Fynsrq3dTn5BxRg8XV+0EU4hxQSafZyOwYs=; b=FYZINOPNXpmzaxtYwhtWsDMCb/
	QKPbB3epOXT7M6+gPSOm4vpsZu8WrJQ7O610GV9Zp5mulrjUxO/iIEOdf6pMHyjofMcE7/gn2V7i5
	Kvnd0h88ak4PJr2WhX2fVgEQivr8QAaACyVU6w8QibXhH2gb5ivh2cIXYDQe13GoiEdVqLLHLe++I
	4M1eq1w1R9AtbXYFV41W6aegu4owHjqghFitbbGtPCtCpYcuzZ7BGJSEYtQrF4Frkh/AGoYdhPRhe
	HSaEwR8by9xgKdnOl4C0HLgmOwbDgcELgo+i0Du2hBPRqbHdtY16h0lh3itT7eJYhYueJiOVXDCHr
	QcT5wqHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuI7Q-0000000H0Nt-2yC0;
	Sun, 22 Feb 2026 22:40:04 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuI79-0000000H06r-3USN;
	Sun, 22 Feb 2026 22:39:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=/+5/rg89Fynsrq3dTn5BxRg8XV+0EU4hxQSafZyOwYs=; b=ySjJLJEKDAEfZhqhYEYJjh2t8K
	Ha37ThJ4DYJ/zdQvHg7Dn3B4g6IGUkZWHFwKaEMErSLmAbvqxtiAwGMU7KBOeMx4vUX37zl74B4ku
	dRwBeXL76nOxMzhl18CaYbNFF5pMopE4c3GVHq7poGyqey3sFhtnCNO83YOGclsIwE2HJPNoikE+g
	EQXMWNvj2i37U//bwDztVCK3TKBANuytPykre8Beg2RxohBMbaBUtfKjhI2LMpeYTGoZzrBqx3NFb
	zo0HU+BXaTxJsi58A8ITyrWl2zs8g7UaUcuRzE5iJgvuSlHxYIaQvIFbZnaXYiwN6Ifo/agUVgDmO
	z90sXDHg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Jonas Karlman <jonas@kwiboo.se>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Hsun Lai <i@chainsx.cn>,
	John Clark <inindev@gmail.com>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Chaoyi Chen <kernel@airkyi.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] arm64: dts: rockchip: Add rk3576 evb2 board
Date: Sun, 22 Feb 2026 23:39:06 +0100
Message-ID: <177179992305.1861430.8217804356106146651.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260131081438.100-1-kernel@airkyi.com>
References: <20260131081438.100-1-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_143947_948229_E2B55864 
X-CRM114-Status: UNSURE (   9.45  )
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


On Sat, 31 Jan 2026 16:14:36 +0800, Chaoyi Chen wrote:
> This series add support for rk3576 evb2 board.
> 
> General features for rk3576 evb2 board:
>     - Rockchip RK3576
>     - LPDDR4/4X
>     - eMMC5.1
>     - RK806-2x2pcs + DiscretePower
>     - 1x HDMI2.1 TX / HDMI2.0 RX
>     - 1x full size DP1.4 TX (Only 2 Lanes)
>     - 2x 10/100/1000M Ethernet
>     - 5x SATA3.0 7Pin Slot
>     - 2x USB3.2 Gen1 Host
>     - 3x USB2.0 Host
>     - WIFI/BT
>     - ...
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: rockchip: Add rk3576 evb2 board
      commit: 912fe17d0a524b571e8aab57de643c5fb5cb6376
[2/2] arm64: dts: rockchip: Add rk3576 evb2 board
      commit: 86a82f7a7eeda451ce1a34425133163b5b581edb

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

