Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C14C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 10:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/noc+Q/n6Kpzt6EQXIhcOW/BLsq1uA3nULifFhnVrf0=; b=u7zGqXomEV2aFn91276oeMWUwe
	rZF1zhxgzUGuV+dYHhD9VBu+wiyzrsJfs9cmNvQ1xUPNbyxWlyAfKnxCJP3nQvovUzS6i3f7V+ced
	3GvFUSn0fMZ6PN6Ram6Tn0sGS32g1MydVmNHQmWoE61k1RAyKki8bSfyYXo0tJUrXLug4fLgmhqAM
	nHPan1lIYhFRZGvVhJYzJVTnvoFlJYD4u4ihUYu1HgPPNkcOhvqd42SywklNMUnp+qXEIuAEnGmCH
	9zBRSL78r3J3XNywOoYdIYKF7/yuh6Kf9gkaWxf/i50pY4j+tuo6xUn9dTTvEmIEXGYkDrLtpWXzI
	2Ps3lIjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6o8C-000000043zJ-2eWk;
	Mon, 21 Apr 2025 10:12:04 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6o6K-000000043ql-1Cev
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 10:10:09 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53LA9vVN1523976
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 05:09:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745230197;
	bh=/noc+Q/n6Kpzt6EQXIhcOW/BLsq1uA3nULifFhnVrf0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=xQHk6hPT96DmZifpQ0tj/GnpHuDgb6fhQo6VMbPiCrm17i8Yvuqww/8n87jRe7SGY
	 E7oezRk48w44hYM9WR7EYcA7iJsOU5pP+3sd3yOe+EXZfYVharMYBzPjFjzeAAJLVf
	 lU8Yha8CjmCOQm+gWnr+ERMitW5CBBDDkMHYB0/4=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53LA9vwG018213
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 05:09:57 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 05:09:56 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 05:09:56 -0500
Received: from [10.24.72.182] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.72.182])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53LA9qrE015453;
	Mon, 21 Apr 2025 05:09:53 -0500
Message-ID: <8a0bbbd1-4767-4399-b163-8243bd849bdf@ti.com>
Date: Mon, 21 Apr 2025 15:39:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] arm64: dts: ti: k3-j721s2-common-proc-board: Add
 main_i2c4 instance
To: "Kumar, Udit" <u-kumar1@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <devarsht@ti.com>, <linux-kernel@vger.kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <kristo@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250411105155.303657-1-j-choudhary@ti.com>
 <20250411105155.303657-5-j-choudhary@ti.com>
 <ab27873e-cada-4135-a617-5d4567a4eaa5@ti.com>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <ab27873e-cada-4135-a617-5d4567a4eaa5@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_031008_505507_30D7699F 
X-CRM114-Status: GOOD (  11.87  )
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

Hello Udit,

On 19/04/25 14:53, Kumar, Udit wrote:
> 
> On 4/11/2025 4:21 PM, Jayesh Choudhary wrote:
>> Add dt node for main_i2c4 instance along with required pinmuxing.
>> Also add the gpio expander 'exp4' required by display connector.
>>
>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>> ---
>>   .../dts/ti/k3-j721s2-common-proc-board.dts    | 21 +++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts 
>> b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
>> index e2fc1288ed07..f691ae4c19e6 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
>> @@ -148,6 +148,13 @@ J721S2_IOPAD(0x060, PIN_INPUT_PULLUP, 13) /* 
>> (AC27) MCASP2_AXR1.I2C3_SDA */
>>           >;
>>       };
>> +    main_i2c4_pins_default: main-i2c4-default-pins {
>> +        pinctrl-single,pins = <
>> +            J721S2_IOPAD(0x014, PIN_INPUT_PULLUP, 8) /* (AD25) 
>> I2C4_SCL */
>> +            J721S2_IOPAD(0x010, PIN_INPUT_PULLUP, 8) /* (AF28) 
>> I2C4_SDA */
>> +        >;
>> +    };
>> +
>>       main_i2c5_pins_default: main-i2c5-default-pins {
>>           pinctrl-single,pins = <
>>               J721S2_IOPAD(0x01c, PIN_INPUT, 8) /* (Y24) 
>> MCAN15_TX.I2C5_SCL */
>> @@ -370,6 +377,20 @@ exp2: gpio@22 {
>>       };
>>   };
>> +&main_i2c4 {
>> +    status = "okay";
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&main_i2c4_pins_default>;
>> +    clock-frequency = <400000>;
>> +
>> +    exp4: gpio@20 {
>> +        compatible = "ti,tca6408";
>> +        reg = <0x20>;
>> +        gpio-controller;
>> +        #gpio-cells = <2>;
> 
> I suggest to add, gpio-line-names as well for this gpio expander.
> 

Sure, I will add gpio-line-names.

> 
>> +    };
>> +};
>> +
>>   &main_i2c5 {
>>       pinctrl-names = "default";
>>       pinctrl-0 = <&main_i2c5_pins_default>;


Thanks,
Jayesh

