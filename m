Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D6DCFA44E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 16:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OuQA09gyI4WukFo0h7kDvUI5cJRKjUfhIF1isfAvFEI=; b=WQUoT+xUm1vAbNjsdK7eWxlQI1
	Wq2x/WyjVSHdLA7zi/XMAfVpNM+A5/vKwp8eRBYHKjWRreoIdxQXirdvAFsVd7HXiWshYzS1MriNX
	oMZ5j0ivWGdtKcU31M9PX61XzXFL+lmJIdBKlufBbxFat0RxGGEhq4vUnrp2IIMNWlBquour3tBPw
	rcQqyO/H+qwi6bO4/3u0KiwfKUmmATs3JAVW9ueMcQHn4cnECJaJbId1QxkZtCMwDcrjkWa9lHFj+
	x+VHso3fyAGoYdJ5PtJ2h6rQLhcwGr20NsVgBav51c02ORurqr6aSI9lCoCuFQ3toaUVbQt1R1Pxt
	F0Zq+5dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eF8-0000000FAmN-45vb;
	Wed, 23 Oct 2024 16:29:54 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3dRx-0000000EzXG-0WYf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 15:39:07 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49NFd1Ws067669;
	Wed, 23 Oct 2024 10:39:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729697941;
	bh=OuQA09gyI4WukFo0h7kDvUI5cJRKjUfhIF1isfAvFEI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=TrIQgpRnEwdf6ZBsIBTODFe9PxqDiNNJY0S9AlzfrSO4P8275hP5PYfPN0HvhMWQ1
	 coPSMaLVX6E5y1g1C7WDpSSiXydS1XB2RqwpkmymtNe4OONGL5tjGzPo+DpaORlAdJ
	 vzrBDpcyBN8CvGsi1n5kikUXj0qtd337uuISH+K4=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49NFd1Ke129217
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Oct 2024 10:39:01 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 23
 Oct 2024 10:39:01 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 23 Oct 2024 10:39:00 -0500
Received: from [172.24.227.91] (psdkl-workstation0.dhcp.ti.com [172.24.227.91])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49NFcuS4104759;
	Wed, 23 Oct 2024 10:38:57 -0500
Message-ID: <47441421-23d4-42a9-b080-21f7c9314fa6@ti.com>
Date: Wed, 23 Oct 2024 21:08:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/12] arm64: dts: ti: k3-j784s4-j742s2-mcu-wakeup:
 Remove parent nodes bootph-*
To: Manorit Chawdhry <m-chawdhry@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Neha Malcom Francis <n-francis@ti.com>,
        Udit
 Kumar <u-kumar1@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
        Siddharth Vadapalli
	<s-vadapalli@ti.com>, Andrew Davis <afd@ti.com>
References: <20241023-b4-upstream-bootph-all-v5-0-a974d06370ab@ti.com>
 <20241023-b4-upstream-bootph-all-v5-2-a974d06370ab@ti.com>
Content-Language: en-US
From: Aniket Limaye <a-limaye@ti.com>
In-Reply-To: <20241023-b4-upstream-bootph-all-v5-2-a974d06370ab@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_083905_301955_9EF7B3BC 
X-CRM114-Status: GOOD (  14.38  )
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



On 23/10/24 12:27, Manorit Chawdhry wrote:
> Adding bootph properties on leaf nodes imply that they are applicable to
> the parent nodes as well. Bootloaders can derive the parent nodes when
> bootph is available in the leaf nodes.
> 
> Remove the bootph-* properties from parent nodes as they are redundant.
> 
> Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>

Reviewed-by: Aniket Limaye <a-limaye@ti.com>

> ---
> 
> Notes:
>      It wasn't existing previously in U-boot but the following patch fixes it [0]
>      
>      [0]: https://lore.kernel.org/u-boot/20231217163627.2339802-10-sjg@chromium.org/
> 
>   arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi
> index 9899da73a905..46bc2a3e4aea 100644
> --- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi
> @@ -7,7 +7,6 @@
>   
>   &cbass_mcu_wakeup {
>   	sms: system-controller@44083000 {
> -		bootph-all;
>   		compatible = "ti,k2g-sci";
>   		ti,host-id = <12>;
>   
> @@ -39,7 +38,6 @@ k3_reset: reset-controller {
>   	};
>   
>   	wkup_conf: bus@43000000 {
> -		bootph-all;
>   		compatible = "simple-bus";
>   		#address-cells = <1>;
>   		#size-cells = <1>;
> @@ -458,7 +456,6 @@ mcu_spi2: spi@40320000 {
>   	};
>   
>   	mcu_navss: bus@28380000 {
> -		bootph-all;
>   		compatible = "simple-bus";
>   		#address-cells = <2>;
>   		#size-cells = <2>;
> 

