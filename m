Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 635B7CCF2C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 14:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MXys7ckdfZsaSqIv9WG3c/zyDXcn3l1gqjz0lpcesqU=; b=ggz8/GdGs6uGXYqE1MerEZxwn9
	ddQOiBSg6vLGs0lqTxVt4DOpLOfFRBORez560M0crCqJo+B8W1UkIJzkcOhFpHkSZhEtArcSqc4OM
	yPm/pvLuLbAIsxlnwp3DyvmF0VVuKY40po7ZVXCALRbEuQdlYY8p4RfAeKRvR7ij+lzgapcI5n5SS
	s4tO5dd6IP2oljyRWvj36AQE1DpZIDSuNIdCf7YdoWA+Qw5bCNbZxW/OeVZd9lh8pf8pC07gavael
	011sro81EgtgfFBaPJE2pLgBuAyFx286lgCMY6p4cXa50fBD+Vnm0BAkp+DMGmbbZ31xyx6Id8ByN
	tnIQpHNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHiUo-000000035j3-0kml;
	Fri, 16 Oct 2026 14:01:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHiUm-000000035ie-3MHv;
	Fri, 16 Oct 2026 14:01:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 53AE643BD0;
	Fri, 16 Oct 2026 14:01:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12F121F000C4;
	Fri, 16 Oct 2026 14:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792159276;
	bh=MXys7ckdfZsaSqIv9WG3c/zyDXcn3l1gqjz0lpcesqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HZkt9gnOetdK3cwJqZfyf/TaDWY69f6OurRre/WUGRspavzKJHxiM/DA5SgOexPGZ
	 QRM4nwBBkDe3HPz4PednxZVmccKXPcMmcWatazO0SKDJDa37pAdak66NbQF9qef0Gp
	 yAYJXMbhivsxdxsLds6zAp+mpjn3GRmPgcnNO5gac331CmQc+6oawJiflBx2SB0HE+
	 1plY9j94/R430Bpu1i86kczeeRrqHuWJ2xQgnmN9rq8jxFkZn/kV/q4FI4QhnA2E0j
	 HpTDYraqKa0RFdHemRUoFCYHwKgOrMevxLyB4fhP03tZTli8/Hpvv6p27NSZwNkyZv
	 Pj6kQhag62uWg==
Date: Fri, 16 Oct 2026 09:01:15 -0500
From: Rob Herring <robh@kernel.org>
To: Jason Yang <jason98166@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Guochun Huang <hero.huang@rock-chips.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Michael Riesch <michael.riesch@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/8] dt-bindings: phy: rockchip,rk3588-mipi-dcphy: Add
 a cell to select TX or RX
Message-ID: <20261016140115.GA1798470-robh@kernel.org>
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
 <20261016-dcphy-rx-v1-v5-2-e63b49eabe2d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016-dcphy-rx-v1-v5-2-e63b49eabe2d@gmail.com>
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

On Fri, Oct 16, 2026 at 04:56:36PM +0800, Jason Yang wrote:
> The Samsung MIPI D-/C-PHY block on RK3588 and RK3576 has a transmitter
> for DSI and a receiver for CSI-2, and two consumers can use them at the
> same time. The single cell of this binding selects the mode and refers
> to the transmitter, so the receiver cannot be described.
> 
> Allow a second cell that selects the transmitter or the receiver. With
> D-PHY:
> 
> 	/* the MIPI DSI host, driving the transmitter */
> 	phys = <&mipidcphy0 PHY_TYPE_DPHY PHY_DIRECTION_TX>;
> 
> 	/* the MIPI CSI-2 host, driving the receiver */
> 	phys = <&mipidcphy0 PHY_TYPE_DPHY PHY_DIRECTION_RX>;
> 
> and with C-PHY:
> 
> 	phys = <&mipidcphy0 PHY_TYPE_CPHY PHY_DIRECTION_TX>;
> 	phys = <&mipidcphy0 PHY_TYPE_CPHY PHY_DIRECTION_RX>;
> 
> The transmitter and the receiver cannot operate in different modes [1],
> so the first cell must match in both consumers.
> 
> Two cells describe the receiver as well. A single cell keeps referring
> to the transmitter, so existing device trees are unaffected.
> 
> [1] RK3588 TRM: section 22.1 (overview): "The TX and RX only support
>     operate in the same PHY mode."

The problem here is this is an ABI break. An existing OS will not know 
what to do with 2 cells. Perhaps adding flags to the upper bits of the 
existing cell would work.

Rob

