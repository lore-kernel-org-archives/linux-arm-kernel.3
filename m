Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D0CC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 17:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5q9k4R0V1JElA3i84ASvPr5ds/UWeY2UvJat3Km58zc=; b=x2LDxvUWCEa1msM1W1cYg0U+tC
	NonbMMXN+NnL3rtxjrPaUSVwf6EA6wzSIQqEEi36pIP+tXhoYweDCGM+UVOf3lPTJ7w3CENJRbpoI
	je9z0IPX4ozDE2ZwtOpJjc7unaiIYB/c36OA15s8dxKa9sZdbgarmYKfDdtslpMMJX6Ob1ZlAUNdn
	bK96ksI8i3V2oRSH6asqzeM1WZotGtpMq3kaJ9ScfPVyKAToOfERxIpBDTuBh2rhcUiTtLU/cOooC
	Hc6b1MNt0jNfsSt/KsoYQo6QbdaASuZ9ljJi1DzZ3VE+jCL+9vvaaeItmvbFDTHmULfSP6NQ7vT2U
	APefXEOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugnif-0000000HKHa-03Or;
	Tue, 29 Jul 2025 17:02:29 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugnDC-0000000HGyA-1pdh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 16:29:59 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 8EC6520F84;
	Tue, 29 Jul 2025 18:29:56 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kh5I-_ur6aEA; Tue, 29 Jul 2025 18:29:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1753806592; bh=cYPpvp6/LktGFqLRabjLYkW/Jo8p7bCXx5XWj6nAHfQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=D+a5l1fOvhebePXJUchw4Yhtzye0Fw7YkC6+MLurTq8XGuJcueOGpRM2zSobYf8iU
	 j5+5ljLOrkjG28uiSPb3IWE8Iu7t6iJ2eU6h2VULRj3V5QCNQuuOcbrsSlJUdyPPGO
	 6D2mPPUf0GUCzKVoXw+efXTzlgiO1k0OeLH+LGe5ZR5uOkVxcbnbtjgZfcOA2Dtt+k
	 +EMxwuPvc+w094r40OWw9k4Iu0Ej+pJAZ5istvxlAHAsAfQXySN6/VKbIAuAQvG8uv
	 ia+cztb0FemhJ98IKUv+ZaGAP4jhyc15v+zAWJohyFvZ2SjEoR+aSBNPTgeyPCQEZr
	 cRGAiEqMf+rhg==
MIME-Version: 1.0
Date: Tue, 29 Jul 2025 16:29:52 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Inki Dae <daeinki@gmail.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 10/13] drm/bridge: samsung-dsim: add ability to define
 clock names for every variant
In-Reply-To: <CAAQKjZNfb6LkShtCvan__ew=H7CaquTqn5DLcP1agtkG6B5mSw@mail.gmail.com>
References: <20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org>
 <20250706-exynos7870-dsim-v3-10-9879fb9a644d@disroot.org>
 <CAAQKjZNfb6LkShtCvan__ew=H7CaquTqn5DLcP1agtkG6B5mSw@mail.gmail.com>
Message-ID: <080f567245829dba8572be649a46cc93@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_092958_747124_C2EBA725 
X-CRM114-Status: GOOD (  17.49  )
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

On 2025-07-29 07:02, Inki Dae wrote:
> 2025년 7월 7일 (월) 오전 3:28, Kaustabh Chakraborty 
> <kauschluss@disroot.org>님이 작성:
>> 
>> -       dsi->clks = devm_kcalloc(dev, dsi->driver_data->num_clks,
>> -                                sizeof(*dsi->clks), GFP_KERNEL);
>> -       if (!dsi->clks)
>> -               return -ENOMEM;
>> -
>> -       for (i = 0; i < dsi->driver_data->num_clks; i++) {
>> -               dsi->clks[i] = devm_clk_get(dev, clk_names[i]);
>> -               if (IS_ERR(dsi->clks[i])) {
>> -                       if (strcmp(clk_names[i], "sclk_mipi") == 0) {
>> -                               dsi->clks[i] = devm_clk_get(dev, 
>> OLD_SCLK_MIPI_CLK_NAME);
>> -                               if (!IS_ERR(dsi->clks[i]))
>> -                                       continue;
>> -                       }
>> -
>> -                       dev_info(dev, "failed to get the clock: %s\n", 
>> clk_names[i]);
>> -                       return PTR_ERR(dsi->clks[i]);
>> -               }
>> +       ret = devm_clk_bulk_get(dev, dsi->driver_data->num_clks,
>> +                               dsi->driver_data->clk_data);
>> +       if (ret) {
>> +               dev_err(dev, "failed to get clocks in bulk (%d)\n", 
>> ret);
>> +               return ret;
> 
> Above change modifies the existing behavior.
> 
> Previously, when devm_clk_get() failed and the clock name was
> "sclk_mipi", the code included a fallback mechanism to try "pll_clk"
> instead. This fallback logic has been removed in the current patch.
> 
> While changing this behavior may raise concerns, the benefits of
> refactoring—specifically, defining clock names per SoC and adopting
> the clk_bulk_* API for improved maintainability—appear to outweigh the
> potential downsides.

I have checked all devices which use this driver.

Here is a mapping of all compatible -> clock names in the driver:
- fsl,imx8mm-mipi-dsim: bus_clk, sclk_mipi
- fsl,imx8mp-mipi-dsim: bus_clk, sclk_mipi
- samsung,exynos3250-mipi-dsi: bus_clk, pll_clk
- samsung,exynos4210-mipi-dsi: bus_clk, sclk_mipi
- samsung,exynos5410-mipi-dsi: bus_clk, pll_clk
- samsung,exynos5422-mipi-dsi: bus_clk, pll_clk
- samsung,exynos5433-mipi-dsi: bus_clk, sclk_mipi,
                                phyclk_mipidphy0_bitclkdiv8,
                                phyclk_mipidphy0_rxclkesc0,
                                sclk_rgb_vclk_to_dsim0

And here is what I found by grep-ing all devicetrees:

arm/boot/dts/nxp/imx/imx7s.dtsi
     compatible = "fsl,imx7d-mipi-dsim", "fsl,imx8mm-mipi-dsim";
     (uses bus_clk, sclk_mipi)

arm/boot/dts/samsung/exynos3250.dtsi
     compatible = "samsung,exynos3250-mipi-dsi";
     (uses bus_clk, pll_clk)

arm/boot/dts/samsung/exynos4.dtsi
     compatible = "samsung,exynos4210-mipi-dsi";
     (uses bus_clk, sclk_mipi)

arm/boot/dts/samsung/exynos5420.dtsi
     compatible = "samsung,exynos5410-mipi-dsi";
     (uses bus_clk, pll_clk)

arm/boot/dts/samsung/exynos5800.dtsi
     compatible = "samsung,exynos5422-mipi-dsi";
     (uses bus_clk, pll_clk - uses node from exynos5420.dtsi)

arm64/boot/dts/exynos/exynos5433.dtsi
     compatible = "samsung,exynos5433-mipi-dsi";
     (uses bus_clk, sclk_mipi, and 3 others as mentioned above)

arm64/boot/dts/freescale/imx8mm.dtsi
     compatible = "fsl,imx8mm-mipi-dsim";
     (uses bus_clk, sclk_mipi)

arm64/boot/dts/freescale/imx8mn.dtsi
     compatible = "fsl,imx8mn-mipi-dsim", "fsl,imx8mm-mipi-dsim";
     (uses bus_clk, sclk_mipi)

arm64/boot/dts/freescale/imx8mp.dtsi
     compatible = "fsl,imx8mp-mipi-dsim";
     (uses bus_clk, sclk_mipi)

So, there shouldn't be any regressions.

> 
> Unless there are objections from other reviewers, I intend to proceed
> with merging this patch.
> If anyone has concerns or sees potential issues with this change,
> please share your thoughts.
> 
> Thanks,
> Inki Dae
> 

