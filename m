Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7AFF532E7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 23:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6hkqmn5/Lm/RJ1zH+MMrxFpBSNBqxslxfAIu548ZS6o=; b=1I6CDKlUHQQlPohTbCcn4rtdWg
	pm5i8ZOVj20RPkLOJlry+AyaXUA7YpLvetH/3shDIacRfDkWzVoNquXfRME4Ky/IUoQotgu5BNGou
	QVhzz9mSFS/iia3J67yBCnYGX5jsGNj8ICDGuMbzHTofYISfWEIbNh8n4KJfVTIX/5JM94mCAXsdb
	3EbUOK6UgSPdtir8IWP296V3AOP7DfPmw9QFAVHKCz9MgmOv1ktr9qtFaI+oauY9AJxWPQ5DmDuwj
	YSHRNFJnfvGT6V7jn8ZzsCuaNzzAo170xd4FeIDNqPSBVMLb91bjrexLz3WAMPiJXnsrEVst1AVpf
	mEnG/dDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Auf-00000002L3k-3fSD;
	Tue, 24 Mar 2026 23:11:53 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Aud-00000002L3O-0buR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 23:11:52 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 15605112263;
	Wed, 25 Mar 2026 00:11:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1774393908;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=6hkqmn5/Lm/RJ1zH+MMrxFpBSNBqxslxfAIu548ZS6o=;
	b=dMPkaKvpgdhIyAKyu5nYxwRdnlq3N08T9loLdL6JOo/n7tqhieKPGvR74HmmvbEvTH1Px3
	UrO2Xca6vycanpXrFwcbi1VDsFi1IOxCDf/BljTZHNJCUuk6uw73z0ttCZiALwznufbr/5
	U4VIaOt5Yu9v6o5XI9Eh4ZWdyrPFD/gTQMxxa8vgvRRgmy407PInjQ7GEEQ33x5BnQIVl4
	6IuDYHrF+gKQ761WAFV0CnyGbuL72ws6xInX/fo/y6BKEQI7KAuA0U8fOFDqELKJEhpezz
	vjhsYM1ldlLjk0p9PThqSCfkFZDSExQVAefZDiWfJTKyPV5a95ydouYXUeKQww==
Message-ID: <e580bc1d-96ce-43c5-880f-bb8ee31fda28@nabladev.com>
Date: Tue, 24 Mar 2026 22:43:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: imx8mp: Add DT overlays for DH i.MX8M Plus
 DHCOM SoM and boards
To: Frank Li <Frank.li@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev, kernel@dh-electronics.com,
 linux-kernel@vger.kernel.org
References: <20260312232500.197096-1-marex@nabladev.com>
 <acK1YU6M5FGK3qM2@lizhi-Precision-Tower-5810>
 <e5d7ca6a-fdd3-4aca-aa1f-1d35bc9c0119@nabladev.com>
 <acLtV4Vwpbj9vpE3@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <acLtV4Vwpbj9vpE3@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_161151_417705_122B4B62 
X-CRM114-Status: GOOD (  18.14  )
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

On 3/24/26 9:00 PM, Frank Li wrote:
> On Tue, Mar 24, 2026 at 06:39:10PM +0100, Marek Vasut wrote:
>> On 3/24/26 5:01 PM, Frank Li wrote:
>>> On Fri, Mar 13, 2026 at 12:24:04AM +0100, Marek Vasut wrote:
>>> ...
>>>
>>>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-ch101olhlwh.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-ch101olhlwh.dtsi
>>>> new file mode 100644
>>>> index 0000000000000..534737363c9f0
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-ch101olhlwh.dtsi
>>>> @@ -0,0 +1,42 @@
>>>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>>>> +/*
>>>> + * Copyright (C) 2022 Marek Vasut
>>>
>>> 2026?
>>
>> That was the original copyright year when this was implemented, but I can
>> update it to 2022-2026 ?
> 
> Okay, you upstream this year.

Right, V2 does extend the copyrights until this year.

>>>> + */
>>>> +
>>>> +&display_bl {
>>>> +	pwms = <&pwm1 0 5000000 0>;
>>>> +};
>>>> +
>>>> +&DH_OVERLAY_PANEL_I2C_BUS {
>>>
>>> why upcase for label, generally it should be lower case
>>
>> Because this label is really a macro , please read on.
>>
>>>> +	#address-cells = <1>;
>>>> +	#size-cells = <0>;
>>>> +
>>>> +	touchscreen@41 {
>>>> +		compatible = "ilitek,ili251x";
>>>> +		pinctrl-0 = <DH_OVERLAY_PANEL_I2C_TOUCHSCREEN_PINCTRL>;
>>>> +		pinctrl-names = "default";
>>>> +		reg = <0x41>;
>>>
>>> reg should second property,  please dt-format for new dts files.
>>> check others
>> What is "dt-format" ? Linux kernel source tree, even current next, does not
>> mention such a tool . I did run schema check and checkpatch on these
>> patches. obv.
> 
> I send out at many place, https://github.com/lznuaa/dt-format
> I write small tools to detect and fix node and property order problem,
> it may be buggy.
> 
> These node order problem is easy to detected and fix by tools to save
> review cycle and focus on the important stuff.
Maybe "make dtbs_check" target could include this tool , to make people 
aware of it ?

