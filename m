Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C05C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 14:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2nW3DmaEwtQqmdcgqJ0ClmdaBE1cGoZ7pcvRuf3Yst4=; b=EMOt982n5KeRJybMzJFaBOtH3s
	u5SCqKHaUgkmVIU1L/HzCkWhhPMdzbwWcENZghshRhijVblHdoNix7OOAupjtlkH/QCZkTFHrOZ5+
	jnkv57GijIOhY0ie9Vm5GTw9rRz4Lf1dySU7/uq5Iro05PewpCSIk9w1teNurZVNBj3xy5N5yL+Aw
	bmj+8LBpW3DzCBA8cuW616uwhwQxE+0f8xoqlcBZvPQfYUBSr1HVDhrbY1hAoWC8Op8ISym2qwUGA
	zT+BDF2Oef8EBCqzfLni/yHK1XfZtCH5TE7MtulCifO2TDTeLLMiBoDXz7eV1ARRTBId6PXW67rUb
	J6jFxZAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1PGf-0000000CJYh-06xx;
	Tue, 01 Sep 2026 14:15:17 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1PGZ-0000000CJXo-3Wol;
	Tue, 01 Sep 2026 14:15:15 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260901141504euoutp02f8cf59604fcc0bb3e97ba307ffda0a3a~ROAEy4Y3I1223512235euoutp02b;
	Tue,  1 Sep 2026 14:15:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260901141504euoutp02f8cf59604fcc0bb3e97ba307ffda0a3a~ROAEy4Y3I1223512235euoutp02b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1788272104;
	bh=2nW3DmaEwtQqmdcgqJ0ClmdaBE1cGoZ7pcvRuf3Yst4=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=FI9HGXNVyamhN2zlQXR4CDPmMvub+hQK2T7ZBv5DkCgQPnby1w+gTVZUh41hlg+KR
	 5ny8AyyOmQlmxO76627Rk1f6+fa9NHdeszWgDcCUqsh3yBThzUR5IsBAQipbYRojBC
	 INCm0GUIqJFBdpcJ/FMR+S//fjPKiXb3VraxvlOY=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260901141504eucas1p156346e8510ccf68f19fc29333c31cfe7~ROAEgxzXG3199331993eucas1p12;
	Tue,  1 Sep 2026 14:15:04 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260901141502eusmtip277e141767fe1c923ccc834fdf6eb451f~ROACyv4-D1277812778eusmtip20;
	Tue,  1 Sep 2026 14:15:02 +0000 (GMT)
Message-ID: <b41f260d-2308-4853-8d3b-22cba534e4e2@samsung.com>
Date: Tue, 1 Sep 2026 16:15:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/15] riscv: dts: starfive: jh7110: Update DT for
 display subsystem
To: Icenowy Zheng <uwu@icenowy.me>, Vinod Koul <vkoul@kernel.org>, Neil
	Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss
	<rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>, Andy
	Yan <andy.yan@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>, Emil
	Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Heiko Stuebner
	<heiko@sntech.de>, Conor Dooley <conor@kernel.org>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Dominique
	Belhachemi <db@domibel.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	mfd@lists.linux.dev, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org, Andy Yan <andyshrk@163.com>, Marek
	Szyprowski <m.szyprowski@samsung.com>, Maud Spierings
	<maudspierings@gocontroll.com>, Graham Markall <hello@big-grey.co.uk>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <e0e0c41c4c6b0b674c4cfc3b6927d60c40fbf733.camel@icenowy.me>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260901141504eucas1p156346e8510ccf68f19fc29333c31cfe7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260828134839eucas1p2d19363d17d4dbf5a7ae5228444af16fa
X-EPHeader: CA
X-CMS-RootMailID: 20260828134839eucas1p2d19363d17d4dbf5a7ae5228444af16fa
References: <20260828-jh7110-clean-send-v2-0-331680c8b9d1@samsung.com>
	<CGME20260828134839eucas1p2d19363d17d4dbf5a7ae5228444af16fa@eucas1p2.samsung.com>
	<20260828-jh7110-clean-send-v2-14-331680c8b9d1@samsung.com>
	<e0e0c41c4c6b0b674c4cfc3b6927d60c40fbf733.camel@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_071512_479710_316627F0 
X-CRM114-Status: GOOD (  22.61  )
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



On 8/28/26 16:06, Icenowy Zheng wrote:
> 在 2026-08-28五的 15:47 +0200，Michal Wilczynski写道：
>> Activate the display subsystem by adding the dc8200, hdmi and voutcrg
>> nodes as direct soc children. Each references the PD_VOUT power
>> domain
>> through power-domains, so genpd powers the domain on demand, and the
>> HDMI-PHY -> voutcrg -> HDMI-controller probe order is resolved by
>> deferred probe.
>>
>> The monolithic hdmi node is modelled as a container with hdmi_phy
>> and hdmi_controller children. This lets the PHY (clock provider,
>> depending only on xin24m) and the controller (clock consumer) probe
>> independently, breaking the circular clock dependency with voutcrg.
>>
>> voutcrg consumes the pixel clock from the &hdmi_phy node instead of
>> the
>> old fixed-clock, and dc8200 gets its pixel clocks from voutcrg's
>> MUXes
>> and is marked dma-noncoherent for framebuffer DMA. The old, incorrect
>> hdmitx0-pixel-clock fixed-clock node is removed.
>>
>> Co-developed-by: Dominique Belhachemi <db@domibel.de>
>> Signed-off-by: Dominique Belhachemi <db@domibel.de>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> +		compatible = "fixed-clock";
>> +		#clock-cells = <0>;
>> +		clock-frequency = <24000000>;
>> +		clock-output-names = "xin24m";
>> +	};
>> +
>>  	soc {
>>  		compatible = "simple-bus";
>>  		interrupt-parent = <&plic>;
>> @@ -1199,22 +1200,92 @@ csi_phy: phy@19820000 {
>>  			#phy-cells = <0>;
>>  		};
>>  
>> +		dc8200: display@29400000 {
>> +			compatible = "verisilicon,dc";
>> +			reg = <0x0 0x29400000 0x0 0x2800>;
>> +			interrupts = <95>;
>> +			dma-noncoherent;
>> +
>> +			power-domains = <&pwrc JH7110_PD_VOUT>;
>> +
>> +			clocks = <&voutcrg
>> JH7110_VOUTCLK_DC8200_CORE>,
>> +				<&voutcrg
>> JH7110_VOUTCLK_DC8200_AXI>,
>> +				<&voutcrg
>> JH7110_VOUTCLK_DC8200_AHB>,
>> +				<&voutcrg
>> JH7110_VOUTCLK_DC8200_PIX0>,
>> +				<&voutcrg
>> JH7110_VOUTCLK_DC8200_PIX1>;
>> +			clock-names = "core", "axi", "ahb", "pix0",
>> "pix1";
>> +
>> +			resets = <&voutcrg
>> JH7110_VOUTRST_DC8200_CORE>,
>> +				 <&voutcrg
>> JH7110_VOUTRST_DC8200_AXI>,
>> +				 <&voutcrg
>> JH7110_VOUTRST_DC8200_AHB>;
>> +			reset-names = "core", "axi", "ahb";
>> +		};
>> +
>> +		hdmi_subsystem: hdmi@29590000 {
>> +			compatible = "starfive,jh7110-hdmi-
>> subsystem";
>> +			reg = <0x0 0x29590000 0x0 0x4000>;
>> +
>> +			/*
>> +			 * This MFD's PHY child is the first device
>> in the vout
>> +			 * region to touch registers, so it owns the
>> NoC display
>> +			 * bus clock + reset that gate access to the
>> region.
>> +			 * PD_VOUT is powered on by genpd via power-
>> domains.
>> +			 */
>> +			power-domains = <&pwrc JH7110_PD_VOUT>;
>> +			clocks = <&syscrg
>> JH7110_SYSCLK_NOC_BUS_DISP_AXI>;
>> +			resets = <&syscrg
>> JH7110_SYSRST_NOC_BUS_DISP_AXI>;
> 
> I think the NOC clocks/resets should be also needed by the DC8200
> either?
> 
> Although patching the DC8200 driver to add support for these
> clocks/resets looks a little dirty...
> 
> Maybe it's still good to have a vout subsys instead of a hdmi subsys...

Yeah that was the idea as it was modeling hardware correctly, however
indirectly it works thanks to the probing order. The problem with the
extra vout subsys as shown in the RFC was that an extra driver and extra
dt-binding were needed which seemed to complicate things a bit. But it
does seem more correct in a sense that it's modeling the relationship
correctly so I'll bring it back for v3.


Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

> 
> Thanks,
> Icenowy
> 



