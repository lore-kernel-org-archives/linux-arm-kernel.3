Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B4F0CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=75t8gUXqDkMVSTXxQWJbT39KD1G/2RxpZCQY37fgf94=; b=D0no5KKFiNvLrm/KMOE/yTqyac
	8sIVEZh8VChfszhcNCgcR4ajYJoc52b/VBlsy4yF9EVzoDqvonjBR2GWumqe9kmAYS0YNh4dy9NEa
	gdUh4hsUIVBN49KRlI6Mi5dm54IvKtn19JniI7H16wyOHXPQoq9UBS5jOeeqlLAZx7AyfG3LZu67U
	pAfpoc8fBIjrlVAwR3ZJHrikwvnTQ9jk3x2ols+qD+2c0Nfr9B7PQQcNLg+SN53yYX0RC9Q5K1WMc
	2verhtBVqlwd6NlriuT4WUMSSaT7pDmLr4DVfvBRj/92DN7FUUqLCoLCOwrtEa6xYN/F6aQSHYKEN
	wPQX2svw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsBs-00000004pOz-2qVt;
	Tue, 09 Sep 2025 06:50:56 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvijT-00000002GkI-0mmd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 20:45:00 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 588Kis44131929;
	Mon, 8 Sep 2025 15:44:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757364294;
	bh=75t8gUXqDkMVSTXxQWJbT39KD1G/2RxpZCQY37fgf94=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=pGvmfmPIExQEr+k8ySt//Eut7ANLX5mntUXxQiVgtWdWcYahiiB7r4MtnJ32ElbWl
	 xr6CZMbMxQi+k60/Oiue3wr8MWLAZ78DhLSOFGa5hMjEZZgPfWC+3XNeHzPJdKfzRe
	 v4ETJ55gON2vVAVre06KaHBRrQekJlrI+cPIeUxA=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 588KisMi3260231
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 8 Sep 2025 15:44:54 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 15:44:53 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 15:44:53 -0500
Received: from [10.247.30.162] (ula0226330.dhcp.ti.com [10.247.30.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 588Kirlu1191331;
	Mon, 8 Sep 2025 15:44:53 -0500
Message-ID: <363878df-528b-4959-945f-3b531f156679@ti.com>
Date: Mon, 8 Sep 2025 15:44:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: ti: k3-am62p/j722s: Remove HS400
 support from common
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>
CC: Moteen Shah <m-shah@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250908173831.269039-1-jm@ti.com>
 <20250908173831.269039-2-jm@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250908173831.269039-2-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_134459_323703_E5160535 
X-CRM114-Status: GOOD (  14.15  )
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

On 9/8/25 12:38 PM, Judith Mendez wrote:
> Since eMMC HS400 has been descoped for J722s due to errata i2478 [0]
> and is supported for AM62Px device, remove eMMC HS400 support from
> common-main.dtsi and include only in am62p-main.dtsi.
> 
> [0] https://www.ti.com/lit/pdf/sprz575
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 3 ---
>   arch/arm64/boot/dts/ti/k3-am62p-main.dtsi              | 6 ++++++
>   2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> index 4427b12058a6..0c05bcf1d776 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> @@ -576,15 +576,12 @@ sdhci0: mmc@fa10000 {
>   		bus-width = <8>;
>   		mmc-ddr-1_8v;
>   		mmc-hs200-1_8v;
> -		mmc-hs400-1_8v;
>   		ti,clkbuf-sel = <0x7>;
> -		ti,strobe-sel = <0x77>;
>   		ti,trm-icp = <0x8>;
>   		ti,otap-del-sel-legacy = <0x1>;
>   		ti,otap-del-sel-mmc-hs = <0x1>;
>   		ti,otap-del-sel-ddr52 = <0x6>;
>   		ti,otap-del-sel-hs200 = <0x8>;
> -		ti,otap-del-sel-hs400 = <0x5>;
>   		ti,itap-del-sel-legacy = <0x10>;
>   		ti,itap-del-sel-mmc-hs = <0xa>;
>   		ti,itap-del-sel-ddr52 = <0x3>;
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
> index 6aea9d3f134e..90afe21e972b 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
> @@ -31,6 +31,12 @@ usb1: usb@31100000 {
>   			snps,usb2-lpm-disable;
>   		};
>   	};
> +
> +	sdhci0: mmc@fa10000 {

The node already has a label where it is defined, so you could just use:

&sdhci0 {
    ...

here at the base level, and not have it inside cbass_main.

Andrew

> +		mmc-hs400-1_8v;
> +		ti,strobe-sel = <0x77>;
> +		ti,otap-del-sel-hs400 = <0x5>;
> +	};
>   };
>   
>   &oc_sram {


