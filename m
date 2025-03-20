Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BE6C36001
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 07:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jgNRTxN5DNgWvkI1l3S2gHA3Bcn02lDWsE+uKc1f9W8=; b=TFMLf+TZPHzW0BBZNbEeXrmS+t
	UaYDHKKdzbe6jzen4ecK0zDc6D7+GfqZkT4YFGkcHNBveEWmDkZ9hb/bA4fX4ha0oiBiLVOHK5Vl6
	sX5fxek7c4T2Bu4V4r3xiPWO2vaau3UheKFk7JScH/BBpcdMhOzzPmsCoCfEEMs/cHvxFV6/0cBsL
	dWiX/IjIRMqW3LZoLwA7Uw9uZGGPgblqQLXDV9V5hj+RWo6ZzcleObIVWNjfrxzny0QvY377auzwG
	y5SiaWTeU/3+azOvGJTR+dH/hy9lkOI/N9XUNLDtajZB7aWrZPQ3wTAWVM9v/JeXA6/gJOgiGfs2o
	toIbmpbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv9wq-0000000BMZE-2Rvd;
	Thu, 20 Mar 2025 07:04:12 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv9v9-0000000BMTl-0OGV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 07:02:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1742454145;
 bh=jgNRTxN5DNgWvkI1l3S2gHA3Bcn02lDWsE+uKc1f9W8=;
 b=AvLuHofPGYJAk8/qfYsD5un/Cp8g+PJAT5YZOzaTxlyowTCLs75Bks0O2OfS8/nwnIVNpBOsw
 0FEJfZTZUlgBfiEn+yvGZRD+x8EtIqcXq7qj1lJASuynY6NN3ZNoIgoK/si3lNYZyYoVVqNv2oN
 mKQRsxreU+jUygq9/76mPWpD+z4idcPxQo3UUsIu+wYUV3CaNlW6Vh0VXTGa6fbZwVaBz2TLvJ/
 2p+96l6Prsa8VwdjnH2gf9uGlB+4PboK1LCtS4mAQcObaPQouSaYVrTCg4ULEC4S340xt71kMwc
 1qqRoJDCw3MKRSb+eZ2cnX4wjnQPeOEs6oMaU6qnWOjg==
X-Forward-Email-ID: 67dbbd7d5af7cf6d2bbfb7ee
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <0f0a35ba-d85d-49eb-92dd-7bc17358aeaf@kwiboo.se>
Date: Thu, 20 Mar 2025 08:02:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: rockchip: Add pwm nodes for RK3528
To: Heiko Stuebner <heiko@sntech.de>, Chukun Pan <amadeus@jmu.edu.cn>
Cc: Yao Zi <ziyao@disroot.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250318120003.2340652-1-amadeus@jmu.edu.cn>
 <20250318120003.2340652-2-amadeus@jmu.edu.cn>
 <0d638134-0c0d-4918-af47-e23d2ead3bf3@kwiboo.se> <2499436.jE0xQCEvom@phil>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <2499436.jE0xQCEvom@phil>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_000227_534891_A48F50D5 
X-CRM114-Status: GOOD (  24.67  )
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

On 2025-03-20 00:47, Heiko Stuebner wrote:
> Am Donnerstag, 20. März 2025, 00:26:14 MEZ schrieb Jonas Karlman:
>> Hi Chukun,
>>
>> On 2025-03-18 13:00, Chukun Pan wrote:
>>> Add pwm nodes for RK3528. The PWM core on RK3528 is the same as
>>> RK3328, but the driver does not support interrupts yet.
>>
>> The device tree should describe the hardware, not what the driver
>> support, so interrupts should probably be included.
>>
>> However, looking closer at TRM for i.e. RK3328, RK3568 and RK3588 it
>> look like the following description is not a true description of the
>> hardware.
>>
>> Each PWM controller seem to support 4 channels, here (and for older RK
>> SoCs) we instead describe each channel and not the controller.
> 
> Yep, that is something that did go wrong in the very early days.
> And all other Rockchip socs also have the same issue - even back
> to the rk3066.

I see, look like the PWM has evolved something like following:

- The controller has always been 1 controller for 4 channels
- Initial versions only had 2 regs for interrupt outside of the 4x
  0x10 reg space, one for each channel
- FIFO was introduced for channel 3
- Interrupts for FIFO was introduced (in RK3399 or earlier)
- Additional features/regs was introduced (in PX30 or earlier)
- PWM_VERSION_ID = 0x02120b34 is used (in RK3308 and later)

> 
> So yes, at some point we should overhaul the thing.
> 
> But I think this is more involved, as right now everything is aimed
> at the current single-channel status quo.

I did a quick and dirty change in driver to use npwms = 4, and that was
a rather trivial change, see top commit at [1]. Minimum required change
in U-Boot also look to be very trivial.

  cat /sys/kernel/debug/pwm
  0: platform/ffa90000.pwm, 4 PWM devices
   pwm-0   ((null)              ): period: 0 ns duty: 0 ns polarity: normal
   pwm-1   (regulator-vdd-arm   ): requested enabled period: 5000 ns duty: 2250 ns polarity: inverse
   pwm-2   (regulator-vdd-logic ): requested enabled period: 5000 ns duty: 2800 ns polarity: inverse
   pwm-3   ((null)              ): period: 0 ns duty: 0 ns polarity: normal

Not really seeing any reason not to describe these PWM controllers more
correctly, we need to start somewhere.

However, I have no idea on how to deal with historic and wrong bindings.
Driver could possible check if resource space is above 0x10 size and state
of PWM_VERSION_ID.

  PWM_VERSION_ID  0x005c  W  0x02120b34  PWM Version ID Register  

[1] https://github.com/Kwiboo/linux-rockchip/commits/next-20250319-rk3528/

Regards,
Jonas

> 
> 
> Heiko
> 
> 
>> Maybe something like following would better represent the hardware:
>>
>> 	pwm0: pwm@ffa90000 {
>> 		compatible = "rockchip,rk3528-pwm";
>> 		reg = <0x0 0xffa90000 0x0 0x10000>;
>> 		clocks = <&cru CLK_PWM0>, <&cru PCLK_PWM0>;
>> 		clock-names = "pwm", "pclk";
>> 		interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
>> 			     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
>> 	};
>>
>> 	pwm1: pwm@ffa98000 {
>> 		compatible = "rockchip,rk3528-pwm";
>> 		reg = <0x0 0xffa98000 0x0 0x10000>;
>> 		clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
>> 		clock-names = "pwm", "pclk";
>> 		interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
>> 			     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
>> 	};
>>
>> Regards,
>> Jonas
>>
>>>
>>> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
>>> ---
>>>  arch/arm64/boot/dts/rockchip/rk3528.dtsi | 80 ++++++++++++++++++++++++
>>>  1 file changed, 80 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
>>> index 1af0d036cf32..621fc19ac0b3 100644
>>> --- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
>>> +++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
>>> @@ -465,6 +465,86 @@ uart7: serial@ffa28000 {
>>>  			status = "disabled";
>>>  		};
>>>  
>>> +		pwm0: pwm@ffa90000 {
>>> +			compatible = "rockchip,rk3528-pwm",
>>> +				     "rockchip,rk3328-pwm";
>>> +			reg = <0x0 0xffa90000 0x0 0x10>;
>>> +			clocks = <&cru CLK_PWM0>, <&cru PCLK_PWM0>;
>>> +			clock-names = "pwm", "pclk";
>>> +			#pwm-cells = <3>;
>>> +			status = "disabled";
>>> +		};
>>> +
>>> +		pwm1: pwm@ffa90010 {
>>> +			compatible = "rockchip,rk3528-pwm",
>>> +				     "rockchip,rk3328-pwm";
>>> +			reg = <0x0 0xffa90010 0x0 0x10>;
>>> +			clocks = <&cru CLK_PWM0>, <&cru PCLK_PWM0>;
>>> +			clock-names = "pwm", "pclk";
>>> +			#pwm-cells = <3>;
>>> +			status = "disabled";
>>> +		};
>>> +
>>> +		pwm2: pwm@ffa90020 {
>>> +			compatible = "rockchip,rk3528-pwm",
>>> +				     "rockchip,rk3328-pwm";
>>> +			reg = <0x0 0xffa90020 0x0 0x10>;
>>> +			clocks = <&cru CLK_PWM0>, <&cru PCLK_PWM0>;
>>> +			clock-names = "pwm", "pclk";
>>> +			#pwm-cells = <3>;
>>> +			status = "disabled";
>>> +		};
>>> +
>>> +		pwm3: pwm@ffa90030 {
>>> +			compatible = "rockchip,rk3528-pwm",
>>> +				     "rockchip,rk3328-pwm";
>>> +			reg = <0x0 0xffa90030 0x0 0x10>;
>>> +			clocks = <&cru CLK_PWM0>, <&cru PCLK_PWM0>;
>>> +			clock-names = "pwm", "pclk";
>>> +			#pwm-cells = <3>;
>>> +			status = "disabled";
>>> +		};
>>> +
>>> +		pwm4: pwm@ffa98000 {
>>> +			compatible = "rockchip,rk3528-pwm",
>>> +				     "rockchip,rk3328-pwm";
>>> +			reg = <0x0 0xffa98000 0x0 0x10>;
>>> +			clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
>>> +			clock-names = "pwm", "pclk";
>>> +			#pwm-cells = <3>;
>>> +			status = "disabled";
>>> +		};
>>> +
>>> +		pwm5: pwm@ffa98010 {
>>> +			compatible = "rockchip,rk3528-pwm",
>>> +				     "rockchip,rk3328-pwm";
>>> +			reg = <0x0 0xffa98010 0x0 0x10>;
>>> +			clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
>>> +			clock-names = "pwm", "pclk";
>>> +			#pwm-cells = <3>;
>>> +			status = "disabled";
>>> +		};
>>> +
>>> +		pwm6: pwm@ffa98020 {
>>> +			compatible = "rockchip,rk3528-pwm",
>>> +				     "rockchip,rk3328-pwm";
>>> +			reg = <0x0 0xffa98020 0x0 0x10>;
>>> +			clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
>>> +			clock-names = "pwm", "pclk";
>>> +			#pwm-cells = <3>;
>>> +			status = "disabled";
>>> +		};
>>> +
>>> +		pwm7: pwm@ffa98030 {
>>> +			compatible = "rockchip,rk3528-pwm",
>>> +				     "rockchip,rk3328-pwm";
>>> +			reg = <0x0 0xffa98030 0x0 0x10>;
>>> +			clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
>>> +			clock-names = "pwm", "pclk";
>>> +			#pwm-cells = <3>;
>>> +			status = "disabled";
>>> +		};
>>> +
>>>  		saradc: adc@ffae0000 {
>>>  			compatible = "rockchip,rk3528-saradc";
>>>  			reg = <0x0 0xffae0000 0x0 0x10000>;
>>
>>
> 
> 
> 
> 


