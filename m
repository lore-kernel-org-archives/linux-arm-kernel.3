Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D8D606A325
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 08:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Qq9c0k3m;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=noi5RM5q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uUHcD7c2GU89ccoQK7kmOp+eT94pdtP2AmRHpCgaVV0=; b=Qq9c0k3mEWrSsCH/wqNFeAB9LC
	tMUC3897MG/e5yzMQJUFmxyb4jXzgIJbLV1kQ120zvM/RU32phkhQpL8R978za/DVzmyvf9rcG47I
	cJJ9Au2lU5mt5o8+WXRKUEfclnhuW0WKR8mNGCtw2lorJS88jdS8tvn7n7WVhFp/Zc6h3xoB3xcAj
	568QrD9OGnNCNNneJRaOT5ZKwRa4rFHvCzc5j7V5KiZOJ2+Vw9M2QvLFASglDvKv/EbuuEzxbwfWw
	P+kYDUe70zEjYQBG9EY6C9tkBbds0idTkkcYViH49mSVoYLHCwAERR8l6PouD0CB4jlQe17kLrkt/
	TJnMXXiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ4oY-0000000972K-3Sj5;
	Tue, 20 Oct 2026 08:03:18 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ4oV-0000000970f-3MnI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 08:03:17 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20261020080308epoutp01c0c09ff37b5d06207d0d64b4b74e7af3~gLiUJTf790543705437epoutp01m
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 08:03:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20261020080308epoutp01c0c09ff37b5d06207d0d64b4b74e7af3~gLiUJTf790543705437epoutp01m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792483388;
	bh=uUHcD7c2GU89ccoQK7kmOp+eT94pdtP2AmRHpCgaVV0=;
	h=Date:Subject:From:To:Cc:In-Reply-To:References:From;
	b=noi5RM5qfrCv4N0v0ZApnpWkaWpTg5qSjCFOoMuFxmS9/LCVCkSvJzTU4czgT+nL6
	 jcV1pGYSOSNEu+7du6x/P4VdFlhX61wxlxWuqmqywqR71eFJ9eAHnySYjOM5Bd9Npv
	 bcyOGHlQwySvz7zBqKgg48qVsbchiQsgBI1ACObI=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20261020080303epcas5p39b35b25b23b24e0cc4adc4c3a6205270~gLiPp6CDo1184711847epcas5p3H;
	Tue, 20 Oct 2026 08:03:03 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.89]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4j84fG3qvSz6B9mF; Tue, 20 Oct
	2026 08:03:02 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20261020080302epcas5p2140954a64a9a8db0f7b802611431eed3~gLiOS_PnJ2967129671epcas5p2u;
	Tue, 20 Oct 2026 08:03:02 +0000 (GMT)
Received: from [107.122.5.126] (unknown [107.122.5.126]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261020080259epsmtip225517e3ffa9b53b64dade8aaa8df77cb~gLiLgSsR62884528845epsmtip2g;
	Tue, 20 Oct 2026 08:02:58 +0000 (GMT)
Message-ID: <6643fece-aa39-42e6-8cd6-5264f15e12ff@samsung.com>
Date: Tue, 20 Oct 2026 13:32:58 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: usb: Introduce samsung,snps-dwc3
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
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
In-Reply-To: <ad11251d-6632-498d-95f6-04a7c6dade72@samsung.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261020080302epcas5p2140954a64a9a8db0f7b802611431eed3
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
	<ad11251d-6632-498d-95f6-04a7c6dade72@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_010316_528224_8C9DC4F4 
X-CRM114-Status: GOOD (  43.55  )
X-Spam-Score: -4.7 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 9/21/2026 12:26 PM, Selvarasu Ganesan wrote:
>
> On 9/18/2026 7:16 PM, Krzysztof Kozlowski wrote:
>> On 18/09/2026 15:36, Selvarasu Ganesan wrote:
>>> On 9/18/2026 3:24 PM, Krzysztof Kozlowski wrote:
>>>> On Wed, Sep 16, 2026 at 05:52:28PM +0530, Selvarasu Ganesan wrote:
>>>>> +maintainers:
>>>>> +  - Krzysztof Kozlowski <krzk@kernel.org>
>>>>> +  - Selvarasu Ganesan <selvarasu.g@samsung.com>
>>>>> +
>>>>> +description:
>>>>> +  Describes the DWC3 USB controller block implemented on Samsung 
>>>>> Exynos SoCs.
>>>>> +
>>>>> +select:
>>>>> +  properties:
>>>>> +    compatible:
>>>>> +      contains:
>>>>> +        const: samsung,snps-dwc3
>>>>> +  required:
>>>>> +    - compatible
>>>> This select is not needed.
>>>>
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    items:
>>>>> +      - enum:
>>>>> +          - samsung,exynos8855-dwc3
>>>>> +      - const: samsung,snps-dwc3
>>>> And this fallback is not really accurate. Samsung does not have snps
>>>> device, because snps is a vendor. Anyway, generic fallbacks should go
>>>> away, drop, so you are left with samsung,exynos8855-dwc3 only.
>>> Hi Krzysztof,
>>>
>>> Thanks for your review comments.
>>> And We apologize for our repeated below explanation, but we wanted to
>>> ensure our intentions were clear for each point to avoid any
>>> misunderstanding.
>>>
>>> The original intent of the generic fallback was to support existing
>>> Exynos dwc3 bindings from a parent/child representation from
>> How does it support existing bindings? I don't understand. There is no
>> such fallback in existing bindings.
>
>
> Sorry for the misunderstanding, Yes there is no such a fallback in 
> existing bindings.
>
> Our intention was to use new proposed generic fallback compatible 
> string that will support USB dwc3 flatted node for all Samsung soc 
> when those are migrated in the future without adding SoC specific 
> compatible string in driver.
>
> Agreed, Here using generic fallback name (samsung,snps-dwc3 as a 
> reference of qcom,snps-dwc3) is incorrect as snps is vendor not a device.
>
> As per DTS101 slide , Now we clear that the future Exynos SoCs could 
> use  samsung,exynos8855-dwc3 as a fallback when they are compatible 
> with the Exynos8855 hardware definition, rather than introducing a 
> generic samsung,snps-dwc3 fallback. The dedicated compatible would 
> still describe any SoC specific differences, such as clocks.
>
> And Understood that we were mixing the current Exynos8855 binding with 
> the longer term migration plan for the existing Exynos SoCs and future 
> SoCs.
>
> We will drop the generic fallback and use SoC specific compatible 
> samsung,exynos8855-dwc3 (vendor,device), following 
> samsung,exynos-dwc3.yaml as the reference.
>
> Regarding the binding filename, if the flattened representation is 
> expected to support multiple Exynos SoCs where there is only 
> differences in clock in the future, similar to how 
> samsung,exynos-dwc3.yaml covers multiple SoCs with the legacy (parent 
> and child) node representation, should we use a common binding 
> filename for the flattened representation instead of a SoC specific 
> name like samsung,exynos8855-dwc3.yaml.
> For example,
>     samsung,exynos-dwc3-flattened.yaml.


HI Krzysztof,

I am writing to kindly follow up on my previous inquiry regarding the 
binding filename for the flattened representation.

To recap, I would like to know if we should use a common binding 
filename, such as samsung,exynos-dwc3-flattened.yaml, instead of SoC 
specific names (e.g., samsung,exynos8855-dwc3.yaml). This would be 
consistent with how samsung,exynos-dwc3.yaml covers multiple SoCs in the 
legacy representation, especially if we expect to support multiple 
Exynos SoCs with only clock differences in the future.

I would appreciate your guidance or suggestions on the preferred naming 
convention for this implementation.

Thanks,
Selva
>
>
>>
>>> (samsung,exynos-dwc3.yaml), and upcoming SoCs (Exynos 8865, 9955, and
>>> 9965) can use this flattened representation without requiring a unique
>>> compatible string for every project in the dwc3-generic-plat driver
>> I did not forbid you to use fallbacks, so I do not understand why you
>> would need unique compatible for every device in the driver.
>
>
> The intention was to avoid adding separate compatible entries to 
> dwc3_generic_of_match[] for each Exynos SoC.
>
> We understand that adding SoC specific compatibles is the correct 
> approach, as follow in samsung,exynos-dwc3.yaml.
>
>
>>
>> This is already heavily documented and explained in beginners docs.
>> Please read writing bindings docs and maybe also DTS101 slides. I even
>> gave the talk DTS101 two months ago in your timezone...
>
> Thanks for pointing out the DTS101 slids, and we referred again the 
> binding documentation including DTS101 slids for further clarification 
> on the using of fallback.
>
>>
>>
>>> of_match_table. We referred to qcom,snps-dwc3 as a helpful reference 
>>> for
>>> this approach.
>> When people argue with me, they use more often poor examples as
>> reference, not the good ones. Interesting pattern.
>>
>> And why you did not take the proper example you even mentioned here -
>> Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml - as
>> reference?
>>
>> Anyway, existing bug is not a reason to add new bug, don't you think?
>
> Agreed and As we mentioned in above comment, we will use the existing 
> samsung,exynos-dwc3.yaml as the reference for the Samsung binding and 
> drop the qcom,snps-dwc3 reference.
>
>>
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
>>> Could you please let us know your preferred approach? Once 
>>> confirmed, we
>>> will address your other review comments based on the selected approach.
>> You do not have other bindings. You have one device. If you have more,
>> then post more. We are not making reviews based on imaginary future 
>> things.
>
> Understood. As mentioned above, we are mixing the current Exynos8855 
> binding with the longer term migration plan and will keep this binding 
> focused on Exynos8855 only and handle other SoCs when they are 
> actually migrated.
>
> Thanks,
> Selva
>
>
>>
>> Best regards,
>> Krzysztof

