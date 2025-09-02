Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37778CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 08:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lwYRQuQ9q81SHpYsQEpVnWlEvIcK3LgEhk4PAia0l1U=; b=b+fPXBVYsBQ8TLs0D0ktbGSIVt
	1tJxcjeXPrzykHCOo1F6v6q1f/GlbcJ5X/erEw3sjS3UZY9CEGm59JuBVqdgBSajU5r3byQovVhtE
	+SMGbfXlKLiC1sDuqymZZy8M1TyTCn4xjFmmpP9rJVXjKR9dopoHJSxAZSIHwt1xtN2EWl7JErWp+
	BT3D3pIArwNyH7AcexmP1bquKvmaSvvbcHnxI6fgq0yQn1/hOqtceBZx6/y+5rt3sXS5LOGmXv1Su
	miGcprUwKySMZUmPLpY7hAVnZa6SWZFcninVxsrIceD8zmoTEOTpnaxMvo9D6cD5jAHhOAmBLXSR7
	gXVNnS1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utMn9-0000000GCWZ-2AdX;
	Tue, 02 Sep 2025 08:55:03 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utMSj-0000000G4jF-0Xq0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 08:33:58 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5828XqHN2487218;
	Tue, 2 Sep 2025 03:33:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756802032;
	bh=lwYRQuQ9q81SHpYsQEpVnWlEvIcK3LgEhk4PAia0l1U=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=mCe9ElLaUjxh1MzX3Fm0lVqEVWZ4uKcKQMkctWCI7p0xDi1xqJRlU7+bdFoZOsniR
	 +JFxYh5tLA++deaOP+UrTN1fr3nmUoubyqL1mO1BVaR7sMUOnatoeD23wzNfIxMiBM
	 NyKW36h+Hx5Xjv7MdnGsvo6/OjedgUcTADoX42FU=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5828XqX92605214
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 2 Sep 2025 03:33:52 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 2
 Sep 2025 03:33:52 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 2 Sep 2025 03:33:51 -0500
Received: from [172.24.233.254] (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5828Xluc3502840;
	Tue, 2 Sep 2025 03:33:47 -0500
Message-ID: <5f94830d-8ad0-4abb-a109-bad88b4a9090@ti.com>
Date: Tue, 2 Sep 2025 14:03:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am62d2-evm: Add support for OSPI flash
To: Paresh Bhagat <p-bhagat@ti.com>, Nishanth Menon <nm@ti.com>
CC: <vigneshr@ti.com>, <praneeth@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <khasim@ti.com>, <v-singh1@ti.com>,
        <afd@ti.com>, <bb@ti.com>, <s-k6@ti.com>
References: <20250813090300.733295-1-p-bhagat@ti.com>
 <20250822183014.apyvqws4afiqiymb@specks>
 <f207b2e9-a910-40f3-a01e-1af33c7f4e6f@ti.com>
Content-Language: en-US
From: Santhosh Kumar K <s-k6@ti.com>
In-Reply-To: <f207b2e9-a910-40f3-a01e-1af33c7f4e6f@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_013357_260228_B6E3E808 
X-CRM114-Status: GOOD (  15.49  )
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

Hello Paresh,

On 23/08/25 09:03, Paresh Bhagat wrote:
> Hi Nishanth,
> 
> 
> On 23/08/25 00:00, Nishanth Menon wrote:
>> On 14:33-20250813, Paresh Bhagat wrote:
>>> AM62D2 EVM has S28HS512T 64 MiB Octal SPI NOR flash connected to the
>>> OSPI interface. Add support for the flash and describe the partition
>>> information as per bootloader.
>>>
>>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>

Thanks for the patch.

>>> ---
>>> Boot logs
>>> https://gist.github.com/paresh-bhagat12/262d8c64e692d22c4e48363d246fb083
>> We already have issues with am62d that needs fixing:
>> cpu cpu0: _of_add_opp_table_v2: no supported OPPs
>> cpu cpu0: OPP table can't be empty
>>
>> and
>>
>> Please enable defconfig for this device
>> arch/arm64/boot/dts/ti/k3-am62d2-evm.dts:       typec_pd0: usb-power- 
>> controller@3f {
>>
>> We can look at adding features for am62d after the above are done.
> 
> 
> The above fixes are now posted in upstream.

The patch seems fine wrt the SPI changes made. Good to go!

Reviewed-by: Santhosh Kumar K <s-k6@ti.com>

> 
> Thanks
>>> Tech Ref Manual-https://www.ti.com/lit/pdf/sprujd4
>>> Schematics Link-https://www.ti.com/lit/zip/sprcal5
>>>
>>>   arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 86 ++++++++++++++++++++++++
>>>   1 file changed, 86 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/ 
>>> boot/dts/ti/k3-am62d2-evm.dts
>>> index daea18b0bc61..aa943ef52fb5 100644
>>> --- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
>>> +++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
>>> @@ -25,6 +25,7 @@ aliases {
>>>           rtc0 = &wkup_rtc0;
>>>           ethernet0 = &cpsw_port1;
>>>           ethernet1 = &cpsw_port2;
>>> +        spi0 = &ospi0;
>>>       };
>>>       chosen {
>>> @@ -367,6 +368,26 @@ usr_led_pins_default: usr-led-default-pins {
>>>               AM62DX_IOPAD(0x0244, PIN_INPUT, 7) /* (D18) 
>>> MMC1_SDWP.GPIO1_49 */
>>>           >;
>>>       };
>>> +
>>> +    ospi0_pins_default: ospi0-default-pins {
>>> +        pinctrl-single,pins = <
>>> +            AM62DX_IOPAD(0x0000, PIN_OUTPUT, 0) /* (L22) OSPI0_CLK */
>>> +            AM62DX_IOPAD(0x002c, PIN_OUTPUT, 0) /* (H21) OSPI0_CSn0 */
>>> +            AM62DX_IOPAD(0x0030, PIN_OUTPUT, 0) /* (G19) OSPI0_CSn1 */
>>> +            AM62DX_IOPAD(0x0034, PIN_OUTPUT, 0) /* (K20) OSPI0_CSn2 */
>>> +            AM62DX_IOPAD(0x0038, PIN_OUTPUT, 0) /* (G20) OSPI0_CSn3 */
>>> +            AM62DX_IOPAD(0x000c, PIN_INPUT, 0) /* (J21) OSPI0_D0 */
>>> +            AM62DX_IOPAD(0x0010, PIN_INPUT, 0) /* (J18) OSPI0_D1 */
>>> +            AM62DX_IOPAD(0x0014, PIN_INPUT, 0) /* (J19) OSPI0_D2 */
>>> +            AM62DX_IOPAD(0x0018, PIN_INPUT, 0) /* (H18) OSPI0_D3 */
>>> +            AM62DX_IOPAD(0x001c, PIN_INPUT, 0) /* (K21) OSPI0_D4 */
>>> +            AM62DX_IOPAD(0x0020, PIN_INPUT, 0) /* (H19) OSPI0_D5 */
>>> +            AM62DX_IOPAD(0x0024, PIN_INPUT, 0) /* (J20) OSPI0_D6 */
>>> +            AM62DX_IOPAD(0x0028, PIN_INPUT, 0) /* (J22) OSPI0_D7 */
>>> +            AM62DX_IOPAD(0x0008, PIN_INPUT, 0) /* (L21) OSPI0_DQS */
>>> +        >;
>>> +        bootph-all;
>>> +    };
>>>   };
>>>   &mcu_gpio0 {
>>> @@ -613,3 +634,68 @@ &c7x_0 {
>>>   &main_rti4 {
>>>       status = "reserved";
>>>   };
>>> +
>>> +&fss {
>>> +    status = "okay";
>>> +};
>>> +
>>> +&ospi0 {
>>> +    pinctrl-names = "default";
>>> +    pinctrl-0 = <&ospi0_pins_default>;
>>> +    status = "okay";
>>> +
>>> +    flash@0{
>>> +        compatible = "jedec,spi-nor";
>>> +        reg = <0x0>;
>>> +        spi-tx-bus-width = <8>;
>>> +        spi-rx-bus-width = <8>;
>>> +        spi-max-frequency = <25000000>;
>>> +        cdns,tshsl-ns = <60>;
>>> +        cdns,tsd2d-ns = <60>;
>>> +        cdns,tchsh-ns = <60>;
>>> +        cdns,tslch-ns = <60>;
>>> +        cdns,read-delay = <4>;
>>> +
>>> +        partitions {
>>> +            compatible = "fixed-partitions";
>>> +            #address-cells = <1>;
>>> +            #size-cells = <1>;
>>> +
>>> +            partition@0 {
>>> +                label = "ospi.tiboot3";
>>> +                reg = <0x0 0x80000>;
>>> +            };
>>> +
>>> +            partition@80000 {
>>> +                label = "ospi.tispl";
>>> +                reg = <0x80000 0x200000>;
>>> +            };
>>> +
>>> +            partition@280000 {
>>> +                label = "ospi.u-boot";
>>> +                reg = <0x280000 0x400000>;
>>> +            };
>>> +
>>> +            partition@680000 {
>>> +                label = "ospi.env";
>>> +                reg = <0x680000 0x40000>;
>>> +            };
>>> +
>>> +            partition@6c0000 {
>>> +                label = "ospi.env.backup";
>>> +                reg = <0x6c0000 0x40000>;
>>> +            };
>>> +
>>> +            partition@800000 {
>>> +                label = "ospi.rootfs";
>>> +                reg = <0x800000 0x37c0000>;
>>> +            };
>>> +
>>> +            partition@3fc0000 {
>>> +                label = "ospi.phypattern";
>>> +                reg = <0x3fc0000 0x40000>;
>>> +                bootph-all;
>>> +            };
>>> +        };
>>> +    };
>>> +};
>>> -- 
>>> 2.34.1
>>>
>>>


