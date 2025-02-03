Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA96C02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 22:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OfI9dlLcSjW6HM4VB+FL+prEF7OaRxVLjKZpK9XkkAs=; b=gLV0zGIqoPhY0/VlrGkhapIetU
	BbSZUeZXmVHcX6I47QxwQs3YrdY8+iEIQoTirD4kI0B9+/KMKo6IFhlUTiP/g7MfFAlkmWTh17t/g
	/iRaSstocnNQbLrP3HzyeZheAeW9Edso54XsmziAjbqY70G9QGATLBfk2Ckk2qkfVMDnxRd28jZ1X
	EKyiRPENNObERQvVRpUT6w2+IdUaHxEVr5qlrsaArsYxN1/4xzWge6ZXvZa2IKF6ZaRvD8APSqTsm
	h2kkD5dSprbyA3SBLd8HUyhS9IjY+NYp0br0t8Fna9+pSpoH3mU5yFbNB+vmbDUHcAc6nLkUKQkLE
	4gZKKWOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf4hf-0000000Glct-03sn;
	Mon, 03 Feb 2025 22:14:03 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf4gJ-0000000GlYx-36lb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 22:12:41 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 513MCZbG2218398
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 3 Feb 2025 16:12:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738620755;
	bh=OfI9dlLcSjW6HM4VB+FL+prEF7OaRxVLjKZpK9XkkAs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Ue2x718piSpMFvKdib39neMBkky7Ugk6w3cDbVaR0ZJLKXQgpHuMspFfW84AgKqOY
	 U4751Rk+D96+MjZugGZX6WeQCqUcADXDBPUQn1A7xLBh/n/Bv3ZCoTOwL+2pJDaP/3
	 ufZiSKPCXrIE6h61DHA0vyePvmo79mAmxuBszfMA=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 513MCZm1065356;
	Mon, 3 Feb 2025 16:12:35 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Feb 2025 16:12:35 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Feb 2025 16:12:35 -0600
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 513MCZB6086602;
	Mon, 3 Feb 2025 16:12:35 -0600
Message-ID: <6fe74c50-1430-4556-90b5-f635fb48e6fb@ti.com>
Date: Mon, 3 Feb 2025 16:12:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] arm64: dts: ti: k3-am62-wakeup: Add wakeup r5f
 node
To: Andrew Davis <afd@ti.com>, <devicetree@vger.kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Hari Nagalla <hnagalla@ti.com>, Nishanth
 Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
References: <20250131214611.3288742-1-jm@ti.com>
 <20250131214611.3288742-2-jm@ti.com>
 <1c2c67b7-987e-4b92-b0be-c0b2f25adae6@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <1c2c67b7-987e-4b92-b0be-c0b2f25adae6@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_141239_866855_316B46FF 
X-CRM114-Status: GOOD (  13.12  )
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

On 1/31/25 5:40 PM, Andrew Davis wrote:
> On 1/31/25 3:46 PM, Judith Mendez wrote:
>> From: Hari Nagalla <hnagalla@ti.com>
>>
> 
> Subject should capitalize R5F

Will fix in v3, thanks

> 
>> AM62 SoC devices have a single core R5F processor in wakeup domain.
>> The R5F processor in wakeup domain is used as a device manager
>> for the SoC.
>>
>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> ---
>> Changes since v1:
>> - disable each device node in the voltage domain files and
>>    enable at the board level file
>> - fix firmware names
>> ---
>>   arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi | 25 ++++++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi 
>> b/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
>> index 9b8a1f85aa15c..12b1520974ade 100644
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
>> +                 <0x78100000 0x00 0x78100000 0x8000>;
> 
> Odd alignment, looks like you have an extra tab on the above line

Hmm missed this, thanks will fix.

~ Judith

> 
> Andrew
> 
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
>> +            ti,atcm-enable = <1>;
>> +            ti,btcm-enable = <1>;
>> +            ti,loczrama = <1>;
>> +        };
>> +    };
>> +
>>       wkup_vtm0: temperature-sensor@b00000 {
>>           compatible = "ti,j7200-vtm";
>>           reg = <0x00 0xb00000 0x00 0x400>,


