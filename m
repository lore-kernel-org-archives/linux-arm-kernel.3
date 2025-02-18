Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8E7C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 18:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zVFXRSmqx5BnoRM4CNN1giPCorlAq7ffHKtbHAgrzbk=; b=cxqoyZqvwYHeFT1jiQVcf7VhGg
	BmYHyQRb36Jw+qI/CzfB49IEiVSMF1w6FXKAZVoz4Cguqd4ZsyBTgRuA1Hf+ctyX9cLMpXP+/SKyq
	uhawqsMbheNKWvNrzcwf51e0hcz/q6kbliC3NZRJXCcnJN1tiuOptnQF2KVQl+xM2twlIoH5hl3AC
	H/971OtBWJu+UdLBAb74JkuZIrCrCA6lIy3AAqvjEhctqQ7xRFbqR46hiG9JaX3RUdfh/qVLYdVr3
	aGGoilb8fzHRvyPQxd0VlV2/ZKN8mRiCwhwFWkUlF8Ur9ZlPHA6vdp43LT3qPEGV4Yjbf7XmNGznM
	7Js3Nz7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkS2H-00000009HkP-3QyF;
	Tue, 18 Feb 2025 18:09:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkS0n-00000009HVn-10AE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 18:08:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73DCD152B;
	Tue, 18 Feb 2025 10:08:16 -0800 (PST)
Received: from [10.1.196.72] (e119884-lin.cambridge.arm.com [10.1.196.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C54FC3F6A8;
	Tue, 18 Feb 2025 10:07:55 -0800 (PST)
Message-ID: <9570e9bd-0555-4abb-930d-3f393df2b4ca@arm.com>
Date: Tue, 18 Feb 2025 18:07:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/8] dt-bindings: arm: Add Morello fvp compatibility
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
References: <20250213180309.485528-1-vincenzo.frascino@arm.com>
 <20250213180309.485528-3-vincenzo.frascino@arm.com>
 <20250214-utopian-griffin-of-innovation-fabc40@krzk-bin>
Content-Language: en-US
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <20250214-utopian-griffin-of-innovation-fabc40@krzk-bin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_100801_344091_945EBF06 
X-CRM114-Status: GOOD (  13.75  )
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



On 14/02/2025 08:12, Krzysztof Kozlowski wrote:
> On Thu, Feb 13, 2025 at 06:03:03PM +0000, Vincenzo Frascino wrote:
>> Add compatibility to Arm Morello Fixed Virtual Platform.
>>
>> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
>> ---
>>  Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml b/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
>> index 40e7910756c8..e71e3e33c4be 100644
>> --- a/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
>> +++ b/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
>> @@ -122,6 +122,10 @@ properties:
>>          items:
>>            - const: arm,morello-sdp
> 
> That's just part of the enum here.
>

I am not sure on what you want me to do :)

--->8---

diff --git a/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
b/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
index 40e7910756c8..8de508b977b0 100644
--- a/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
@@ -118,9 +118,11 @@ description: |+
         items:
           - const: arm,foundation-aarch64
           - const: arm,vexpress
-      - description: Arm Morello System Development Platform
+      - description: Arm Morello System Development/Fixed Virtual Platform
         items:
-          - const: arm,morello-sdp
+          - enum:
+	      - arm,morello-sdp
+	      - arm,morello-fvp
           - const: arm,morello

   arm,vexpress,position:
-- 
2.34.1

--->8---

Something like this?

>>            - const: arm,morello
>> +      - description: Arm Morello Fixed Virtual Platform
>> +        items:
>> +          - const: arm,morello-fvp
> 
> Best regards,
> Krzysztof
> 

-- 
Regards,
Vincenzo


