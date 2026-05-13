Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E37F0CD37B6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 10:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DgspeyQOU+FSn2pTKUQO1BQQqqJd8SPAkmYKpS44OyA=; b=gsO5SroEJVEq0TcXFYv55i0Nx4
	D7qM/iwg/FgVKJL/nP8PRBSmssHiYuHIpSgtg45u+z4ZBBwfQs5LXp3UHGw5F4lcXDrQrNzCA+cuF
	n9qS7jEibUv28iLyvUFz9ei+p8ehVRDgA2bnJZ6jl1/SxyJ3AG5IduB1S26eKKTL7QiKbVHb82Tmn
	U7hm2ztz2MCEdtP8ihXIEBX54y9J971DpHa6TsT1XNEHpi29OuHRpI2q8/on+RD7Qp+7XX+asES2Z
	krMDqlGtFBawUrECz8giwspM2LlY449UdUmWN9yx+4Uw2AKurGztRqrDgPougQ3081J9eiOoJ2hHd
	BK6fs/iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6nB-00000002BBy-1y5A;
	Wed, 13 May 2026 10:26:17 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6n8-00000002BAJ-1PHf;
	Wed, 13 May 2026 10:26:16 +0000
Message-ID: <2615455d-4b4b-43cb-a0eb-ee8ea3cd68fb@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1778667966;
	bh=ddoblNZZsz5wNrt8mpoM1PIZNDv3RgKjfvpiPYWJsIE=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=ZDlNcLmEyrJkfsm2aHLedDxwtuIP7EhBNioKD/ISmamJpI9nQKIEDEn8F8AeWr9F/
	 f6dy6/7uwEyQYJKbRolYQfamFmrh62d2PiO1M8/tJWfiY4A9e0f7mTMUX+H0X7gFRj
	 urzcLDclRrXioe82NiKuzrOO4hSSAdTqr4kA2kVo=
Date: Wed, 13 May 2026 12:26:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: t7: khadas-vim4: add PWM-driven
 status LED
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20260512-add-kvim4-sysled-v1-0-7178719a43e7@aliel.fr>
 <20260512-add-kvim4-sysled-v1-2-7178719a43e7@aliel.fr>
 <7ad282ae-fffa-4d0a-9cec-65d8f6b40544@linaro.org>
Content-Language: en-US
In-Reply-To: <7ad282ae-fffa-4d0a-9cec-65d8f6b40544@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_032614_809084_EBC0837C 
X-CRM114-Status: GOOD (  12.63  )
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

On 5/13/26 10:05 AM, Neil Armstrong wrote:
> On 5/12/26 19:47, Ronald Claveau via B4 Relay wrote:
>> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>>
>> The VIM4 board exposes a status LED wired to the PWM_AO_C_D output.
>> Enable the pwm_ao_cd controller with its pinmux, and declare a
>> pwm-leds node with a heartbeat trigger.
>>
>> Also, move the xtal-clk node to restore alphabetical ordering.
> 
> Please send a separate patch for that
> 

Thanks for your review, I will add a new patch.

>>
>> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
>> ---
>>   .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 30 ++++++++++++
>> +++++-----
>>   1 file changed, 23 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-
>> vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>> index 69d6118ba57e7..c41525a34b721 100644
>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>> @@ -45,13 +45,6 @@ secmon_reserved_bl32: secmon@5300000 {
>>           };
>>       };
>>   -    xtal: xtal-clk {
>> -        compatible = "fixed-clock";
>> -        clock-frequency = <24000000>;
>> -        clock-output-names = "xtal";
>> -        #clock-cells = <0>;
>> -    };
>> -
>>       dc_in: regulator-dc-in {
>>           compatible = "regulator-fixed";
>>           regulator-name = "DC_IN";
>> @@ -60,6 +53,16 @@ dc_in: regulator-dc-in {
>>           regulator-always-on;
>>       };
>>   +    pwm-leds {
>> +        compatible = "pwm-leds";
>> +
>> +        status {
>> +            linux,default-trigger="heartbeat";
>> +            max-brightness = <255>;
>> +            pwms = <&pwm_ao_cd 0 30040 0>;
>> +        };
>> +    };
>> +
>>       sd_3v3: regulator-sdcard-3v3 {
>>           compatible = "regulator-fixed";
>>           regulator-name = "SD_3V3";
>> @@ -155,6 +158,13 @@ wifi32k: wifi32k {
>>           clock-frequency = <32768>;
>>               pwms = <&pwm_ab 0 30518 0>;
>>       };
>> +
>> +    xtal: xtal-clk {
>> +        compatible = "fixed-clock";
>> +        clock-frequency = <24000000>;
>> +        clock-output-names = "xtal";
>> +        #clock-cells = <0>;
>> +    };
>>   };
>>     &pwm_ab {
>> @@ -163,6 +173,12 @@ &pwm_ab {
>>       pinctrl-names = "default";
>>   };
>>   +&pwm_ao_cd {
>> +    status = "okay";
>> +    pinctrl-0 = <&pwm_ao_c_d_pins>;
>> +    pinctrl-names = "default";
>> +};
>> +
>>   /* SDIO */
>>   &sd_emmc_a {
>>       status = "okay";
>>
> 


-- 
Best regards,
Ronald

