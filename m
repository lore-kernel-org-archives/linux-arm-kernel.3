Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E869CFA44E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 16:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oAT6kcbQRB/ZOWWrGAXO0TKYP/bnChnk4e/I5SIxR4k=; b=iYm8+3JXcL4s9gSkJob8T02wxp
	dUxWylg2j42ETkGVaKkew7HnOuJA654pnskY8lw24Irfj4qbg13a53ImD2fwnv+8ACyhxN6HSV+Ng
	uicQgOcxp0G4oQl2Toy34Q30UBraPg2ky3bQh/BMN3RulHOh6RzaPUAnOUBqA6+cD4Uipc7k8hj7x
	z9ZEDgMgz1IhZz0+Zto+GBywoL5UajwyfXV1f1GAZ2lngAJ6y+Bmt/7KDrIBDelB1Rg7mxIjJ/WEZ
	FcfOBddHn6o+L3NvbFndehzO+86uOae3+5+AmWJAu6YAYqNEpbQpgDglJ1UYg/fLiejCR/CD+y1vn
	ke6Qg+0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3e08-0000000F6DQ-39aM;
	Wed, 23 Oct 2024 16:14:24 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3dEy-0000000Ex42-3ZDu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 15:25:43 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49NFPasY040420;
	Wed, 23 Oct 2024 10:25:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729697136;
	bh=oAT6kcbQRB/ZOWWrGAXO0TKYP/bnChnk4e/I5SIxR4k=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=tLf2YT/nvbiZwuxM6OF8iFUIB86Vklfapfch8+Q8Lh3NdyrH0pvWCdidJeEcMAIsm
	 GpxN/MLJE6RZVuvoUowZyLxAtMYr1Fu/4Tgofs6gYayld6oQp+nlg3AulKsepb+fGz
	 JNiMUjLNhH16qph+1PoupAugB9V6tO3H4Dw8TfKg=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49NFPahc019136
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Oct 2024 10:25:36 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 23
 Oct 2024 10:25:35 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 23 Oct 2024 10:25:35 -0500
Received: from [172.24.227.91] (psdkl-workstation0.dhcp.ti.com [172.24.227.91])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49NFPVbN087980;
	Wed, 23 Oct 2024 10:25:31 -0500
Message-ID: <a0452ef6-6c79-4eb8-8b25-0857978bbf94@ti.com>
Date: Wed, 23 Oct 2024 20:55:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/12] arm64: dts: ti: k3-j784s4-j742s2-evm-common:
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
 <20241023-b4-upstream-bootph-all-v5-7-a974d06370ab@ti.com>
Content-Language: en-US
From: Aniket Limaye <a-limaye@ti.com>
In-Reply-To: <20241023-b4-upstream-bootph-all-v5-7-a974d06370ab@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_082541_048945_EEB60E4D 
X-CRM114-Status: GOOD (  13.11  )
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
>   arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi | 9 ---------
>   1 file changed, 9 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
> index 98453171a179..b2e2b9f507a9 100644
> --- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
> @@ -305,7 +305,6 @@ &wkup_gpio0 {
>   };
>   
>   &main_pmx0 {
> -	bootph-all;
>   	main_cpsw2g_default_pins: main-cpsw2g-default-pins {
>   		pinctrl-single,pins = <
>   			J784S4_IOPAD(0x0b8, PIN_INPUT, 6) /* (AC34) MCASP1_ACLKX.RGMII1_RD0 */
> @@ -432,7 +431,6 @@ J784S4_IOPAD(0x078, PIN_OUTPUT, 1) /* (AH37) MCAN2_RX.AUDIO_EXT_REFCLK1 */
>   };
>   
>   &wkup_pmx2 {
> -	bootph-all;
>   	wkup_uart0_pins_default: wkup-uart0-default-pins {
>   		bootph-all;
>   		pinctrl-single,pins = <
> @@ -548,7 +546,6 @@ J784S4_WKUP_IOPAD(0x028, PIN_INPUT, 7)
>   };
>   
>   &wkup_pmx0 {
> -	bootph-all;
>   	mcu_fss0_ospi0_pins_default: mcu-fss0-ospi0-default-pins {
>   		bootph-all;
>   		pinctrl-single,pins = <
> @@ -568,7 +565,6 @@ J784S4_WKUP_IOPAD(0x008, PIN_INPUT, 0) /* (C34) MCU_OSPI0_DQS */
>   };
>   
>   &wkup_pmx1 {
> -	bootph-all;
>   	mcu_fss0_ospi0_1_pins_default: mcu-fss0-ospi0-1-default-pins {
>   		bootph-all;
>   		pinctrl-single,pins = <
> @@ -740,18 +736,15 @@ &ufs_wrapper {
>   };
>   
>   &fss {
> -	bootph-all;
>   	status = "okay";
>   };
>   
>   &ospi0 {
> -	bootph-all;
>   	status = "okay";
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&mcu_fss0_ospi0_pins_default>, <&mcu_fss0_ospi0_1_pins_default>;
>   
>   	flash@0 {
> -		bootph-all;
>   		compatible = "jedec,spi-nor";
>   		reg = <0x0>;
>   		spi-tx-bus-width = <8>;
> @@ -808,13 +801,11 @@ partition@3fc0000 {
>   };
>   
>   &ospi1 {
> -	bootph-all;
>   	status = "okay";
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&mcu_fss0_ospi1_pins_default>;
>   
>   	flash@0 {
> -		bootph-all;
>   		compatible = "jedec,spi-nor";
>   		reg = <0x0>;
>   		spi-tx-bus-width = <1>;
> 

