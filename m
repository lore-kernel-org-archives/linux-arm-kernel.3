Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4FFC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 17:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wdCzpoXHiUwgiGgzxN8YWp/CXgwezVLW2dCbmruGf2k=; b=ycRmOPe0ioYZQQLBo1eOfRzCNu
	rwV8FBFwzQFRQcIq1k/WLbHgoc7F4Uf0Fj/DskIuKZuZ9yHhmeocfP5DUMvAms27C6fHkFbpHCHnX
	7Z8Iii+wHsOMopKDKsXq8m2HkkD/BjEDEiWgXPDfudny7DElEBLQ04bC0yYkqab7JU2KIgyVzoSzp
	2AEI143iVbZl/gIPkg/X7NwXHrjBlYEqa7leijC/cBB7lW+tsiMjNUgWS0XU8xmxKQpHYEiBHGlSr
	pjUHTe2/dnomsiA1LzR8JgoEEVe+vqXYMhBoWaI36abshJIskBPT2o1mKHFSmEbvn+Q0mQcfcFpqg
	f86gFr4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzfZ4-000000041vY-1dq7;
	Tue, 01 Apr 2025 17:38:18 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzfXH-000000041mI-1mzw;
	Tue, 01 Apr 2025 17:36:29 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D079F25C5F;
	Tue,  1 Apr 2025 19:36:18 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 85kTxoqsDQpS; Tue,  1 Apr 2025 19:36:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1743528978; bh=fzp725Jl1448wIARjxbrq/kaOVZ0/ZOHyXPogF42rQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QpY78WWREkPzmaMORR2X6BiBkCKQuye4HPfTvVRwUrtJhRs4tqPWlwgxKFrCn9U7o
	 lPWhnePhuVl6Xqqgat624FuEjs5yDqvygTGz7/Sw2Ayw+0Pp6D8iP3yhJkjYzmvCOW
	 zX6pw2x0m+QSkF03FIySiLfSvjLHdLOhlUETjbeDzZ481j0ou4R1XR07S5DRvPic5U
	 Kz2EeHVkmpLz5V8Cjsig5wO2vP4WXz/+6b1EDMy1/AAdkaL/yOxxu8rIy0PvXA2UCX
	 cmdYhClZfafwGoSw+v8hO9Dh4ReYSu0wSGPm2RGebnr6UJehd5dA5pXsc4Zd09J0Am
	 V93pf7RabQ7LA==
Date: Tue, 1 Apr 2025 17:35:57 +0000
From: Yao Zi <ziyao@disroot.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: rockchip: Add DMA controller for
 RK3528
Message-ID: <Z-wj_eO6FGcwsEh6@pie.lan>
References: <20250401100020.944658-1-amadeus@jmu.edu.cn>
 <20250401100020.944658-3-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401100020.944658-3-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_103627_873893_B733BAFC 
X-CRM114-Status: GOOD (  14.74  )
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

On Tue, Apr 01, 2025 at 06:00:19PM +0800, Chukun Pan wrote:
> Add DMA controller dt node for RK3528 SoC.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  arch/arm64/boot/dts/rockchip/rk3528.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> index 7f1ffd6003f5..c366766ee3f5 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> @@ -493,6 +493,24 @@ sdhci: mmc@ffbf0000 {
>  			status = "disabled";
>  		};
>  
> +		dmac: dma-controller@ffd60000 {
> +			compatible = "arm,pl330", "arm,primecell";
> +			reg = <0x0 0xffd60000 0x0 0x4000>;
> +			clocks = <&cru ACLK_DMAC>;
> +			clock-names = "apb_pclk";
> +			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
> +			arm,pl330-periph-burst;

Should this be moved above "clocks" line to sort the properties?

Thanks,
Yao Zi

> +			#dma-cells = <1>;
> +		};
> +
>  		pinctrl: pinctrl {
>  			compatible = "rockchip,rk3528-pinctrl";
>  			rockchip,grf = <&ioc_grf>;
> -- 
> 2.25.1
> 

