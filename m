Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF40E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 22:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NWcauDOjKnYU4RcQC5PZBZLk9Ag4Oc862avoOH5RmR8=; b=FTbT/szaVjLyCOPf8jQxaa/4sw
	IVPq1leX5stAj5pDqGgO1kl7VIcod5zWeCf1oVLEMfbpKG52un98tAGn3yw8WOWm8N/9M7ogHG7si
	CJrUB1wByRqXC62L168gZJsQRGq1a80UzNKihHcWjisp/xroat3eISZGnMfYWKxVsJmUFEtGait8K
	coUOFFndqXPYWalXMLlh0jtogajfzdBkuVDo1nuovvzuGe7mRbZIUj3r1T7W1R12mgBS1lZzJv1rC
	HJSA9hos6i/bY7VheKfNwZaH7/yiV1O4Yxrqwx7eXKd/1kG+SL1il8GISoNlmXMDlGKKbeA8docBi
	0LaDHRtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW1JN-0000000DUJE-26yD;
	Thu, 09 Jan 2025 22:47:33 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW1IA-0000000DUAr-1dp9;
	Thu, 09 Jan 2025 22:46:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NWcauDOjKnYU4RcQC5PZBZLk9Ag4Oc862avoOH5RmR8=; b=X0BI3bseCuXzMdWwiok/8TEWjn
	akAG6GzKjYk4LPTUFpJKrr3V+6LSnWTK9rSiUHwLgQo+QlnQ6Exvjq6gJSEWgYpOOp/kFM+ltqVSj
	LmkAC8nxr2/OwFP2AhAnue18sS5+F1eUo5I7p/t073PJS+ed8BV13kORxJ42PGPXOjMuzeq1gC3gI
	o00pJBBJtN/1lzKrY1yyaIE1aFwYu0bnNgaadY70moQUSR5dFBcCT1eg+XuOBaqGXhDw8xWRpeiE7
	9TDh8db7qb1eaQrwNzpyzE5tniEk0NqnYTYGeyz6ggO9Tdv8FdkGU5B6ppurmtt/FPaCsEHLqC0Q3
	0PJOPS4Q==;
Received: from i5e860d05.versanet.de ([94.134.13.5] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tW1I3-0005ho-TG; Thu, 09 Jan 2025 23:46:11 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Jimmy Hon <honyuenkwun@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Ondrej Jirman <megi@xff.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: (subset) [PATCH v8 0/4] Orange Pi 5 Max
Date: Thu,  9 Jan 2025 23:46:01 +0100
Message-ID: <173646269067.2939804.12592916938678988873.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250109051619.1825-1-honyuenkwun@gmail.com>
References: <20250109051619.1825-1-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_144618_428653_7250AFE5 
X-CRM114-Status: GOOD (  12.66  )
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


On Wed, 08 Jan 2025 23:16:14 -0600, Jimmy Hon wrote:
> Add device-tree for Orange Pi 5 Max
> 
> Orange Pi now has 3 SBCs using the RK3588 SOC. Refactor the common parts
> of the 5 Plus DTS so it can be shared with the 5 Max and the 5 Ultra.
> The 5 Max and 5 Ultra have a similar credit-card sized board layout and
> will also share a DTSI between them.
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: rockchip: refactor common rk3588-orangepi-5.dtsi
      commit: ea63f4666e483b48a49d9774d8c680f81165ff06
[2/4] dt-bindings: arm: rockchip: Add Xunlong Orange Pi 5 Max
      commit: 6327f2d83dce514d43134dedb766df000420b779
[3/4] arm64: dts: rockchip: Add Orange Pi 5 Max board
      commit: c600d252dc52ffc29982ee6873b6eee064193752

The whole hdmi1 thing still needs to wait for the phy maintainer to
pick up phy driver patches, so I've only taken the first patches
for now.

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

