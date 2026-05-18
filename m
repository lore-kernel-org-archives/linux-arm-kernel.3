Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD02CD4F48
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 07:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T8K3ktX6kxGJCGj6r3lYBqDLxaBpHUVMXWebpGjuIPc=; b=2GnIx9Xms0naqjkyHI1wOQBP0g
	PemVutJutZo/8gg21SO7vbXUBI5wlveTm/Fg/vTjziPQFxGB4I0ftdAljtaHqB06SAiPyYKFhU5iW
	eP2C70OxWyZPcrPjDq4Est/alhOiiL+cpRdth57ZS+2x5ARh8TR3o48qG+xf3BtojlZLlMNIlUxrV
	rV3nJSW3ZE8Gf/6hemh7RYyZzUgEPJufUPC9sKazqYtPqrI3jnEbnHnhBb4SeezO16elq2SsDtOqt
	aCAM6mJtY6XKpTKsmc7YCQdFVWa9XC5gAr/XGIIKNKA5ybSE3KFCROBgkQrq+CCNpQJ5eNOWQ2YfE
	TbPyrMnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsOR-0000000EaZM-3Pzj;
	Mon, 18 May 2026 07:28:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsOP-0000000EaYK-3MQ6;
	Mon, 18 May 2026 07:28:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779089281; x=1810625281;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=mTL4AmldJLzLoADrNv/OW3KIjhSEDw/stTd1/0S4/Kk=;
  b=I0nxskgXa2zm4t9c6LiOFJMJycw5icblpKYfpVYvE/rzQTZkBxtU6W+U
   HheCywDj48ByDpHUi03D4E1+dgy14Tx7WyJfCBh0j2Fz8Oz3wCJjhgRJU
   alKDa+BJ2QjSItF04OQ7hCVieZTuuz7xik1Guiiw0XpWpDPwRkv6vLZr3
   aIW3SCwykmMhSGU/iFL00mDCrl135jCoQqQMa+yZdVWWVq/lIF7Indfo9
   mB5EOHJhPm6XxM+0y0+e845CwQM07U9laEOjxE360seCryrjX+AlZuRHA
   cxEcBwbUcMh3I6bdbYX1C6/EjDhrwLAdsB2ex5eZv1sbrEslx7OFOkody
   g==;
X-CSE-ConnectionGUID: J2ZZy5+7R6SKTOgX18Itgw==
X-CSE-MsgGUID: 09Eij195QgmMOObYXG9Vhg==
X-IronPort-AV: E=Sophos;i="6.23,241,1770620400"; 
   d="scan'208";a="66398712"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 00:27:59 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Mon, 18 May 2026 00:27:59 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 18 May 2026 00:27:54 -0700
Message-ID: <0ae90352-2099-4d3d-a55c-40a6e090fde4@microchip.com>
Date: Mon, 18 May 2026 09:27:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] ARM: dts: microchip: add I3C controller
To: Manikandan M - I67131 <Manikandan.M@microchip.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>
CC: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"Frank.Li@nxp.com" <Frank.Li@nxp.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "tytso@mit.edu" <tytso@mit.edu>, Aubin Constans - M51280
	<Aubin.Constans@microchip.com>, Ryan Wanner - C70674
	<Ryan.Wanner@microchip.com>, Romain Sioen - M70749
	<Romain.Sioen@microchip.com>, "durai.manickamkr@microchip.com"
	<durai.manickamkr@microchip.com>, Cristian Birsan - M91496
	<Cristian.Birsan@microchip.com>, "adrian.hunter@intel.com"
	<adrian.hunter@intel.com>, "jarkko.nikula@linux.intel.com"
	<jarkko.nikula@linux.intel.com>, "npitre@baylibre.com" <npitre@baylibre.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
References: <20260507084805.481737-1-manikandan.m@microchip.com>
 <20260507084805.481737-5-manikandan.m@microchip.com>
 <da83523d-f3ac-42e3-83a2-fb7e7d64ebf9@tuxon.dev>
 <515e89f3-fca9-477c-be4d-be9ed9428d5f@microchip.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <515e89f3-fca9-477c-be4d-be9ed9428d5f@microchip.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_002801_849803_A95829FC 
X-CRM114-Status: GOOD (  18.36  )
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

On 18/05/2026 at 08:10, Manikandan M - I67131 wrote:
> Hi Claudiu,
> 
> On 16/05/26 9:37 pm, Claudiu Beznea wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know
>> the content is safe
>>
>> Hi, Manikandan,
>>
>> On 5/7/26 11:48, Manikandan Muralidharan wrote:
>>> From: Durai Manickam KR <durai.manickamkr@microchip.com>
>>>
>>> Add I3C controller for sama7d65 SoC.
>>>
>>> Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
>>> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
>>> ---
>>> Changes in v3:
>>> - Remove clock-names property as driver enables the clk in bulk
>>>
>>>    arch/arm/boot/dts/microchip/sama7d65.dtsi | 8 ++++++++
>>>    1 file changed, 8 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi
>>> b/arch/arm/boot/dts/microchip/sama7d65.dtsi
>>> index 67253bbc08df..ec200848c153 100644
>>> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
>>> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
>>> @@ -1055,5 +1055,13 @@ gic: interrupt-controller@e8c11000 {
>>>                        #address-cells = <0>;
>>>                        interrupt-controller;
>>>                };
>>> +
>>> +             i3c: i3c@e9000000 {
>>> +                     compatible = "microchip,sama7d65-i3c-hci";
>>> +                     reg = <0xe9000000 0x300>;
>>
>>   From manual at [1] I see the size of I3CC region is 0x1000. Unless that is
>> wrong I think we should use 0x1000 to properly describe de HW. Please
>> let me
>> know and I can do it while applying.

The memory map simply describes what is the next memory boundary 
assigned (or void in this case), not the actual size of the IP user 
interface.
So we took the opportunity to avoid mapping unused memory.

> According to Table 78.6 (Register Summary), the I3CC register space
> extends up to offset 0x258, Ideally the mapping should have been 0x400

The underlying memory mapping certainly does what is best, so I would 
cling to being the closest to last register described. So your 0x300 
value looks very good to me.

Best regards,
   Nicolas

> (next power of 2 considering the memory region alignment), using 0x1000
> is also acceptable. Please advise which value is preferred.
> 
>> Thank you,
>> Claudiu
>>
>> [1]
>> https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/ProductDocuments/DataSheets/SAMA7D6-Series-Data-Sheet-DS60001851.pdf
>>
>>> +                     interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
>>> +                     clocks = <&pmc PMC_TYPE_PERIPHERAL 105>, <&pmc
>>> PMC_TYPE_GCK 105>;
>>> +                     status = "disabled";
>>> +             };
>>>        };
>>>    };
>>
> 


