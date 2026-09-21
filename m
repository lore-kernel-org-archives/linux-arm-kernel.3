Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6139DC982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 07:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A2RGwEkX8Nr2X2WiqJgXRovZAX/TOp2rfkegY7+nn5M=; b=ZvD2BONN/pJz71BlXqu6VpDZi3
	IUpQ1o7/eFhnRjsbJMsqgn3wz/3uAddjhDgCnzoD1UCo7kAmb5y9q/cIkCpykQpBR1xHqWN+NjtD6
	Iuqc+gbC4LayyIkM/A0Wkmu7tpbuQ8/SC0h5xzY/DX+ytWK7RJedNg7+ZTLxlhamw06OO4CLZdZ2s
	XhKK5KO5hp4mMaaxfTdnXH3aB7/N7Tcl+35DAt7eUlmPKSH6qv2ZA1nxH+VWu9RSjss+2ui5NbA/V
	j5kJsDNyaWuvEkw7POfIImPXuasQ43u2DYz28PkW6Cg2/19+QSXECt2/ol2VetP0fD9MSwzxHJHjv
	bdhU2Zyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Y4W-000000019Ky-0ELf;
	Mon, 21 Sep 2026 07:04:16 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Y4S-000000019KQ-1xit
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 07:04:14 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260921070405epoutp04921adb06728d0c1e79bd42fabb13458d~XRBeo72Ax1300913009epoutp04N
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 07:04:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260921070405epoutp04921adb06728d0c1e79bd42fabb13458d~XRBeo72Ax1300913009epoutp04N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789974245;
	bh=A2RGwEkX8Nr2X2WiqJgXRovZAX/TOp2rfkegY7+nn5M=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=OJltEPhS4bdswx5DbOMWMF7aMeuigsTDgRdBzFosjRnngMXqPf+GD6UN4IG7qPhKz
	 wQbRBoMSKKMeC5v7dW2sAVY/AzIR/TUv5XEYPCVs8Xr6PxjLrkJf0IUfK+OxUJJe8N
	 MbQUz97SNvL5QlmO7OApDSNgkbOwn4FmOuH8fS1g=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260921070404epcas5p3fd32e1e83eed9c75c3552ede73a9bcf4~XRBeSK8Xc0766607666epcas5p3g;
	Mon, 21 Sep 2026 07:04:04 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.91]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4hpDjb6Tcfz3hhTL; Mon, 21 Sep
	2026 07:04:03 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260921070403epcas5p1e5467529358348d41e60829d045e55e9~XRBcw5yLI1491414914epcas5p1n;
	Mon, 21 Sep 2026 07:04:03 +0000 (GMT)
Received: from [107.122.5.126] (unknown [107.122.5.126]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260921070400epsmtip20f421aa8950b361a497ca737f8cf6a1d~XRBZ8jRid2760327603epsmtip2I;
	Mon, 21 Sep 2026 07:04:00 +0000 (GMT)
Message-ID: <053c58ae-5920-4aed-a3b8-61b0a02fc52d@samsung.com>
Date: Mon, 21 Sep 2026 12:33:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: usb: Introduce samsung,snps-dwc3
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: peter.griffin@linaro.org, alim.akhtar@samsung.com,
	gregkh@linuxfoundation.org, robh@kernel.org, conor+dt@kernel.org,
	Thinh.Nguyen@synopsys.com, mani@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, jh0801.jung@samsung.com, h10.kim@samsung.com,
	dh10.jung@samsung.com, akash.m5@samsung.com, hongpooh.kim@samsung.com,
	eomji.oh@samsung.com, shijie.cai@samsung.com, muhammed.ali@samsung.com,
	thiagu.r@samsung.com
Content-Language: en-US
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
In-Reply-To: <628a4ac0-135d-434a-b5c7-27453e96fdec@kernel.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260921070403epcas5p1e5467529358348d41e60829d045e55e9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260916122354epcas5p401fd6470d6cef75951af732b03aa5970
References: <20260916122229.2604003-1-selvarasu.g@samsung.com>
	<CGME20260916122354epcas5p401fd6470d6cef75951af732b03aa5970@epcas5p4.samsung.com>
	<20260916122229.2604003-3-selvarasu.g@samsung.com>
	<20260918-burgundy-marmoset-of-focus-c9b9a7@quoll>
	<fef2b2f5-3838-4eec-8118-d41f9ca0ed2f@samsung.com>
	<7fbcf497-a166-45d6-844d-faaece6f581c@kernel.org>
	<628a4ac0-135d-434a-b5c7-27453e96fdec@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_000413_156166_FD922935 
X-CRM114-Status: GOOD (  20.94  )
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


On 9/18/2026 7:25 PM, Krzysztof Kozlowski wrote:
> On 18/09/2026 15:46, Krzysztof Kozlowski wrote:
>> On 18/09/2026 15:36, Selvarasu Ganesan wrote:
>>
>>> As seen in samsung,exynos-dwc3.yaml, our existing bindings already
>>> support multiple SoCs with diverse clock requirements within a single
>>> file. Similarly, we plan to use a single flattened Samsung binding to
>>> manage these diverse clock requirements. for different SoCs.
>>>
>>> Regarding the migration for current and future SoCs, would you prefer,
>> I do not understand how any of this is relevant to my review comment.
>>
>>> Option A: A single flattened binding file using a common fallback
>>> compatible string (instead of samsung,snps-dwc3) to minimize
>>> of_match_table entries, and if/then constraints to handle diverse clock
>>> requirements.
>>> Option B: Separate binding files for each individual SoCs.
>>>
>>> Could you please let us know your preferred approach? Once confirmed, we
>>> will address your other review comments based on the selected approach.
>> You do not have other bindings. You have one device. If you have more,
>> then post more. We are not making reviews based on imaginary future things.
> OK, I guess you referred to my further comments about if:then: block
> here. When you have more devices, you can add them to the same binding,
> with proper constraints for each variant.
>
> https://protect2.fireeye.com/v1/url?k=9ebe79fc-ff356cca-9ebff2b3-74fe485fffe0-0d2d81d841babdca&q=1&e=60d36b7b-e65b-4d92-9fe0-f943564aaf66&u=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv7.3-rc3%2Fsource%2FDocumentation%2Fdevicetree%2Fbindings%2Fclock%2Fsamsung%2Cexynos990-clock.yaml%23L93
>
> If the difference is only in clocks, one binding file is usually good to
> hold many variants. If there are more differences, things are getting
> too messy and more files are useful (see commit
> c80dc8121d3af8f33413bb0f9ed9e81e2c576e1a for example).


Thanks for your reference.


Since the differences between the Exynos SoCs with USB DWc3 are 
primarily their clock requirements, We will keep the one binding file 
and add Exynos8855 SoC now and extend the same binding with per 
compatible clock constraints when others are migrated.

As we mentioned in our previous comment, we would appreciate your 
guidance on the naming convention for a binding file that supports 
multiple SoCs for flattened support , similar to how 
samsung,exynos-dwc3.yaml is structured.

should we use a common binding filename for the flattened representation 
(Example: samsung,exynos-dwc3-flattened.yaml)?


Thanks,
Selva
>
> Best regards,
> Krzysztof

