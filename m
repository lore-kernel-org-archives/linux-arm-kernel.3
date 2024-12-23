Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25569E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 16:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4IhY/z/XL4X4dKVdbKYWND5osDmcaKQYkj7eqVRwK/I=; b=E8QY3KHhD6bM1G3sCK1Y720edA
	fN3tSsU31cJPkAbFsGCij7MUoE1hGBbxNr+rO0vCf0n+DaAsIBMVemnjxC8HtJ5V0RJK/Yipj7xnU
	fNqfEDaTf02/TpqqH1USoyw7w1tt+KzpeCCsEfHMEjLZq0oBFOo3LM/dpREkVic9Gln8F8/rS+b8n
	LMslHCQv3nRS2bYNZjAYdvlzcvGwrDjALyMKcmrOM5oaZIJuf6XqamGBl2hF8uQQqUpUQpgDgTDrg
	HxlsX37G5RMRZ7ddO6lBEm8zQl9wm7kJoEdtKai5QMurbmV8qAndZEBw3ZaC0qWH4C2DtxLER4f7j
	MvhFnjbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPlXM-0000000AQOS-41za;
	Mon, 23 Dec 2024 16:44:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPlVC-0000000AQ5v-0CZV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 16:41:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 987BA1424;
	Mon, 23 Dec 2024 08:42:21 -0800 (PST)
Received: from [10.57.74.39] (unknown [10.57.74.39])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A99343F694;
	Mon, 23 Dec 2024 08:41:51 -0800 (PST)
Message-ID: <342b3c31-7e82-41d1-a9f0-9f3973f99486@arm.com>
Date: Mon, 23 Dec 2024 16:41:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: Add Morello compatibility
To: Krzysztof Kozlowski <krzk@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Russell King <linux@armlinux.org.uk>
References: <20241223162029.326997-1-vincenzo.frascino@arm.com>
 <20241223162029.326997-2-vincenzo.frascino@arm.com>
 <fc83ab3f-99fe-4566-9a33-670956dd76a4@kernel.org>
Content-Language: en-GB
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <fc83ab3f-99fe-4566-9a33-670956dd76a4@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_084154_145941_69FDAF91 
X-CRM114-Status: GOOD (  14.11  )
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



On 23/12/2024 16:32, Krzysztof Kozlowski wrote:
> On 23/12/2024 17:20, Vincenzo Frascino wrote:
>> Add compatibility to Arm Morello System Development Platform.
>>
>> Note: Morello is at the same time the name of an Architecture [1], an SoC
>> [2] and a Board [2].
>> To distinguish in between Architecture/SoC and Board we refer to the first
>> as arm,morello and to the second as arm,morello-sdp.
>>
>> [1] https://developer.arm.com/Architectures/Morello
>> [2] https://www.morello-project.org/
>>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: Liviu Dudau <liviu.dudau@arm.com>
>> Cc: Sudeep Holla <sudeep.holla@arm.com>
>> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
>> Cc: Russell King <linux@armlinux.org.uk>
>> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
>> ---
>>  Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml b/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
>> index 8dd6b6446394..7934d2c4cba0 100644
>> --- a/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
>> +++ b/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
>> @@ -118,6 +118,9 @@ properties:
>>          items:
>>            - const: arm,foundation-aarch64
>>            - const: arm,vexpress
>> +      - description: Arm Morello System Development Platform
>> +        items:
>> +          - const: arm,morello-sdp
> Also:
> const: arm,morello
> 
> Unless you claim that this cannot be used in any other product than SDP,
> but this then needs explanation in commit msg.
>

Morello is a Prototype architecture and there are no plans to use it outside of
SDP hence I did not add arm,morello.

I thought it was clear since the note states that Architecture, SoC and Board
have the same name, if not, happy do address it in v3.

> Best regards,
> Krzysztof

-- 
Regards,
Vincenzo


