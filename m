Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD70C3ABD5
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 21:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Tr4avpC+MzvgrSxOKKwZnty7WT+VJA3Ia5CbcZG9eE=; b=YKnFInXiFifH3FFBOVUc89hsdK
	bu7AlmAmIEXE8S+PpDE8HXcT8WIHVR46ToFcB0g+XAlhiq8g+Nl3s3pg4V0x9FZzd9CrgrJjAH60j
	bs8bUnH2BSQYsMUg/3HdrIfr0siI6mALiLT5ZgD5UU7GeEb/DpC1li5JSjS4vKanZsnD5s2a5wb1f
	wPsvVXUsZr8IBsXqQnRcehDCBeOI/kiInmR/R42d6NHi/6pErkRw2450BvQfAeZaDiwnrqjc1aoEV
	HeuBqkpU4+7Lr6maqXi1g1yiZhyFp9TzkEwDGhjVDVS42SU3zvdjk4cBirnPv7X7wZvbEkGa3yG+E
	rPDVXQWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUxo-00000004uhB-1ZLz;
	Fri, 09 May 2025 21:09:00 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDTtt-00000004i9O-1OaL;
	Fri, 09 May 2025 20:00:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=9Tr4avpC+MzvgrSxOKKwZnty7WT+VJA3Ia5CbcZG9eE=; b=upIHKf688KyjcXYyPtW85pwgAt
	C3OPu7vGZALzoW+7SD/d5roc59G9tisVuiDh5oUDHm7g0SVCfNADoOYVeSZlffaBDy5H5B4A5U/6u
	7ky80Mb8PyHLhepkFO1a+b/o8r2W6Wl4SS98QIacNpO/T+JREjHIibuCqqcw4UzHkm0S+C+l2ehTP
	lWjy6VEoP/0xSK8vfIObJ55cdhNIFkNezFMFrEdBCMtcn5eJACSd9CU5bteWUxPLrzYcrSHDPCOHE
	09ul8USQrhUCLJg5jv3RdAzLO+yQ/mSOj4Pc5kLdsKby7uup2BspuBZgwcvsWszYBW1HS8dUYKKSz
	ElCunnmQ==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uDTtZ-0004Jo-R4; Fri, 09 May 2025 22:00:33 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Kever Yang <kever.yang@rock-chips.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Alexey Charkov <alchark@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Add support for rk3399 industry evaluation board
Date: Fri,  9 May 2025 22:00:20 +0200
Message-ID: <174682074869.2029046.5714989650782845441.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250506034347.57-1-kernel@airkyi.com>
References: <20250506034347.57-1-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_130053_378171_E3B39357 
X-CRM114-Status: GOOD (  11.60  )
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


On Tue, 06 May 2025 11:43:45 +0800, Chaoyi Chen wrote:
> General feature for rk3399 industry evaluation board:
> - Rockchip RK3399
> - 4GB LPDDR4
> - emmc5.1
> - SDIO3.0 compatible TF card
> - 1x HDMI2.0a TX
> - 1x HDMI1.4b RX with TC358749XBG HDMI to MIPI CSI2 bridge chip
> - 1x type-c DisplayPort
> - 3x USB3.0 Host
> - 1x USB2.0 Host
> - 1x Ethernet / USB3.0 to Ethernet
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: rockchip: Add rk3399 industry evaluation board
      commit: ff7c417e54a8cca74db147ba0417ecdfcb99f89c
[2/2] arm64: dts: rockchip: Add rk3399-evb-ind board
      commit: 2435fca0580ca9b58a8c5a71e5bd61b9707bc313

Dropped the regulator-compatible and reordered some minor things.

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

