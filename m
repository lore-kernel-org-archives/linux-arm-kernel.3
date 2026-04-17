Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C44D1F4368C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 16:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uD+0YX5YKLPbss9Rmx/h2mpFML+OosqFSQdVBsWDicI=; b=BayEw9XwFzARu1+rWxXCLcE3K+
	Jv1ow02S7AI1QY2m/IHRyG06wiIMNNgolJcAaYkJsw3GU9EgRteLVZ+YvSBYlNtoYwMgghnf+oHR4
	DV2vbSVnhvIAR+d8MYZlg2jA5S7CES1XaFYkFWPXbJHXoizLRyvIfxr5m6kKAGiGiuWztU2th/iIv
	TR/I1OPtX0oce7rIO526UXUv1/dDeDd1mmpmgGQPpPXqF4UMIiPXEQGKRfPugpTUQ+QO3+Z3jzcK0
	f00QY20en3ys/nNeboD7gN4z0YXC4tjfeyLoVy02QTNG1A1CY9QdRSsHT2f+OKai9AE2L+17/HFTj
	2HZwFQyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDm9C-00000004Gdd-3YTU;
	Fri, 17 Apr 2026 16:34:26 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDm98-00000004Gcc-16XS;
	Fri, 17 Apr 2026 16:34:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776443658;
	bh=g4lO6rW3zr2fdZujOWSFg/NCpM1f2D3pE6jpFlC8CCU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I4chTyUmARiCkAr8wAFIH6QrsG06odlCvgC9ew0ysyOYaBoBNeF4h2hi3EPiHgj2d
	 h0S1z1pVk33KxZZ5bQmbi7wDKw49dHifiBD0eKTZijhNZofq+IsgZAQ866QEfLEs5/
	 rAgFTBkDO74HFToE20td/XX5qDqfEdROD6lkl1d8RUYVzdGmOu96Mjp4szcXzCRYds
	 5c3pWvNFxcvA/lNfV5/V0NkKehYKxZRWUYz0k6qsfbX1t4jA/5/AuEd8zXqQLDub5j
	 2L2/GYTAfEzNG26ITUgJOMQ/mzapqsVDX67xPWde4PfXYezDFQcnJ6vq6VQlCwi5Yq
	 YufoG8GVwzHCQ==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EE40617E127F;
	Fri, 17 Apr 2026 18:34:17 +0200 (CEST)
Message-ID: <62f51359-9d91-4107-917b-cd722c7321c2@collabora.com>
Date: Fri, 17 Apr 2026 19:34:17 +0300
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
 <20260417-dts-rk-frl-enable-gpios-v1-5-a19c0dd8c9f6@collabora.com>
 <2000470.6tgchFWduM@phil>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <2000470.6tgchFWduM@phil>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_093423_301016_96847CB2 
X-CRM114-Status: GOOD (  24.90  )
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

On 4/17/26 2:32 PM, Heiko Stuebner wrote:
> Hi Cristian,
> 
> the comments below apply sort of to all patches in that series.
> 
> Am Freitag, 17. April 2026, 11:24:39 Mitteleuropäische Sommerzeit schrieb Cristian Ciocaltea:
>> The board exposes the GPIO4_C6 line to control the voltage bias on the
>> HDMI data lines.  It must be asserted when operating in HDMI 2.1 FRL
>> mode and deasserted for HDMI 1.4/2.0 TMDS mode.
>>
>> Wire up the HDMI node to the GPIO line using the frl-enable-gpios
>> property and drop the line from the vcc_5v0_hdmi regulator to allow
>> adjusting the bias when transitioning between TMDS and FRL operating
>> modes.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi | 9 ++++-----
>>  1 file changed, 4 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi
>> index 749f0a54b478..93ae37699366 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi
>> @@ -140,10 +140,7 @@ regulator-state-mem {
>>  
>>  	vcc_5v0_hdmi: regulator-vcc-5v0-hdmi {
>>  		compatible = "regulator-fixed";
>> -		enable-active-high;
>> -		gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;
>> -		pinctrl-names = "default";
>> -		pinctrl-0 = <&hdmi_con_en>;
>> +		regulator-always-on;
>>  		regulator-min-microvolt = <5000000>;
>>  		regulator-max-microvolt = <5000000>;
>>  		regulator-name = "vcc_5v0_hdmi";
> 
> I think this regulator was sort of a complete hack, to set that
> gpio to some sort of default state, by declaring it as hdmi-pwr-supply.
> 
> Only 2 rk3576 boards seem, to use that hack, so I think as that "regulator"
> is completely functionless now, the whole thing could be removed?

Ack, let's just drop it.

> 
> 
>> @@ -231,6 +228,8 @@ &gpu {
>>  };
>>  
>>  &hdmi {
>> +	pinctrl-0 = <&hdmi_txm0_pins &hdmi_tx_scl &hdmi_tx_sda &hdmi_frl_en>;
>> +	frl-enable-gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_LOW>;
> 
> this should be sorted the other way around I think.
> 
> Also please provide a pinctrl-names property too. If for whatever reason
> the dw-hdmi aquires a 2nd pinctrl state in the future, this makes sure
> board DTs are staying in the "old" compatible mode until they are adapted.

Just to make sure I fully understand, the convention is that 

  pinctrl-names = "default";

should be always provided, even when the node overrides an existing pinctrl-0
property?

E.g. in rk3576.dtsi we have:

  hdmi: hdmi@27da0000 {
    ...
    pinctrl-names = "default";
    pinctrl-0 = <&hdmi_txm0_pins &hdmi_tx_scl &hdmi_tx_sda>;
    ...
  }

Hence I omitted pinctrl-names which doesn't change and just appended
&hdmi_frl_en to pinctrl-0's original value.

> 
> 
>>  	status = "okay";
>>  };
>>  
>> @@ -655,7 +654,7 @@ &pcie0 {
>>  
>>  &pinctrl {
>>  	hdmi {
>> -		hdmi_con_en: hdmi-con-en {
>> +		hdmi_frl_en: hdmi-frl-en {
> 
> pinctrl names should ideally match the naming in schematics, for example the
> "HDMI0_TX_ON_H" for jaguar and tiger. This makes it way easier to> go from DT
> to schematics and back.

I opted for a more descriptive name that could be used consistently across all
boards, given that not all schematics are publicly available.

You make a fair point though, we should probably stick with the pretty terrible
hdmi[N]_tx_on_h naming instead.

Thanks,
Cristian

