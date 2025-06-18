Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17FEC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 18:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zyJlG7Z4td11oSqRetm0jl2eLd6T8cmzVzCUc9u2JvM=; b=dOjgOS9ggj1QbsV3iGi8b4cUF6
	d2/shidkqJmCk1nIFidhB6+deowbTPnHCJo2OhSMtl8Y4CpvQdPEjB1RQ0AL2ENocEIjaDzw/lh97
	cgaqvVdCv4AfAdkV2t6gSdy2sS07OLpKjQlgHYzqeuHRygDE1K9VSTQ+0jlrNp0rspk6/5sCEA30P
	GiVjcon/24B+e/NGnzXqdG1RY7mbOODdsS2A8gKfzQDOk/G8Gvh9Pl2vznGn8s3MISdXka3l4X4Yu
	fNdIaebloYQKIhILU7IxCHDKqlfND9/+1UUoubsQdT3ycZf4nW0MJH1Pf3Mh608IC2BJ/j9CAJ3KS
	+nSe/DHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRxEo-0000000B2Ls-2AeK;
	Wed, 18 Jun 2025 18:10:18 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRvJo-0000000Agv1-2htE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 16:07:22 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id B6B6425DF5;
	Wed, 18 Jun 2025 18:07:17 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HLu9mRvZczgM; Wed, 18 Jun 2025 18:07:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750262836; bh=mOfi1Z9zb0xi4+yWHJom5fdfrVrQ0ZgGdPDqz11C0bE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=MzPjn4GPf8UxiaROLuhGP3cvuGFlQT10Pm/ub+0dQDuqam1PSRskQuZg0f1vkG4gU
	 0OwmZ/iSlylV2kJpSaJxuA3Wq361aFMdvVo18AWXSTfNqIzn4VMcJQzD1M8VtRLfft
	 +f7+kiFEEgxWoCmjrz41cOveafc9JOCbg57a3Nx+5sB2jmiEeh89/Akx3+q/edjHKx
	 oKpMTEMavM+x2F/NnJv6pHWNAi+/YkLasUEJDjCc7z3FWCdvwtDfJG7nr7ZBA9WnIR
	 8M3dbML5gDmlJJWbLu+7PmwNNpU9BfDI+GLxbkxNMqMogTJ/i9Pgeo4aiSNbF1Uh0R
	 LCuSvZqwUQWrw==
MIME-Version: 1.0
Date: Wed, 18 Jun 2025 16:07:16 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: samsung: exynos-sysreg: add exynos7870
 sysregs
In-Reply-To: <00e28a4a-78d6-4452-b28f-29d2e201f6d9@kernel.org>
References: <20250612-exynos7870-drm-dts-v1-0-88c0779af6cb@disroot.org>
 <20250612-exynos7870-drm-dts-v1-1-88c0779af6cb@disroot.org>
 <7bb375c8-1a43-40e2-891c-8815c9cc94ff@kernel.org>
 <76df5b2d6b2c8de73519e1862e105c67@disroot.org>
 <97a54a9f-8719-4bbd-a1d5-dd398f42ab0c@kernel.org>
 <cd0f942a3752053e7569040f9e508b2d@disroot.org>
 <00e28a4a-78d6-4452-b28f-29d2e201f6d9@kernel.org>
Message-ID: <119675e462ce53a05acf55bb3d9fe91f@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_090721_117916_640B88A7 
X-CRM114-Status: UNSURE (   9.48  )
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

On 2025-06-18 15:40, Krzysztof Kozlowski wrote:
> On 18/06/2025 16:49, Kaustabh Chakraborty wrote:
>> On 2025-06-18 14:37, Krzysztof Kozlowski wrote:
>>> On 18/06/2025 16:32, Kaustabh Chakraborty wrote:
>>>> On 2025-06-18 09:46, Krzysztof Kozlowski wrote:
>>>>> On 12/06/2025 17:23, Kaustabh Chakraborty wrote:
>>>>>> Add sysreg compatible strings for the Exynos7870 SoC. Two sysregs
>>>>>> are
>>>>>> added, used for the SoC MIPI PHY's CSIS and DSIM blocks.
>>>>>> 
>>>>>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>>>>>> ---
>>>>>>  .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
>>>>>> | 6 ++++++
>>>>>>  1 file changed, 6 insertions(+)
>>>>>> 
>>>>>> diff --git
>>>>>> a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
>>>>>> b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
>>>>>> index
>>>>>> d27ed6c9d61ea9db77229eca60b6b9a0abc5d305..174bdb8ee932ff965de6fc17aef004a3cedffeb3
>>>>>> 100644
>>>>>> ---
>>>>>> a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
>>>>>> +++
>>>>>> b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
>>>>>> @@ -52,6 +52,12 @@ properties:
>>>>>>                - samsung,exynosautov9-sysreg
>>>>>>            - const: syscon
>>>>>>          deprecated: true
>>>>>> +      - items:
>>>>>> +          - enum:
>>>>>> +              - samsung,exynos7870-cam-sysreg
>>>>>> +              - samsung,exynos7870-disp-sysreg
>>>>>> +          - const: samsung,exynos7870-sysreg
>>>>> 
>>>>> 
>>>>> Drop. These are not really compatible or your commit msg is
>>>>> incomplete.
>>>>> Don't use deprecated syntax and backwards compatible solutions for
>>>>> new
>>>>> hardware.
>>>> 
>>>> Are you sure? The deprecated one is actually the item above. From 
>>>> what
>>>> I
>>> 
>>> Yes. Think why were they added.
>>> 
>>>> understand, those are generic sysregs and don't mention their
>>>> functions.
>>> 
>>> And what is a generic sysreg?
>> 
>> What I meant is, usually compatibles go like this (in order):
> 
> No, they don't. So you checked why they were added?

Checked it, understood. It's meant to be:
"samsung,exynos<soc>-<function>-sysreg", "syscon"

> 
> Best regards,
> Krzysztof

