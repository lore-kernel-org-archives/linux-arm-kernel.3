Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D752CF5580B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 11:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mjWQjP4IRSB5Wy14EhVD3hIP7KLN2LrKYzsuKbIxCnc=; b=m245xaRj0JGcYU/hv2tAUEkbUQ
	TB1OnmH5jzqqe7ttJJmCh0qddu6LhnWXofySCdMXj1paG7DqVZWp2m5KVNURJW6raxeaL5vwfbm7e
	T48+V+jNU0JGz7CeNRNBalG+9KGfH6T6J8QgDXC2gaKPWppHCoGZs3Ucz8RiI8Q5cCnBIzMZ7d1IJ
	J8qbrfEOCsOV0NLMxprN5NCpYxl3JW7hu08SDyyIResNilVXpUnG6e3TMlPBHyhIAfXAGMplmjphV
	nfv/j0ihWeoQnNwB5IKTcOFely9IYdafV56iHYKzrZSBikl7/N4lUy84gzpCYHpypCCwLuKg+UBES
	veUxJ9kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEmMj-00000006lBg-1iUV;
	Mon, 20 Apr 2026 11:00:33 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEmMg-00000006lB6-2o1o;
	Mon, 20 Apr 2026 11:00:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776682826;
	bh=PLPNmgPAxeK5mYLQnnUXuoPE4aCHhmjsyDeuAgufwss=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K0CY6tvZ839+ED5+JnvY8glBhKFO790KScWfvsNhZDE9pe4jF7PrB2Kic+moM9ZW3
	 BIMal4m2vnG6ohpyr2fQrSFew483858a5b26SmlEuJbPp8jlIBh/QdXrFNXi3g0oDj
	 kaJVEkPIdbGwNncdTi+RkrpomJ7ry+gwM7tTMx9SXcwFkTkzzH+boQ1JaWTRz0C2W2
	 dnmU7FH1m8muVP55ogcfnrHSzuaqVwNda+qefEMeGqYVIovbCSnv0q5ZFz8qr152qg
	 RXiseB/qzTH0cnFahf7JzeZ5WxXvPCJuXEiQs0d2OiOa7s1ayeC3o0y90v0ZCWapkC
	 4V3yepyJhcRCg==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1CAE617E1388;
	Mon, 20 Apr 2026 13:00:26 +0200 (CEST)
Message-ID: <401a020f-ca5d-4c7d-941e-f0288e144357@collabora.com>
Date: Mon, 20 Apr 2026 14:00:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3576-luckfox-core3576
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
 <2000470.6tgchFWduM@phil>
 <62f51359-9d91-4107-917b-cd722c7321c2@collabora.com>
 <2282688.C4sosBPzcN@phil>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <2282688.C4sosBPzcN@phil>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_040030_858746_E34BCE81 
X-CRM114-Status: GOOD (  26.33  )
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

Hi Heiko,

On 4/18/26 2:12 AM, Heiko Stuebner wrote:
> Hi Cristian,
> 
> Am Freitag, 17. April 2026, 18:34:17 Mitteleuropäische Sommerzeit schrieb Cristian Ciocaltea:
>> On 4/17/26 2:32 PM, Heiko Stuebner wrote:
>>> the comments below apply sort of to all patches in that series.
>>>
>>> Am Freitag, 17. April 2026, 11:24:39 Mitteleuropäische Sommerzeit schrieb Cristian Ciocaltea:
>>>> The board exposes the GPIO4_C6 line to control the voltage bias on the
>>>> HDMI data lines.  It must be asserted when operating in HDMI 2.1 FRL
>>>> mode and deasserted for HDMI 1.4/2.0 TMDS mode.
>>>>
>>>> Wire up the HDMI node to the GPIO line using the frl-enable-gpios
>>>> property and drop the line from the vcc_5v0_hdmi regulator to allow
>>>> adjusting the bias when transitioning between TMDS and FRL operating
>>>> modes.

[...]

>>>
>>>
>>>> @@ -231,6 +228,8 @@ &gpu {
>>>>  };
>>>>  
>>>>  &hdmi {
>>>> +	pinctrl-0 = <&hdmi_txm0_pins &hdmi_tx_scl &hdmi_tx_sda &hdmi_frl_en>;
>>>> +	frl-enable-gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_LOW>;
>>>
>>> this should be sorted the other way around I think.
>>>
>>> Also please provide a pinctrl-names property too. If for whatever reason
>>> the dw-hdmi aquires a 2nd pinctrl state in the future, this makes sure
>>> board DTs are staying in the "old" compatible mode until they are adapted.
>>
>> Just to make sure I fully understand, the convention is that 
>>
>>   pinctrl-names = "default";
>>
>> should be always provided, even when the node overrides an existing pinctrl-0
>> property?
>>
>> E.g. in rk3576.dtsi we have:
>>
>>   hdmi: hdmi@27da0000 {
>>     ...
>>     pinctrl-names = "default";
>>     pinctrl-0 = <&hdmi_txm0_pins &hdmi_tx_scl &hdmi_tx_sda>;
>>     ...
>>   }
>>
>> Hence I omitted pinctrl-names which doesn't change and just appended
>> &hdmi_frl_en to pinctrl-0's original value.
> 
> correct, please always provide a pinctrl-names entry when setting a new
> pinctrl-0 .
> 
> The background is, imagine you have a base:
> 
> pinctrl-names = "default";
> pinstrl-0 = <....>;
> 
> and override pinctrl-0 in a board.
> 
> Now a newer binding introduces a 2nd pinctrl state "foo". Of course
> we're backwards compatible, and both are valid and the driver checks
> what states are defined.
> 
> So the base sets:
> pinctrl-names = "default", "foo";
> pinctrl-0 = <...>;
> pinctrl-1 = <...>;
> 
> in your (old) board you override pinctrl-0, but the driver still sees
> the new variant with 2 pinctrl states, where it should've stayed with
> the legacy 1-state, until the board-dts might get adapted in the future.
> 
> 
> And I know, we're likely not doing that everywhere, and also in most
> cases it won't really matter, but still it is safer and sets the better
> precedent :-) .

Thanks for the detailed explanation, that clears things up!

There are several other nodes (e.g. i2c, pwm, uart) that also lack
pinctrl-names despite providing pinctrl-0 - I can address those in a
separate patch.

I also noticed an inconsistency in property ordering: some nodes place
pinctrl-names before pinctrl-<n> and others after.  I have always used
the former, but we should probably prefer the latter to stay consistent
with how clocks, resets, phys, etc. are ordered.

Thoughts?

> 
>>>>  	status = "okay";
>>>>  };
>>>>  
>>>> @@ -655,7 +654,7 @@ &pcie0 {
>>>>  
>>>>  &pinctrl {
>>>>  	hdmi {
>>>> -		hdmi_con_en: hdmi-con-en {
>>>> +		hdmi_frl_en: hdmi-frl-en {
>>>
>>> pinctrl names should ideally match the naming in schematics, for example the
>>> "HDMI0_TX_ON_H" for jaguar and tiger. This makes it way easier to> go from DT
>>> to schematics and back.
>>
>> I opted for a more descriptive name that could be used consistently across all
>> boards, given that not all schematics are publicly available.
>>
>> You make a fair point though, we should probably stick with the pretty terrible
>> hdmi[N]_tx_on_h naming instead.
> 
> yep, we're doing that everywhere else already too, and sticking to the
> schematics naming, also prevents any discussions about how something
> should be named ;-) .

Indeed. :)

