Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA137C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 07:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fnXHJf9oUloZ+JbRfqZ3+0M0KDLsNQyFXiqsszUV9Mc=; b=stNGTTHrO5Ei7G2QG9K3hiv+GW
	/30JVmQxSvIRTrCInsL7RXcPIqDo3KvQ7ux1ooMexFdlBvzbY1Cb1+jQtgXuPc3fqz8T5LxzJTtPg
	n8Zx34HQL9152RGX6vJVrAuPtqFXKSRGKanFHaxM7z8yKhxjQ+R5G1FLuEg6XBILsLzVtDpnweHEZ
	Jej/JPhB+Rr2b7Fa9G/nVqnIQU/5aTZTS8YSz2pJuWcGUeJgtmIHrooPp6b8tDDszpHU0ZvCHh73t
	AUGfXgaPawrJT7na46w4qZXmf+RfhgkLiHXs/AL0sAVz6C2qUQmrYC8jHG0tO9oHxjGMUtA+0u+I8
	SZOMheuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u38j5-0000000CqeZ-40af;
	Fri, 11 Apr 2025 07:22:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u37tH-0000000Cj83-0b9a
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 11 Apr 2025 06:29:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=fnXHJf9oUloZ+JbRfqZ3+0M0KDLsNQyFXiqsszUV9Mc=; b=IMo5QCmINo6Ub+brvHBSM6pq19
	iE+DQ0MY6xijaT5TkeQyn3AVgFsICy8/WhirH+lpjKLP4epvEO4WGJRjXTwOuS/p/4d+bgB7L6oU+
	0cyqswqeuNKO1h+k29x9UtqE53hEiM10a58bw48aH5dwNGBd53xcYFou7VFFYO9oi6o31L3XyeJ9K
	YU8SMAPf3qCiCj9En3jULR6mLZ8ZR976kjXTQ2WotwOb/bqTxtVktaG++jA1hwNCSHcAdDZ7G/iPv
	NHeps1IqKyg79MkT34T4KgWNOQ4wPZg1Z1R5gDgxWS/sZU/hMktxpAwyAcRL6zJdv91znMwsUePn6
	mA0/I4Mg==;
Received: from cpanel.siel.si ([46.19.9.99])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u37tD-00000008wCE-2fV5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 06:29:25 +0000
Received: from [89.212.21.243] (port=57560 helo=[192.168.69.116])
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u37sx-003VJz-29;
	Fri, 11 Apr 2025 08:29:07 +0200
Message-ID: <d68df49c-222a-445d-b29c-f9ad962b87aa@norik.com>
Date: Fri, 11 Apr 2025 08:29:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] arm64: dts: freescale: imx93-phycore-som: Enhance
 eMMC pinctrl
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, upstream@lists.phytec.de
References: <20250410090251.1103979-1-primoz.fiser@norik.com>
 <20250410090251.1103979-5-primoz.fiser@norik.com>
 <Z/fcFPrHdI8/IBRC@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Primoz Fiser <primoz.fiser@norik.com>
Autocrypt: addr=primoz.fiser@norik.com; keydata=
 xjMEZrROOxYJKwYBBAHaRw8BAQdAADVOb5tiLVTUAC9nu/FUl4gj/+4fDLqbc3mk0Vz8riTN
 JVByaW1veiBGaXNlciA8cHJpbW96LmZpc2VyQG5vcmlrLmNvbT7CiQQTFggAMRYhBK2YFSAH
 ExsBZLCwJGoLbQEHbnBPBQJmtE47AhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQagttAQducE+T
 gAD+K4fKlIuvH75fAFwGYG/HT3F9mN64majvqJqvp3gTB9YBAL12gu+cm11m9JMyOyN0l6Os
 jStsQFghPkzBSDWSDN0NzjgEZrROPBIKKwYBBAGXVQEFAQEHQP2xtEOhbgA+rfzvvcFkV1zK
 6ym3/c/OUQObCp50BocdAwEIB8J4BBgWCAAgFiEErZgVIAcTGwFksLAkagttAQducE8FAma0
 TjwCGwwACgkQagttAQducE8ucAD9F1sXtQD4iA7Qu+SwNUAp/9x7Cqr37CSb2p6hbRmPJP8B
 AMYR91JYlFmOJ+ScPhQ8/MgFO+V6pa7K2ebk5xYqsCgA
Organization: Norik systems d.o.o.
In-Reply-To: <Z/fcFPrHdI8/IBRC@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_072924_060836_03A24DCF 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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

Hi Frank,

On 10. 04. 25 16:56, Frank Li wrote:
> On Thu, Apr 10, 2025 at 11:02:42AM +0200, Primoz Fiser wrote:
>> Improve eMMC on phyCORE-i.MX93 SOM by adding 100MHz and 200MHz pinctrl
>> modes. This enables to use eMMC at enhanced data rates (e.g. HS400).
>>
>> While at it, apply a workaround for the i.MX93 chip errata ERR052021.
>>
>> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
>> ---
>>  .../boot/dts/freescale/imx93-phycore-som.dtsi | 57 +++++++++++++++----
>>  1 file changed, 47 insertions(+), 10 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
>> index 82f680d891c2..3d84eed33074 100644
>> --- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
>> @@ -166,8 +166,10 @@ eeprom@50 {
>>
>>  /* eMMC */
>>  &usdhc1 {
>> -	pinctrl-names = "default";
>> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
>>  	pinctrl-0 = <&pinctrl_usdhc1>;
>> +	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
>> +	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
>>  	bus-width = <8>;
>>  	non-removable;
>>  	status = "okay";
>> @@ -213,18 +215,53 @@ MX93_PAD_ENET2_RD3__GPIO4_IO27		0x31e
>>  		>;
>>  	};
>>
>> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */
>>  	pinctrl_usdhc1: usdhc1grp {
>>  		fsl,pins = <
>>  			MX93_PAD_SD1_CLK__USDHC1_CLK		0x179e
>> -			MX93_PAD_SD1_CMD__USDHC1_CMD		0x1386
>> -			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x138e
>> -			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x1386
>> -			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x138e
>> -			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x1386
>> -			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x1386
>> -			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x1386
>> -			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x1386
>> -			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x1386
>> +			MX93_PAD_SD1_CMD__USDHC1_CMD		0x40001386
>> +			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x4000138e
>> +			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x40001386
>> +			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x4000138e
>> +			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x40001386
>> +			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x40001386
>> +			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x40001386
>> +			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x40001386
>> +			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x40001386
>> +			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x179e
>> +		>;
>> +	};
>> +
>> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */
>> +	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
>> +		fsl,pins = <
>> +			MX93_PAD_SD1_CLK__USDHC1_CLK		0x17be
>> +			MX93_PAD_SD1_CMD__USDHC1_CMD		0x4000139e
>> +			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x4000138e
> 
> any reason why DATA0 is difference with other one?
> 
>> +			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x4000139e
>> +			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x400013be
>> +			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x4000139e
>> +			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x4000139e
>> +			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x4000139e
>> +			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x4000139e
>> +			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x4000139e
>> +			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x179e
>> +		>;
>> +	};
>> +
>> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */
>> +	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
>> +		fsl,pins = <
>> +			MX93_PAD_SD1_CLK__USDHC1_CLK		0x17be
>> +			MX93_PAD_SD1_CMD__USDHC1_CMD		0x4000139e
>> +			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x4000139e
> 
> any reason why DATA0/DATA1 is difference with other one

Bus signal integrity envelope was measured and drive-strengths adjusted
accordingly by the PHYTEC hardware department to conform to the specs.

Values were thus determined empirically to adjust for differences in
signal impedance due to PCB layout.

BR,
Primoz

> 
> Frank
>> +			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x400013be
>> +			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x400013be
>> +			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x400013be
>> +			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x400013be
>> +			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x400013be
>> +			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x400013be
>> +			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x400013be
>>  			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x179e
>>  		>;
>>  	};
>> --
>> 2.34.1
>>

-- 
Primoz Fiser
phone: +386-41-390-545
email: primoz.fiser@norik.com
--
Norik systems d.o.o.
Your embedded software partner
Slovenia, EU
phone: +386-41-540-545
email: info@norik.com

