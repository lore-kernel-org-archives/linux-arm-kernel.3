Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B407EC71143
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 18:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r3EVnRbmSMlgRrDXB3H2BP/1li0w1Wem69SzKRryKtY=; b=11bGtLm8ceHS9TABK6SBBFqaAP
	81swcH15ZFuVDpLYeI5TRbq2ms7mlMP5E4Wy0ANbxYHd+xbL5XVtKrzBgk2EZF7YqtUaEEEriGjtT
	48DR08RoeMRMlGTUthH1BcukY+Kkd4SF4GLIEYxYy92laaMhJ3295eKLfSOOTJYx40NWhCw0a+XUR
	CLWOPqoJ8T+2R/nPCBDwsWO7JF9+xWn9dcmeHJFGIKViPs51OLpCDcdt1DR9U2imAnH/rd8xpcbYx
	3bNfeVDc+CnV9kIGt8zDztFSdt2hycGK5pLoXGVWkIWhTMX6Q6fUYyEUSY2HJ1uDbuNuEm3NgGftK
	IjT/d69w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPPkx-0000000Ao2P-194X;
	Wed, 11 Jun 2025 18:00:59 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMLD-0000000A5Ug-2bDH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 14:22:13 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55BDrZjD022309;
	Wed, 11 Jun 2025 16:21:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	r3EVnRbmSMlgRrDXB3H2BP/1li0w1Wem69SzKRryKtY=; b=slImy+QRerHTh1HU
	DGp3sqBUjbpbzZCKMOaa3BESUZhhR2hcTAY6+HsBb5ffnGMuxumTknxTMo28yi9K
	mu0Zu+nz6c2ycnQlXEUWXBCWWZu8BIlTHXY4RDdqQLZ8e3tD7av+vd5d7ifycU6V
	J5NjDzwHTFhIYAPnlbRYdZ2QwSDeaM0/NhpbblmhOPGD/Gf8Uc6xEgUl2xV6PK8x
	zDhf7yFiaaKt3YaTmx0+fEH+agbWtBF4FSKjTCmYeMSt8Co98XhPqY3sAPixCd0J
	jgzt3YYac9fOvo66CPMoRkyeXwRq5v7xrV/2M+JNBI1MjpHknsMhFC7WcXZlbV3x
	LE2vVQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cs2u085-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 16:21:52 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AE89940059;
	Wed, 11 Jun 2025 16:20:45 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B159DB23F16;
	Wed, 11 Jun 2025 16:08:27 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 16:08:27 +0200
Message-ID: <2865ab3a-1c20-4951-8132-4be98d73d70e@foss.st.com>
Date: Wed, 11 Jun 2025 16:08:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] ARM: dts: stm32: add Hardware debug port (HDP) on
 stm32mp13
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250523-hdp-upstream-v3-0-bd6ca199466a@foss.st.com>
 <20250523-hdp-upstream-v3-5-bd6ca199466a@foss.st.com>
 <5b7a2102-ff68-4aab-a88d-0c4f9195ef95@kernel.org>
 <3c868c4b-8a0e-44b5-9d6e-3a0526d9deeb@foss.st.com>
 <3ba588ed-1614-4877-b6fc-b5aa853b8c2e@kernel.org>
 <714ad17d-53f1-4703-8e13-61c290a8da89@foss.st.com>
 <7000f63e-5e68-465d-9d7f-1a6ca0524222@kernel.org>
 <a49d0af2-07b7-4f51-941b-fa25b2879720@foss.st.com>
 <42a0b7ab-d85d-4d52-a263-4a4648c7ff05@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <42a0b7ab-d85d-4d52-a263-4a4648c7ff05@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_072211_948850_AC663BF9 
X-CRM114-Status: GOOD (  26.94  )
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

On 6/11/25 08:35, Krzysztof Kozlowski wrote:
> On 10/06/2025 15:33, Clement LE GOFFIC wrote:
>> On 6/10/25 14:38, Krzysztof Kozlowski wrote:
>>> On 10/06/2025 14:02, Clement LE GOFFIC wrote:
>>>> On 5/29/25 11:01, Krzysztof Kozlowski wrote:
>>>>> On 28/05/2025 14:14, Clement LE GOFFIC wrote:
>>>>>>>
>>>>>>>> +		};
>>>>>>>> +
>>>>>>>> +		hdp: pinctrl@5002a000 {
>>>>>>>> +			compatible = "st,stm32mp131-hdp";
>>>>>>>> +			reg = <0x5002a000 0x400>;
>>>>>>>> +			clocks = <&rcc HDP>;
>>>>>>>>      			status = "disabled";
>>>>>>>
>>>>>>> Why are you disabling it? What is missing?
>>>>>>
>>>>>> Nothing is missing just disabled by default.
>>>>>> The node is then enabled when needed in board's dts file.
>>>>> Nodes should not be disabled by default if they are complete. That's why
>>>>> I asked what is missing. Drop.
>>>>
>>>> Hi Krzysztof, OK I better understand now.
>>>> So yes the 'pinctrl-*' properties which are board dependent are lacking.
>>>
>>> These are not properties of this node.
>>
>> Does this mean I should add 'pinctrl-*' properties in bindings yaml file ?
>> I don't get it..
> 
> These properties have no meaning here, so the hardware description is
> complete. You claim that you miss them thus device is incomplete is just
> not correct: these properties do not belong here! They belong to the
> board but even there they are totally optional. Why would they be a
> required resource?
> 
> To remind: we talk here ONLY about required resources.

Yes, 'pinctrl-*' properties belongs to the board and are not required.
So nothing is missing.

This hdp node in the SoC dtsi file can be enabled by default.
But the hdp driver will probe and do nothing because without the 
'pinctrl-*' properties from the board files it would not be able to 
access to any pin.
I consider enabling this driver by default in SoC dtsi file as just 
increasing the boot time on "every" board.
It's the board dts that requires the hdp and provides the 'pinctrl-*' 
properties to connect the hdp to some SoC pin and then to some signal on 
the board. For me it's natural to have the status okay only in the board 
dts file.

>>
>>>>
>>>> In the last patch of my serie I add them (only for stm32mp157f-dk2) but
>>>> keep it disabled because the pin is on an external connector (the
>>>> Arduino connector of the board).
>>>> This prevent any issue with a possible connected module.
>>>
>>> Not relevant. Pin control for connector are board specific, but pinctrl
>>> SoC part is SoC.
>>
>> I think we don't understand each other here too. I don't understand the
>> end of your sentence "pinctrl SoC part is SoC".
> 
> Please read first how DTS is organized.
> 
> The pin controller device is part of SoC not part of a board.
> 
> Pins configuration for devices on the board are not part of the SoC.
> What is not clear here? We talk here in terms how DTS is supposed to be
> organized.

Now everything is clear, you want me to just set status enable in soc 
dtsi file but I disagree, keep discussing.

> 
>>
>> Maybe some informations that could help:
>> The 'pinctrl-*' properties are used in the HDP case to select the
>> internal signal to output AND the alternate function on the pin to
>> output the HDP function.
> 
> We all know this.

Ok fine

Best regards,

Clément

> 
>>
>>> Best regards,
>>> Krzysztof
>>
> 
> 
> Best regards,
> Krzysztof


