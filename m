Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D55CE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 09:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gKTfJyAFubNCbtCYRbQhHbeUkKlCLTjxK8b0awaQUCk=; b=y04Cqv2wINR/iXHhJefJVbAD54
	0fvTd5mKi5lhQsQ95FJK3yg4bTKx+gZrfyqqPdOQZi87cDlBK/ztiZEBWSbKJxlm7GXI9mR9NfRQw
	W9nAzPnXVW+qq0zvRC6kZrccuSZc24gdwzIbaSDjmU66fFVLGBcl10XO3jAWt6pz0kb6bCRnaUuyJ
	/sOj/l3jS42UsP1MsGBMsbODHg4EwLgEnHqi2FElN1shQToesym6VmjA4hry2Csumaw3LG3PCe3LC
	sSKcFxzoyi502ZYvIeMZ3Cdl5Hzp172Gm550zqKYDXW/zMA295VS6uM3IvfZrbEhpB35ns71vw0V/
	Hx2QYgbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVpIs-0000000BRrd-49Ro;
	Thu, 09 Jan 2025 09:58:15 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVpHf-0000000BRgg-1yhO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 09:57:01 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5099usQk084361;
	Thu, 9 Jan 2025 03:56:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736416614;
	bh=gKTfJyAFubNCbtCYRbQhHbeUkKlCLTjxK8b0awaQUCk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Epnwx27hU003Kac2y9S3Z5IhtKuH8J9n7evBycgM9s75544eTIBf6jNp+HG5c5cjJ
	 GBQzGhfsgGVd478ex835yYWC4AQiiG3PigLYfynfP8ruHk5APMHVOaNbvLqf73AVAm
	 pd6G2bJ06GVHksa6YIYqQOL2hQQJqyn+HNVYYCq8=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5099us86020453
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Jan 2025 03:56:54 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 9
 Jan 2025 03:56:54 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 9 Jan 2025 03:56:54 -0600
Received: from [172.24.227.245] (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5099upD1126904;
	Thu, 9 Jan 2025 03:56:51 -0600
Message-ID: <2f9b9ea6-f99d-4883-bd3d-f7ee8f0f5bd5@ti.com>
Date: Thu, 9 Jan 2025 15:26:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: ti: k3-am62l: add initial reference
 board file
To: Bryan Brattlof <bb@ti.com>, Nishanth Menon <nm@ti.com>,
        Tero Kristo
	<kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250108-am62lx-v2-0-581285a37d8f@ti.com>
 <20250108-am62lx-v2-3-581285a37d8f@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20250108-am62lx-v2-3-581285a37d8f@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_015659_603182_37B51B72 
X-CRM114-Status: GOOD (  15.64  )
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



On 09/01/25 04:21, Bryan Brattlof wrote:
> From: Vignesh Raghavendra <vigneshr@ti.com>
> 
> Add the initial board file for the AM62L3's Evaluation Module.
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> Signed-off-by: Bryan Brattlof <bb@ti.com>
> ---
> Changes in v1:
>  - switched to non-direct links so TRM updates are automatic
>  - removed current-speed property from main_uart0
>  - removed empty reserved-memory{} node
>  - removed serial2 from aliases{} node
>  - corrected main_uart0 pinmux
> ---
>  arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 43 ++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> new file mode 100644
> index 0000000000000..ed0148ce1bea6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> @@ -0,0 +1,43 @@
> +// SPDX-License-Identifier: GPL-2.0-only or MIT
> +/*
> + * Device Tree file for the AM62L3 Evaluation Module
> + * Copyright (C) 2024 Texas Instruments Incorporated - https://www.ti.com/
> + *
> + * Technical Reference Manual: https://www.ti.com/lit/pdf/sprujb4
> + */
> +
> +/dts-v1/;
> +
> +#include "k3-am62l3.dtsi"
> +
> +/ {
> +	compatible = "ti,am62l3-evm", "ti,am62l3";
> +	model = "Texas Instruments AM62L3 Evaluation Module";
> +
> +	chosen {
> +		stdout-path = &main_uart0;
> +	};
> +
> +	memory@80000000 {
> +		reg = <0x00000000 0x80000000 0x00000000 0x80000000>;
> +		device_type = "memory";
> +		bootph-all;
> +	};
> +};
> +
> +&pmx0 {
> +	main_uart0_pins_default: main_uart0-default-pins {
> +		pinctrl-single,pins = <


> +			AM62PX_IOPAD(0x01b4, PIN_INPUT, 0)	/* (D13) UART0_RXD */
> +			AM62PX_IOPAD(0x01b8, PIN_OUTPUT, 0)	/* (C13) UART0_TXD */

			^^^^ AM62LX_IOPAD()

> +		>;
> +		bootph-all;
> +	};
> +};
> +
> +&main_uart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&main_uart0_pins_default>;
> +	status = "okay";
> +	bootph-all;
> +};
> 

-- 
Regards
Vignesh
https://ti.com/opensource


