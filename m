Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3BDC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 03:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qd6qp1+ybi0MHi3xmDnOya6FXacrtJVptDj7+jwoBCs=; b=k3EIfQW0UU0nuXc/Dou4vu0zAC
	hpWpTlABQAwa9UxK5fHQEBuRxg1Sb7meoAovBLqDTUo2OtQpuQtL/rT1h6klT92qp/fngwYHv2la3
	aA2saH+42Fm2G4XlrpB/+GyQDW0EzR7SKRC9hx1rnLhqOeqkA+PgI8vMjXi3cwfFNYwI0o6v70W+F
	lxxkS/ayc3eQ0QmK/pMDTEwVKOMwGKT9ZcJcLBMdGJ3cFYFZdZvbNBYR6tb+3+cd5kZ0V12EyoZaW
	SsUIYyrCd0Dao+4eo98DLxKH9wfxce1sUs41VS3YT73EIsh4DVKUjA093eF7QQDV3trJQW/VE5GFI
	/six45Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkaNf-0000000AiYF-0yKh;
	Wed, 19 Feb 2025 03:04:11 +0000
Received: from mail-b.studer.dev ([3.21.136.164])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkaMB-0000000AiMQ-0eJ8;
	Wed, 19 Feb 2025 03:02:40 +0000
Received: from mail.studer.dev (mail.studer.dev [168.62.161.121])
	by mail-b.studer.dev (Postfix) with ESMTPSA id A4B6240047;
	Wed, 19 Feb 2025 03:02:35 +0000 (UTC)
dkim-signature: v=1; a=rsa-sha256; d=studer.dev; s=hmail;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References;
	bh=qd6qp1+ybi0MHi3xmDnOya6FXacrtJVptDj7+jwoBCs=;
	b=TBUdQCJWM1Gle0QybTdOW2kMgDrTXfMtboFQ20aQBjD5bfSQ92pWUNYKTZk543HV67pnT5HyOk7RHFoJ7TY/TuN283Ir1ce2yv9ggDuX82NPctt/pcJPqDEPxwqddiOcb3jOZ3RUPFOUc1a3DVtiMlPWTNAGYEauGTyAEW1Wc4g+NrrFoIZpgBsF60kybfL8NuxTaQmGRK7herpMtN/sHiFQQ/sNcpwdyNhynrpWFyaKLamRbdFJVKpUTS
	vuZ7QUXTeIrE2qfQ03Lqpd5iwNtB5QXas5632DTZ+nByQd07N1mcMjTnNEZy7zZrUSYXVoRiaWH8gHkRqZi7MKgspVMw==
Received: from [192.168.1.166] (pool-68-239-44-167.bstnma.fios.verizon.net [68.239.44.167])
	by mail.studer.dev with ESMTPSA
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128)
	; Wed, 19 Feb 2025 03:02:33 +0000
Message-ID: <56fe8762-5b05-4b41-b7fd-f08f35012ba9@studer.dev>
Date: Tue, 18 Feb 2025 22:02:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: allwinner: d1: Add CPU thermal sensor and
 zone
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250218020629.1476126-1-alex@studer.dev>
 <4628970.LvFx2qVVIh@jernej-laptop>
From: Alex Studer <alex@studer.dev>
Content-Language: en-US
In-Reply-To: <4628970.LvFx2qVVIh@jernej-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_190239_271663_39936829 
X-CRM114-Status: GOOD (  19.13  )
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

On 2/18/25 12:23 PM, Jernej Škrabec wrote:
> Dne torek, 18. februar 2025 ob 03:06:29 Srednjeevropski standardni čas je Alex Studer napisal(a):
>> The sun20i THS (built in CPU thermal sensor) is supported in code, but
>> was never added to the device tree. So, add it to the device tree,
>> along with a thermal zone for the CPU.
>>
>> Signed-off-by: Alex Studer <alex@studer.dev>
>> ---
>>  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 31 +++++++++++++++++++
>>  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 16 ++++++++++
>>  2 files changed, 47 insertions(+)
>>
>> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
>> index 6367112e6..bdde82aa8 100644
>> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
>> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
>> @@ -3,6 +3,8 @@
>>  
>>  #define SOC_PERIPHERAL_IRQ(nr)	(nr + 16)
>>  
>> +#include <dt-bindings/thermal/thermal.h>
> Put above line on top (before SOC_PERIPHERAL_IRQ()).
Will fix in v2.
>> +
>>  #include "sunxi-d1s-t113.dtsi"
>>  
>>  / {
>> @@ -115,4 +117,33 @@ pmu {
>>  			<0x00000000 0x0000000e 0xffffffff 0xffffffff 0x00010000>,
>>  			<0x00000000 0x0000000f 0xffffffff 0xffffffff 0x00020000>;
>>  	};
>> +
>> +	thermal-zones {
>> +		cpu-thermal {
>> +			polling-delay-passive = <0>;
>> +			polling-delay = <0>;
>> +			thermal-sensors = <&ths>;
>> +
>> +			cooling-maps {
>> +				map0 {
>> +					trip = <&cpu_alert>;
>> +					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>> +				};
>> +			};
>> +
>> +			trips {
>> +				cpu_alert: cpu-alert {
>> +					temperature = <85000>;
>> +					hysteresis = <2000>;
>> +					type = "passive";
>> +				};
>> +
>> +				cpu-crit {
>> +					temperature = <100000>;
>> +					hysteresis = <0>;
>> +					type = "critical";
>> +				};
> Where do those limits come from?
I took them from the definitions in
arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi, which is what I generally
based this patch on. I checked the D1s datasheet and it does specify a
max "Ambient Operating Temperature" of 70 C and a max "Working Junction
Temperature Range" of 110 C. So I could use those, but the dtsi files
for the other sunxi chips don't seem to follow their respective
datasheets, so I wasn't sure what to do here.
>> +			};
>> +		};
>> +	};
>>  };
>> diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
>> index e4175adb0..fcfcaf06c 100644
>> --- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
>> +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
>> @@ -426,6 +426,10 @@ sid: efuse@3006000 {
>>  			reg = <0x3006000 0x1000>;
>>  			#address-cells = <1>;
>>  			#size-cells = <1>;
>> +
>> +			ths_calibration: thermal-sensor-calibration@14 {
>> +				reg = <0x14 0x8>;
>> +			};
>>  		};
>>  
>>  		crypto: crypto@3040000 {
>> @@ -934,5 +938,17 @@ rtc: rtc@7090000 {
>>  			clock-names = "bus", "hosc", "ahb";
>>  			#clock-cells = <1>;
>>  		};
>> +
>> +		ths: thermal-sensor@2009400 {
>> +			compatible = "allwinner,sun20i-d1-ths";
>> +			reg = <0x2009400 0x100>;
> Size should be 0x400.
Will fix in v2.
>
> Best regards,
> Jernej

Thanks,
Alex

>
>> +			interrupts = <SOC_PERIPHERAL_IRQ(58) IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&ccu CLK_BUS_THS>;
>> +			clock-names = "bus";
>> +			resets = <&ccu RST_BUS_THS>;
>> +			nvmem-cells = <&ths_calibration>;
>> +			nvmem-cell-names = "calibration";
>> +			#thermal-sensor-cells = <0>;
>> +		};
>>  	};
>>  };
>>
>
>
>


