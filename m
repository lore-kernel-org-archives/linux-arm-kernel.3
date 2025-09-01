Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBEACA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 13:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b8jTxoxu6fM2YyVPoK/aAvaCJ5ksiaw3bZKSjKUEM/U=; b=LWxLF5YSg0UW8ybGIqYwG7p0lh
	bLOI6E94gfIZOGMtEQaAaYQ+9ClUIfhAE3/JWZczB7VYyMArfgLbD2DBPpDfaRLeVLNDNAoRT+JpD
	bf2CHvZWHndKhxKUtJClNjYFixGyw30d3Otv0L/UIbps5xaw9PkQt4PhCJbfv2+j0xjCXKgaQCpH9
	/IdfmlbEhOi3DQVJ68ZIQQS9grc0HEKiFii+MOMsKHWmsoZDq5mywYiSVWQiqPC/OtPRkJQet6j+7
	LPiIBETIsRFUlPboL5w1m7H6a3V0V5UuTV1xgfkk1L8gLEEHH8wtB3tFG+jGsCWzAKfXZQ1hGHzGa
	O66cqGgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut4DR-0000000CcgW-0awD;
	Mon, 01 Sep 2025 13:04:57 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut2GI-0000000Byut-0v32;
	Mon, 01 Sep 2025 10:59:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=b8jTxoxu6fM2YyVPoK/aAvaCJ5ksiaw3bZKSjKUEM/U=; b=RpaGy4XLA2c8YZbgeSDDso6S1v
	Oq+FsFM7XHisXgM9rW4mmHd7SdV6y32fbWlLjPI0RAygFIsPgPoNluuqQZNVroLT/F2auR68tNQ4Y
	tiFfd+Dvh6V+OKoRhvvhyTTOmD3Bv9hdYlxB496hP52VeyuFbv5NTQOkwlXef959spGX2yfhCzNfx
	sb8GcCicl0XC1MJ5GHahwYid1616J5X2RvY35RwumHQsoDxueaks1SRe2oZJc/DtHriO5UQZP0xfz
	DrphtNNohbV6b9/EXMt+SoT1VWC1fy+LCtWlVB60NP6CE/Eez7CjZ0pZWPSgxz+KN5AhY66C73Gux
	zLLCRaVQ==;
Received: from i53875a2d.versanet.de ([83.135.90.45] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ut2G3-0001WA-HP; Mon, 01 Sep 2025 12:59:31 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: dmitry.baryshkov@oss.qualcomm.com,
	Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	hjc@rock-chips.com,
	mripard@kernel.org,
	naoki@radxa.com,
	stephen@radxa.com,
	cristian.ciocaltea@collabora.com,
	neil.armstrong@linaro.org,
	Laurent.pinchart@ideasonboard.com,
	yubing.zhang@rock-chips.com,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: (subset) [PATCH v7 00/10] Add support for RK3588 DisplayPort Controller
Date: Mon,  1 Sep 2025 12:59:27 +0200
Message-ID: <175672432555.3612134.264758265580488174.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250822063959.692098-1-andyshrk@163.com>
References: <20250822063959.692098-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_035946_254667_C0C18D55 
X-CRM114-Status: GOOD (  12.31  )
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


On Fri, 22 Aug 2025 14:39:44 +0800, Andy Yan wrote:
> There are two DW DPTX based DisplayPort Controller on rk3588 which
> are compliant with the DisplayPort Specification Version 1.4 with
> the following features:
> 
> * DisplayPort 1.4a
> * Main Link: 1/2/4 lanes
> * Main Link Support 1.62Gbps, 2.7Gbps, 5.4Gbps and 8.1Gbps
> * AUX channel 1Mbps
> * Single Stream Transport(SST)
> * Multistream Transport (MST)
> * Type-C support (alternate mode)
> * HDCP 2.2, HDCP 1.3
> * Supports up to 8/10 bits per color component
> * Supports RBG, YCbCr4:4:4, YCbCr4:2:2, YCbCr4:2:0
> * Pixel clock up to 594MHz
> * I2S, SPDIF audio interface
> 
> [...]

Applied, thanks!

[07/10] arm64: dts: rockchip: Add DP0 for rk3588
        commit: 8c239f24341ab9ac75992a0a3c32bb8cddf48a20
[08/10] arm64: dts: rockchip: Add DP1 for rk3588
        commit: 445e4ac0d85821904b3f2bee410def4181987c4e
[09/10] arm64: dts: rockchip: Enable DisplayPort for rk3588s Cool Pi 4B
        commit: 1b242cafdfc4bc7d43ed9147cbffe5480632f661
[10/10] arm64: dts: rockchip: Enable DP2HDMI for ROCK 5 ITX
        commit: df02252f271b4fa50c7087a0e6f5a7d7ed2f1dcc

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

