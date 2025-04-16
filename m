Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B77AC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 12:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kNruuEmDcpxkAaSrVP2dAxG3f4Hgh2UoA0dC+fm5Ogg=; b=j8B8+A7s2yP6D/0LDYkoVXOgrf
	HcRdlEtymFx589SBDR9iyOkxPbJxfqhWNnAyJYAiD0cvNNT4DPCKdszWn5yuazfOE3PyFe0lb8RFp
	MviCrF+/q8OHUC6caiwLejE3uIvX2sXi3GU+99uk3cQ4d6IcoB0qmzpNj8A5wT8r6Qsdfty7aM4C3
	DBQJgQgFVgBdbaM8ItdzKb40zVwiwQHmrSAxsCFUjPReLLocIGvVm8cQYer98nKKiJwjl7lcXP3ui
	L5AsZ0kyZTLsor6cO6W5VpJtwX0X8p+W5E1wSs+MIze0Lc8Cnb7FS0whBRoMiyL8Tnk1eUMz2/lpg
	A3wxxkQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u524C-00000009Y9U-3LCF;
	Wed, 16 Apr 2025 12:40:36 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5223-00000009Xo0-2Ce1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 12:38:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kNruuEmDcpxkAaSrVP2dAxG3f4Hgh2UoA0dC+fm5Ogg=; b=kKrXgX9GtiB1kNAFldw8QAL8pB
	pp7RskPuEm/ge1oeuMyM4KJjYC0zogZ9RinyIVoeCNQoh4infG/TVIadUQdw9jASBWNon2N6RRoyE
	rbpOnd6zfa5Fr0QoSOhZ0z+kVMT9+LK0CwkUJBJdLiy4MMLX8kGiZQ+j8iEn501LkhAwUxlrh2iYS
	pOBQb8OVkLo9+0ZdC5IGVNcdqyuYjIq8i6v5XC1SS91QxVztJO+jbxy9hxgOfU2Uts6jP/VTr9jhI
	HDrc26JvvdXxKlkfblDUbbJQ4TrBaNfzxIM6qlT/wmeys0MMKwp7rjO/4FXAYshUSxfMxKUXSbGrB
	EA/i+fiQ==;
Received: from [89.212.21.243] (port=55700 helo=[192.168.69.116])
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u521y-003yzC-1s;
	Wed, 16 Apr 2025 14:38:18 +0200
Message-ID: <46fa1d36-ec90-49b9-b352-1a3171f78d11@norik.com>
Date: Wed, 16 Apr 2025 14:38:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/15] arm64: dts: freescale: imx93-phyboard-segin: Fix
 for ERR052021 errata
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, upstream@lists.phytec.de
References: <20250415043311.3385835-1-primoz.fiser@norik.com>
 <20250415043311.3385835-10-primoz.fiser@norik.com>
 <Z/6ofNXe5Mu4skh7@lizhi-Precision-Tower-5810>
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
In-Reply-To: <Z/6ofNXe5Mu4skh7@lizhi-Precision-Tower-5810>
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
X-CRM114-CacheID: sfid-20250416_053824_041146_E533CC36 
X-CRM114-Status: GOOD (  16.48  )
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

On 15. 04. 25 20:42, Frank Li wrote:
> On Tue, Apr 15, 2025 at 06:33:05AM +0200, Primoz Fiser wrote:
> 
> subject should be
> 
> "set SION bit for CMD/DATA to fix ERR052021 errata"
> 

OK I can fix this in v3.

>> Implement fix for i.MX 93 silicon errata ERR052021:
>>
>> ERR052021 uSDHC: Sometimes uSDHC does not work under VDD_SOC low
>> 		 drive mode and nominal mode
>> Description:
>> uSDHC PADs have one integration issue.
>> When CMD/DATA lines direction change from output to input, uSDHC
>> controller begin sampling, the integration issue will make input
>> enable signal from uSDHC propagated to the PAD with a long delay,
>> thus the new input value on the pad comes to uSDHC lately. The
>> uSDHC sampled the old input value and the sampling result is wrong.
>>
> 
> nit:
>   add 2 char indention

OK, will add.

BR,
Primoz

> 
>> Workaround:
>> Set uSDHC CMD/DATA PADs iomux register SION bit to 1, then PADs will
>> propagate input to uSDHC with no delay, so correct value is sampled.
> 
> the same here
> 
>>
>> This issue will wrongly trigger the start bit when sample the USDHC
>> command response, cause the USDHC trigger command CRC/index/endbit
>> error, which will finally impact the tuning pass window, espically
>> will impact the standard tuning logic, and can't find a correct delay
>> cell to get the best timing.
>>
>> Based on commit bb89601282fc ("arm64: dts: imx93-11x11-evk: set SION for
>> cmd and data pad of USDHC").
>>
>> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
>> ---
>> Changes in v2:
>> - new patch in v2 (split from #8)
>>
>>  .../dts/freescale/imx93-phyboard-segin.dts    | 37 ++++++++++---------
>>  1 file changed, 20 insertions(+), 17 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
>> index 541297052b62..525f52789f8b 100644
>> --- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
>> +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
>> @@ -75,39 +75,42 @@ MX93_PAD_SD2_CD_B__GPIO3_IO00		0x31e
>>  		>;
>>  	};
>>
>> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */
>>  	pinctrl_usdhc2_default: usdhc2grp {
>>  		fsl,pins = <
>>  			MX93_PAD_SD2_CLK__USDHC2_CLK		0x159e
>> -			MX93_PAD_SD2_CMD__USDHC2_CMD		0x139e
>> -			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x138e
>> -			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x138e
>> -			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x138e
>> -			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x139e
>> +			MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000139e
>> +			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x4000138e
>> +			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x4000138e
>> +			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x4000138e
>> +			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x4000139e
>>  			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
>>  		>;
>>  	};
>>
>> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */
>>  	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
>>  		fsl,pins = <
>>  			MX93_PAD_SD2_CLK__USDHC2_CLK		0x159e
>> -			MX93_PAD_SD2_CMD__USDHC2_CMD            0x139e
>> -			MX93_PAD_SD2_DATA0__USDHC2_DATA0        0x138e
>> -			MX93_PAD_SD2_DATA1__USDHC2_DATA1        0x138e
>> -			MX93_PAD_SD2_DATA2__USDHC2_DATA2        0x139e
>> -			MX93_PAD_SD2_DATA3__USDHC2_DATA3        0x139e
>> -			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT    0x51e
>> +			MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000139e
>> +			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x4000138e
>> +			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x4000138e
>> +			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x4000139e
>> +			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x4000139e
>> +			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
>>  		>;
>>  	};
>>
>> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */
>>  	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
>>  		fsl,pins = <
>>  			MX93_PAD_SD2_CLK__USDHC2_CLK		0x158e
>> -			MX93_PAD_SD2_CMD__USDHC2_CMD            0x139e
>> -			MX93_PAD_SD2_DATA0__USDHC2_DATA0        0x139e
>> -			MX93_PAD_SD2_DATA1__USDHC2_DATA1        0x139e
>> -			MX93_PAD_SD2_DATA2__USDHC2_DATA2        0x139e
>> -			MX93_PAD_SD2_DATA3__USDHC2_DATA3        0x139e
>> -			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT    0x51e
>> +			MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000139e
>> +			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x4000139e
>> +			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x4000139e
>> +			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x4000139e
>> +			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x4000139e
>> +			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
>>  		>;
>>  	};
>>  };
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

