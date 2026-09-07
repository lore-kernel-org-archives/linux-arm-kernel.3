Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B3EC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 07:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XysbZdZdrKGKW3RKspZ9TPmk0cHmu+YozeDs0r6a+84=; b=SoJkcWZ9gGouCbpfxf/lRxiTZ8
	ZoV3+lxmo0SXeTFQm1SyZw31JylPZjCeU43DOrxeJB0e9479p9JD6yF1Sb+FkeKAJOcAmp68MsbBy
	ar0c4iYcPxRfi+Qjz8+eB3Ps/cjSJHU/D05OeHVQf2c5FAvjZfA8CteriUFeRHqcxc/LzYVZREJEl
	ilsp+bSU292odQjwkhwr2VKpQcC7j2sqysbAlKL2rOTroAJDIrOedgkGShcjaz/qAmIPaXO4y/hb0
	umTs68JLpvUs8JXhtdqLBwXWIm+mtDcH3ZN6gH2QMp3yv2hCFqvbftI2yiEIgBbyi98zzHwd7Xhyt
	g/t/a1cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Tjl-000000069g7-3yHu;
	Mon, 07 Sep 2026 07:25:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Tjk-000000069fp-2LzI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 07:25:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D0B8043534;
	Mon,  7 Sep 2026 07:25:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC1DC1F00A3A;
	Mon,  7 Sep 2026 07:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788765951;
	bh=XysbZdZdrKGKW3RKspZ9TPmk0cHmu+YozeDs0r6a+84=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=AEoSQcwfvWAOgdnAVhrgItjVrOklvMfCAI7uFfux2CTIpOaSbDGP3ap+LpOmufSlz
	 IRDjRGDeTYmvphl27PDlMG3y77cG5ztdZHhQzfPJx98NHZJ4ODapOPjdPdIXQX5pDJ
	 7aAaRiCBN8vO0sMWKkML9IAlOx94JcbklDmAUjjIUG06jpdRFKGjknccOCHJrn37J9
	 xd1RnUC4j/CDy/zP88CdswNKraJWkc+vvPcYlcpI3Ln2YgJES1XE9pAffAfm5bdnLE
	 8htghaa5Jy6qtqIoGFNzwLmXZ180QB7p+Z8zJtJnhLOW6O9JS0t63lgcw8PWj4fV18
	 ku9r3ecV/liBw==
Message-ID: <6ba5218f-9646-421b-9bf9-efe28f1a5880@kernel.org>
Date: Mon, 7 Sep 2026 09:25:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: vendor-prefixes: add Axera
To: =?UTF-8?B?5Ya357qi5p6X?= <lenghonglin@axera-tech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?B?5pe25b+X5oiQ?=
 <shizhicheng@axera-tech.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "soc@lists.linux.dev" <soc@lists.linux.dev>,
 "hlleng233@gmail.com" <hlleng233@gmail.com>
References: <2113d03615a9265b42a4d69a5a9020ef3-9-26kernel.org@sslemail.net>
 <20260903-impossible-normal-termite-b7f9b8@quoll>
 <c5bc6bb0-0a0b-49bf-afd0-f39696d84b90@axera-tech.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <c5bc6bb0-0a0b-49bf-afd0-f39696d84b90@axera-tech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 07/09/2026 09:12, 冷红林 wrote:
> On 9/3/2026 8:39 PM, Krzysztof Kozlowski wrote:
>> On Tue, Sep 01, 2026 at 05:19:28PM +0800, Leng Honglin wrote:
>>> Add the Axera Semiconductor vendor prefix for devicetree bindings.
>>>
>>> For more information, visit the official Axera Semiconductor website:
>>> Chinese site: https://www.axera-tech.com/
>>> English site: https://www.axera-tech.com/en
>>>
>>> Signed-off-by: Leng Honglin <lenghonglin@axera-tech.com>
>>> ---
>>>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>>> index 396044f368e7..1dbafe682724 100644
>>> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
>>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>>> @@ -219,6 +219,8 @@ patternProperties:
>>>      description: Shanghai Awinic Technology Co., Ltd.
>>>    "^axentia,.*":
>>>      description: Axentia Technologies AB
>>> +  "^axera,.*":
>>
>> So how did you implement own comment?
>>
>> Best regards,
>> Krzysztof
> 
> Hi Krzysztof,
> 
> I sincerely apologize for the confusion. In my previous reply, I did
> promise to change the prefix to "axera-tech" to align with our domain
> name. I should have explained my change of mind in the v2 patch notes.
> 
> When I started making the changes internally for v2, I realized that
> our existing BSPs, bootloaders, and a large amount of downstream
> codebase already heavily rely on the "axera,*" prefix for compatible
> strings. Changing it to "axera-tech" now would cause massive breakage
> and compatibility issues across our existing ecosystem.

Did this existing downstream codebase receive DT maintainers ack or review?

I checked and it seems it is first time you ask:
https://lore.kernel.org/all/?q=dfn%3Avendor-prefixes.yaml+axera

Whatever you have downstream is Axera's fault. You should have come
earlier. Otherwise everyone will produce whatever stuff (including total
junk) in downstream and then say that it is an effort to align to
upstream. And I saw this argument more than once.


> 
> Because of this historical legacy, I looked for similar cases in the
> upstream bindings and noticed that there are accepted precedents where
> the prefix reflects the core brand rather than the full domain (for
> example, "^cix,.*" for cixtech.com).

Indeed cix should use cixtech.


> 
> Would it be acceptable to keep "axera" as the prefix to preserve
> compatibility with our existing deployed systems, even though our
> domain is axera-tech.com?
> 
> If this is strictly not allowed, we will have to figure out a
> migration path internally, but preserving "axera" would be highly
> preferable for our ecosystem. I am very sorry again for not clarifying
> this earlier.

Axera is fine, I don't see conflicts with other possible vendors, but
the problem is that if I agree now, next months someone will use this as
an argument for their patchset that "cix" and "axera" were allowed, so
they also deserve exception because they never cared to ask upstream
before. So obviously based on your earlier reason, of using past mistake
or exception, I should not really agree on that one. Therefore fine by
me, but please get an Ack from different DT maintainer.



Best regards,
Krzysztof

