Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D52D767D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 10:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YPmigkvND1M65bM7eLtB8Efz6RO6LivRSWldgQpo5aw=; b=3ZFgWIOpjkjMH3lIBqaPLki2zm
	ZgYpNk4AUGcb1pLOm2ofoGOwNMJ+nyvnBXoK8/AebSxXR+mcYSj1LJGEKlq1yc70kDHQUTjjqKQUY
	vEWcpX/VDUZpi5SSWCSHT/JUiV7UfERKqoYPQ3nh4x7rsXzC9LAksbeMjXC9rqTz9lJed1RE7c/6c
	bzLdYIJlQjs1UuJP9f70x8SIFozRME9W3VkBZ8ujn+/A0Stiask8k5FLdTpUh0/twfxwnDam7IVSv
	VOIw+PGbztnn+VpNSM8HgLu7EAJwERFuoB9Wud3Uz77P2q7eiJ6Rc/9LML4Ur2fXnSpOBsGpbpe0P
	eqv93ZKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXtO-0000000A8Q6-2ynl;
	Fri, 19 Dec 2025 10:39:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXtM-0000000A8Oa-1bRD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 10:39:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47CEAFEC;
	Fri, 19 Dec 2025 02:39:16 -0800 (PST)
Received: from e134710.manchester.arm.com (e134710.arm.com [10.33.10.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9AF7B3F5CA;
	Fri, 19 Dec 2025 02:39:21 -0800 (PST)
From: Ahmed Tiba <ahmed.tiba@arm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: tony.luck@intel.com,
	bp@alien8.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	rafael@kernel.org,
	linux-doc@vger.kernel.org,
	Dmitry.Lamerov@arm.com,
	Michael.Zhao2@arm.com,
	Ahmed.Tiba@arm.com
Subject: Re: [PATCH 10/12] dt-bindings: ras: document estatus provider
Date: Fri, 19 Dec 2025 10:37:57 +0000
Message-ID: <20251219103850.2722580-1-ahmed.tiba@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <57772b40-e4d9-4152-9709-04ba897608d0@kernel.org>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_023924_458423_14216A8F 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
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


On 19/12/2025 10:53, Krzysztof Kozlowski wrote:
>> On 17/12/2025 12:41, Krzysztof Kozlowski wrote:
>>>> +properties:
>>>> +  compatible:
>>>> +    const: arm,ras-ffh
>>>
>>> Again ras - what's that? Your patch or binding must explain that.
>>
>> That updated description will explicitly expand the Arm RAS acronym so the
>> compatible string is self-explanatory.
>>
>>>> +
>>>> +  reg:
>>>> +    minItems: 1
>>>
>>> Why is this flexible?
>>
>> I'll keep `reg` describing the CPER status buffer, cap it at two entries, and
>> document the second entry as the optional doorbell register that some firmware
>> requires before reusing the buffer.
>
> I still do not understand why this is flexible or in other words - why
> second address space appears and disappears.

The second address space is only present for firmware that exposes an ACK register.
Not all platforms require this extra handshake so that address shows up only
when the extra handshake exists. I’ll say that clearly in the binding
so it’s obvious the region is optional.

>>
>>>> +    items:
>>>> +      - description: CPER status block exposed by firmware
>>>> +      - description:
>>>> +          Optional 32- or 64-bit acknowledgment register. Firmware watches this
>>>> +          register and expects bit 0 to be written to 1 once the OS consumes the
>>>> +          status buffer so it can reuse the record.
>>>> +


Best regards,
Ahmed

