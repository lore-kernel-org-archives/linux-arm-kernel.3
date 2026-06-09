Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E37CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 18:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ytbyKI+RdUvyVlcNYTn52rG1AH2yMD9Qe40oM2s5RvY=; b=dbWyJ3eR7F4JWKgVmBmkHsKgd5
	9G/H3W9iUJsdPluyX8sPJyeI9fNIVd5xAoFUr6re5GL7lL08A6vam/lQ3UEZR9LJw2okg9b8UTunT
	qhWJ2jo6IfBguHAjIVR55JtLj+Nn5VV6j0cYwq4oJU91qReLDCoAGC3dI85S/qnhOrK4cb3eRByhN
	czWaeczqgcm82P7DNSRvepqky6+xKkdwow2xk9i4nUBEOZ8oVF5A+0IaNz4cy45K3qT4hfaSlfJzr
	hcYHY3hOHgEeuFAE2I6jcIpI7ItIKqlH3VZ8EDWZEry+2wsEvK7ADokNfygWv58XZIa0BOzPdI1+F
	WC/kkJ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX0qK-00000006ANH-1hCE;
	Tue, 09 Jun 2026 18:06:28 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX0qG-00000006AMX-4BOC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 18:06:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1781028383;
 bh=ytbyKI+RdUvyVlcNYTn52rG1AH2yMD9Qe40oM2s5RvY=;
 b=RNAns0VLyaGmhjVFUFuVeo6B5UsmymLOXRad9pqF4ND0DcJ/ou2seEzFlPdryHfyRSdV9FZGp
 SPGqSQjSQySaY2NZ9Fzxb0o4XTJsKa7ZaUfHU0Sf8o4YvI7gIlnBvOyUsOLsxSbeX4+8uT/icBc
 oVW/woKKC0W0qUXR24lwh0985KuYIdtuXo5g2/XVSJp2y9Nh2hcJz8HnGg6VUdcGqxpQFdZu4lT
 2N/sTRNJcfZ2XeF11io7kZ3liX3Zs5ZYvm5K6uOZoXxitokfyHfZ+dRKKPbAfxtR3lBxoyfBXNr
 LnI88mCBTR/TIvreXMagO7SaeUVOY+Y2ZJMOuG6jSk4Q==
X-Forward-Email-ID: 6a28561cb3badaab58d3c4fc
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.8.22
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <9e8f806d-72ec-4eb4-8967-3f82eb0e7dd4@kwiboo.se>
Date: Tue, 9 Jun 2026 20:06:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: usb: Add Rockchip RK3568 compatible for
 EHCI and OHCI
To: Diederik de Haas <diederik@cknow-tech.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260609154124.445182-1-jonas@kwiboo.se>
 <20260609154124.445182-2-jonas@kwiboo.se>
 <DJ4NVA328NUV.LSPMVBFE0PD8@cknow-tech.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <DJ4NVA328NUV.LSPMVBFE0PD8@cknow-tech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_110625_502529_C6862745 
X-CRM114-Status: GOOD (  22.50  )
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

Hi Diederik,

On 6/9/2026 6:32 PM, Diederik de Haas wrote:
> Hi Jonas,
> 
> On Tue Jun 9, 2026 at 5:41 PM CEST, Jonas Karlman wrote:
>> The Rockchip RK3568 EHCI/OHCI controller depends on clk_usbphy1_480m
>> being enabled, or the system may freeze when registers are accessed.
>>
>> Add Rockchip RK3568 EHCI and OHCI compatibles with a similar four-clock
>> constraint as RK3588.
>>
>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>> ---
>> Existing DTs for RK3568 use the plain generic-ehci/ohci compatible,
>> next patch make use of these new compatibles and adds the missing
>> clk_usbphy1_480m clock references.
>> ---
>>  .../devicetree/bindings/usb/generic-ehci.yaml          | 10 ++++++++++
>>  .../devicetree/bindings/usb/generic-ohci.yaml          |  5 ++++-
>>  2 files changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
>> index 55a5aa7d7a54..c49a1bbc8cfd 100644
>> --- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
>> +++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
>> @@ -52,6 +52,7 @@ properties:
>>                - ibm,476gtr-ehci
>>                - nxp,lpc1850-ehci
>>                - qca,ar7100-ehci
>> +              - rockchip,rk3568-ehci
>>                - rockchip,rk3588-ehci
>>                - snps,hsdk-v1.0-ehci
>>                - socionext,uniphier-ehci
>> @@ -186,6 +187,15 @@ allOf:
>>        required:
>>          - clocks
>>          - clock-names
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: rockchip,rk3568-ehci
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 4
> 
> I think that the constraint for rk3588 is this:
> - minItems: 1
> - maxItems: 4
> 
> Like ~ every other compatible; there's no 'branch' for rk3588-ehci.
> 
> That's different from what you add for rk3568. Is that deliberate?
> Because from the commit message I assumed they should be the same.

It was deliberate, the intention is to use min/maxItems: 4 for rk3568
for both EHCI and OHCI. I left out anything related to k3588 to keep
existing behavior and avoid any possible breakage, and why I used
'similar' and not 'same' in the commit message ;-)

Did a check and the rk3588 variant also uses 4 clocks so I will add same
constraint for the rk3588 variant and address Sashiko's concern in v2.

Regards,
Jonas

> 
>>  unevaluatedProperties: false
>>  
>> diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
>> index d42f448fa204..5f1b4d2bff89 100644
>> --- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
>> +++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
>> @@ -47,6 +47,7 @@ properties:
>>                - hpe,gxp-ohci
>>                - ibm,476gtr-ohci
>>                - ingenic,jz4740-ohci
>> +              - rockchip,rk3568-ohci
>>                - rockchip,rk3588-ohci
>>                - snps,hsdk-v1.0-ohci
>>            - const: generic-ohci
>> @@ -198,7 +199,9 @@ allOf:
>>        properties:
>>          compatible:
>>            contains:
>> -            const: rockchip,rk3588-ohci
>> +            enum:
>> +              - rockchip,rk3568-ohci
>> +              - rockchip,rk3588-ohci
> 
> Here they clearly do have the same constraint.
> 
> Cheers,
>   Diederik
> 
>>      then:
>>        properties:
>>          clocks:
> 


