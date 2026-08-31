Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63ABC624CF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 16:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fvYNluFuQySNF3hhgPFVZT3o5V52MNrGi+SgvNu4QfQ=; b=oBLo+WL7YhYC67VHExMCAhwsh0
	2sVpHXDH+XzmQ4ZxJW5CIe/L+6OYasAFDWuL46rj2FGtyiYgSfHmcWHuHB1RJ5oYEjknTey4iDKaF
	XFNJeYPJVNkT9InHrNH3rAgkRGbcTyKgbwM7UxWb286kLg2CNTpQJq6OXIsflKlVQfCEzuKTkxlkg
	ONncFf2IVBUdJfVqhQBxx11NFDV2e1LxbNdlqe9naadm0kFWlNhkprtMt0ryeaRR+BTfrzwU+7yCt
	q7NRjJPdKH0sIYmFXJd/sicaljSGJ/e7P6nUA6EqRe8MwTqEyZjP6gegjT47dcvUphVkGChifLTYb
	Q3MYafKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14r7-0000000A2bS-2Nbh;
	Mon, 31 Aug 2026 16:27:33 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14r5-0000000A2aZ-0CY3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 16:27:32 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 01A7611B183;
	Mon, 31 Aug 2026 18:27:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788193644;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=fvYNluFuQySNF3hhgPFVZT3o5V52MNrGi+SgvNu4QfQ=;
	b=WmVGRFYJbQrjpBImYLPLZ/OyKJcCq/P3KEBI9wDx5T4krCeTGW86/OM+lcozfPy4qqw8yR
	/bILh2/MlyV8FbLwyWCO40xU2yH1BfRoSqB0I/EAsLZdL7HGM4sHQpzaeP+XhS5KIGHN4a
	vELVLf70M5rjUBcXgE8fg9QbhfqBkYOgUEw7mVONQdHasQCkn0+clmk/6lZOnET/M6EPuF
	J0WBiLIt9jQqoPsiyoZL1808IU1BIvR/QkyWrjVVY1Wnl0BJQPxtP5fx4sS5RPlqZA5eC5
	os8l0T+x9I7+U8zjZnuDJ3epOFvNs9d9N+DQS4+JIDhGXeIs4CoxhOBgC6YULg==
Message-ID: <2b09012a-3cae-4589-b42d-f61d33f2f876@nabladev.com>
Date: Mon, 31 Aug 2026 18:27:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: stm32: Document
 st,stm32mp23/25-syscfg subnodes and cells
To: Conor Dooley <conor@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Rob Herring <robh@kernel.org>, Yannick Fertre <yannick.fertre@foss.st.com>,
 devicetree@vger.kernel.org, kernel@dh-electronics.com,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260828151216.175020-1-marex@nabladev.com>
 <20260828-target-operable-ebc87e0bf30a@spud>
 <0f959651-34d9-4fb2-9e07-238f731c5342@nabladev.com>
 <20260831-clustered-margarine-80bf19005aad@spud>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260831-clustered-margarine-80bf19005aad@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_092731_307181_B42C241D 
X-CRM114-Status: GOOD (  11.52  )
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

On 8/31/26 5:05 PM, Conor Dooley wrote:

Hello Conor,

>>> Sashiko comment here I believe is valid, the syntax here only works if
>>> there's only the listed compatible present. It doesn't work with
>>> fallbacks.
>>
>> This syntax is used all over the place ?
>>
>> Documentation/devicetree/bindings/ata/ahci-platform.yaml-allOf:
>> Documentation/devicetree/bindings/ata/ahci-platform.yaml-  - $ref:
>> ahci-common.yaml#
>> Documentation/devicetree/bindings/ata/ahci-platform.yaml-
>> Documentation/devicetree/bindings/ata/ahci-platform.yaml-  - if:
>> Documentation/devicetree/bindings/ata/ahci-platform.yaml-      properties:
>> Documentation/devicetree/bindings/ata/ahci-platform.yaml-        compatible:
>> Documentation/devicetree/bindings/ata/ahci-platform.yaml:          contains:
> 
>                                                                       ^^^^^^^^
> This is the key difference, you need "contains" for partial matches.

Uh ... right ... fixed in V5. Thank you.

>> Documentation/devicetree/bindings/ata/ahci-platform.yaml-            enum:
>> Documentation/devicetree/bindings/ata/ahci-platform.yaml-              -
>> qcom,apq8064-ahci
>> Documentation/devicetree/bindings/ata/ahci-platform.yaml-              -
>> qcom,ipq806x-ahci
>>
>>> pw-bot: changes-requested
>>>
>>>>        then:
>>>>          required:
>>>>            - "#clock-cells"
>>>> +        - "#address-cells"
>>>> +        - "#size-cells"
>>>
>>> else, false? But I'm also not sure what the benefit is of requiring
>>> addr/size cells when the child node is not?
>> The subnodes of this syscfg node have reg property , see [PATCH v4 0/4]
>> arm64: dts: st: Add STM32MP2 USB support .
> 
> Right, but I was questioning why the properties describing the reg
> property in children is required when the children (and thus the reg
> property in them) were not made required.

Do you mean this patternProperties should be made required in here ?

"
+patternProperties:
+  "^phy@[0-9a-f]+$":
"

Could you please give me a hint how to do that ? git grep gives me nothing.

