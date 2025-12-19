Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D64D767CB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 10:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YPmigkvND1M65bM7eLtB8Efz6RO6LivRSWldgQpo5aw=; b=wvufoasztw/JS+PJXjfgg7mPon
	rkTaMaa/2sv8D7odaYd5O61iZ9sUo4YejvKWsvNsCmESF7D1w4KCqa1PnXZs3vzxwiCnhN+HclU+g
	yBpigiQXBr5S5F8FiDbsJFPFiAkz05hMg2TxK1C0KqaWrJEq+CysjS4TdsgFHUOj1KePA+Sn1EOP8
	lGUcj9NY3x1pPotwGirmqNap8/DuTJ/7IW3Gk8AFeeYTln9IIOXdBeCtToi+BxRlUFa59Bg+9RtaV
	wAS5bugSmOkSJf4zrpGrk9/cyBBEbda9RXq2ZhBMJcANnOOITCY9KVrKw/lP6d9DRxbpx+i2BTh/W
	rvkt17lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWY1u-0000000A9Q2-1Xur;
	Fri, 19 Dec 2025 10:48:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWY1r-0000000A9P3-2gwU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 10:48:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B75DFEC;
	Fri, 19 Dec 2025 02:48:03 -0800 (PST)
Received: from e134710.manchester.arm.com (e134710.arm.com [10.33.10.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD0803F5CA;
	Fri, 19 Dec 2025 02:48:08 -0800 (PST)
From: Ahmed Tiba <ahmed.tiba@arm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-acpi@vger.kernel.org,
	devicetree@vger.kernel.org
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
Date: Fri, 19 Dec 2025 10:47:53 +0000
Message-ID: <20251219104759.2726164-1-ahmed.tiba@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <57772b40-e4d9-4152-9709-04ba897608d0@kernel.org>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_024811_714677_86B640F2 
X-CRM114-Status: UNSURE (   9.74  )
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

