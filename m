Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5544FB3CED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 10:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J8t5VA9F93c/ZdJlqycmtTE4EVv0oimPW3eK9lBJA74=; b=db30I/hLi2l15/3RZhtUdetR3n
	tlC3slIMhhdN7dysBbZ80/Uzu5h28TNB/llG5BgjvhwK4tCJQixvdCts1fGkuNiDcfEvoxNr8/H0Y
	bq5YfoSWdhpat/Sraz0Fv90o51UmF9Um/yrYzAzDYrLi+zpCoba0H4rxEeDH9ys9q2x69szDm5K1D
	yOmQ0XHsquVs0sbl4fG/v/izuqtAG+JmssiyMaXGPKOT9p2SwlhmSy2zqqdFJQ+qFDOfTozISfjTT
	MN0AEwmkor8mCiK+CW6rp7xqaWO9g5LAsn/YpKsRrc+MztJDXPqbfp6kcJo4nyuOy0gfenIH8tg5r
	T5iV2Asg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79hW-0000000B2fo-33lo;
	Mon, 30 Mar 2026 10:18:30 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79hU-0000000B2fB-1rCo;
	Mon, 30 Mar 2026 10:18:29 +0000
Message-ID: <44c0a75e-6e72-49e8-9b15-cb504a494feb@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1774865896;
	bh=+C/m07xrnjqPCMatJ2aXNKiqXleyo1ulSGuLaHUMa18=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=BMYiAxLUiIGumw6RyS1KKt0wBhxLSX1O3Csb/1uoGMCYsItSebXTqRhbwuss2xqiY
	 Lf6zuLY+ynwlncarwYnDhywMDyJJsTUKBIUz5TQ2owsrsf9ss1z+R1pH6FkZKrAOKf
	 SJnRJqZ6RA+vHV/OsAAqhEKUQUhJmXJeRi+EqyPQ=
Date: Mon, 30 Mar 2026 12:18:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v5 6/9] arm64: dts: amlogic: t7: khadas-vim4: Add power
 regulators
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>
References: <20260326-add-emmc-t7-vim4-v5-0-d3f182b48e9d@aliel.fr>
 <20260326-add-emmc-t7-vim4-v5-6-d3f182b48e9d@aliel.fr>
 <416d42a6-8d99-421c-91aa-e705f23576e2@linaro.org>
Content-Language: en-US
In-Reply-To: <416d42a6-8d99-421c-91aa-e705f23576e2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_031828_625360_CFE3ACC3 
X-CRM114-Status: GOOD (  10.68  )
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

On 3/30/26 9:55 AM, Neil Armstrong wrote:
> On 3/26/26 10:59, Ronald Claveau wrote:
>> Add voltage regulator nodes describing the VIM4 power tree,
>> required by peripheral nodes such as the SD card controller.
>>
>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
>> ---
>>   .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 90 ++++++++++++
>> ++++++++++
>>   1 file changed, 90 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-
>> vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>> index fffdab96b12eb..2450084d37642 100644
>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>> @@ -6,6 +6,8 @@
>>   /dts-v1/;
>>     #include "amlogic-t7.dtsi"
>> +#include <dt-bindings/gpio/amlogic,t7-periphs-pinctrl.h>
>> +#include <dt-bindings/gpio/gpio.h>
>>     / {
>>       model = "Khadas vim4";
>> @@ -45,6 +47,94 @@ xtal: xtal-clk {
>>           #clock-cells = <0>;
>>       };
>>   +    dc_in: regulator-dc-in {
>> +        compatible = "regulator-fixed";
>> +        regulator-name = "DC_IN";
>> +        regulator-min-microvolt = <5000000>;
>> +        regulator-max-microvolt = <5000000>;
>> +        regulator-always-on;
>> +    };
>> +
>> +    sd_3v3: regulator-sdcard-3v3 {
>> +        compatible = "regulator-fixed";
>> +        regulator-name = "SD_3V3";
>> +        regulator-min-microvolt = <3300000>;
>> +        regulator-max-microvolt = <3300000>;
>> +        vin-supply = <&vddao_3v3>;
>> +        gpio = <&gpio GPIOD_11 GPIO_ACTIVE_LOW>;
>> +        regulator-boot-on;
> 
>> +        enable-active-low;
> 
> This properly is invalid, please send follow up patch removing this,
> 
> Thanks,
> Neil
> 
> <snip>

Sure. I am on it.

Thanks,
-- 
Best regards,
Ronald

