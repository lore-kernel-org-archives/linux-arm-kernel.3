Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E91D29C5D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 19:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HHWgHmHioEt/0YiiJEprWST3wU3t3S/52C4koyjJRYk=; b=cQPRsS1rcuTg0EhjRHtR+QY7ES
	YiDr8WGvPAEc2ygYj4HFfRsPvkVGdpviPZVNs0x9hdTyQEk+AcW6BZPgNsS5SP+56ICb/YhwsaMpZ
	PkqnhUhrU5OUJhO4TMeYbKHJxGlGoIBEQ9w8LP2QfnifYv4B2+ubeVYOte6Qifbo0sCjaPw2Z609h
	ESDJO3kVb7vLcqRsTMtByV5/DlbEqS410eifUnXVmIuxb+QCrXA0Ip6FTCUTreoeS+EY3XjDQeRFk
	HX9en8+f7lJ+4cGCAt81yvdIIb6HRE3tNF5IXN2JFKRxAFeykZvkz717Gx/F5ALhr5lTJOdWlwG2S
	36nrn+ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhuV1-00000002kSi-08Bd;
	Mon, 19 Jan 2026 19:01:15 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhuUx-00000002kRX-48qL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 19:01:13 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dw0Cs5gszz9v15;
	Mon, 19 Jan 2026 20:00:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768849257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HHWgHmHioEt/0YiiJEprWST3wU3t3S/52C4koyjJRYk=;
	b=pD6znHaQkhDrHvxE7ZHu8rnPx7tGuW8bnoNSf3bzVLSyUaesaPyNp6ZO5RbceRbr2dm7Zq
	9uAWG+AV8bWIPezuKWOlFyg7VNq/K8Xq2aUgSIhiqjgh52x5G3LHRd9eVC9qUcKL2qWcMO
	4bMXZf/b4PwWs7laV/kbIqkj8P3Ez6JSBwwa21uqfLxFkIEWQmcVHTuqLrmU+6HtCy8hdA
	Ufyi3vTS9Gck/pObcv7xlmpSQIBw2TcLESWawySdGljAAy+5/i+CeViQ6R9pFZ1CsK6J0Q
	b3/knjgKsWycv5FsQUdQPeWVb/NIlRy4nTHRFaPMn6WyGkXzfItLDzNlUt1dpA==
Message-ID: <a76c8764-b0be-40bc-941f-02515cd5167d@mailbox.org>
Date: Mon, 19 Jan 2026 20:00:54 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v4 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,no-completion-irq property
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, "Rob Herring (Arm)" <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Sudeep Holla
 <sudeep.holla@arm.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
References: <20260117010241.186685-1-marek.vasut+renesas@mailbox.org>
 <aW5hmb9tyw1Gv388@pluto>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aW5hmb9tyw1Gv388@pluto>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: jga11wgoc6aah6yxxmh97yibomjjdejy
X-MBO-RS-ID: cde433c36df03f86619
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_110112_176653_0E3D8E89 
X-CRM114-Status: GOOD (  11.11  )
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

On 1/19/26 5:53 PM, Cristian Marussi wrote:

[...]

>> diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
>> index be817fd9cc34b..d06cca9273c48 100644
>> --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
>> +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
>> @@ -146,6 +146,13 @@ properties:
>>         this platform. If set, the value should be non-zero.
>>       minimum: 1
>>   
>> +  arm,no-completion-irq:
>> +    type: boolean
>> +    description:
> 
> Shouldn't these two points have to be swapped as per Sudeep and Rob
> suggestions ?
> 
>      description:
> 	....
>      type: boolean
> 
>> +      This optional property is intended for hardware that does not generate
>> +      completion interrupts and can be used to unconditionally enable forced
>> +      polling mode of operation.
>> +
>>     arm,smc-id:
>>       $ref: /schemas/types.yaml#/definitions/uint32
>>       description:

They were referring to the content of the description: . Note that the 
type precedes the description: , see e.g. arm,smc-id above or any of the 
other properties.

