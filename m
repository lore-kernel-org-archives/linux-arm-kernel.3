Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB3AC88E73
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 19:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l4wDoWVeNywfcIR5L4rg3J/vDfSoW2zWF07vjDkO78A=; b=FwzCHg/nk12A/UR/BwQi79SylI
	0Bn09gf4EA7yHXEDt65hmqhHsB964AWHWPWRLY/nstdH+Z1zdzYQ/cKSrFayUYqUXmkvFSfomAUkH
	wCSHSqW2EaqHvykKghhaEWlLeAkO/tdur2F8cHl8H7B61JrOLOdpwKZGyqXmEI7BhHXWhmls596TR
	R9KVjFBtvoZiNb2G+aQbVf2dGGqCmZQJRR3DMdc/H5HjFiT9N8s7TFT+bF2IMFDaj8N0gXgFHMsYY
	zhp+tE2ly0tBlp4pxgelfVuEC+n8TfKiUo0nSVxNKtFBVX9ME0uv6tFt9Yx275Or4D+4LVx4T3VTN
	H5Ta/5+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6CVz-00000004XoZ-19Nu;
	Mon, 14 Sep 2026 19:38:55 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6CVq-00000004Xkq-0vAr;
	Mon, 14 Sep 2026 19:38:47 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260914193842euoutp01953e61d38ec40643bc4d7157964f6df4~VRzWra7uK0314903149euoutp01E;
	Mon, 14 Sep 2026 19:38:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260914193842euoutp01953e61d38ec40643bc4d7157964f6df4~VRzWra7uK0314903149euoutp01E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789414722;
	bh=l4wDoWVeNywfcIR5L4rg3J/vDfSoW2zWF07vjDkO78A=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=WTY8xEi6jJOa1gLnOSUBPvlQpMk4v2dS5Nlb2zkZtStSIF1Pr3VZihsDFbmaj+Y4h
	 48ffokqJfJoWOeBrkZRq1liliRT+IYnxf1/b09yAMsjlsgBoE69rhThGKgRG7auZzS
	 XuVmAtFsH2iSO/zueW7kE3R3lnmCSs0qp5222L1M=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260914193842eucas1p27f2871f925584e946f2bb24c04b38b90~VRzWUs-Iu3205232052eucas1p2N;
	Mon, 14 Sep 2026 19:38:42 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260914193840eusmtip1c6e3388713b55ee3f14ee6a855ba8b6e~VRzUiiOIx1812818128eusmtip1N;
	Mon, 14 Sep 2026 19:38:40 +0000 (GMT)
Message-ID: <fcfdd9da-8425-4cf9-94ba-23b06cd06185@samsung.com>
Date: Mon, 14 Sep 2026 21:38:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/19] riscv: dts: starfive: jh7110: Update DT for
 display subsystem
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
	Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrzej
	Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
	Lee Jones <lee@kernel.org>, Andy Yan <andy.yan@rock-chips.com>, Philipp
	Zabel <p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, Hal
	Feng <hal.feng@starfivetech.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney
	<bmasney@redhat.com>, Heiko Stuebner <heiko@sntech.de>, Conor Dooley
	<conor@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>, Dominique Belhachemi <db@domibel.de>, Brian Masney
	<bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	mfd@lists.linux.dev, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org, Andy Yan <andyshrk@163.com>, Marek
	Szyprowski <m.szyprowski@samsung.com>, Maud Spierings
	<maud_spierings@murena.io>, Graham Markall <hello@big-grey.co.uk>, Icenowy
	Zheng <zhengxingda@iscas.ac.cn>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20260910-determined-fantastic-seriema-3ff701@quoll>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260914193842eucas1p27f2871f925584e946f2bb24c04b38b90
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260904132743eucas1p1e02218d3fb38af95c3dd4bfa24904cab
X-EPHeader: CA
X-CMS-RootMailID: 20260904132743eucas1p1e02218d3fb38af95c3dd4bfa24904cab
References: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
	<CGME20260904132743eucas1p1e02218d3fb38af95c3dd4bfa24904cab@eucas1p1.samsung.com>
	<20260904-jh7110-clean-send-v3-18-484f9ae72715@samsung.com>
	<20260910-determined-fantastic-seriema-3ff701@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_123846_525192_CAF2C1C2 
X-CRM114-Status: GOOD (  14.16  )
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



On 9/10/26 10:37, Krzysztof Kozlowski wrote:
> On Fri, Sep 04, 2026 at 03:27:19PM +0200, Michal Wilczynski wrote:
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> index 9c3e4598747eb5541effe697044484715569a285..0f981f4c89586269b987be8591037c9461e04703 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> @@ -290,12 +290,6 @@ gmac1_rmii_refin: gmac1-rmii-refin-clock {
>>  		#clock-cells = <0>;
>>  	};
>>  
>> -	hdmitx0_pixelclk: hdmitx0-pixel-clock {
>> -		compatible = "fixed-clock";
>> -		clock-output-names = "hdmitx0_pixelclk";
>> -		#clock-cells = <0>;
>> -	};
>> -
>>  	i2srx_bclk_ext: i2srx-bclk-ext-clock {
>>  		compatible = "fixed-clock";
>>  		clock-output-names = "i2srx_bclk_ext";
>> @@ -352,6 +346,13 @@ tdm_ext: tdm-ext-clock {
>>  		#clock-cells = <0>;
>>  	};
>>  
>> +	xin24m: xin24m {
> 
> Other clocks are called foo-clock, so follow this as well (even though
> it does not follow recommended practice of clock-foo, but at least some
> consistency).

will rename to to xin24m-clock

> 
> Best regards,
> Krzysztof
> 
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>


