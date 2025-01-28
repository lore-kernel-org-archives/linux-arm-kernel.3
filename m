Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD77EC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 16:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cC0KMS0vR8Sacv6KHUAZ+n02/v/BMfPwtB7yIm17/P8=; b=kEq1yaDkpaiy/7A/nmOTazL5+I
	4+ckS0ozqTUeYhdOIHKP3uxFNvdGz/GQKwwLRUdlGn3fPidGGmzuUvjISgtSYby5/0+YhPn2oHknQ
	+98d4yMWukjbSNXeUv7F9LI1lQ2CkNvWa8V5LvEc4DzyDpe6tcNeWY4hY/aQEsTrhnTdIt8omI4Xy
	TLxCRnrRh4FYrnAuV47BgqYkrIht8Zm8Z3WFuqjPlODo9iVne33daGPmmlmnXYXVAwaFPRiHM6FUG
	KLaON9bLYHQNoQvOpZOYtMoBb1mJmpMD38euhlDx9I/fEYrl/BntTObZygVb7K6pjyBYSWa4bt780
	yYUgT5Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcoep-00000005MFg-1hAy;
	Tue, 28 Jan 2025 16:41:47 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcoQm-00000005JoA-0yqj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 16:27:17 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50SGRCHl1991342
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Jan 2025 10:27:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738081632;
	bh=cC0KMS0vR8Sacv6KHUAZ+n02/v/BMfPwtB7yIm17/P8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=xEld7KT9eRIA/7mzjTT9W4raW+WMASjsjsN6IHKWABf2f4WKkIqdWk2WBJUtnOyU4
	 q63Rm9RXiRuCdduncfAzTtIVRR/kt/M2YDTo48fc6wqo0pM3fyfrdoANnW06IsbJ6a
	 VGhLLH/cjdyELze/3ceAaz8A7NALP2cWqYc9HtmQ=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50SGRCxj024979
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 28 Jan 2025 10:27:12 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 28
 Jan 2025 10:27:11 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 28 Jan 2025 10:27:11 -0600
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50SGRBoE088372;
	Tue, 28 Jan 2025 10:27:11 -0600
Message-ID: <6d896633-0545-4e2c-ac7d-a05686a0df49@ti.com>
Date: Tue, 28 Jan 2025 10:27:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: ti: k3-am62-wakeup: Add wakeup r5f node
To: Andrew Davis <afd@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Devarsh Thakkar
	<devarsht@ti.com>,
        Hari Nagalla <hnagalla@ti.com>
References: <20250127221631.3974583-1-jm@ti.com>
 <20250127221631.3974583-2-jm@ti.com>
 <950a1e23-a943-41b0-979a-4e7a4a264fdd@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <950a1e23-a943-41b0-979a-4e7a4a264fdd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_082716_364851_3250BD5B 
X-CRM114-Status: GOOD (  15.97  )
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

Hi Andrew,

On 1/28/25 10:22 AM, Andrew Davis wrote:
> On 1/27/25 4:16 PM, Judith Mendez wrote:
>> From: Hari Nagalla <hnagalla@ti.com>
>>
>> AM62 SoC devices have a single core R5F processor in wakeup domain.
>> The R5F processor in wakeup domain is used as a device manager
>> for the SoC.
>>
>> Co-authored-by: Devarsh Thakkar <devarsht@ti.com>
>> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
>> [Judith: Fix commit message header]
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> ---
>>   arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi | 24 ++++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi 
>> b/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
>> index 9b8a1f85aa15c..79708c1c214f8 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
>> @@ -106,6 +106,30 @@ wkup_rti0: watchdog@2b000000 {
>>           status = "reserved";
>>       };
>> +    wkup_r5fss0: r5fss@78000000 {
>> +        compatible = "ti,am62-r5fss";
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +        ranges = <0x78000000 0x00 0x78000000 0x8000>,
>> +                 <0x78100000 0x00 0x78100000 0x8000>;
>> +        power-domains = <&k3_pds 119 TI_SCI_PD_EXCLUSIVE>;
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
>> +            firmware-name = 
>> "ti-sysfw/ti-fs-stub-firmware-am62x-gp-signed.bin";
> 
> What is this firmware name? This doesn't exist in linux-firmware,
> should use the normal name like "am62-wkup-r5f0_0-fw", then we
> can use symlinks in our userspace to map to whatever firmware we
> want to run.

Understood, will respin with fixed name, thanks.

~ Judith

> 
> Andrew
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


