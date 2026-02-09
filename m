Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88CA5E94606
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 20:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tPqHCXgLLpIGNLbcP1MfHdpvRT1rv6Bd11zUrhLERJg=; b=tm1r+GrJzOB6yaE9YDfzF44Nsx
	gvuWwD7hokTZdcEVe27AEmfBU/2YkAaJ2uwjSu8dCxLusPPBVJCBGf49jl019+WTdYp96wOF7cWIR
	JLLwXIMUw0xBiilMz6AqQvhfj2tBBKyCVGDroOO8i7JlnBfk5aJYGOoNdEF0/WFBMXGjBuRNYGY2+
	Tzv3skb0pavxN4LjurrlRCjB3ru9P1CRPVH7gcHRQ2CFW/COnf6wkP43T4yi3dia+RH/FrvgkTy9j
	HRjOND1Y5fp3tEwfa9Go9HBSueSm7RTuNmOm4zkitM1sSWvih42qV2a/KlMN5BW2vrC0SsJb8RSjg
	2P7jOeWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpY85-0000000G0CM-2Ee6;
	Mon, 09 Feb 2026 20:45:09 +0000
Received: from ahti.lucaweiss.eu ([128.199.32.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpY83-0000000G0Br-0Fbc;
	Mon, 09 Feb 2026 20:45:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1770669903; bh=X1KoYVWiFzc4LQ9pm/nSofVmkz5/jQqXAxNpYaTQpY0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Hkhez5OFJmafMQqdFooicOHR1EURW5jV13zxJlmjqppX1LWXKLK8EDkLz0cab9gAK
	 iziuxyddAP+fugq+3yJ2kvrobIP5zZIiWcQ8cy3abjJMbJep1lTaWUB+Kr3h5SNwP0
	 cChQXag+NqE3hVRDJRMrU1UelfvDakwsfpl/wSXU=
Message-ID: <f1e1eeea-b246-42c8-84c9-0c1203706ddc@lucaweiss.eu>
Date: Mon, 9 Feb 2026 21:45:02 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: mfd: syscon: Add mt8516-syscfg
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, phone-devel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260206-mt8516-syscfg-syscon-v1-0-96dcb37acdb4@lucaweiss.eu>
 <20260206-mt8516-syscfg-syscon-v1-1-96dcb37acdb4@lucaweiss.eu>
 <20260207-tricky-strange-swan-6f11b0@quoll>
 <3476c51b-9293-40f1-8b5c-9ac9802d7d97@collabora.com>
From: Luca Weiss <luca@lucaweiss.eu>
In-Reply-To: <3476c51b-9293-40f1-8b5c-9ac9802d7d97@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_124507_254046_D0755C46 
X-CRM114-Status: GOOD (  23.78  )
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

Hi AngeloGioacchino,

On 09-02-2026 12:34, AngeloGioacchino Del Regno wrote:
> Il 07/02/26 11:51, Krzysztof Kozlowski ha scritto:
>> On Fri, Feb 06, 2026 at 11:20:48AM +0100, Luca Weiss wrote:
>>> Document the Mediatek mt8516-syscfg.
>>
>> Which is what? What is syscfg block?
>>
> 
> Not sure this is really a SYSCFG block.
> 
> This should be a GPIO controller range, which is split between IOCFG and 
> EINT.
> Now, the legacy drivers are declaring the EINT iospace in the pinctrl 
> node, and
> getting the GPIO controller (IOCFG) iospace from a regmap.
> 
> I don't have any board with MT8516... but well, the really-right-thing 
> to do
> would be to migrate that SoC off of the legacy driver, to the new-style one
> that *properly* takes two iospaces:
> "base" -> (0x10005000)
> "eint" -> (0x1000b000)
> 
> Luca, if you've got such a board, could you please try to migrate this 
> SoC out
> of the improper (but working good) driver and bindings?
> 
> If not... well, I think this block is IOCFG, not SYSCFG...

Thanks for the suggestions. This is essentially my first Mediatek patch 
and while I'd say I have a good understanding of Qualcomm SoCs, Mediatek 
is very different, so I've got no clue about anything here really ;)

I'll try to decipher your comment and see what I can do about it, 
hopefully soon. Thanks!

Regards
Luca

> 
> Cheers,
> Angelo
> 
>>>
>>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>>> ---
>>>   Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/ 
>>> Documentation/devicetree/bindings/mfd/syscon.yaml
>>> index e57add2bacd3..a67699f1faee 100644
>>> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
>>> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
>>> @@ -91,6 +91,7 @@ select:
>>>             - mediatek,mt8135-pctl-b-syscfg
>>>             - mediatek,mt8173-pctl-a-syscfg
>>>             - mediatek,mt8365-syscfg
>>> +          - mediatek,mt8516-syscfg
>>
>> Why aren't you placing it with all others mediatek,mt8516 syscons?
>>
>> Why this is so generically called "syscfg", completely not looking like
>> a real name from datasheet unlike the others in this device.
>>
>> You have entire commit msg to explain that.
>>
>> Best regards,
>> Krzysztof
>>
> 
> 


