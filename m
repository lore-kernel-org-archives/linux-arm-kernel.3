Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5B7CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 04:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PkSpf1ZHv8SEZJ8lze3Rlo+3neTkvjuYjsny6zTRWJQ=; b=V0vDDwI9vomiV58HAhdl7iQmYV
	Omi7fPfY//AzPGj4BMaCtzoe+4gn0Q9PVayeD+zHdoZSI/jHlTbLikjxvt0tCYN8o1c/L9KInB5qi
	wtiNFq5jgJYOlXYUKLbt4vgrpPcjkpwHPBzVavXbeV6EwaQnz176/bjID3ctubgihUx0fj82GNht6
	zq8YEZLReYbUXE5FjQvS5bD9z4kRcxfcqVpx+0+T+BTV6hrQ19NR21gSEdzp0uoUoPyIosNHw3Sia
	DaGaXUoAlTIbatbu9p4+c8K6WERqbKsl2WyEvGNmjlGFcc1Vg7jMQMv+mVZ7nMPr0gIRbJVDyf5+r
	LwcqgVcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwZ2l-00000000pnF-0IuJ;
	Thu, 11 Sep 2025 04:36:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwZ2k-00000000pml-0gju;
	Thu, 11 Sep 2025 04:36:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C34236013D;
	Thu, 11 Sep 2025 04:36:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCAB8C4CEF1;
	Thu, 11 Sep 2025 04:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757565380;
	bh=ZgftlexC7m0f7G9tB59+CtBtIlpZM1B//E5L2IXaVTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oRkcekVRHWqQcu29cLjnza7mjmFYeioVBFoZ4C2HaBoRqNuyBVZbDyqt4Mtp98RIi
	 yg5PkRkr3lcW9/XzDtiK4FKRSu6RzVuD7U5bu6XXZ72WbqkejhRlEiJKcts1oHeGjn
	 PO0zVs+Kn7Q2MGgubGvhhlaQDoLNrsHGaM/WGjooetq54WOyoY01TXI2daU4dPDCfx
	 +7ps5yf4qQncVWIrZ8cwSFiI0xwtm+LKFU1h7XiW9QeBQeCD+n77uzahLq8zk1pgi+
	 +5V1fJ3tA6NUaU9HLKMyeVGYPvPXRdg31VxdpMhkD9GmrTSGa7Lt2AREADvZZHKvY5
	 AUSqnBPIrc+AA==
Date: Thu, 11 Sep 2025 10:06:16 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Collabora Kernel Team <kernel@collabora.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, stable@kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v4 0/7] phy: rockchip:
 phy-rockchip-inno-csidphy: add support for rk3588 variant
Message-ID: <aMJRwENKCuNQKbYC@vaman>
References: <20250616-rk3588-csi-dphy-v4-0-a4f340a7f0cf@collabora.com>
 <175752285211.484319.18097786132863236205.b4-ty@kernel.org>
 <2070639.PIDvDuAF1L@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2070639.PIDvDuAF1L@diego>
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


Hi Heiko,

On 10-09-25, 21:21, Heiko Stübner wrote:
> Hi Vinod,
> 
> Am Mittwoch, 10. September 2025, 18:47:32 Mitteleuropäische Sommerzeit schrieb Vinod Koul:
> > 
> > On Wed, 03 Sep 2025 19:04:48 +0200, Michael Riesch wrote:
> > > Habidere,
> > > 
> > > The Rockchip RK3588 features two MIPI CSI-2 DPHYs (not to be confused with
> > > the two combo MIPI DSI/CSI CPHY/DPHY blocks). The CSI-2 DPHYs can be
> > > supported using the existing phy-rockchip-inno-csidphy driver, the notable
> > > differences being
> > >  - the control bits in the GRF
> > >  - the additional reset line
> > > This patch series adds support for this variant.
> > > 
> > > [...]
> > 
> > Applied, thanks!
> > 
> > [2/7] dt-bindings: phy: rockchip-inno-csi-dphy: make power-domains non-required
> >       commit: c254815b02673cc77a84103c4c0d6197bd90c0ef
> > [3/7] dt-bindings: phy: rockchip-inno-csi-dphy: add rk3588 variant
> >       commit: 5072b8e98eef4685a5a9a8bae56072cb65a2ef69
> > [4/7] phy: rockchip: phy-rockchip-inno-csidphy: allow writes to grf register 0
> >       commit: 8c7c19466c854fa86b82d2148eaa9bf0e6531423
> > [5/7] phy: rockchip: phy-rockchip-inno-csidphy: allow for different reset lines
> >       commit: 260435153c90c8e90553e456ec43578834a14a71
> 
> question, what happened to patch 6?
>   [PATCH v4 6/7] phy: rockchip: phy-rockchip-inno-csidphy: add support for rk3588 variant
> 
> or is it just missing from this mail?

Looks like I missed, picked now

-- 
~Vinod

