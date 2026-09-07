Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB04DC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 07:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nZm+NCet44cJmJyjw8MBjxY0eNygQ9RfC21W5wcGYs4=; b=g2n1TQXG5jpJasJiGrK4gWnuRN
	WZmY11TV4S7SVazzrNXotr2khlTkyh3whBlPPqZtqiuo3Q5kogQfL7PeqaCYyHeJvdEPi5I1VKaQZ
	NEI9PR0T9MTId6LtNym97ApNpaQIn3tyeP3/LfbIxAHdx5Tt5wQj3WfcQHDvU4OMcWQl69hr1u3HU
	1yLkpQys0UXZtcuqXvzZyUYoc6hlL+Kx8s72hzMQDpSz2vOiqvDjlYJ+J+8IfJNwaSC9Mt0Luaptn
	30hjiKaI6HdjPtLfS1jcj7bhscWrtw0IQalVlSR2f/1SyAj7dhb2t9EsOUGp484i1sN5FW5d8/Amb
	7WPw9yvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3TSL-000000067hQ-0u81;
	Mon, 07 Sep 2026 07:07:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3TSJ-000000067h5-3U7e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 07:07:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A18DD60052;
	Mon,  7 Sep 2026 07:07:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BA271F00A3A;
	Mon,  7 Sep 2026 07:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788764870;
	bh=nZm+NCet44cJmJyjw8MBjxY0eNygQ9RfC21W5wcGYs4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=lB9Cz9gutHpSn4dFQHsjd41+NuoHTO46cVTIUuMGJ04YLs9Poe2oGR/dc4rhmZX4q
	 tJKDs/+ACu+0B4MxctEr71dmyQARwgzUcZj/FBiFmCLXgujlDANxRj7QkfTruf/uZQ
	 1av6CCDuLlM/vcWHQmKlK0NbglENzPOyBvoKt4caB6KKxhqZVZxeAWhL9pt/ILG5wY
	 fv9hE+z6WHEVR88GniUUC6wecXkSDhRAJmazb34Q3hFzltlu0kOtkiOFd2xhHiKV47
	 eoeUJQgWTwmZHrM0hab9bhO7595Pb+yFftAFb6FWYTw59B6LxpNKHL5OHtoCsjp1EB
	 3VwOcjhTLosLA==
Message-ID: <5629de34-1a63-40bf-8375-64be9a69eea2@kernel.org>
Date: Mon, 7 Sep 2026 09:07:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: usb: Introduce samsung,snps-dwc3
To: Selvarasu Ganesan <selvarasu.g@samsung.com>, peter.griffin@linaro.org,
 alim.akhtar@samsung.com, gregkh@linuxfoundation.org, robh@kernel.org,
 conor+dt@kernel.org, Thinh.Nguyen@synopsys.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: jh0801.jung@samsung.com, dh10.jung@samsung.com, akash.m5@samsung.com,
 hongpooh.kim@samsung.com, eomji.oh@samsung.com, shijie.cai@samsung.com,
 muhammed.ali@samsung.com, thiagu.r@samsung.com
References: <20260903071250.3421499-1-selvarasu.g@samsung.com>
 <CGME20260903071318epcas5p4b804edb84554847c576d1d034b814d7a@epcas5p4.samsung.com>
 <20260903071250.3421499-3-selvarasu.g@samsung.com>
 <ad1d8c01-a810-443a-9ad5-721d6d0b68b1@kernel.org>
 <e4bafeea-4548-41ef-b5e2-98ade2864e74@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <e4bafeea-4548-41ef-b5e2-98ade2864e74@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 07/09/2026 08:04, Selvarasu Ganesan wrote:
> 
> On 9/5/2026 12:52 PM, Krzysztof Kozlowski wrote:
>> On 03/09/2026 09:12, Selvarasu Ganesan wrote:
>>> The Samsung Exynos8855 USB glue is not separate from the Synopsys DWC3
>>> core, using a flattened model where the DWC3 controller is directly
>>> addressable rather than nested as a child node of a glue layer.
>>>
>>> Describe the Exynos USB block as a single node, referencing the split
>>> out Synopsys DWC3 core properties via snps,dwc3-common.yaml. The new
>>> binding follows the same approach as qcom,snps-dwc3.
>>>
>>> A generic fallback compatible "samsung,snps-dwc3" is introduced to
>>> describe this binding, selected by the validator based on the presence
>>> of the fallback string in the compatible list. Future Exynos SoCs
>> This is AI slop text. Over longish useless sentence describing diff
>> without actual information WHY.
>>
>> Don't send AI generated slop messages.
> 
> Sorry for the misleading info on this commit message. We were trying to 
> explain why a separate flattened representation is being introduced with 
> using generic fallback string, and follow the style of some other DWC3 
> flattened refactors (like the Qualcomm : 
> https://lore.kernel.org/all/20250414-dwc3-refactor-v7-2-f015b358722d@oss.qualcomm.com) 
> to justify the separate binding, but it became too long. We'll simplify 
> it and keep only the technical reasoning.

Flattened node is the right approach, so just say this is the first
Samsung Exynos binding using flattened node.


Best regards,
Krzysztof

