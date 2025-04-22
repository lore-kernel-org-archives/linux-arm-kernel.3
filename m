Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E43C369D7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 20:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Te7Gv5UjpurtX8eYF0wNNRibtVhqh8MFhbmu5ug5EmA=; b=Boz/XO6DlGnCtJHh+p7YyW0Jrg
	NMY8NMMcRwcBg42/KKSK59EYNMZyJ0kPGm+KcHnu3eid4iiZkFAlHUZ/w/1iqmKwqDzMxbfFFOnQZ
	iUv9wSfMRGX0WqrG4cp6gWawDSzm9MRoU7HOd6bAlIMhc1iH1W03+JWtp8hawOsV9NsvMJ5TalIeU
	NdCNEKNRdny3EaxPmw3D4pbVkSrQs7Ed3KheuJg6jIXvTZ6GyMcEk3wI/x9Lcq2KUiHgixp/7VUo2
	tkx+GAmUhU9e/2v+2alARnkHW2Wju8tLis1r5DglNhZrzec8VFru4P7OW+72tApUydGMCiNMIg8Qw
	l+vpgaCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Kb7-00000008VFZ-0qgB;
	Tue, 22 Apr 2025 20:52:05 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7HHA-000000080a9-2kr7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 17:19:18 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53MHJB5v1288307
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 12:19:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745342351;
	bh=Te7Gv5UjpurtX8eYF0wNNRibtVhqh8MFhbmu5ug5EmA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=NraC96FRzJ/kO7IRCGeefUAGB3Y8kNOkcOmDIYfXNQMf/REd+v4DrH9Z7I+UPfZVv
	 iOiUcJ166FOAg2prr5VmStS9bhC0QN47E3xxgjSZ/TJ/cS1S3mcX+hGxW2yQtbAseJ
	 sfslF+f3c2pYXqUTFYzPCRPTMmJJYJv5nL18l/VU=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53MHJBK0076493
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 12:19:11 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 12:19:11 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 12:19:11 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53MHJ7uk089948;
	Tue, 22 Apr 2025 12:19:08 -0500
Message-ID: <2f33eb19-40b0-47be-a57f-f071b9bc9e08@ti.com>
Date: Tue, 22 Apr 2025 22:49:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] arm64: dts: ti: Add basic support for
 phyBOARD-Izar-AM68x
To: Dominik Haller <D.Haller@phytec.de>, "robh@kernel.org" <robh@kernel.org>,
        "kristo@kernel.org" <kristo@kernel.org>,
        "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "vigneshr@ti.com" <vigneshr@ti.com>, "nm@ti.com" <nm@ti.com>,
        "m-chawdhry@ti.com" <m-chawdhry@ti.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "upstream@lists.phytec.de"
	<upstream@lists.phytec.de>,
        <u-kumar1@ti.com>
References: <20250417125921.100580-1-d.haller@phytec.de>
 <20250417125921.100580-2-d.haller@phytec.de>
 <385e8f6a-6f25-4729-8ccc-877a551a3e9b@ti.com>
 <e1e2e4c0d831f917728d3a4245d8e18ae1186288.camel@phytec.de>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <e1e2e4c0d831f917728d3a4245d8e18ae1186288.camel@phytec.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_101916_790047_CBBA92A5 
X-CRM114-Status: GOOD (  18.27  )
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

Hi Dominik,


On 4/22/2025 9:14 PM, Dominik Haller wrote:
> On Sun, 2025-04-20 at 10:08 +0530, Kumar, Udit wrote:
>> Hello Dominik,
>>
>> Thanks for patch.
>>
>> Few minor feedback
> Hello Udit,
>
> thanks for the feedback.
>> On 4/17/2025 6:29 PM, Dominik Haller wrote:
>>> The phyCORE-AM68x/TDA4x [1] is a SoM (System on Module) featuring
>>> TI's
>>> AM68x/TDA4x SoC. It can be used in combination with different
>>> carrier
>>> boards. This module can come with different sizes and models for
>>> DDR,
>>> eMMC, SPI NOR Flash and various SoCs from the AM68x/TDA4x (J721S2)
>>> family.
>>>
>>> A reference carrier board design, called phyBOARD-Izar is used for
>>> the
>>> phyCORE-AM68x/TDA4x development kit [2].
>>>
>>> Supported features:
>>> * Debug UART
>>> * 2x SPI NOR Flash
>>> * eMMC
>>> * 2x Ethernet
>>> * Micro SD card
>>> * I2C EEPROM
>>> * I2C RTC
>>> * 2x I2C GPIO Expander
>>> * LEDs
>>> * USB 5 Gbit/s
>>> * PCIe
>>>
>>> For more details see the product pages for the SoM and the
>>> development kit:
>>>
>>> [1]
>>> https://www.phytec.eu/en/produkte/system-on-modules/phycore-am68x-tda4x/
>>> [2]
>>> https://www.phytec.eu/en/produkte/development-kits/phyboard-izar/
>>>
>>> Signed-off-by: Dominik Haller <d.haller@phytec.de>
>>> Acked-by: Moteen Shah <m-shah@ti.com>
>>> ---
>>>
>>> Notes:
>>>       Bootlog:
>>>
>>> [..]
>>> Please have bootph-all in case, this is boot device
> I only plan to add OSPI0 as boot source in mainline U-boot since
> booting from OSPI1/QSPI won't work with the same binaries.

Ok,


>>
>>> [..]
>>> +
>>> +   wkup_uart0_pins_default: wkup-uart0-default-pins {
>>> +           pinctrl-single,pins = <
>>> +                   J721S2_WKUP_IOPAD(0x070, PIN_INPUT, 0) /*
>>> (E25) WKUP_GPIO0_6.WKUP_UART0_CTSn */
>>> +                   J721S2_WKUP_IOPAD(0xas OSPI1/QSPI needs at
>>> least a different CONFIG_SF_DEFAULT_BUS.074, PIN_OUTPUT, 0) /*
>>> (F28) WKUP_GPIO0_7.WKUP_UART0_RTSn */
>>> +                   J721S2_WKUP_IOPAD(0x048, PIN_INPUT, 0) /*
>>> (D28) WKUP_UART0_RXD */
>>> +                   J721S2_WKUP_IOPAD(0x04c, PIN_OUTPUT, 0) /*
>>> (D27) WKUP_UART0_TXD */
>>> +           >;
>>> +           bootph-all;
>> Since this is shared with TIFS fw (debug prints), then i suggest not
>> to
>> have flow control on this UART
> So if you see the flow control pins causing issues with tifs I'll drop
> them. And if you recommend setting the wkup_uart0 to "reserved" in the
> devicetree by default to begin with I'll do that too.

For debug port, often flow control is not used.

I am not sure, what use case you are targeting with wkup_uart0.

But if possible , I suggest to leave this for fw usage,

reference EVM you can refer at below

https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts#L322 



>>
>>> +   };
>>> +};
>>> [..]

