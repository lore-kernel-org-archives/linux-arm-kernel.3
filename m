Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27598C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 14:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M9fpsf78Paf5UKQYjLwaXjw5Gbg+DBdSCuZWocGOz1c=; b=Gf6vu7GaGeunErJWDDERGZRzN6
	tQ9EtX1vhZdykXKfnH28NfiQqqCsiAUDv5eakMbfMqCTBK7u8RHMx/OzYz0N2ZLFHgojufWAlD0lr
	szGH+Cv/5qdXoMRHFVuVfp6Z6S2EIcEKjTvkx3NK4vK9LWI9/0X/K2baQgzS5OG8T6HU9SanCQg4j
	bnCRUQ+OpHmPsYuq6VyeUmv2pZMQCYJdV+qH/fr+shXLpDBG8IZFqIhuHuppWdm1LAM95VzzxHWmk
	qxmz9gkqDAheQOkHSuRZUtMEKl0X1DvZ4YgNvUBDyUWkTE2lG5Rc4S80iZ2XLMxKf+cXzvClUInk0
	KeYVcFWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9PfQ-00000006fL4-2T3q;
	Mon, 28 Apr 2025 14:41:08 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9PYg-00000006eDk-27aw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 14:34:12 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53SEY5lE3573445
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 09:34:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745850845;
	bh=M9fpsf78Paf5UKQYjLwaXjw5Gbg+DBdSCuZWocGOz1c=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=sJPJraCHbeaVGqjYkUiiMPpzHnnFG8SQopfpgOzkvwzdyi+athULzc9Z85/Xdmh0p
	 Jw2rdrcfbsEiuyqqr0RQE36tlz2kOb7cXH/sVCMaESkPP1kYNjHnWGaHl+cmNm/y3J
	 ijojrKrDNmId3wSTVy1gdlaNXLJRNkRFRfFhqwsM=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53SEY5uL003914
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Apr 2025 09:34:05 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Apr 2025 09:34:03 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Apr 2025 09:34:03 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53SEXxMp108147;
	Mon, 28 Apr 2025 09:33:59 -0500
Message-ID: <5619384e-28d4-48b9-99cc-dbf2e2375090@ti.com>
Date: Mon, 28 Apr 2025 20:03:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: ti: k3-j784s4-j742s2-main-common: add
 ACSPCIE0 node
To: Siddharth Vadapalli <s-vadapalli@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <parth105105@gmail.com>,
        <parth.pancholi@toradex.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <u-kumar1@ti.com>
References: <20250422123218.3788223-1-s-vadapalli@ti.com>
 <20250422123218.3788223-2-s-vadapalli@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250422123218.3788223-2-s-vadapalli@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_073410_674327_83F42412 
X-CRM114-Status: GOOD (  17.41  )
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


On 4/22/2025 6:02 PM, Siddharth Vadapalli wrote:
> The ACSPCIE0 module on TI's J784S4 SoC is capable of driving the
> reference clock required by the PCIe Endpoint device. It is an
> alternative to on-board and external reference clock generators.
> Add the device-tree node for the same.
>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>
> The previous versions of this series were a single patch. Based on the
> feedback received on previous versions, the SoC and Board support has
> been split in order to allow reuse for other Boards based on the same
> SoC.
>
> v2 patch:
> https://lore.kernel.org/r/20250411121307.793646-1-s-vadapalli@ti.com/
> Changes since v2 patch:
> - The SoC and board changes have been split across:
>    k3-j784s4-j742s2-main-common.dtsi and k3-j784s4-j742s2-evm-common.dtsi
>    respectively.
>
> Regards,
> Siddharth.
>
>   arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> index 1944616ab357..f03b2b6d5d03 100644
> --- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> @@ -126,6 +126,11 @@ audio_refclk1: clock@82e4 {
>   			assigned-clock-parents = <&k3_clks 157 63>;
>   			#clock-cells = <0>;
>   		};
> +
> +		acspcie0_proxy_ctrl: clock-controller@1a090 {
> +			compatible = "ti,j784s4-acspcie-proxy-ctrl", "syscon";
> +			reg = <0x1a090 0x4>;

Reviewed-by: Udit Kumar <u-kumar1@ti.com>


> +		};
>   	};
>   
>   	main_ehrpwm0: pwm@3000000 {

