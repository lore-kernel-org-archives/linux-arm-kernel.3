Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B43CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 10:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HnTgtvKdtHrhMOVirx9l8voTajx/RI49/oZD27VCamo=; b=fdNGvnrGkGBcpQ7O3U4tYqpP8A
	A0QxxHEI4F3ZU8nIieUx/3auE3Mex739kKHPBnK3z2udxC39R7vYCpjElijZZ8jUQnzoR6WAa/Y2a
	JKzeNZW97m45thijPd9o50XZSJG3ilR1PAP+TqlMrXLbFSbAYzUmHSJ+DiW9K/fYvQAUWPZyRHsIz
	R6C4q2J+mzyx8+Qt46ZR6F5H4Be5tA4IBqbGP7zFh1K+bECmAOZb9F7oJvro9aUiwN4xBBvRpmg8p
	WuNm0WmLchloynfQQ3DFDZ6KlVyE2Bqc+PGKFp7tF/7Pir+rTQ/8Ixn233GSpMVqHQaBhCTlqTCM0
	dLrMgs1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3nF-00000000qs3-2Q6P;
	Wed, 29 Oct 2025 10:52:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3nD-00000000qre-44sw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 10:52:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1543A601CF;
	Wed, 29 Oct 2025 10:52:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0C67C4CEF7;
	Wed, 29 Oct 2025 10:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761735158;
	bh=WJY9uVEvm/AtqJJTYDny4vNI0huLEu00IUv36RYkrzI=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=U5aAB87NxdYRSvJ4zuumX21WQyFgrvfPbSMf6qeueMNII2yP+89+Jp6NGNmurIoae
	 HsjjnzobGOs4V9FdjnsA9yQLyS12UbTCJF/jKXNhBcheBgSuIfJfPxOV/eFlzieS7p
	 CIjwqnRG+NzY1IQCbn136Q8qrRjCcbtJeO4f+K8zZSBVR46xAKSrEds04SPZZq4jBJ
	 QLOTF/dcDRTx9qrlP1gKwnOXpkqUm6fEkdYq6TkcEx6lJyEKYPEerEvA10XjrWOoHZ
	 DKzHE7q0EsGAyI/igrqBRCMpV1sLCay+tCm+OXU4f0lpy6/ieVRZm047xrQin9bwly
	 5pl4UleGJaH8w==
Message-ID: <3c3287f6-1c5c-4c4d-9349-32665a5e1585@kernel.org>
Date: Wed, 29 Oct 2025 11:52:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 1/4] dt-bindings: i2c: Split AST2600 binding into a
 new YAML
To: Ryan Chen <ryan_chen@aspeedtech.com>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
 "joel@jms.id.au" <joel@jms.id.au>,
 "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
 "jk@codeconstruct.com.au" <jk@codeconstruct.com.au>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "naresh.solanki@9elements.com" <naresh.solanki@9elements.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20251021013548.2375190-1-ryan_chen@aspeedtech.com>
 <20251021013548.2375190-2-ryan_chen@aspeedtech.com>
 <0b76f196-f642-4991-ad5c-717c23938421@kernel.org>
 <TY2PPF5CB9A1BE6597ECD46BD4CB7C5F09FF2FAA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <TY2PPF5CB9A1BE6597ECD46BD4CB7C5F09FF2FAA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 29/10/2025 09:29, Ryan Chen wrote:
>> Subject: Re: [PATCH v20 1/4] dt-bindings: i2c: Split AST2600 binding into a new
>> YAML
>>
>> On 21/10/2025 03:35, Ryan Chen wrote:
>>> The AST2600 I2C controller is a new hardware design compared to the
>>> I2C controllers in previous ASPEED SoCs (e.g., AST2400, AST2500).
>>>
>>> It introduces new features such as:
>>>  - A redesigned register layout
>>>  - Separation between controller and target mode registers
>>>  - Transfer mode selection (byte, buffer, DMA)
>>>  - Support for a shared global register block for configuration
>>>
>>> Due to these fundamental differences, maintaining a separate
>>> devicetree binding file for AST2600 helps to clearly distinguish the
>>> hardware capabilities and configuration options from the older
>>> controllers.
>>>
>>> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
>>> ---
>>>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   |  3 +-
>>>  .../devicetree/bindings/i2c/ast2600-i2c.yaml  | 66
>>> +++++++++++++++++++
>>>  2 files changed, 67 insertions(+), 2 deletions(-)  create mode 100644
>>> Documentation/devicetree/bindings/i2c/ast2600-i2c.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
>>> b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
>>> index 5b9bd2feda3b..d4e4f412feba 100644
>>> --- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
>>> +++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
>>> @@ -4,7 +4,7 @@
>>>  $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
>>>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>>>
>>> -title: ASPEED I2C on the AST24XX, AST25XX, and AST26XX SoCs
>>> +title: ASPEED I2C on the AST24XX, AST25XX SoCs
>>>
>>>  maintainers:
>>>    - Rayn Chen <rayn_chen@aspeedtech.com> @@ -17,7 +17,6 @@
>>> properties:
>>>      enum:
>>>        - aspeed,ast2400-i2c-bus
>>>        - aspeed,ast2500-i2c-bus
>>> -      - aspeed,ast2600-i2c-bus
>>>
>>>    reg:
>>>      minItems: 1
>>> diff --git a/Documentation/devicetree/bindings/i2c/ast2600-i2c.yaml
>>> b/Documentation/devicetree/bindings/i2c/ast2600-i2c.yaml
>>
>> Why completely breaking naming? Please follow writing bindings carefully.
> 
> Will update 
> $id: "http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.yaml#"
>>
>>> new file mode 100644
>>> index 000000000000..6ddcec5decdc
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/i2c/ast2600-i2c.yaml
>>> @@ -0,0 +1,66 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/i2c/ast2600-i2c.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: ASPEED I2C on the AST26XX SoCs
>>> +
>>> +maintainers:
>>> +  - Ryan Chen <ryan_chen@aspeedtech.com>
>>> +
>>> +allOf:
>>> +  - $ref: /schemas/i2c/i2c-controller.yaml#
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - aspeed,ast2600-i2c-bus
>>> +
>>> +  reg:
>>> +    minItems: 1
>>
>> Why?
> 
> Will update as following.
> 
> reg:
>   minItems: 1
>   maxItems: 2


No. You changed nothing. Instead explain why this is flexible.

See writing bindings.


...


>>> +  bus-frequency:
>>> +    minimum: 500
>>> +    maximum: 4000000
>>> +    default: 100000
>>> +    description: frequency of the bus clock in Hz defaults to 100 kHz when
>> not
>>> +      specified
>>
>> Don't repeat constraints in free form text.
> 
> Will update
> clock-frequency:
>     description: Desired I2C bus frequency in Hz
>     default: 100000

Heh? You are making random set of changes like did not really read the
feedback. I not to repeat something. What is repeated? Constraints.
Where are the repeated "in free form text". What did you do? Dropped
constraints.

I don't know what to say.

Best regards,
Krzysztof

