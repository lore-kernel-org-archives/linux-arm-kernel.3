Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA01CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 07:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=brFSUkDZTDolZhcUeIbGihgytnqOaPKAtMS5WiZeM3U=; b=uzO8jVKFpEd7Bn58VbMZUMzWEn
	u3egPlidWeNK+WNlIH3wQQ1oCXZ66319T2Vn40XAiVkqSvGlXujP7zpN0gWPXMl80SmR+JU7q1L/E
	f0n0AndC1R0GCkBgYm7n8XWNFu1jCtsOUA3yloyUXJIFCl2Xk2WgYQmwwq3oL8CbMduGhNIBgC6XN
	JIpLJGciCU0Slhq1SsDNhvNuJ4PIjGdn9xZq/TRk4f2sQ59fmVcd8ePjZ7utHKiKOGKMNMOqE/pEO
	BkCvX56HreaFrCTc8sUBlUBrzHOyYl9WAX2ZuXvfWGDJKeESU7G4PiKfts4+5nsMvH1L7AxaVVdWa
	rrSN1Wfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEiu3-00000003nRr-1Uax;
	Thu, 08 Oct 2026 07:50:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEitz-00000003nQK-3aW2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 07:50:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 906B61516;
	Thu,  8 Oct 2026 00:50:47 -0700 (PDT)
Received: from [192.168.178.72] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 919353F959;
	Thu,  8 Oct 2026 00:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791445850; bh=M7FNo7bgBUiaWI/HcaQdIdCBXfKJLk20mb3qyz9nUno=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WruXY8bopBSNctghFvI9GjTqI11dUVfJNNXm7mmPDtfD+stzVxn15wyrJqYoJoAbM
	 dc4UCzdiloByiV4ihV+DpAtpow+9tmDOHN1OmU15LZfRMWAy3cv/FyXuqNNgmC33Af
	 38uGRqrsjRkL7XEBmLtEKfw5g8VV96G9cwXmkj/U=
Message-ID: <6bb97a9e-cc9c-48c0-bf6d-3a1c6e8048f2@arm.com>
Date: Thu, 8 Oct 2026 09:50:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/11] dt-bindings: pinctrl: sun4i-a10: add Allwinner
 B288
To: Rob Herring <robh@kernel.org>, Pablo Mazzini <pmazzini@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev
References: <20261005202731.153971-1-pmazzini@gmail.com>
 <20261005202731.153971-4-pmazzini@gmail.com>
 <20261007211626.GA338242-robh@kernel.org>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261007211626.GA338242-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_005056_055893_57E9CFDE 
X-CRM114-Status: GOOD (  15.41  )
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

Hi,

On 10/7/26 23:16, Rob Herring wrote:
> On Mon, Oct 05, 2026 at 09:27:23PM +0100, Pablo Mazzini wrote:
>> The B288 driver takes its mux values from the DT, so allwinner,pinmux
>> becomes an allowed property here, required for this compatible only.
>>
>> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
>> ---
>>   .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  | 22 +++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
>> index 45b7a0b6c626..b1f093d218f5 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
>> @@ -39,6 +39,7 @@ properties:
>>         - allwinner,sun8i-a33-pinctrl
>>         - allwinner,sun8i-a83t-pinctrl
>>         - allwinner,sun8i-a83t-r-pinctrl
>> +      - allwinner,sun8i-b288-pinctrl
>>         - allwinner,sun8i-h3-pinctrl
>>         - allwinner,sun8i-h3-r-pinctrl
>>         - allwinner,sun8i-r40-pinctrl
>> @@ -120,6 +121,15 @@ patternProperties:
>>           $ref: /schemas/types.yaml#/definitions/uint32
>>           enum: [10, 20, 30, 40]
>>   
>> +      allwinner,pinmux:
>> +        $ref: /schemas/types.yaml#/definitions/uint32-array
>> +        description:
>> +          Pinmux selector value, for each pin. Only used by SoCs whose
>> +          driver takes the mux values from the DT instead of an in-driver
>> +          table. Almost every time this value is the same for all pins, so
>> +          any array shorter than the number of pins will repeat the last
>> +          value, to allow just specifying a single cell, for all cells.
> 
> Perhaps new platforms should move to the common 'pinmux' property?

If you mean to just drop the allwinner prefix: this has been discussed, 
but NAKed, because the generic property carries a different semantic. 
And implementing that generic behaviour in the existing sunxi pinctrl 
driver would be quite some effort (read: a rewrite), without any obvious 
win, so we decided back then to not boil the ocean here, and just go 
with a special property.

Cheers,
Andre


