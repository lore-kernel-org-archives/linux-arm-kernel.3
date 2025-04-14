Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD50C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 11:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GJ15JUHCXfYbdtaJeMwKFzeg6ws2+tweG0+4stR4TQI=; b=ezZMBYTFGMsITiUI8Vgzlu0wvh
	zl2CiA6RGVHZsvwU2TdGMzM/ymalOhf5RfFCeRl9Rrf5G3wxm/QRI6Hdus8sEhlxPnq+9InyKS0dF
	MjxGj1h3N6H6ppEBKgiY0gzaiFWlGuhH6rHnzK15Zl0i83IlzfD1dHJo1CExpVCxYjNU2Tua0y1wM
	NizcuPeL50k/L3NXJHodSCGuI/5jRtyk5kDn1xhAKnevHFZhhkbjbsAKTBZuTnPy5RpPE58uxHfLr
	lbfOhOTzcnnSx5ct2xmQmGscwBZDwE0yRNHPTVgQAAyFpktHqY2RmzUtZZwjuEYWM1adPGYQJTn6E
	M7STv+mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4HYL-00000001diX-3Pf1;
	Mon, 14 Apr 2025 11:00:37 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4HDX-00000001a1e-3wuY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 10:39:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GJ15JUHCXfYbdtaJeMwKFzeg6ws2+tweG0+4stR4TQI=; b=irPMeEc0lLDwmLPSFjfwDUUpPK
	Y3tKexLT3gUSq6zpx6zjfEKxfyDDcgLgAj/xb7GDhG/6UMDENF4sHSZybs1e1RcY5dqXF2epEeihG
	LDfZ5UzhN/EAxviBZHqTtUd21a1Wqlm9jalJdAnFUytadOFppuLJb0/hffmR7Cba2aAxJS3aIE4bP
	jZVMMpibz1NgWteF1WFBQAyrmyUonBqjkGQ2Z2jGegxqjwZ3Z4wTfhpP/4/fakrHfanjgCa3eZWK4
	UyjsppPH4atzpmA2QAiCOPE+6NpLWk0J1mrQ4QnhrZkiE0I8hlcyyExnBeDIsOxZ2wSqO9hM4zpO/
	4jJMxIGQ==;
Received: from [89.212.21.243] (port=36324 helo=[192.168.69.116])
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u4HDU-00DwF3-2f;
	Mon, 14 Apr 2025 12:39:04 +0200
Message-ID: <ff6320e5-1c83-4cab-9cfe-4df6877952b8@norik.com>
Date: Mon, 14 Apr 2025 12:39:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/13] arm64: dts: freescale: imx93-phyboard-segin: Drop
 eMMC no-1-8-v flag
To: Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 upstream@lists.phytec.de
References: <20250410090251.1103979-1-primoz.fiser@norik.com>
 <20250410090251.1103979-7-primoz.fiser@norik.com>
 <254efe04-09c6-4225-a869-126026642091@gmx.net>
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
In-Reply-To: <254efe04-09c6-4225-a869-126026642091@gmx.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-CRM114-CacheID: sfid-20250414_033908_447393_1A06E706 
X-CRM114-Status: UNSURE (   7.38  )
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

Hi Stefan,

On 12. 04. 25 18:23, Stefan Wahren wrote:
> Hi Primoz,
> 
> Am 10.04.25 um 11:02 schrieb Primoz Fiser:
>> Drop redundant 'no-1-8-v' flag from usdhc1 (eMMC) node. Flag is now set
>> by default in the SOM include file (imx93-phycore-som.dtsi).
>>
>> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> i think, Patch 5 and this one should be squashed together.

I intentionally split these series into SoM and board related patches.

I see no benefit in squashing #5 and #6.

Also, I already got Frank's Reviewed-by tag on this patch.

Thus I would like to keep them separate as is.

Thanks,
BR,
Primoz

> 
> Regards
>> ---
>>   arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts | 5 -----
>>   1 file changed, 5 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
>> b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
>> index 85fb188b057f..902b523fc92c 100644
>> --- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
>> +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
>> @@ -40,11 +40,6 @@ &lpuart1 {
>>       status = "okay";
>>   };
>>
>> -/* eMMC */
>> -&usdhc1 {
>> -    no-1-8-v;
>> -};
>> -
>>   /* SD-Card */
>>   &usdhc2 {
>>       pinctrl-names = "default", "state_100mhz", "state_200mhz";
> 

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

