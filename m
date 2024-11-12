Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D73D42B85
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 14:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p37w8dh3AMk4B0TEeIgVCn6S2A3tTzg9OwNCj8TrimU=; b=L5ThYDEBxgbyyTDZJljioNl1Ly
	aGS2AztgfEeSMLxlLbcABsTXrJ58yZF0iY7IVrbrDh5JuwRXxHuCYg28EbQWgS/nI9enQkf67U50Z
	IEcsSaXtnSzCxGT1Z7VtVD5AVPbnG5125HbmDA1ocg9ToHviwUL53QIAsF3YSp2hwnx1UjczHBLtX
	j4vnrNkmrnwMu20i2AtDMaUNPnCmhcagttMym7XlbLpAOdaw5UWzZQRMRZqKPwQcTHrrGDi0uWW+B
	fPnOcNsNWrz+mkf4FHWPZ+a5BWUBMbldDd9Hd26/QfVww4br6hWkFz6tE+O0XSgIQzWn/75Zpisnp
	ZAQEvPwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAs8t-00000003o0V-3yIr;
	Tue, 12 Nov 2024 14:45:19 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAs0b-00000003mDF-3Jyf;
	Tue, 12 Nov 2024 14:36:47 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1731422201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p37w8dh3AMk4B0TEeIgVCn6S2A3tTzg9OwNCj8TrimU=;
	b=lP18VSUS81kGud5E6Mo8dEoe3wl9IDmvKcYolW5MJc+ognXnrJbr2X5ZJrLK61keBEf/Qv
	BMvVCYQyO58cp9HOood0JjU5p+M/v07hV23stEhkpiMCrWl5+Bp8RI7tTDt65dHWT/uvhG
	vcRg0UEBFgqY/ZeFkHQw9YiLIJu3kE9mei8zrGnLpeJ7zriziE96+9jCqble2bIvhimMD3
	v7SGJ/2oWxlON6KBN6pO28uws0dpOGxmYEAfNYq0WSXXNri5aEQj9wFSNVwGXiOSLe+pF7
	IGSAlw/bML6RAgQNCt1eGvz23sLb4m+S+9f/xRgGi/DNHLSwzOt2os4vweQpdQ==
Date: Tue, 12 Nov 2024 15:36:41 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: linux-rockchip@lists.infradead.org, heiko@sntech.de,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Fix vdd_gpu voltage constraints on
 PinePhone Pro
In-Reply-To: <607a731c-41e9-497a-a08c-f718339610ae@arm.com>
References: <0718feb8e95344a0b615f61e6d909f6e105e3bf9.1731264205.git.dsimic@manjaro.org>
 <607a731c-41e9-497a-a08c-f718339610ae@arm.com>
Message-ID: <fdf58f3e9fcb4c672a4bb114fbdab60d@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_063646_153487_E7E81B1B 
X-CRM114-Status: GOOD (  26.03  )
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

Hello Robin,

On 2024-11-12 15:19, Robin Murphy wrote:
> On 10/11/2024 6:44 pm, Dragan Simic wrote:
>> The regulator-{min,max}-microvolt values for the vdd_gpu regulator in 
>> the
>> PinePhone Pro device dts file are too restrictive, which prevents the 
>> highest
>> GPU OPP from being used, slowing the GPU down unnecessarily.  Let's 
>> fix that
>> by making the regulator-{min,max}-microvolt values less strict, using 
>> the
>> voltage range that the Silergy SYR838 chip used for the vdd_gpu 
>> regulator is
>> actually capable of producing. [1][2]
> 
> Specifying the absolute limits which the regulator driver necessarily
> already knows doesn't seem particularly useful... Moreover, the RK3399
> datasheet specifies the operating range for GPU_VDD as 0.80-1.20V, so
> at the very least, allowing the regulator to go outside that range
> seems inadvisable.

Indeed, which is why I already mentioned in the patch description
that I do plan to update the constraints of all regulators to match
the summary of the constraints of their consumers.  Though, I plan
to do that later, as a separate directory-wide cleanup, for which
I must find and allocate a substantial amount of time, to make sure
there will be no mistakes.

> However there's a separate datasheet for the
> RK3399-T variant, which does specify this 875-975mV range and a
> maximum GPU clock of 600MHz, along with the same 1.5GHz max.
> Cortex-A72 clock as advertised for RK3399S, so it seems quite possible
> that these GPU constraints here are in fact intentional as well.
> Obviously users are free to overclock and overvolt if they wish - I do
> for my actively-cooled RK3399 board :) - but it's a different matter
> for mainline to force it upon them.

Well, maybe the RK3399S is the same in that regard as the RK3399-T,
but maybe it actually isn't -- unfortunately, we don't have some
official RK3399S datasheet that would provide us with the required
information.  As another, somewhat unrelated example, we don't have
some official documentation to tell us is the RK3399S supposed not
to have working PCI Express interface, which officially isn't present
in the RK3399-T variant.

However, I fully agree that forcing any kind of an overclock is not
what we want to do.  Thus, I'll do my best, as I already noted in this
thread, to extract the dtb from the "reference" Android build that
Rockchip itself provided for the RK3399S-based PinePhone Pro.  That's
closest to the official documentation for the RK3399S variant that we
can get our hands on.

>> This also eliminates the following error messages from the kernel log:
>> 
>>    core: _opp_supported_by_regulators: OPP minuV: 1100000 maxuV: 
>> 1150000, not supported by regulator
>>    panfrost ff9a0000.gpu: _opp_add: OPP not supported by regulators 
>> (800000000)
>> 
>> These changes to the regulator-{min,max}-microvolt values make the 
>> PinePhone
>> Pro device dts consistent with the dts files for other Rockchip 
>> RK3399-based
>> boards and devices.  It's possible to be more strict here, by 
>> specifying the
>> regulator-{min,max}-microvolt values that don't go outside of what the 
>> GPU
>> actually may use, as the consumer of the vdd_gpu regulator, but those 
>> changes
>> are left for a later directory-wide regulator cleanup.
>> 
>> [1] 
>> https://files.pine64.org/doc/PinePhonePro/PinephonePro-Schematic-V1.0-20211127.pdf
>> [2] 
>> https://www.t-firefly.com/download/Firefly-RK3399/docs/Chip%20Specifications/DC-DC_SYR837_838.pdf
>> 
>> Fixes: 78a21c7d5952 ("arm64: dts: rockchip: Add initial support for 
>> Pine64 PinePhone Pro")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Dragan Simic <dsimic@manjaro.org>
>> ---
>>   arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts 
>> b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
>> index 1a44582a49fb..956d64f5b271 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
>> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
>> @@ -410,8 +410,8 @@ vdd_gpu: regulator@41 {
>>   		pinctrl-names = "default";
>>   		pinctrl-0 = <&vsel2_pin>;
>>   		regulator-name = "vdd_gpu";
>> -		regulator-min-microvolt = <875000>;
>> -		regulator-max-microvolt = <975000>;
>> +		regulator-min-microvolt = <712500>;
>> +		regulator-max-microvolt = <1500000>;
>>   		regulator-ramp-delay = <1000>;
>>   		regulator-always-on;
>>   		regulator-boot-on;

