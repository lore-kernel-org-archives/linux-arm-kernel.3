Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B040AC71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 22:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P4xCrWE6UfMDQfaIrM/6JY1uVyL0Fej7yEtEL19lwQY=; b=xGQBMuMNwwC8j5XS1DaktETf2e
	jjIyRgy+OAggTR+lSOehlc8USSZyAlk5U2MvwWunBW316MxAhuUesEBbe4Nva8VKsHo5XGCMxcJWq
	JF68eo9rNAtWiYBVtjA/24/rY46B0Zme6aaISs1iVxQPhGHUhK/HfUTYWNgP2qhRy7TMF4GMlu4UG
	lwQ3QUepiVQlppKkH/b56aSNXx8UTiW+oZFlPHKXk3RWUzKSnTDIyQah2bI2jQRaO+bVJQ1w6ZPXd
	0JuPSG83PAF6n8ldSiefI0iAMjk61t9MeCQnhKaChEi4RWPfGy+pHRvEqHR6FDU59EsRZuw7+KHgq
	LcN8lR3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPTl0-0000000BRyV-27d4;
	Wed, 11 Jun 2025 22:17:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRUH-0000000B0Jv-0ZII
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 19:51:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1749671512; x=1781207512;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=0JxLNWRlX6k+uwatmqej4dYDRJCNBxE+haXmVURsNd0=;
  b=n823Sy5VVVgrYwq7at69PoECaC6jl+a0jY//i4KfKcpXFIkZqaF0tAy0
   BN0/yWSGFOlXmMjF7e/g0Ym6dqvtosnXeBFMh7bMQshMcyxQlhUfz3Awo
   B+wDH36LP07QhFXQLrVZt57ewQ3SeIaA37sCrSNJxQWbOcfB0snWbGlBg
   kCCL3uDzxX70lJXsHoFROkiSSrUzDP2Cf8VzSCLsIjQRc6zLg0xidCcBT
   n4JAHzn4xB6WMQfduNzcs76ObV747HvsIaESJvINPSZ0u8FoRS/rko/p9
   tYAFrNZHbLCPUe9dW7NH+hGpYunsFTs+shfwQdVGWUD0YwPtFBkEE6nn5
   Q==;
X-CSE-ConnectionGUID: PFE2adCJQrWAEgiYnjIERA==
X-CSE-MsgGUID: 5eHzcbFMTH+pyjY0H6lqDQ==
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="210175217"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Jun 2025 12:51:52 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 11 Jun 2025 12:51:21 -0700
Received: from [10.10.179.162] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Wed, 11 Jun 2025 12:51:21 -0700
Message-ID: <5373558c-d075-4a35-a941-623e385cdc22@microchip.com>
Date: Wed, 11 Jun 2025 12:51:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] ARM: dts: microchip: sama7d65: Add clock name
 property
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <cover.1748030737.git.Ryan.Wanner@microchip.com>
 <f6ae8a38a005e1a4e025b25ddb29113c5e65dead.1748030737.git.Ryan.Wanner@microchip.com>
 <dc0c2777-ed5b-4729-8ae3-6563d8996e2e@tuxon.dev>
From: Ryan Wanner <ryan.wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <dc0c2777-ed5b-4729-8ae3-6563d8996e2e@tuxon.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_125153_237974_F5FEE749 
X-CRM114-Status: GOOD (  18.96  )
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

On 6/7/25 04:57, Claudiu Beznea wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi, Ryan,
> 
> On 23.05.2025 23:24, Ryan.Wanner@microchip.com wrote:
>> From: Ryan Wanner <Ryan.Wanner@microchip.com>
>>
>> Add clock-output-names to the xtal nodes, so the driver can correctly
>> register the main and slow xtal.
>>
>> This fixes the issue of the SoC clock driver not being able to find
>> the main xtal and slow xtal correctly causing a bad clock tree.
>>
>> Fixes: 261dcfad1b59 ("ARM: dts: microchip: add sama7d65 SoC DT")
> 
> Can you please prepare a similar fix for sam9x7. It is also affected by
> this, right?
The driver looks for the xtal differently in the sam9x75 than in the
SAMA7 clock drivers, so it is not immediately affected. But I will add a
sam9x7 in the v2 of the patch since in the future it will be needed.

Thank you,
Ryan
> 
> Thank you,
> Claudiu
> 
>> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
>> ---
>>  arch/arm/boot/dts/microchip/sama7d65.dtsi | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
>> index b6710ccd4c36..7b1dd28a2cfa 100644
>> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
>> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
>> @@ -38,11 +38,13 @@ cpu0: cpu@0 {
>>       clocks {
>>               main_xtal: clock-mainxtal {
>>                       compatible = "fixed-clock";
>> +                     clock-output-names = "main_xtal";
>>                       #clock-cells = <0>;
>>               };
>>
>>               slow_xtal: clock-slowxtal {
>>                       compatible = "fixed-clock";
>> +                     clock-output-names = "slow_xtal";
>>                       #clock-cells = <0>;
>>               };
>>       };
> 


