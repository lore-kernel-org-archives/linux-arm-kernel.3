Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E5DCD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 19:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FmI8PUvl0y9cOUVYzfjTqYiM/XJNLR0tm65qzan3Ppo=; b=qG6lyYnasQV1214qu7c9KYHbYG
	Wx+uy2MOC0fnAzJ0DUncnro1iWxAIGlOQkZq/YWBu3KVG5gCoCjB4Nxn68P8LgX4rcYrNf5/FUS35
	YHK+gP7mQOOdJXYkIXCwYsQhe+1/9bdcnNwMSklTEen464Sp1zER0HiB3FCqCZk/TSyy5043AQEDD
	13bETXJ/m+DPtRkSr0TG/MFiINEE4Z+H9lVg8Ac7GHE8GK/36/ojYmIqfELy9XKpYqypUG0QpCC/R
	y5EpnmC90Fjqfm5Npy3crXktEOmJLPm0+pbpBMSiOCvS/dKv0x6Vi7VyPRSXC9S966y/jXLQDk1Cw
	Nu5c3+7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX2Uv-00000006JwH-0ojP;
	Tue, 09 Jun 2026 19:52:29 +0000
Received: from out-170.mta0.migadu.com ([2001:41d0:1004:224b::aa])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX2Us-00000006JvB-3gqU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 19:52:28 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1781034734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FmI8PUvl0y9cOUVYzfjTqYiM/XJNLR0tm65qzan3Ppo=;
	b=AOeaBGzl7oMpuwX23rf7rzw3qcQOe4ogFQhAi5TCmbEhKy3OJ3PlVbsf3fkxMKcPI59mwR
	IN4//tCOpt2V8cRmt5BBAi90+ch/VAQ66+lTqMTJOo9bUJ0uGtatt4sPivCzQyNDNV3Db2
	3z3QYkUdr4UliUsE9o6zoJfhFAFnzAxhO3L8BinjviZNYhJ66T+37dM7iPVWHOQH81gWe+
	/KgeVxgk3g7Or73PDL87I8Q6IZVMpzUPENF7OkqgW7A/PzF1kThV5qvFG03roQQrjdgn8I
	qCjl5MaVs+zzOkXkO3WH4KqZrOI9EbX0EdR4ape2N8QTMKEp/i6VXf1k0Hk/Qw==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Jun 2026 21:51:58 +0200
Message-Id: <DJ4S46HX0BMK.25LUHCHQY4V7K@cknow-tech.com>
Cc: "Heiko Stuebner" <heiko@sntech.de>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: usb: Add Rockchip RK3568 compatible
 for EHCI and OHCI
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Jonas Karlman" <jonas@kwiboo.se>, "Diederik de Haas"
 <diederik@cknow-tech.com>
References: <20260609154124.445182-1-jonas@kwiboo.se>
 <20260609154124.445182-2-jonas@kwiboo.se>
 <DJ4NVA328NUV.LSPMVBFE0PD8@cknow-tech.com>
 <9e8f806d-72ec-4eb4-8967-3f82eb0e7dd4@kwiboo.se>
In-Reply-To: <9e8f806d-72ec-4eb4-8967-3f82eb0e7dd4@kwiboo.se>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_125227_202607_77D623B2 
X-CRM114-Status: GOOD (  22.42  )
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

Hi Jonas,

On Tue Jun 9, 2026 at 8:06 PM CEST, Jonas Karlman wrote:
> Hi Diederik,
>
> On 6/9/2026 6:32 PM, Diederik de Haas wrote:
>> Hi Jonas,
>>=20
>> On Tue Jun 9, 2026 at 5:41 PM CEST, Jonas Karlman wrote:
>>> The Rockchip RK3568 EHCI/OHCI controller depends on clk_usbphy1_480m
>>> being enabled, or the system may freeze when registers are accessed.
>>>
>>> Add Rockchip RK3568 EHCI and OHCI compatibles with a similar four-clock
>>> constraint as RK3588.
>>>
>>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>>> ---
>>> Existing DTs for RK3568 use the plain generic-ehci/ohci compatible,
>>> next patch make use of these new compatibles and adds the missing
>>> clk_usbphy1_480m clock references.
>>> ---
>>>  .../devicetree/bindings/usb/generic-ehci.yaml          | 10 ++++++++++
>>>  .../devicetree/bindings/usb/generic-ohci.yaml          |  5 ++++-
>>>  2 files changed, 14 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/=
Documentation/devicetree/bindings/usb/generic-ehci.yaml
>>> index 55a5aa7d7a54..c49a1bbc8cfd 100644
>>> --- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
>>> +++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
>>> @@ -52,6 +52,7 @@ properties:
>>>                - ibm,476gtr-ehci
>>>                - nxp,lpc1850-ehci
>>>                - qca,ar7100-ehci
>>> +              - rockchip,rk3568-ehci
>>>                - rockchip,rk3588-ehci
>>>                - snps,hsdk-v1.0-ehci
>>>                - socionext,uniphier-ehci
>>> @@ -186,6 +187,15 @@ allOf:
>>>        required:
>>>          - clocks
>>>          - clock-names
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: rockchip,rk3568-ehci
>>> +    then:
>>> +      properties:
>>> +        clocks:
>>> +          minItems: 4
>>=20
>> I think that the constraint for rk3588 is this:
>> - minItems: 1
>> - maxItems: 4
>>=20
>> Like ~ every other compatible; there's no 'branch' for rk3588-ehci.
>>=20
>> That's different from what you add for rk3568. Is that deliberate?
>> Because from the commit message I assumed they should be the same.
>
> It was deliberate, the intention is to use min/maxItems: 4 for rk3568

Thanks :-)

> for both EHCI and OHCI. I left out anything related to k3588 to keep
> existing behavior and avoid any possible breakage, and why I used
> 'similar' and not 'same' in the commit message ;-)
>
> Did a check and the rk3588 variant also uses 4 clocks so I will add same
> constraint for the rk3588 variant and address Sashiko's concern in v2.

FWIW: I would be absolutely fine if you restrict this patch set to just RK3=
568.
For the same reason you mentioned. All I wanted to know if it was deliberat=
e
and you confirmed that :-)

Cheers,
  Diederik

> Regards,
> Jonas
>
>>=20
>>>  unevaluatedProperties: false
>>> =20
>>> diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/=
Documentation/devicetree/bindings/usb/generic-ohci.yaml
>>> index d42f448fa204..5f1b4d2bff89 100644
>>> --- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
>>> +++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
>>> @@ -47,6 +47,7 @@ properties:
>>>                - hpe,gxp-ohci
>>>                - ibm,476gtr-ohci
>>>                - ingenic,jz4740-ohci
>>> +              - rockchip,rk3568-ohci
>>>                - rockchip,rk3588-ohci
>>>                - snps,hsdk-v1.0-ohci
>>>            - const: generic-ohci
>>> @@ -198,7 +199,9 @@ allOf:
>>>        properties:
>>>          compatible:
>>>            contains:
>>> -            const: rockchip,rk3588-ohci
>>> +            enum:
>>> +              - rockchip,rk3568-ohci
>>> +              - rockchip,rk3588-ohci
>>=20
>> Here they clearly do have the same constraint.
>>=20
>> Cheers,
>>   Diederik
>>=20
>>>      then:
>>>        properties:
>>>          clocks:
>>=20


