Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F704D116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 09:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S3kURdZsSXe6pN91I7sgh33BC3O3x51+tQtkwxRDdIY=; b=zzDpjciz8KeS105o8Nju4RGxIV
	50ghfV/DcvCls9AEmtTtSj6+dikpxG5UUjwyeUWACtGfwhFsnveBa0B9QE1Iy4pWa2KSss5a1cBtU
	lcuoGyoMHsPrCWi/Lh1JZnd4G9m+uv2R2C0w7BnFANShmLSJ3jmlt1F0AOrjLO2mPYlY8aUcowTTt
	MbTv2j4amiMJWoE/5WAsyki5EoyxxhYhRxR4ufHw460A8gIyvH0kwst4eXyMsOjBlRuJ0yoqyENxI
	qy0g2svUFy0hffiYFzGta3fe/xKDk9re5ltBng7NnARrxvqYIHxWfk8qaNaSc96OuO7IdubvlkkJ8
	GclVI+XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ0b4-00000003FDQ-0PUs;
	Mon, 01 Dec 2025 09:53:30 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ0ax-00000003FC6-38Zx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 09:53:29 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20251201095314epoutp033bf16d22c4bb764b097519c8afef4d51~9DrPQsSd-0897008970epoutp03b
	for <linux-arm-kernel@lists.infradead.org>; Mon,  1 Dec 2025 09:53:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20251201095314epoutp033bf16d22c4bb764b097519c8afef4d51~9DrPQsSd-0897008970epoutp03b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1764582794;
	bh=S3kURdZsSXe6pN91I7sgh33BC3O3x51+tQtkwxRDdIY=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=Snc06rJS+4VPNhZJHpEjq8+Sd7g38GyVq1x02r0f1gFjGQ7iDBnkTYobRFYPGd5Op
	 wUxFOTX1DTWFw8HWnCSLvy2iCz4dKNTBwyvaRCSiDc/HwTiZV7AzKlmI+O7GLP38z9
	 tN66daf4Nq8ZzyqJOEVJceI+CMviIyaTYtZYYVb0=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20251201095313epcas2p4cf56a03f07e4d606b4c50a923b0fc2e5~9DrOxJWg10546505465epcas2p4z;
	Mon,  1 Dec 2025 09:53:13 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.38.209]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4dKfNT3Lntz2SSKb; Mon,  1 Dec
	2025 09:53:13 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20251201095312epcas2p4d5f93312996f492487f51eb3ba0e5873~9DrNu0QB60783507835epcas2p4I;
	Mon,  1 Dec 2025 09:53:12 +0000 (GMT)
Received: from [12.36.160.98] (unknown [12.36.160.98]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251201095312epsmtip2b42d4a7316a5583f10e05c912e0a63b4~9DrNm75Fc3074230742epsmtip2C;
	Mon,  1 Dec 2025 09:53:12 +0000 (GMT)
Message-ID: <c3cc4b6f-ac75-448e-9fdf-c3c45e2ceed7@samsung.com>
Date: Mon, 1 Dec 2025 18:54:59 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 RESEND 2/3] thermal: exynos_tmu: Support new hardware
 and update TMU interface
To: Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?B?7IaQ7Iug?=
	<shin.son@samsung.com>, 'Bartlomiej Zolnierkiewicz' <bzolnier@gmail.com>,
	'Krzysztof Kozlowski' <krzk@kernel.org>, "'Rafael J . Wysocki'"
	<rafael@kernel.org>, 'Daniel Lezcano' <daniel.lezcano@linaro.org>, 'Zhang
	Rui' <rui.zhang@intel.com>, 'Lukasz Luba' <lukasz.luba@arm.com>, 'Rob
	Herring' <robh@kernel.org>, 'Conor Dooley' <conor+dt@kernel.org>, 'Alim
	Akhtar' <alim.akhtar@samsung.com>
Cc: 'Henrik Grimler' <henrik@grimler.se>, linux-pm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 'Peter
	Griffin' <peter.griffin@linaro.org>, =?UTF-8?Q?=27Andr=C3=A9_Draszik=27?=
	<andre.draszik@linaro.org>, 'William McVicker' <willmcvicker@google.com>,
	jyescas@google.com
Content-Language: en-US
From: Youngmin Nam <youngmin.nam@samsung.com>
In-Reply-To: <401ed9b9-19a4-4a19-b397-0f353e9f0c97@linaro.org>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251201095312epcas2p4d5f93312996f492487f51eb3ba0e5873
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251113064044epcas2p1b87addb21473eca7cc52052e4e2e9237
References: <20251113064022.2701578-1-shin.son@samsung.com>
	<CGME20251113064044epcas2p1b87addb21473eca7cc52052e4e2e9237@epcas2p1.samsung.com>
	<20251113064022.2701578-3-shin.son@samsung.com>
	<5a6a749b-b2b7-41bb-bcb4-a2342e7f4e98@linaro.org>
	<015501dc5ea5$0c7dd460$25797d20$@samsung.com>
	<401ed9b9-19a4-4a19-b397-0f353e9f0c97@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_015326_032247_D417D6EB 
X-CRM114-Status: GOOD (  21.91  )
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

On 11/26/25 18:21, Tudor Ambarus wrote:
> Hi, Shin Son,
> 
> On 11/26/25 9:19 AM, 손신 wrote:
>>> Looking at the exynosautov9 registers that you described and comparing
>>> them with
>>> gs101 I see just 2 differences:
>>> 1/ exnosautov2 has a TRIMINFO_CONFIG2 register, while gs101 doesn't 2/
>>> EXYNOSAUTOV920_PEND register fields differ from GS101
>> TRIMINFO_CONFIG2 doesn't exist on eav920 either; I simply misnamed it.
>> However, the PEND register indeed differs from GS101.
>>
>>> Given the similarities, and considering the EXYNOS9_ registers rename from:
>>> https://lore.kernel.org/linux-samsung-soc/20251117074140.4090939-5-
>>> youngmin.nam@samsung.com/
>>> would it make sense to use the SoC-era name instead of specific SoC, i.e.
>>> s/EXYNOSAUTOV920_/EXYNOS9_ and use the latter for both exynosautov9 and
>>> gs101?
>>>
>> First of all, as far as I know, EXYNOS9 is not the same as exynosautov9, and exynosautov920 also differs from exynosautov9.
> 
> See also see this patch, or maybe the entire patch set:
> https://lore.kernel.org/linux-samsung-soc/20251117074140.4090939-2-youngmin.nam@samsung.com/
> 
> It's not just autov9 and gs101 that have similar TMU registers (with the two
> exceptions AFAICT), it's also exynos850 that seems identical with autov9.
> 
> All seem to be part of the same "Exynos9-era" SoCs. Let's think about how
> gs101/exynos850 TMU addition will follow. Shall one use the EXYNOSAUTOV920
> registers? That seems misleading. Shall one redefine the entire register set?
> That won't fly because of the code duplication.
> 
> Thus I propose to use the EXYNOS9 prefix for the register definitions, and if
> there are SoCs with slight differences, that can be handled with compatible
> match data and specific SoC definitions, but only where things differ.
> 
>> So while sharing a common prefix is a good suggestion in general, I believe it's not appropriate here
>> Because the register definitions are not fully compatible across these SoCs. Using a common name array may introduce confusion later.
> 
> Please reconsider this. Maybe Youngmin Nam or others can intervene.
> 
> Thanks!
> ta
> 
Hi Tudor,

First, thank you for referencing my pinctrl patch and asking for my input.
Yes. That's exactly my intent. Use the EXYNOS9 prefix to minimize fragmentation.

Even if some registers aren't fully compatible,
I'd prefer to maximize the common EXYNOS9 definitions and handle SoC-specific differences via match data or small deltas,
rather than introducing SoC-specific register names.

Hi Shin Son,
if possible, please consider this approach as well.

Thanks,
Youngmin

