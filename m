Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A09C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 16:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Erb1j78Tl39CoDzh9ac30D16Llfa3ooTqJ8erhPUCDY=; b=CGKVvE0wNvkxu8MlPGMAkN2iZ4
	+9H0ppy3uNohU6y8G9+ajI9erizKPGHZr/YfMU6CS/vjewn+bBzmBISlq8rB1J0YyS0ldvo0QeVtK
	pZMy/B7WFdmawEO/CraGy255+Cugmv9zTg8JomMmLYA79qGXd7/JGQ5UAfpDk1o2MMpffFHi+KdFC
	8glXBEe2c8AFLc3ZaOvSPy7jggRpnlh9eGEIO0P0p9YFAHoRKG4btm5EB5zi9WGA3wKZgQKvepjKs
	zBXBV3PptJ/pU0bWz36KGj8xnLSlZI1M12rixMs+dXYAW/QWNnbQDgS7++xFsO4X+tyC8MHyFK0zs
	JjiRcvLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl9Ys-00000001uC4-0qZK;
	Thu, 20 Feb 2025 16:38:06 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl9Vz-00000001tVY-3nlO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 16:35:09 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51KGYsQP048123
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Feb 2025 10:34:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740069295;
	bh=Erb1j78Tl39CoDzh9ac30D16Llfa3ooTqJ8erhPUCDY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fQiaFnZZEuGRh4BKYGGwdxs6znPM66osnJsTkoLo35Pzja8pgNJxCffu3LOHPBe8k
	 s/PbIoOQ//sqerTNjmZ4QgQK+791700Zv4W9mtvYL95ZtDFI6F46aenAcrwL58mi8Q
	 DNaKpIH/lEGJbfsZ4YTYcrJkfJ1Q09a+ccifLKhQ=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51KGYsDQ090117
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Feb 2025 10:34:54 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Feb 2025 10:34:54 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Feb 2025 10:34:54 -0600
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51KGYsa2077700;
	Thu, 20 Feb 2025 10:34:54 -0600
Message-ID: <f8456f1b-b092-44b2-a916-13c4d88c5f83@ti.com>
Date: Thu, 20 Feb 2025 10:34:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/10] arm64: dts: ti: k3-am62-wakeup: Add wakeup R5F
 node
To: Beleswar Prasad Padhi <b-padhi@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis
	<afd@ti.com>,
        Hari Nagalla <hnagalla@ti.com>
References: <20250210221530.1234009-1-jm@ti.com>
 <20250210221530.1234009-2-jm@ti.com>
 <4740c3f8-5051-4e25-af91-b45735ffef31@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <4740c3f8-5051-4e25-af91-b45735ffef31@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_083508_105134_1C2174D3 
X-CRM114-Status: GOOD (  14.15  )
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

Hi Beleswar,

On 2/19/25 10:30 AM, Beleswar Prasad Padhi wrote:
> Hi Judith,
> 
> On 11/02/25 03:45, Judith Mendez wrote:
>> From: Hari Nagalla <hnagalla@ti.com>
>>
>> AM62 SoC devices have a single core R5F processor in wakeup domain.
>> The R5F processor in wakeup domain is used as a device manager
>> for the SoC.
>>
>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> ---
>> Changes since v4:
>> - No change
>> ---
>>   arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi | 25 ++++++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi 
>> b/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
>> index 9b8a1f85aa15c..061819a64300f 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
>> @@ -106,6 +106,31 @@ wkup_rti0: watchdog@2b000000 {
>>           status = "reserved";
>>       };
>> +    wkup_r5fss0: r5fss@78000000 {
>> +        compatible = "ti,am62-r5fss";
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +        ranges = <0x78000000 0x00 0x78000000 0x8000>,
>> +             <0x78100000 0x00 0x78100000 0x8000>;
>> +        power-domains = <&k3_pds 119 TI_SCI_PD_EXCLUSIVE>;
>> +        status = "disabled";
>> +
>> +        wkup_r5fss0_core0: r5f@78000000 {
>> +            compatible = "ti,am62-r5f";
>> +            reg = <0x78000000 0x00008000>,
>> +                  <0x78100000 0x00008000>;
>> +            reg-names = "atcm", "btcm";
>> +            ti,sci = <&dmsc>;
>> +            ti,sci-dev-id = <121>;
>> +            ti,sci-proc-ids = <0x01 0xff>;
>> +            resets = <&k3_reset 121 1>;
>> +            firmware-name = "am62-wkup-r5f0_0-fw";
> 
> 
> Here and everywhere else, 'resets' and 'firmware-name' are standard DT 
> properties and should come before vendor specific properties.

Right, let me fix that, thanks.

~ Judith

> 
> https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-of-properties-in-device-node
> 
> Thanks,
> Beleswar
> 
>> +            ti,atcm-enable = <1>;
>> +            ti,btcm-enable = <1>;
>> +            ti,loczrama = <1>;
>> +        };
>> +    };
>> +
>>       wkup_vtm0: temperature-sensor@b00000 {
>>           compatible = "ti,j7200-vtm";
>>           reg = <0x00 0xb00000 0x00 0x400>,


