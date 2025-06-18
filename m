Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50502C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 18:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u3gE7s5PuceDScaiswjtYN14W7DMGBcPU86QCXC6a4E=; b=DEpNV6YVVQedKlv4Igr2JSNzD/
	3vIDnSU8TR8fvDoJ0ODEOU3iaKLDXDrdyjL9JWrAR8dN25Lfbst71wNOg4Wxcb3XirROZzdMBuTA0
	iVrK6z/eEN1kgciiB0edeiasNfT095uRjHIXILfNLR5Suiy1vIB4UwEoPa2Ja9hY6RfASnj5CksEn
	VEM7x7bHre4PHM3HQnNCv4HpKjzW7OeZBuI6gh0qLBjJ3kMzJ992SezFEc5jW2naFL9++OYaSJ3+E
	39eJhPG5tzOvIj6VR3Cb4G35OC9t4z2Kk0qbDdHtohVCN7CKa0XgWpmgvo1Kn4qRe/q81epq/Iyzn
	htHwMUYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRx6f-0000000B0iW-1bCn;
	Wed, 18 Jun 2025 18:01:53 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRu6c-0000000AUqO-2pND
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 14:49:40 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4F65825F28;
	Wed, 18 Jun 2025 16:49:37 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mrkJ_d0x0XTh; Wed, 18 Jun 2025 16:49:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750258176; bh=xCwjGQRZNk8k1ts776Y9Hh6Gp2YJ+EK67MoT9GdAkfU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=XUp3Gvb1PUc1QieRkDW5TcBwRN/wmT41FC2rHOVMvtJTJoUJTAzzUlrIJ+MEPjKIq
	 +L9UZ5T3rqMAZBAShOGWAQxtLAeGhe+dNcOldXBfomoyTSdaqmap2vwuYfzyf9WAGb
	 6zcc5T8JI9ZbR5QoHXLuqQolGnccDjsXt8xEga3zwBrJG1XFy0+dAD1cSNSAdHhIYb
	 138DtbvYL/9F/QhUKON/3vOoyLsOHf4lQIrrko92mFeaVCBKl6cSYzV+HpYVphmkVJ
	 M6CAhEsB5LZD7IBqDlw/9PjJQQyrkn4aECO/Izcw3Jfs8X4jh4LjE+/5iTSYYopOKN
	 Cy9iyx/5NEjbw==
MIME-Version: 1.0
Date: Wed, 18 Jun 2025 14:49:36 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: samsung: exynos-sysreg: add exynos7870
 sysregs
In-Reply-To: <97a54a9f-8719-4bbd-a1d5-dd398f42ab0c@kernel.org>
References: <20250612-exynos7870-drm-dts-v1-0-88c0779af6cb@disroot.org>
 <20250612-exynos7870-drm-dts-v1-1-88c0779af6cb@disroot.org>
 <7bb375c8-1a43-40e2-891c-8815c9cc94ff@kernel.org>
 <76df5b2d6b2c8de73519e1862e105c67@disroot.org>
 <97a54a9f-8719-4bbd-a1d5-dd398f42ab0c@kernel.org>
Message-ID: <cd0f942a3752053e7569040f9e508b2d@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_074938_849708_29BB4843 
X-CRM114-Status: GOOD (  11.86  )
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

On 2025-06-18 14:37, Krzysztof Kozlowski wrote:
> On 18/06/2025 16:32, Kaustabh Chakraborty wrote:
>> On 2025-06-18 09:46, Krzysztof Kozlowski wrote:
>>> On 12/06/2025 17:23, Kaustabh Chakraborty wrote:
>>>> Add sysreg compatible strings for the Exynos7870 SoC. Two sysregs 
>>>> are
>>>> added, used for the SoC MIPI PHY's CSIS and DSIM blocks.
>>>> 
>>>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>>>> ---
>>>>  .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml      
>>>> | 6 ++++++
>>>>  1 file changed, 6 insertions(+)
>>>> 
>>>> diff --git 
>>>> a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml 
>>>> b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
>>>> index 
>>>> d27ed6c9d61ea9db77229eca60b6b9a0abc5d305..174bdb8ee932ff965de6fc17aef004a3cedffeb3 
>>>> 100644
>>>> --- 
>>>> a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
>>>> +++ 
>>>> b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
>>>> @@ -52,6 +52,12 @@ properties:
>>>>                - samsung,exynosautov9-sysreg
>>>>            - const: syscon
>>>>          deprecated: true
>>>> +      - items:
>>>> +          - enum:
>>>> +              - samsung,exynos7870-cam-sysreg
>>>> +              - samsung,exynos7870-disp-sysreg
>>>> +          - const: samsung,exynos7870-sysreg
>>> 
>>> 
>>> Drop. These are not really compatible or your commit msg is 
>>> incomplete.
>>> Don't use deprecated syntax and backwards compatible solutions for 
>>> new
>>> hardware.
>> 
>> Are you sure? The deprecated one is actually the item above. From what 
>> I
> 
> Yes. Think why were they added.
> 
>> understand, those are generic sysregs and don't mention their 
>> functions.
> 
> And what is a generic sysreg?

What I meant is, usually compatibles go like this (in order):

"samsung,exynos<soc>-<function>-sysreg", "samsung,exynos<soc>-sysreg", 
"syscon"

But the deprecated item had its compatibles like this:

"samsung,exynos<soc>-sysreg", "syscon"

That is what I meant by "generic". It doesn't mention <function>.

And my additions adhere to the former. So does [1], [2], and [3]. None 
are
deprecated.

[1] 
https://elixir.bootlin.com/linux/v6.15.2/source/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml#L40
[2] 
https://elixir.bootlin.com/linux/v6.15.2/source/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml#L55
[3] 
https://elixir.bootlin.com/linux/v6.15.2/source/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml#L61

> 
> Best regards,
> Krzysztof

