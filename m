Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB09CA0FFF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 16:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2f0pF4cOVRp5vftRAMP0k7Ja9Wy98twL5qtX3adsjD8=; b=s5hMexoAK9tgtdYHfSfahehSUI
	G0Iv65lQr3WTHbOG4/D+Pggxipv4uQYdXvtO/KTZQympF7N0+phHfxeQDwGbEt1g0KPYQ+xOCWtKW
	MXRvr91XQ2Ln6y5V6CMrI33jWuj4BzFmlW+4+/U44fOJZhVXjritomw6ejgVyoh8u25UTK5I0ZiND
	merqBROKsAhxDVXE5oJ47hPy50iuB0eIEqTNs99VQjQM7AyWRXnt3TY94Zii+jH9xPIsUxP2e1ATR
	uPcdDXY+MI/1vDiyC1+Y+RqJr2C8sQyjMqcxqyW7vCYft+wIr246Hy9CwRCQXCUCJkiKQPqRVAsep
	duLy4LXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7VL-0000000DGtd-1SiK;
	Mon, 01 Sep 2025 16:35:39 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3q3-0000000CYea-419Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 12:40:49 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 581Ceiq22313308;
	Mon, 1 Sep 2025 07:40:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756730445;
	bh=2f0pF4cOVRp5vftRAMP0k7Ja9Wy98twL5qtX3adsjD8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ErltRGBlZn4R/Qp0YST6wzboF1YcJNhSSsKAcidGkJ4SyhIyykt+CEmrnoiHWGprA
	 Ak3AoMjMdXaNnv5b0JagdddV7Qf/dQC98obYDIa/6zxh1BwNNyoAsNGVSW0nW5uMvi
	 JHIBTDbmdlGWlUAv5RGFEvaEnQmR+bRo3pzHTnFc=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 581Cei8K2728081
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 1 Sep 2025 07:40:44 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 1
 Sep 2025 07:40:44 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 1 Sep 2025 07:40:44 -0500
Received: from [10.24.68.177] (akashdeep-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.177])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 581CeeOl2237214;
	Mon, 1 Sep 2025 07:40:40 -0500
Message-ID: <9b3cd9d9-c163-47ba-b979-e1ba8ad5ccbc@ti.com>
Date: Mon, 1 Sep 2025 18:10:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: ti: k3-am62x-sk-common: Remove the unused
 config from USB1_DRVVBUS
To: Dhruva Gole <d-gole@ti.com>
CC: <vigneshr@ti.com>, <praneeth@ti.com>, <nm@ti.com>, <afd@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <vishalm@ti.com>, <sebin.francis@ti.com>
References: <20250731115631.3263798-1-a-kaur@ti.com>
 <20250731115631.3263798-3-a-kaur@ti.com>
 <20250813131530.apibc4p6t2uo5bkr@lcpd911>
Content-Language: en-US
From: Akashdeep Kaur <a-kaur@ti.com>
In-Reply-To: <20250813131530.apibc4p6t2uo5bkr@lcpd911>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_054048_093240_D57DB366 
X-CRM114-Status: GOOD (  28.22  )
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

Hi Dhruva,

On 13/08/25 18:45, Dhruva Gole wrote:
> On Jul 31, 2025 at 17:26:30 +0530, Akashdeep Kaur wrote:
>> After the SoC has entered the Deep Sleep mode, USB1 can be used to wakeup
> 
> Just leaving my comments on the commit message here since 1st patch
> seems to be pretty much the same commit message.
> 
> Let's reword this as --> Deep Sleep low power mode.
> Makes it a bit more clear.

> 
>> the SoC based on USB events triggered by USB devices. This requires that
>> the pin corresponding to the Type-A connector remains pulled up even after
>> the SoC has entered the Deep Sleep mode.
>> For that, either deep Sleep pullup can be selected or the pin can have the
> 
> Nit: Be consistent with either deep sleep, or Deep Sleep, don't mix case.
> Also, please can we talk here in terms of exactly which macros we're
> talking about? For eg. if deep sleep pullup == PIN_DS_PULLUD_ENABLE, then
> please mention that in a bracket or something for people who may not
> necessarily be aware of all these terms.
Reworded at all instances to TRM mentioned DeepSleep>
>> same configuration that it had when SoC was in active mode.
>> In order for deep sleep configuration to take effect, the deep sleep
>> control bit has to be enabled.
> 
> Please talk with some references, because not everyone will be able to
> follow what we mean by deep sleep control bit/ deep sleep configuration.
> 
>> Remove the deep sleep state configuration from USB1_DRVBUS pin as it is
>> anyways not taking effect (deep sleep control bit is not set).
>>
>> This reverts commit 527f884d2d94981016e181dcbd4c4b5bf597c0ad.
> 
> And so are you in conclusion saying that this patch is just unnecessary/
> useless? The bracket message feels to me that you are saying that if we set
> the deep sleep control bit this patch will start working as expected?
> Please can you clarify a bit on that end?
The intent was that there is no need to set the DeepSleep control bit. 
Also, if that bit is not set, then the current setting is ignored by 
hardware.
> 
>>
>> Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>
>> ---
>>   arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
>> index 13e1d36123d5..d3bed23134ca 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
>> @@ -249,7 +249,7 @@ AM62X_IOPAD(0x12c, PIN_OUTPUT, 0) /* (AD19/V15) RGMII1_TX_CTL */
>>   
>>   	main_usb1_pins_default: main-usb1-default-pins {
>>   		pinctrl-single,pins = <
>> -			AM62X_IOPAD(0x0258, PIN_OUTPUT | PIN_DS_PULLUD_ENABLE | PIN_DS_PULL_UP, 0) /* (F18/E16) USB1_DRVVBUS */
>> +			AM62X_IOPAD(0x0258, PIN_OUTPUT, 0) /* (F18/E16) USB1_DRVVBUS */
>>   		>;
>>   	};
>>   
> 
> Sorry for the long review on the commit message, but context feels like
> everything when it comes to small patches. Hence trying to make sure
> everyone understands what's being done here... :)
> 

Regards,
Akashdeep Kaur


