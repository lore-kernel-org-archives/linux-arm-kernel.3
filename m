Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EEB9C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 08:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RFjqqtuQMHlIRw585Wn4nrpGsc9yhalulq9+ydGLu7Y=; b=tR5h+0tcf28h1DpPZsCS6fe9qK
	JZkrf6Y24nK1k0+IM1l9sgv+gLiyOr7/VwP27TsPN2+Ag76NlvTLJmnAwb/VTd8R/l94nunYhwaIC
	aQmB5zM5hFbjUbaEIgFhvPBahIX9COaTg3iiMhp7tRSAgtwwI/1hstqRQKzLNPRK+3N+pmWEp+uM5
	acApLN6EM4hVYLVphaF4osnO0rQ9Eu+STvYkmJlqkrsWd4u4SR05wJxQ8hNlz5E/80OXdfOTNL6vG
	BuBnvIJgZsyNQHwPwNtDGzoi4YblkIo/LWhjhnfLyo1xb7ZM1GgF1rc+PGxyDlyfaxc0aQNdnh5ye
	tBx8ijLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3V44-00000006JZv-1yBn;
	Mon, 07 Sep 2026 08:50:56 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3V3z-00000006JYp-3mJF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 08:50:54 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260907085041epoutp0460bcec9c7c19036e804abb97948cd85e~S-cjgQGGX0997709977epoutp04t
	for <linux-arm-kernel@lists.infradead.org>; Mon,  7 Sep 2026 08:50:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260907085041epoutp0460bcec9c7c19036e804abb97948cd85e~S-cjgQGGX0997709977epoutp04t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1788771041;
	bh=RFjqqtuQMHlIRw585Wn4nrpGsc9yhalulq9+ydGLu7Y=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=qnDUqXXADXQcaLnqfevPguIb1R/9rdh7a226I89ZUI3hHpgxUCG2wo9o+lGSmbG2l
	 /pDaDBj/tFVhMDTP6x+tWpLO4iP3FFw6Xc5Jm2Xe7paNwEE75MKVhkmtkf5IKFNrtd
	 D0lKe9QAmIu1SoPrA4oj3bjby4xpLTv5GvM7cu7k=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260907085040epcas5p11e00318dbcf56c67ee11afd79369faa9~S-ci_hk3f3212532125epcas5p1g;
	Mon,  7 Sep 2026 08:50:40 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.90]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4hdgl346Sgz6B9mH; Mon,  7 Sep
	2026 08:50:39 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260907085039epcas5p24c419437ae9644adc78521646b2f1728~S-chhk3rU1189311893epcas5p2O;
	Mon,  7 Sep 2026 08:50:39 +0000 (GMT)
Received: from [107.122.5.126] (unknown [107.122.5.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260907085036epsmtip189981f862ba2d77168178876da8696a5~S-ce6VyDH2067720677epsmtip1s;
	Mon,  7 Sep 2026 08:50:36 +0000 (GMT)
Message-ID: <792517c1-9970-44f2-8eff-2a87895cc37c@samsung.com>
Date: Mon, 7 Sep 2026 14:20:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: usb: Introduce samsung,snps-dwc3
To: Krzysztof Kozlowski <krzk@kernel.org>, peter.griffin@linaro.org,
	alim.akhtar@samsung.com, gregkh@linuxfoundation.org, robh@kernel.org,
	conor+dt@kernel.org, Thinh.Nguyen@synopsys.com,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jh0801.jung@samsung.com, dh10.jung@samsung.com, akash.m5@samsung.com,
	hongpooh.kim@samsung.com, eomji.oh@samsung.com, shijie.cai@samsung.com,
	muhammed.ali@samsung.com, thiagu.r@samsung.com
Content-Language: en-US
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
In-Reply-To: <5629de34-1a63-40bf-8375-64be9a69eea2@kernel.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260907085039epcas5p24c419437ae9644adc78521646b2f1728
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260903071318epcas5p4b804edb84554847c576d1d034b814d7a
References: <20260903071250.3421499-1-selvarasu.g@samsung.com>
	<CGME20260903071318epcas5p4b804edb84554847c576d1d034b814d7a@epcas5p4.samsung.com>
	<20260903071250.3421499-3-selvarasu.g@samsung.com>
	<ad1d8c01-a810-443a-9ad5-721d6d0b68b1@kernel.org>
	<e4bafeea-4548-41ef-b5e2-98ade2864e74@samsung.com>
	<5629de34-1a63-40bf-8375-64be9a69eea2@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_015052_600779_12F1A034 
X-CRM114-Status: GOOD (  15.73  )
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


On 9/7/2026 12:37 PM, Krzysztof Kozlowski wrote:
> On 07/09/2026 08:04, Selvarasu Ganesan wrote:
>> On 9/5/2026 12:52 PM, Krzysztof Kozlowski wrote:
>>> On 03/09/2026 09:12, Selvarasu Ganesan wrote:
>>>> The Samsung Exynos8855 USB glue is not separate from the Synopsys DWC3
>>>> core, using a flattened model where the DWC3 controller is directly
>>>> addressable rather than nested as a child node of a glue layer.
>>>>
>>>> Describe the Exynos USB block as a single node, referencing the split
>>>> out Synopsys DWC3 core properties via snps,dwc3-common.yaml. The new
>>>> binding follows the same approach as qcom,snps-dwc3.
>>>>
>>>> A generic fallback compatible "samsung,snps-dwc3" is introduced to
>>>> describe this binding, selected by the validator based on the presence
>>>> of the fallback string in the compatible list. Future Exynos SoCs
>>> This is AI slop text. Over longish useless sentence describing diff
>>> without actual information WHY.
>>>
>>> Don't send AI generated slop messages.
>> Sorry for the misleading info on this commit message. We were trying to
>> explain why a separate flattened representation is being introduced with
>> using generic fallback string, and follow the style of some other DWC3
>> flattened refactors (like the Qualcomm :
>> https://lore.kernel.org/all/20250414-dwc3-refactor-v7-2-f015b358722d@oss.qualcomm.com)
>> to justify the separate binding, but it became too long. We'll simplify
>> it and keep only the technical reasoning.
> Flattened node is the right approach, so just say this is the first
> Samsung Exynos binding using flattened node.


Thanks for your update.
We will update the commit message as follows and post a new patch set.
And We are assuming that all other points including the clock count and 
the generic fallback compatible (samsung,snps-dwc3) are fine.


dt-bindings: usb: Introduce samsung,snps-dwc3

Add the Samsung Exynos8855 DWC3 binding using a flattened node
representation, where the DWC3 controller is directly
addressable rather than nested as a child node of a glue layer.

This is the first Samsung Exynos binding using the flattened
representation. The existing samsung,exynos-dwc3 binding describes the
parent and child representation used by existing Exynos SoCs, which can
be migrated to the flattened model.

Use the samsung,snps-dwc3 fallback compatible for Samsung Exynos SoCs
sharing the same flattened model can be added by extending the
compatible enum with per SoC clock and property constraints.

Thanks,
Selva
>
>
> Best regards,
> Krzysztof

