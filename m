Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03BAC36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 10:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eI7gPyQYRsRBMrw/lvACQBiN3JsT2YD+lfGEOC2JxYU=; b=5FiZBKsaBWiyuOZKmZTogp762+
	QXlmaDWS7imw37IkzrStlELXfT/pOAyA+6OaLlQ++DU+lRM0OycgngCGy5lZnn2BI+enKoVjVnQc6
	KMkHwHYkldzz7if0z1AJdssYoeoKgM0EMC86Eh1bi02HzTXslb91/HUB74EG/7qEjMjACVmeZJQ11
	sXdbHAzY2oc/Z23m8Wbsvp95W9Ulp6mcS4CZ1nKTsdkOwM9Db1OKgT9uBEpZBtyfbTFTnq2IDCgB7
	W7lKXcSvhTPEWWY9Bw/KQpkzrEbgesgISGYhIUB/DlD4vVvOOnFWt4XmdQMp6KioWVFtAtZDHd9EK
	IUsKceNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twf9m-00000002qNq-2ozB;
	Mon, 24 Mar 2025 10:35:46 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twf81-00000002qCp-2sMS;
	Mon, 24 Mar 2025 10:33:59 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1742812433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eI7gPyQYRsRBMrw/lvACQBiN3JsT2YD+lfGEOC2JxYU=;
	b=tzBmpe6y4C9C1mC187Q2hITuYbsywdQEk9ISEptzHhtaaMWMEXT9wyejk/K91P70RuDFt0
	yh7LOLNj0Jig/SUKDRxlqgdmqpmo0oMmeKIK+xwWSbNxWJvDZzxuDLw3c6wLJ/E1WGOGGb
	pD3aBw//mpNMo6fV55zHDAWQde+ldynndHLyeALFMMmKhlOk4AcDxIJegLTXfDXjcvBPbf
	8y2M8OTgqv4oGnaNXRnoe31cVUh3p/UVivt/saEZKVSXm6SlwMWeDd/yvLXwB55zljrROj
	ibghbX+nD1lzry+Y3YGz+tUT2YxukwHAEsvzw5tGERCd5xpDHei8z2x4TjtOBg==
Date: Mon, 24 Mar 2025 11:33:53 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: linux-rockchip@lists.infradead.org, heiko@sntech.de,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, stable@vger.kernel.org, Alexey Charkov
 <alchark@gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Remove overdrive-mode OPPs from
 RK3588J SoC dtsi
In-Reply-To: <170e4d8d-33ca-4c53-9ae7-ca9d674540a9@cherry.de>
References: <f929da061de35925ea591c969f985430e23c4a7e.1742526811.git.dsimic@manjaro.org>
 <71b7c81b-6a4e-442b-a661-04d63639962a@cherry.de>
 <960c038ad9f7b83fe14d0ded388b42f7@manjaro.org>
 <2ece5cca-50ea-4ec9-927e-e757c9c10c18@cherry.de>
 <4d25c9af4380598b35a0d55e7c77ac3d@manjaro.org>
 <170e4d8d-33ca-4c53-9ae7-ca9d674540a9@cherry.de>
Message-ID: <17b55e889838f2c989bd0efc6528801b@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_033358_052047_AB086D01 
X-CRM114-Status: GOOD (  11.36  )
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

On 2025-03-24 11:20, Quentin Schulz wrote:
> On 3/24/25 10:53 AM, Dragan Simic wrote:
>> On 2025-03-24 10:23, Quentin Schulz wrote:
>>> On 3/23/25 11:19 AM, Dragan Simic wrote:
>>>> On 2025-03-21 10:53, Quentin Schulz wrote:
>>>>> On 3/21/25 4:28 AM, Dragan Simic wrote:
>>>>>> The differences in the vendor-approved CPU and GPU OPPs for the 
>>>>>> standard
>>>>>> Rockchip RK3588 variant [1] and the industrial Rockchip RK3588J 
>>>>>> variant [2]
>>>>>> come from the latter, presumably, supporting an extended 
>>>>>> temperature range
>>>>>> that's usually associated with industrial applications, despite 
>>>>>> the two SoC
>>>>>> variant datasheets specifying the same upper limit for the allowed 
>>>>>> ambient
>>>>>> temperature for both variants.  However, the lower temperature 
>>>>>> limit is
>>>>> 
>>>>> RK3588 is rated for 0-80°C, RK3588J for -40-85°C, c.f. Recommended
>>>>> Operating Conditions, Table 3-2, Ambient Operating Temperature.
>>>> 
>>>> Indeed, which is why I specifically wrote "specifying the same upper
>>>> limit", because having a lower negative temperature limit could 
>>>> hardly
>>>> put the RK3588J in danger of overheating or running hotter. :)
>>> 
>>> """
>>> despite the two SoC variant datasheets specifying the same upper 
>>> limit
>>> for the allowed temperature for both variants
>>> """
>>> 
>>> is incorrect. The whole range is different, yes it's only a 5°C
>>> difference for the upper limit, but they still are different.
>> 
>> I just commented on this separately, with a couple of datasheet
>> screenshots, before I saw your latest response.  Please, have
>> a look at that message.
> 
> I see, I had a v1.3 datasheet opened:
> 
> https://github.com/FanX-Tek/rk3588-TRM-and-Datasheet/blob/master/Rockchip_RK3588_Datasheet_V1.3-20220328.pdf

Yup, the v1.6 of the RK3588 datasheet increased the upper ambient
temperature limit from 80 to 85 oC.

> Interestingly, it seems the RK3588S (still?) has a smaller operating 
> range:
> 
> https://www.armboard.cn/download/Rockchip_RK3588S_Datasheet_V1.6-20240821.pdf

Oh, that's quite interesting, I had the v1.5 as the newest version.
The v1.6 of the RK3588S datasheet actually lowered the upper ambient
temperature limit from 85 down to 80 oC.

