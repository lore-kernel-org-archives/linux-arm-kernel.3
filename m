Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E53BC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 07:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sHT/bpv7npo8FHXJF8tJgXtvhm1+caIx6CEyUhY2jac=; b=Pm2ZpyfzByBEe5j2cFJZFuZLha
	nKd684j8wpGaAgciz8+fEEt43eIpinRm4B9NsfxNeLsHFs9u1z4V2otUYTDbEGcVEioA7KaDaWyi1
	vmCriNFbkWsEX0PAp3mPYA8UQPAZs3Exa9MRTK8nK4+rG3NGiPCda8liZYVbgGPfTcJNBgj56WsCd
	QlHDdw0/NZqbKiSacbURu1SCm7XCGnkyZqC6rUt5eAkzoEYi8TG2dmT5D7/S8vYLcMvSua/8xLv6k
	xA4jkfbwLNKY+j8pn39D4cfjlM6eVfcadX9tQcpdAEkNrN8TAemYSsULnfozqIoJavXH3f4MJtJRk
	MyiZS1+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u38oQ-0000000CrUl-1EoL;
	Fri, 11 Apr 2025 07:28:30 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u38EU-0000000Cmlj-2hXR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 06:51:24 +0000
Received: from [89.212.21.243] (port=39246 helo=[192.168.69.116])
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u38ES-003Yz0-13;
	Fri, 11 Apr 2025 08:51:19 +0200
Message-ID: <cffdcd6c-88c5-43c1-9f00-d1c84af73f4c@norik.com>
Date: Fri, 11 Apr 2025 08:51:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/13] arm64: dts: freescale: imx93-phycore-som: Add eMMC
 no-1-8-v by default
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, upstream@lists.phytec.de
References: <20250410090251.1103979-1-primoz.fiser@norik.com>
 <20250410090251.1103979-6-primoz.fiser@norik.com>
 <Z/fdR2C0IRUfUv4U@lizhi-Precision-Tower-5810>
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
In-Reply-To: <Z/fdR2C0IRUfUv4U@lizhi-Precision-Tower-5810>
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
X-CRM114-CacheID: sfid-20250410_235122_842162_A880CC59 
X-CRM114-Status: UNSURE (   9.93  )
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

On 10. 04. 25 17:01, Frank Li wrote:
> On Thu, Apr 10, 2025 at 11:02:43AM +0200, Primoz Fiser wrote:
>> Add property 'no-1-8-v' by default to usdhc1 (eMMC) node. Bootloader
>> will take care of deleting the property in case SOM supports HS400 mode
>> (1.8V IO voltage feature flag has to be set in the EEPROM).
> 
> what means of EEPROM here?
> 
> Generally eMMC worked fixed voltage, why need 'no-1-8-v' here, even no
> HS400 support.

The phyCORE-i.MX93 SoM comes in two variants, one with 3.3V VDD_IO and
the other one with 1.8V VDD_IO voltage set.

The 3.3V variant can only support DDR52 mode, while 1.8V variant will
support HS400ES eMMC mode.

The information about VDD_IO option is encoded in the SoM's EEPROM. We
read EEPROM in the bootloader and clear "no-1-8-v" flag in case of 1.8V
SOM variant is detected.

In case of EEPROM error (erased or read error) the fall-back option has
to support both SoM variants, hence the "no-1-8-v" flag has to be set by
default.

BR,
Primoz



> 
> Frank
>>
>> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
>> ---
>>  arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
>> index 3d84eed33074..d6589d26c875 100644
>> --- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
>> @@ -172,6 +172,7 @@ &usdhc1 {
>>  	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
>>  	bus-width = <8>;
>>  	non-removable;
>> +	no-1-8-v;
>>  	status = "okay";
>>  };
>>
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

