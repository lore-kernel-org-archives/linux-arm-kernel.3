Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6855C3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 08:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4LqHMCcK2l/V1M+MRFnOp7hwBiMnH0PyGKsakcx8Vu4=; b=JTGv2mIjL1LcN10CNcX9aFk8iA
	N1UdIOVz7BW/PtEne2CL7ow7i1FRn/xbb+g+bTjigi3QT18NUwV+YCaD4rXpT3Zwvxvt9kiLHyTM8
	j81ftt7kb6032PiV7pjZEeVucmRBgfqvM4Fm2rRS3phg3cs7MIbvRFdpf3Ol1CZz4PMfxbQlknmBw
	IM1/XF3sI9vtuBygSoOoNpf/ESioqT+s/yff2ghgshysvVjlvsxKaIueTw6DrJ93BfqHVpO0OQW/S
	3XiSZWFoCRNa2rsdAgYbOeTNpyPwfhD783hc35xAFVwiy/97JeKfVJD4lBsfLMSzWEqNgDYT9yXLS
	MlhmnfxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAlKV-000000019dV-3AYk;
	Fri, 02 May 2025 08:01:07 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAl8o-000000018R0-3MtX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 07:49:04 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5427mcH2361756
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 02:48:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746172118;
	bh=4LqHMCcK2l/V1M+MRFnOp7hwBiMnH0PyGKsakcx8Vu4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=rf0WrmKYKQOaRfLqXQkErznRX00xbww/2tmuOYEGfDRAOIkoUfW/GrLJDFJ+cPaWx
	 ViNK9XvI/6X1wNerCLuFqNAyCe+XavbvaEw1qt8c7SvNT4SvtD9VBi0uydqdDmQ7bG
	 nsWaHdTw8Xs5Q/DaJ8BTA+SWpdWSS/ouSwPI1/lQ=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5427mcsv045384
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 02:48:38 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 02:48:37 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 02:48:37 -0500
Received: from [172.24.227.193] (devarsh-precision-tower-3620.dhcp.ti.com [172.24.227.193])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5427mWwB079020;
	Fri, 2 May 2025 02:48:33 -0500
Message-ID: <6cf6f0f4-6559-4d74-ab69-1ccdf131512d@ti.com>
Date: Fri, 2 May 2025 13:18:32 +0530
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH v1 1/4] arm64: dts: ti: k3-am62p5-sk: Add regulator nodes
 for AM62P
To: Rishikesh Donadkar <r-donadkar@ti.com>, <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <y-abhilashchandra@ti.com>,
        <s-jain1@ti.com>, <jai.luthra@linux.dev>,
        <jai.luthra@ideasonboard.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <imx@lists.linux.dev>
References: <20250429154133.3377962-1-r-donadkar@ti.com>
 <20250429154133.3377962-2-r-donadkar@ti.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20250429154133.3377962-2-r-donadkar@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_004903_017153_068DC1EA 
X-CRM114-Status: GOOD (  14.24  )
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

On 29/04/25 21:11, Rishikesh Donadkar wrote:
> Add regulator node for AM62P-SK
> 
> VCC_3V3_MAIN is the output of LM5141-Q1, and it serves as an input to
> TPS22965DSGT which produces VCC_3V3_SYS [1]
> 
> VCC_3V3_SYS servers as vin-supply for peripherals like CSI [1].
> 
> Link: https://www.ti.com/lit/zip/sprr487 [1]
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>

Reviewed-by: Devarsh Thakkar <devarsht@ti.com>

Regards
Devarsh
> ---
>  arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> index c2f55cc5a8ebc..0af33fccb96bf 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> @@ -115,6 +115,28 @@ vddshv_sdio: regulator-3 {
>  		bootph-all;
>  	};
>  
> +	vcc_3v3_main: regulator-4 {
> +		/* output of LM5141-Q1 */
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_3v3_main";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vmain_pd>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	vcc_3v3_sys: regulator-5 {
> +		/* output of TPS222965DSGT */
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_3v3_sys";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vcc_3v3_main>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
>  	leds {
>  		compatible = "gpio-leds";
>  		pinctrl-names = "default";


