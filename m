Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA362CCA472
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 06:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oosYeLyPjfXql6l43l32r1v5yOA0CpgQHdyA3yS/8w8=; b=E/KqAogEcoU/rRQwY5n6mevoEo
	IpehZ2asx/S7A4iO7IQWfZX6nzjjAe9ewvf/R8AnH5bnj0BvuoOZWvloAU0IBrqPKbblKzSr9SDPg
	1zeOGWjb956tmMHTEHBeK6WEV/XngKH2ZoUE6NqY/65M4vJUD0HqeeW2cxYvUzUNfcKDdlZeymGUR
	+Zo33dFI5jiKt1zIzF0cQPqqyQbUhKf6b7xaDkW9yrlxMLB/iB78sK0BBnQ+KPNFG34WZu0FQe5+i
	kQJhraMTTz8Ejrfu5BgDZrxrPuxVAGKACveXbT74ePgdG6PTYRP+2u1YmALej+UZ7MNVy1l/5bx6T
	Y4oes2SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5fBC-0000000H3Ti-1UP4;
	Mon, 06 Oct 2025 06:58:42 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5fB7-0000000H3Si-3ie8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 06:58:41 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251006065828euoutp01958de9b5abd022835e48d3c14fb2b3be~r1KqT-Rfi2693526935euoutp01J
	for <linux-arm-kernel@lists.infradead.org>; Mon,  6 Oct 2025 06:58:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251006065828euoutp01958de9b5abd022835e48d3c14fb2b3be~r1KqT-Rfi2693526935euoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1759733908;
	bh=oosYeLyPjfXql6l43l32r1v5yOA0CpgQHdyA3yS/8w8=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=vJA3Xc9dBbGFuzvGAtx1isIIiSG3gmf4/rRp1N6CXsPPIbu4boMUqm0y0LdsPPu44
	 /yiPh3Q/1lNjO7NpBrMX62IAiUPUbqUo0ZOP7Nxli9zEcLLbryTGzVV1gA/6glKTrq
	 DDi7HgME4/An6MM4rN3LMJ8wUd141lzfjf/qdE6U=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251006065827eucas1p29c891b7201848ab66b8a012bed6fc55e~r1KpwbWFr1175911759eucas1p2X;
	Mon,  6 Oct 2025 06:58:27 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251006065826eusmtip20cd27991c59a64d757d28aa5460a3d6d~r1Kof2kJ61948819488eusmtip2t;
	Mon,  6 Oct 2025 06:58:26 +0000 (GMT)
Message-ID: <56519fa2-1596-4e16-bbb5-8bafa655ddf2@samsung.com>
Date: Mon, 6 Oct 2025 08:58:26 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] ARM: dts: broadcom: rpi: Switch to V3D firmware clock
To: Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>, Melissa Wen <mwen@igalia.com>,
	=?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, Maxime Ripard
	<mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	kernel-dev@igalia.com, kernel-list@raspberrypi.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20251005113816.6721-1-wahrenst@gmx.net>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20251006065827eucas1p29c891b7201848ab66b8a012bed6fc55e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251005113845eucas1p142007f052ddb4c711e5741702f33b5b1
X-EPHeader: CA
X-CMS-RootMailID: 20251005113845eucas1p142007f052ddb4c711e5741702f33b5b1
References: <CGME20251005113845eucas1p142007f052ddb4c711e5741702f33b5b1@eucas1p1.samsung.com>
	<20251005113816.6721-1-wahrenst@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251005_235838_536125_08F56D38 
X-CRM114-Status: GOOD (  17.50  )
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

On 05.10.2025 13:38, Stefan Wahren wrote:
> Until commit 919d6924ae9b ("clk: bcm: rpi: Turn firmware clock on/off
> when preparing/unpreparing") the clk-raspberrypi driver wasn't able
> to change the state of the V3D clock. Only the clk-bcm2835 was able
> to do this before. After this commit both drivers were able to work
> against each other, which could result in a system freeze. One step
> to avoid this conflict is to switch all V3D consumer to the firmware
> clock.
>
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/linux-arm-kernel/727aa0c8-2981-4662-adf3-69cac2da956d@samsung.com/
> Fixes: 919d6924ae9b ("clk: bcm: rpi: Turn firmware clock on/off when preparing/unpreparing")
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> Co-developed-by: Melissa Wen <mwen@igalia.com>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi        | 8 ++++++++
>   arch/arm/boot/dts/broadcom/bcm2835-rpi-common.dtsi | 9 +++++++++
>   2 files changed, 17 insertions(+)
>
> diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi b/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
> index c78ed064d166..1eb6406449d1 100644
> --- a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
> +++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
> @@ -77,6 +77,14 @@ &i2c0 {
>   	/delete-property/ pinctrl-0;
>   };
>   
> +&pm {
> +	clocks = <&firmware_clocks 5>,
> +		 <&clocks BCM2835_CLOCK_PERI_IMAGE>,
> +		 <&clocks BCM2835_CLOCK_H264>,
> +		 <&clocks BCM2835_CLOCK_ISP>;
> +	clock-names = "v3d", "peri_image", "h264", "isp";
> +};
> +
>   &rmem {
>   	/*
>   	 * RPi4's co-processor will copy the board's bootloader configuration
> diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi-common.dtsi b/arch/arm/boot/dts/broadcom/bcm2835-rpi-common.dtsi
> index 8b3c21d9f333..fa9d784c88b6 100644
> --- a/arch/arm/boot/dts/broadcom/bcm2835-rpi-common.dtsi
> +++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi-common.dtsi
> @@ -13,7 +13,16 @@ &hdmi {
>   	clock-names = "pixel", "hdmi";
>   };
>   
> +&pm {
> +	clocks = <&firmware_clocks 5>,
> +		 <&clocks BCM2835_CLOCK_PERI_IMAGE>,
> +		 <&clocks BCM2835_CLOCK_H264>,
> +		 <&clocks BCM2835_CLOCK_ISP>;
> +	clock-names = "v3d", "peri_image", "h264", "isp";
> +};
> +
>   &v3d {
> +	clocks = <&firmware_clocks 5>;
>   	power-domains = <&power RPI_POWER_DOMAIN_V3D>;
>   };
>   

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


