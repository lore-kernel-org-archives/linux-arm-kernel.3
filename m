Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FD0D767E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 16:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bXLrbm4rNgCxySzqegyMFNcdkSquFq5CB9anD4WpKE8=; b=ix7LrNZ/7CK/52Zw4qBR9ezjSJ
	a4E14rIfKWCdKlFVx5AKKT7wtlldeSI26WKO0RmANPtO+dQA5y5UW0MM0PBzk5Sgt4fuG9tjo52Vt
	SUNDyygmS9W/863ULJmyjjlTmSfxVj4UdXh3Q+t18JGihl5XlaIPrODoABkzRAdTT2QzTNyik02CF
	sYzvVogdy1+FHouFL30yQGyt7bCNDMB6cStVQQsvGmlLevh3eHZSD5cKgIz7X48u9rGwxEplkGac2
	fYMbWWLpf2NeHRBDAt65+nJ7paj/ot39h9lyeRz8DKP8o35FqwbXLJUA2wUWu1tIpUTdH/OgB7cTZ
	y8P10Wkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6YFr-00000004EWh-3B8o;
	Thu, 31 Oct 2024 16:42:39 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6YCj-00000004D4U-3H2B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 16:39:27 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49VGdB8b075269;
	Thu, 31 Oct 2024 11:39:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730392751;
	bh=bXLrbm4rNgCxySzqegyMFNcdkSquFq5CB9anD4WpKE8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Q6pixFk4owkW+oYSI/1SbFcgjnq4y3gomOrgV3Jk/764nSfOhCcS+zvCfEegpMZRd
	 fr/2tvb2OCuOe8teDxxyyjx4XqVhCcZFNYMfj2AWBTzPylADq2Q4ZrSaK+SuyCj3bq
	 BXL3qHLX/Zxty7/yJ36oRszdpyTeCmkkmF2dlJYk=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49VGdBvQ029782;
	Thu, 31 Oct 2024 11:39:11 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 31
 Oct 2024 11:39:11 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 31 Oct 2024 11:39:11 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49VGdAW7096539;
	Thu, 31 Oct 2024 11:39:10 -0500
Message-ID: <9b30cb03-8334-48ce-b23b-19df8e9f89f9@ti.com>
Date: Thu, 31 Oct 2024 11:39:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am642-evm: Add dt overlay to disable
 icssg for Linux
To: MD Danish Anwar <danishanwar@ti.com>, <vigneshr@ti.com>, <nm@ti.com>
CC: <conor+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <robh+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <kristo@kernel.org>, <srk@ti.com>, Roger Quadros <rogerq@kernel.org>
References: <20241030114458.1358800-1-danishanwar@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20241030114458.1358800-1-danishanwar@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_093925_943010_94D278A2 
X-CRM114-Status: GOOD (  16.32  )
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

On 10/30/24 6:44 AM, MD Danish Anwar wrote:
> Add k3-am642-evm-icssg1-disable.dtso overlay file that disables
> icssg1-eth from Linux so that icssg peripherals can be used by
> RTOS or some other OS running on R5 core.
> 

That was the point of putting icssg1-eth in its own overlay,
if you don't want to use ICSSG1 for Ethernet, just don't apply
k3-am642-evm-icssg1-dualemac.dtbo.

Andrew

> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> ---
>   arch/arm64/boot/dts/ti/Makefile               |  7 +--
>   .../dts/ti/k3-am642-evm-icssg1-disable.dtso   | 49 +++++++++++++++++++
>   2 files changed, 53 insertions(+), 3 deletions(-)
>   create mode 100644 arch/arm64/boot/dts/ti/k3-am642-evm-icssg1-disable.dtso
> 
> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> index 6bd06bd76b68..0fd95b7df5a8 100644
> --- a/arch/arm64/boot/dts/ti/Makefile
> +++ b/arch/arm64/boot/dts/ti/Makefile
> @@ -76,6 +76,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am642-evm.dtb
>   dtb-$(CONFIG_ARCH_K3) += k3-am642-evm-nand.dtbo
>   dtb-$(CONFIG_ARCH_K3) += k3-am642-evm-icssg1-dualemac.dtbo
>   dtb-$(CONFIG_ARCH_K3) += k3-am642-evm-icssg1-dualemac-mii.dtbo
> +dtb-$(CONFIG_ARCH_K3) += k3-am642-evm-icssg1-disable.dtbo
>   dtb-$(CONFIG_ARCH_K3) += k3-am642-evm-pcie0-ep.dtbo
>   dtb-$(CONFIG_ARCH_K3) += k3-am642-phyboard-electra-rdk.dtb
>   dtb-$(CONFIG_ARCH_K3) += k3-am642-sk.dtb
> @@ -235,8 +236,8 @@ k3-am62p5-sk-microtips-mf103hie-lcd2-dtbs := k3-am62p5-sk.dtb \
>   	k3-am62p5-sk-microtips-mf103hie-lcd2.dtbo
>   k3-am642-evm-icssg1-dualemac-dtbs := \
>   	k3-am642-evm.dtb k3-am642-evm-icssg1-dualemac.dtbo
> -k3-am642-evm-icssg1-dualemac-mii-dtbs := \
> -	k3-am642-evm.dtb k3-am642-evm-icssg1-dualemac-mii.dtbo
> +k3-am642-evm-icssg1-disable-dtbs := \
> +	k3-am642-evm.dtb k3-am642-evm-icssg1-disable.dtbo
>   k3-am642-evm-pcie0-ep-dtbs := \
>   	k3-am642-evm.dtb k3-am642-evm-pcie0-ep.dtbo
>   k3-am642-tqma64xxl-mbax4xxl-sdcard-dtbs := \
> @@ -323,7 +324,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
>   	k3-am62p5-sk-microtips-mf101hie-panel.dtb \
>   	k3-am62p5-sk-microtips-mf103hie-lcd2.dtb \
>   	k3-am642-evm-icssg1-dualemac.dtb \
> -	k3-am642-evm-icssg1-dualemac-mii.dtb \
> +	k3-am642-evm-icssg1-disable.dtb \
>   	k3-am642-evm-pcie0-ep.dtb \
>   	k3-am642-tqma64xxl-mbax4xxl-sdcard.dtb \
>   	k3-am642-tqma64xxl-mbax4xxl-wlan.dtb \
> diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm-icssg1-disable.dtso b/arch/arm64/boot/dts/ti/k3-am642-evm-icssg1-disable.dtso
> new file mode 100644
> index 000000000000..dc04e2999e97
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am642-evm-icssg1-disable.dtso
> @@ -0,0 +1,49 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/**
> + * DT overlay for enabling 2nd ICSSG1 port on AM642 EVM
> + *
> + * Copyright (C) 2020-2024 Texas Instruments Incorporated - https://www.ti.com/
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include "k3-pinctrl.h"
> +
> +&oc_sram {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
> +	r5f0_0_sram: r5f0_0_sram@0 {
> +		reg = <0x0 0x180000>;
> +	};
> +};
> +
> +&main_r5fss0_core0 {
> +	sram = <&r5f0_0_sram>;
> +};
> +
> +&cpsw_port2 {
> +	status = "disabled";
> +};
> +
> +&icssg0 {
> +	status = "disabled";
> +};
> +
> +&icssg1 {
> +	status = "disabled";
> +};
> +
> +&ospi0 {
> +	status = "disabled";
> +};
> +
> +&mdio_mux_1 {
> +	status = "disabled";
> +};
> +
> +&icssg1_eth {
> +	status = "disabled";
> +};

