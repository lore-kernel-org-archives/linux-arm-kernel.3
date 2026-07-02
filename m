Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501EEC43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 19:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ILx4u100roKSNdt62g0vCVIzu5pk0TzDJDZVD8Hhcks=; b=nrfpiuC6zmYi/QK32hKtVunJZr
	Saaq9I7ut8dBqOIw7DnuPOxADdipoctjInp0PK/u1DmDBkXbYPz3p6SIC1HHNryQ4oXzxqrrVYGtb
	ayhtoR5LivVfHNm90PvKSr4rtXmqbIZarFVR4UzTAYYbuRIIZ0mwfAZ4ZmjZx/xHnJxKOSrQVPiy6
	dDY9cTB6nI4JhE57n6eRJyX3ijZ9/tEK0X2wRIshMKU699ReyrujcC45zzH1w585gnIH6IeKfnnRd
	0fqQJRRA648Ud9iHLkNG4wZEySl5QaDXLevDjwKEs9ccFlPl8rTalExi9fpdHZRZk44U3vgsxTaWt
	AzmEfbjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfMil-00000005JV7-0chJ;
	Thu, 02 Jul 2026 19:05:11 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfMig-00000005JNl-3Lav;
	Thu, 02 Jul 2026 19:05:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=ILx4u100roKSNdt62g0vCVIzu5pk0TzDJDZVD8Hhcks=; b=YEKfePcZJ66Vv0BDxc4KeXTSIv
	FDr1kCdSRTOHlgrLRJ+5jvXRu88+gx6MENusUTuCv/fT84nk/0UC3CEYLbMq/Y2/N3pWKhzVvsDLB
	Id+5l7pyRIFfMVVIqdXv5oqgYHpxgHTGpJTqEOjRG8Tm6E4FXkAl37yHurwlJL0ZCpdl+eOtyZyVP
	DEWFrX4j4Pk+PBTWb1fg12ub3y3dgMfPTdKDGLCpg9GRgn2di3FsSN9fA3rogzpvS1GO1QbMt6Cyj
	V6+/I9UNIBK01n/VJiEhyqr6J/APWIX76ecrTQehy1YRhlbVyr5iPDR9/y3XZRi+qDK4BM78HuGyW
	zjt5hZ/g==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ricardo Pardini <ricardo@pardini.net>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH] arm64: dts: rockchip: fix regulator names on NanoPC-T6
Date: Thu,  2 Jul 2026 21:04:56 +0200
Message-ID: <178301901912.3838694.17963295262868921590.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260605-rk3588-dts-rockchip-nanopct6-fix-schematic-names-v1-1-15dd3b23ab1a@pardini.net>
References: <20260605-rk3588-dts-rockchip-nanopct6-fix-schematic-names-v1-1-15dd3b23ab1a@pardini.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_120506_834777_5338B2DA 
X-CRM114-Status: GOOD (  12.33  )
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


On Fri, 05 Jun 2026 13:54:35 +0200, Ricardo Pardini wrote:
> Three fixed-regulator names on the NanoPC-T6 don't match the board
> schematic [1].
> 
> - vcc3v3_pcie2x1l0 -> vdd_mpcie_3v3
>   This GPIO-switched 3v3 regulator is labeled vcc3v3_pcie2x1l0, but
>   it is wired to and consumed by &pcie2x1l1. Per the schematic,
>   the GPIO PCIE_M2_1_PWREN controls the power net VDD_MPCIE_3.3V;
>   rename to match.
> - vdd_2v0_pldo_s3 -> vcc_2v0_pldo_s3
>   Typo in the regulator-name property of RK806-1 DCDC reg7. The node
>   label and the schematic power-net name both already use the vcc_
>   form; only the regulator-name string had vdd_.
> - vcc3v3_pcie30 -> vcc3v3_pcie_m2_0
>   The GPIO-switched 3v3 feeding the M.2 M-Key (NVMe) slot is named
>   after the PCIe controller it sits behind rather than the schematic
>   power net. The schematic names it VCC3V3_PCIE_M2_0 (produced by an
>   MP2143-based buck off VCC_5V0, enabled by PCIE_M2_0_PWREN); rename
>   to match.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: fix regulator names on NanoPC-T6
      commit: e53bb7bffd4d359b68e8256bc0ebf5a119ba3c71

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

