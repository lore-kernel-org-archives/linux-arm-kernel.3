Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84406D29FF8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 12:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9rjIaF5fJ8UoaWfhIhoBLfz3F/qzdEKOA9hJH/g1xSA=; b=HxyHen7TZDoYOBPtTgKcW+Z+Jd
	tSZyQDDPTpxR/R9G7v2rW2Fwz4Nv2r3OaN5Cfd2e5bExXFfTJ95sIc7pUO62nDut6V12wW5NOaZ9X
	+/xT3NxJN5gBBF41HL8rMCrzwJo3n1LDhGBkyVnHFZNJTEPj4tANAWnfvXCQQ1dBW6Wnm6YMNf8Mg
	xq6Q2IDcYc//mp7EUlE+XiRYEOWG4Ae/cjuc4tuJUn3nu7GqanIqg2gDlPBHox4BoK1CSYQ/9PafP
	0dzzHLgTbjkEH3A3MKOS+td9Tw1AKT0hu0ClS/z2xxVY8o2eIIInKyLYYkD5BGFzdKRDTsdzr05oO
	uFwHaBqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg0FY-00000009DxE-3He6;
	Wed, 14 Jan 2026 12:45:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg0FU-00000009DvK-0wH9;
	Wed, 14 Jan 2026 12:45:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10B0C1515;
	Wed, 14 Jan 2026 04:45:09 -0800 (PST)
Received: from [10.57.50.170] (unknown [10.57.50.170])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 482E43F632;
	Wed, 14 Jan 2026 04:45:14 -0800 (PST)
Message-ID: <abf8a1cd-488f-43d7-80f1-37ba8917b17b@arm.com>
Date: Wed, 14 Jan 2026 12:45:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: Move RK3399 eDP pinctrl to
 boards
To: Dragan Simic <dsimic@manjaro.org>
Cc: heiko@sntech.de, neil.armstrong@linaro.org, dianders@chromium.org,
 thierry.reding@gmail.com, sam@ravnborg.org, jesszhan0024@gmail.com,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <cover.1767111804.git.robin.murphy@arm.com>
 <0b9488badb467ef83a0a464eeea921f59e32e6b0.1767111809.git.robin.murphy@arm.com>
 <81fcd769-d7a5-e909-7105-23cd3d09e473@manjaro.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <81fcd769-d7a5-e909-7105-23cd3d09e473@manjaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_044522_797544_5E7C3E10 
X-CRM114-Status: GOOD (  17.77  )
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

On 2026-01-14 11:49 am, Dragan Simic wrote:
> Hello Robin,
> 
> On Tuesday, December 30, 2025 18:20 CET, Robin Murphy <robin.murphy@arm.com> wrote:
>> The EDP_HOTPLUG pin is optional, and muxed with other functions (notably
>> HDMI CEC), so move its selection from the SoC DTSI to the boards which
>> apparently want it, namely those which enable eDP without "force-hpd".
>> By the same token we drop it from Pinebook Pro, which already uses
>> "force-hpd", and according to the schematics does not have the pin wired
>> at all.
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> ---
>>   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi              | 2 --
>>   arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi    | 2 ++
>>   arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts       | 2 --
>>   arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts | 2 ++
>>   4 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
>> index 4dcceb9136b7..19a312baa9f1 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
>> @@ -2145,8 +2145,6 @@ edp: dp@ff970000 {
>>   		interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH 0>;
>>   		clocks = <&cru PCLK_EDP>, <&cru PCLK_EDP_CTRL>, <&cru PCLK_VIO_GRF>;
>>   		clock-names = "dp", "pclk", "grf";
>> -		pinctrl-names = "default";
>> -		pinctrl-0 = <&edp_hpd>;
>>   		power-domains = <&power RK3399_PD_EDP>;
>>   		resets = <&cru SRST_P_EDP_CTRL>;
>>   		reset-names = "dp";
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi
>> index 9d07353df52c..3f3cb0eb5809 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi
>> @@ -241,6 +241,8 @@ &dmc {
>>   };
>>   
>>   &edp {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&edp_hpd>;
>>   	status = "okay";
>>   
>>   	/*
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
>> index eaaca08a7601..dcab04863d28 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
>> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
>> @@ -401,8 +401,6 @@ &cpu_l3 {
>>   
>>   &edp {
>>   	force-hpd;
>> -	pinctrl-names = "default";
>> -	pinctrl-0 = <&edp_hpd>;
>>   	status = "okay";
>>   };
>>   
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts b/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts
>> index a4ceafe6dd7a..80d6ea0eda84 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts
>> +++ b/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts
>> @@ -141,6 +141,8 @@ sdio_pwrseq: sdio-pwrseq {
>>   };
>>   
>>   &edp {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&edp_hpd>;
>>   	status = "okay";
>>   };
> 
> Thanks for this patch!  These changes are looking good to me, and the
> board dts files changed in this patch are the right ones, i.e. those that
> enable the "edp" node without specifying the "force-hpd" property.
> 
> Additionally,"/omit-if-no-ref/" should be added to the "edp" pinctrl node
> in rk3399-base.dtsi, to not include the "edp_hpd" pinctrl definition in
> the board dtb files where that actuually isn't used.

Ah, indeed - I can't think of a realistic good reason for the pinctrl to 
only be selected by an overlay rather than the base board, and even if 
anyone did conjure up some such crazy modular system, they could always 
change it back. Good thing I got distracted and didn't get round to 
sending v2 last night :)

> With the note above addressed, please feel free to include
> 
> Reviewed-by: Dragan Simic <dsimic@manjaro.org>

Thanks!

Robin.


