Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4434BC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 21:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FwRTNZOGaMzk6sK4gqhqpSsftDoXWbs1L9reGg1ZKBI=; b=LKEo3jiJFZ4kCFCPB/JRHH14aZ
	i7lqVJXFz7tp81zu4Rbo+aQTJRKTCxlZSbsah+I7x9lcveYYU8UIVXqAk7tDO57hYsCfNMV2AQHrS
	0YzqX80ipE1qWayl1yThHcB1eOPtaug+HhBjvPJqw7VdZ43jH9V/SqLzuB04cg/Y/O2w1CzsNYgQl
	y95iy+cVFakVoEkMOq4rTSzBY8ccy6obr1cZTuu4K2tk+CZi/ZGDw4TlTt1VLafLgk6ksf4aod368
	mnMpV2x+WVLA/KpubA/TP89m7eGUSN2tRIw03vEjRSrMnpFfuJuctdWK5U9akZkmHt0l6OI9OLU0z
	O0P0Vjcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twSWg-00000001jEO-24j3;
	Sun, 23 Mar 2025 21:06:34 +0000
Received: from smtp.forwardemail.net ([121.127.44.59])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twSUy-00000001j4y-1dxD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Mar 2025 21:04:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1742763883;
 bh=FwRTNZOGaMzk6sK4gqhqpSsftDoXWbs1L9reGg1ZKBI=;
 b=DfL9ynNe0So0hln/rdgumR3TgYgg/rrBPsMJF5QUTuhaSuqdukZPMDfBLYGTLaCLGJTkkx5VX
 rfxHidiqAXf62s+E++f4oMGTJX9aI1hEABzXeo5frkkRb/Z/7P7PRt1/vT+nvtxJdgliy1NRbM/
 cqmmKGmCkwxh2h8XsvGLf/b0k1KHNHVB88ehN9BlisM4gZ4e9Hx2kmnX4rF3TjV0mglpHVcVwRg
 vfppDxPVxzZuB4ngQ/7+y1uwu1C1dlXondokzkqvb7CjZA5mzU1CnSk/nTqDi0/tSD9LVYiSJ6D
 7tJorJuXrD0i9CwrLkqFj+ViOnd/DcePusHC3kJAvsMg==
X-Forward-Email-ID: 67e07765bd529871d5f80612
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.59
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <201122ca-74d1-4938-9940-7da051896da9@kwiboo.se>
Date: Sun, 23 Mar 2025 22:04:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: rockchip: Add DMA controller for RK3528
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Yao Zi <ziyao@disroot.org>, Rob Herring <robh@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250318100010.2253408-1-amadeus@jmu.edu.cn>
 <20250318100010.2253408-3-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250318100010.2253408-3-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_140448_520942_548127FE 
X-CRM114-Status: GOOD (  12.56  )
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

Hi Chukun,

On 2025-03-18 11:00, Chukun Pan wrote:
> Add DMA controller dt node for RK3528 SoC.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  arch/arm64/boot/dts/rockchip/rk3528.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> index 7f1ffd6003f5..ad77e0ef70f2 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> @@ -493,6 +493,24 @@ sdhci: mmc@ffbf0000 {
>  			status = "disabled";
>  		};
>  
> +		dmac: dma-controller@ffd60000 {
> +			compatible = "arm,pl330", "arm,primecell";
> +			reg = <0x0 0xffd60000 0x0 0x4000>;
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
> +			clocks = <&cru ACLK_DMAC>;
> +			clock-names = "apb_pclk";

nitpick:

Please move the clock related props before interrupts to keep prop order
consistent in the rk3528.dtsi-file. See [1] for preferred prop order.

[1] https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-of-properties-in-device-node

Regards,
Jonas

> +			#dma-cells = <1>;
> +		};
> +
>  		pinctrl: pinctrl {
>  			compatible = "rockchip,rk3528-pinctrl";
>  			rockchip,grf = <&ioc_grf>;


