Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506A6C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 19:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=45b7+iFHqq41vN2poZPExRuxtRpUIdHR17dsbMnjiIQ=; b=zJWl0yd3e8qBSRSiMnI6PXVTmV
	5pshDciRh2wehXeS2faEZNg/5ZYWTvjuoS1xu9pWhiBQPytr2wvuhmCxjpNw/bJJg6AxaJUIC5rGo
	CTXQ9iiO2x+/c40iPsgIMBZbgd/FNsllyq5AnXdTKD2ZUylxedQmOOO1OifGVMpPmBfLzhIhZnKv0
	PEaaYalGUCEd5bcUaK24wnQresZeSpNBcYGmwyLNouoInUu6RMbH8ga72NSdms8C+oTQMYqjFOP1v
	7DIjMpcwOAjD53ntOCh7O6fhmHJyquEb4gda0j+pZG1N4KIb+BR1Duwad0U4kq/2kowepvujtIWsD
	PaUPvM2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugpyI-0000000HYQM-3OIl;
	Tue, 29 Jul 2025 19:26:46 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugpvn-0000000HYJC-149R;
	Tue, 29 Jul 2025 19:24:15 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1753817048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=45b7+iFHqq41vN2poZPExRuxtRpUIdHR17dsbMnjiIQ=;
	b=A0BCxyrnYyclR+WVu3Wj43vGJTqP0k11ahIrdKi5DyWe4f+5DjKoxKPijRoi+LlX7ZI3yr
	CG6/zPkzOmq4O2kjcihAop6JTDB64bDn/rm4zYVZfs07ceOTgBmI65qhNWEjBLe5tp+KYB
	6g1cjW8wPVvZfWuvtfNPYMJYryln3+dV2+4v9WVc00v6tzY0pi1jAhPjBr1yNtliUazcDb
	kOwjIwvdqEodc+4CDb2qeVYwoKastrAmMEjUElS142nXc053pjZPhO8xROckBWvUuzoVJj
	6ECRDcFe/BInJPA/Jkgm/HNxgy0Lt5G8yO8h+y5gpeab+NPFni8MyUJw4wZGwg==
Date: Tue, 29 Jul 2025 21:24:08 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Geert
 Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: Pinebook Pro: Update WiFi
In-Reply-To: <6948463c8ca90bd9c72fb34178ddb029@manjaro.org>
References: <20250729185827.144547-1-pbrobinson@gmail.com>
 <6948463c8ca90bd9c72fb34178ddb029@manjaro.org>
Message-ID: <5c3a62a678f6d86e81913700c05e0286@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_122411_637907_6764D705 
X-CRM114-Status: GOOD (  17.35  )
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

On 2025-07-29 21:10, Dragan Simic wrote:
> Hello Peter,

Sorry, somehow I managed to forget suggesting that the patch
summary should be made a bit more self-descriptive.  At the same
time, including "Pinebook Pro:" as one of the summary prefixes
isn't common, so perhaps this would be a good candidate for the
revised patch summary:

   arm64: dts: rockchip: Describe WiFi wake-up pin for the Pinebook Pro

Obviously, this applies to your PinePhone Pro patch [1] as well.
As a nitpick, please note that the second "p" in "PinePhone" is
actually an uppercase "P".

[1] 
https://lore.kernel.org/linux-rockchip/20250729190712.145817-1-pbrobinson@gmail.com/T/#u

> On 2025-07-29 20:58, Peter Robinson wrote:
>> Update the WiFi configuration to include the wake-up
>> pin and add an ethernet alias to allow assignment of
>> a mac-address from the firmware.
>> 
>> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
>> ---
>>  .../boot/dts/rockchip/rk3399-pinebook-pro.dts | 19 
>> +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
>> b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
>> index 5a8551d9ffe47..05c48cb09df6f 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
>> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
>> @@ -19,6 +19,7 @@ / {
>>  	chassis-type = "laptop";
>> 
>>  	aliases {
>> +		ethernet0 = &brcmf;
> 
> I'm sorry, but this alias isn't acceptable.  In a few words, this
> simply isn't an Ethernet interface.
> 
> We're already stretching a bit the dynamic nature of, well, everything
> with the aliases in the Rockchip DT files, and an alias like this one
> would be stretching the whole thing beyond the breaking point.
> 
>>  		mmc0 = &sdio0;
>>  		mmc1 = &sdmmc;
>>  		mmc2 = &sdhci;
>> @@ -883,6 +884,12 @@ vcc5v0_host_en_pin: vcc5v0-host-en-pin {
>>  		};
>>  	};
>> 
>> +	wifi {
>> +		wifi_host_wake_l: wifi-host-wake-l {
>> +			rockchip,pins = <0 RK_PA3 RK_FUNC_GPIO &pcfg_pull_none>;
>> +		};
>> +	};
>> +
>>  	wireless-bluetooth {
>>  		bt_wake_pin: bt-wake-pin {
>>  			rockchip,pins = <2 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>;
>> @@ -940,7 +947,19 @@ &sdio0 {
>>  	pinctrl-names = "default";
>>  	pinctrl-0 = <&sdio0_bus4 &sdio0_cmd &sdio0_clk>;
>>  	sd-uhs-sdr104;
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>>  	status = "okay";
>> +
>> +	brcmf: wifi@1 {
>> +		reg = <1>;
>> +		compatible = "brcm,bcm4329-fmac";
>> +		interrupt-parent = <&gpio0>;
>> +		interrupts = <RK_PA3 IRQ_TYPE_LEVEL_HIGH>;
>> +		interrupt-names = "host-wake";
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&wifi_host_wake_l>;
>> +	};
>>  };
>> 
>>  &sdhci {

