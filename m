Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA37CAC58C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 07:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zuFLBnhVlG9Xe0rzmQ2aQ8puxTjfyso14EEKYx0T/lQ=; b=M8avJOZHo4e/YALeS1egjbgzaz
	Rfa6quJtg8l6W+0IVZktqJvTnYdlEifbcgwvvtg5SYyGAhTh6DXU0zfbzsKxGsKQgiuD97QAOJfqC
	qrk993clT2LK+8W/VRPUl+gO9dagKftu58uA11XczEMmwb3hBkiFLFXjioq0il5Fm9B/fuBe6eMZn
	kfJ1sfYWRSOsKrztYzh3TdCHUVEBJ6WnyxXqNdTGIm0dT8fsuDw1U66sJxzgFTFnQmKtlxHKzmwqw
	jemqV5sMWE5G6fq66YYva+qanqRqRqAdzzJ/GZMHYk4nXUhxMvHg3JbY2fir/6CsVr/YedWhBqY1G
	YQ+nqnDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvssI-00000005Byc-1ZZz;
	Tue, 09 Sep 2025 07:34:46 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvrVc-00000004b2H-3bh6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 06:07:18 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5896758U3959728;
	Tue, 9 Sep 2025 01:07:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757398025;
	bh=zuFLBnhVlG9Xe0rzmQ2aQ8puxTjfyso14EEKYx0T/lQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=eul3I6/3uBR2bsColcBThyV824YZxzZhC6yvqUfw6QU6V/swPN1gDl6Xb78ti+UwV
	 rViCSO9WQngKkou0AtcHBLr2dDAieLBiKGmqDZ/W2ypskC1C6oz7X1DZcPyAoqeMrU
	 9vjJX0tnQk6IobTih9eCUt9BJ7laV9ebrudm6Hls=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5896759i3563479
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 9 Sep 2025 01:07:05 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 9
 Sep 2025 01:07:05 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 9 Sep 2025 01:07:05 -0500
Received: from [10.24.72.162] (moteen-ubuntu-desk.dhcp.ti.com [10.24.72.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 589671DH1840294;
	Tue, 9 Sep 2025 01:07:02 -0500
Message-ID: <c4de581a-906c-4f0f-a881-6725f27499e6@ti.com>
Date: Tue, 9 Sep 2025 11:37:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: ti: k3-am62p/j722s: Remove HS400
 support from common
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        Andrew Davis <afd@ti.com>, <linux-kernel@vger.kernel.org>
References: <20250908235207.473628-1-jm@ti.com>
 <20250908235207.473628-2-jm@ti.com>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <20250908235207.473628-2-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_230716_988438_794B0E1B 
X-CRM114-Status: GOOD (  13.55  )
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


On 09/09/25 05:22, Judith Mendez wrote:
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
> index 6aea9d3f134e..020bd121a6a3 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
> @@ -74,3 +74,9 @@ &main_gpio1 {
>   	gpio-reserved-ranges = <32 10>;
>   	ti,ngpio = <52>;
>   };
> +
> +&sdhci0 {
> +	mmc-hs400-1_8v;
> +	ti,strobe-sel = <0x77>;
> +	ti,otap-del-sel-hs400 = <0x5>;
> +};

Reviewed-by: Moteen Shah <m-shah@ti.com>

Regards,
Moteen

