Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481C5CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 21:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z1MeHN/FAuAOkxz9iJEKMCLiQPrMJjTHwVbwSN9mvp8=; b=PLR55+yx76MeEkLaTnjrd2N754
	yn1edxlpMROl8kQGRMmR9LLaPd1Cetq1+wZeYthneIN4fC4fEGNIn9y0jz4vkIESdDL4DUMKjEHJr
	xLckd2umlm4l26Aj9BblX5mJY/F9ughE05TRNmCZwH7h3jTI4+xRD34HKQkm7eihGSBoh1I0uLuDv
	28DPUCaP1W7JxHQNp2VBHsv/oAcWYym4qCtkQ5Xy+Y0jaEfCtU8tL1dNr+QQI5X21gzTtCmGck5XR
	CEmdqYydaBUPS++lxPjryFmoM3xkrF0L/yuXxhRXcJKbyEh7bX+T0Cw3D9DEhWo/+v421NIl4p3G5
	q/nueQpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwSNd-0000000GrR7-3DOV;
	Wed, 10 Sep 2025 21:29:29 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwSNb-0000000GrOI-00xw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 21:29:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1757539764;
 bh=Z1MeHN/FAuAOkxz9iJEKMCLiQPrMJjTHwVbwSN9mvp8=;
 b=o+v+9vTsSJ9aMMmOrCyG5RWU68YRTMoKUKXfYIVOBn2suwaXhUzMZ7Odyle05F8+KD5AnV/dm
 m8zPx9QCm0YK5FT79OXONDrGvCt/LB8xkHkHiXJ4hL52E+pIRc2hOt0CdEEZd9K9LFiP0JbSmv/
 rMvEzz6cNYD1cMjYrIejTE1AD67xS2BtDMGILt837bPqmUhPT2UX9LtlJiIjZeM48K2yNJDgaeY
 v+9t3Wx1M1E36rZcul+iJkMbHMcOGCWzJNYqCNiDD8wXMO/bu0k4Sc/SXhS4aZuaXRyCKNfdu54
 WwdB59hSAR+HuE2/ITdeaBqAf8SSrAryDXkXRlss0JMA==
X-Forward-Email-ID: 68c1eda3343e597491a9aa4c
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.2.14
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <38e80b6d-1dc9-47a8-8b23-e875c2848e6e@kwiboo.se>
Date: Wed, 10 Sep 2025 23:29:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: rockchip: Add PCIe Gen2x1 controller for
 RK3528
To: Yao Zi <ziyao@disroot.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Shawn Lin <shawn.lin@rock-chips.com>, Simon Xue <xxm@rock-chips.com>,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Chukun Pan <amadeus@jmu.edu.cn>
References: <20250906135246.19398-1-ziyao@disroot.org>
 <20250906135246.19398-3-ziyao@disroot.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250906135246.19398-3-ziyao@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_142927_080649_15DDFF7F 
X-CRM114-Status: GOOD (  16.48  )
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

Hi Yao Zi,

On 9/6/2025 3:52 PM, Yao Zi wrote:
> Describes the PCIe Gen2x1 controller integrated in RK3528 SoC. The SoC
> doesn't provide a separate MSI controller, thus the one integrated in
> designware PCIe IP must be used.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  arch/arm64/boot/dts/rockchip/rk3528.dtsi | 56 +++++++++++++++++++++++-
>  1 file changed, 55 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> index db5dbcac7756..2d2af467e5ab 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/phy/phy.h>
>  #include <dt-bindings/pinctrl/rockchip.h>
>  #include <dt-bindings/clock/rockchip,rk3528-cru.h>
>  #include <dt-bindings/power/rockchip,rk3528-power.h>
> @@ -239,7 +240,7 @@ gmac0_clk: clock-gmac50m {
>  
>  	soc {
>  		compatible = "simple-bus";
> -		ranges = <0x0 0xfe000000 0x0 0xfe000000 0x0 0x2000000>;
> +		ranges = <0x0 0xfc000000 0x0 0xfc000000 0x0 0x44400000>;

We should use the dbi reg area in the 32-bit address space, please use:

  ranges = <0x0 0xfc000000 0x0 0xfc000000 0x0 0x4000000>;

>  		#address-cells = <2>;
>  		#size-cells = <2>;
>  
> @@ -1133,6 +1134,59 @@ combphy: phy@ffdc0000 {
>  			rockchip,pipe-phy-grf = <&pipe_phy_grf>;
>  			status = "disabled";
>  		};
> +
> +		pcie: pcie@fe4f0000 {

With the dbi reg area changed below, please update the node name and
move this node to top of the soc node.

  pcie@fe000000

> +			compatible = "rockchip,rk3528-pcie",
> +				     "rockchip,rk3568-pcie";
> +			reg = <0x1 0x40000000 0x0 0x400000>,

We should use the dbi reg area in the 32-bit address space, please use:

  reg = <0x0 0xfe000000 0x0 0x400000>,

> +			      <0x0 0xfe4f0000 0x0 0x10000>,
> +			      <0x0 0xfc000000 0x0 0x100000>;
> +			reg-names = "dbi", "apb", "config";
> +			bus-range = <0x0 0xff>;
> +			clocks = <&cru ACLK_PCIE>, <&cru HCLK_PCIE_SLV>,
> +				 <&cru HCLK_PCIE_DBI>, <&cru PCLK_PCIE>,
> +				 <&cru CLK_PCIE_AUX>, <&cru PCLK_PCIE_PHY>;
> +			clock-names = "aclk_mst", "aclk_slv",
> +				      "aclk_dbi", "pclk",
> +				      "aux", "pipe";

In my U-Boot test I did not have the pipe/phy clock here, do we need it?

With above fixed this more or less matches my U-Boot testing, and is:

Reviewed-by: Jonas Karlman <jonas@kwiboo.se>

Regards,
Jonas

> +			device_type = "pci";
> +			interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "sys", "pmc", "msg", "legacy", "err",
> +					  "msi";
> +			#interrupt-cells = <1>;
> +			interrupt-map-mask = <0 0 0 7>;
> +			interrupt-map = <0 0 0 1 &pcie_intc 0>,
> +					<0 0 0 2 &pcie_intc 1>,
> +					<0 0 0 3 &pcie_intc 2>,
> +					<0 0 0 4 &pcie_intc 3>;
> +			linux,pci-domain = <0>;
> +			max-link-speed = <2>;
> +			num-lanes = <1>;
> +			phys = <&combphy PHY_TYPE_PCIE>;
> +			phy-names = "pcie-phy";
> +			power-domains = <&power RK3528_PD_VPU>;
> +			ranges = <0x01000000 0x0 0xfc100000 0x0 0xfc100000 0x0 0x100000>,
> +				 <0x02000000 0x0 0xfc200000 0x0 0xfc200000 0x0 0x1e00000>,
> +				 <0x03000000 0x1 0x00000000 0x1 0x00000000 0x0 0x40000000>;
> +			resets = <&cru SRST_PCIE_POWER_UP>, <&cru SRST_P_PCIE>;
> +			reset-names = "pwr", "pipe";
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			status = "disabled";
> +
> +			pcie_intc: legacy-interrupt-controller {
> +				interrupt-controller;
> +				interrupt-parent = <&gic>;
> +				interrupts = <GIC_SPI 155 IRQ_TYPE_EDGE_RISING>;
> +				#address-cells = <0>;
> +				#interrupt-cells = <1>;
> +			};
> +		};
>  	};
>  };
>  


