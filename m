Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55975D3399B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 16:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j2nI3EK4lo60PXeb1prgT8bo3cTLba+CnIJDgP+CDFs=; b=a9N+XoQ+t+Oj95EO9sUFDd6OLM
	4mQnwQKCRPcGfMOHqxAKbcrtl3VYM1lz3S+ItCXYSte29c5kq5g+OgVqcMye81yRS6pgwBrV+bRVE
	DeyEjorZbtoKZKgev6qWjTPvUrQeOREcUv/cfeEu/arMUV6OMonyNOkvQiFLkbiDJ9VRRmP1vmIRb
	VTz1pTom0pV8rqT1jwld7Nypw6filcafBORT2950DpkbPAlmWesIFQ7Fg4WEqFo5TAOym2cOAipND
	PRnbE7qe8BUjrZ74kGNZJYfUHJGDNqJd0vGvlqeVkYOuhylogy5gKdwt3zPMpdU88yuEIC2Uuub9R
	31uJRaLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Skk-0000000BWAY-4BQt;
	Mon, 28 Oct 2024 16:38:03 +0000
Received: from thales.epochal.quest ([51.222.15.28])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5SRf-0000000BTCj-1zvY;
	Mon, 28 Oct 2024 16:18:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=epochal.quest;
	s=default; t=1730132297;
	bh=YoAEfFnB+V3/NmHgOaM2JE6lzsCnn8ETFlwcY21yX/8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QjttJ2jjANICFZZcgAkdevl4qluQAJt5palAzr2xB3gwWDo2dn6m6yNlzcN/CvKvC
	 WqnO3/eajzfFkkdfwd9cFHr5f+3Nwcm0u2CbnQ4t1+eSCK6odtSK+N4eyAmyJbNDgJ
	 hW0nUSZB9YRYmQUMu3f1y/8l0s1XkcTv2VGtu6lPmeUvX8+3CEd5LgYZY3y+fyoabg
	 C5izUBqMH1kIZ7TsjqpwL4myeXLafb5pO+jjWru0sUP+8GL5vPfc/EvlrH1wTLKEQs
	 Bhd64q2kqD2SDAv4Sotwc03IO4PzOGS2CoxpuvToKG3b3E9XjKoha4ywJMK6rIU889
	 Ag+CLOlXEJSiQ==
X-Virus-Scanned: by epochal.quest
MIME-Version: 1.0
Date: Mon, 28 Oct 2024 13:18:16 -0300
From: Cody Eksal <masterr3c0rd@epochal.quest>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-usb@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>, Viresh Kumar
 <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, Andre Przywara
 <andre.przywara@arm.com>, Parthiban <parthiban@linumiz.com>, Florian
 Fainelli <florian.fainelli@broadcom.com>, Vinod Koul <vkoul@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Thierry Reding
 <treding@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>
Subject: Re: [PATCH 11/13] dt-bindings: opp: h6: Add A100 operating points
In-Reply-To: <abf7d194-80b5-410e-8f6f-b1f9e40cd893@linaro.org>
References: <20241024170540.2721307-1-masterr3c0rd@epochal.quest>
 <20241024170540.2721307-12-masterr3c0rd@epochal.quest>
 <7dybkf3zveidwapwfivvq3jk6qxntuqgycndff3ajjl2owhjhn@khqgycnzh76j>
 <13a5e833ce19df20b0420d7f1052fd96@epochal.quest>
 <abf7d194-80b5-410e-8f6f-b1f9e40cd893@linaro.org>
Message-ID: <5cd57cad0847d9c61955ea12b35f8457@epochal.quest>
X-Sender: masterr3c0rd@epochal.quest
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_091819_614689_48409B8B 
X-CRM114-Status: GOOD (  13.57  )
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

On 2024/10/27 6:17 pm, Krzysztof Kozlowski wrote:
> On 27/10/2024 22:13, Cody Eksal wrote:
>> On 2024/10/27 5:47 pm, Krzysztof Kozlowski wrote:
>>> On Thu, Oct 24, 2024 at 02:05:29PM -0300, Cody Eksal wrote:
>>>> diff --git
>>>> a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
>>>> b/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
>>>> index ec5e424bb3c8..603c6c88d080 100644
>>>> ---
>>>> a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
>>>> +++
>>>> b/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
>>>> @@ -23,6 +23,7 @@ properties:
>>>>    compatible:
>>>>      enum:
>>>>        - allwinner,sun50i-h6-operating-points
>>>> +      - allwinner,sun50i-a100-operating-points
>>>>        - allwinner,sun50i-h616-operating-points
>>> 
>>> I have no clue why a100 is between h6 and h616. :/
>>  From my understanding, the A100 was released before the H616, but 
>> after
>> the H6. There are not many sources to rely on for this, but the H6
>> appears to have launched in 2017, the A100 in 2019, and the H616 in
>> 2020.
>> 
>> I assumed ordering was intended to be in chronological order; perhaps 
>> it
>> was intended to be in lexicographical order instead? If so, I can move
>> this entry above the H6.
> 
> Most, really most of the lists in the bindings are ordered
> alphanumerically, because that's the only order all people will get and
> all people can really verify. There are exceptions. If that's the one
> here, then sure, keep chronological order.
After reviewing other files, it seems like alphanumeric ordering is 
normally used in the bindings for these peripherals. I'll update in V2.

Thank you!
- Cody
> Best regards,
> Krzysztof

