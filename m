Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F24D6D232
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 19:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sNWIT443GGw5o2pSrAlRLPYVSz0g8PQxbKXi7X0RwnQ=; b=lkJGwNQRO49rT/f5Dt8u6XzBn0
	ecQNHLn6x5Bzuq+GFIFJ8hCJvRwqx8tJMA3h09W80N4Ym+DWmqoMtNBU6oT8Y7lMrKlP7e6d+Lk6l
	8+pym9Jn1NcwA+jUb/D/TXFM9GgCQ31y6QFw4hMDwyeTeFH4fvBA+gr/vuPUvYleQ2Ct588AyVo2o
	74Afx2niClB1E1nG3JMYOKPW3Jx6VO8yMvBu09l0YbK3oEervp3kWK8qKXjC4OIM6kV76ri0JVGn7
	AhzBni9bwLq42BspHL0kqfb0Ta4zi0WjAZzQ5YY74n7XucDXDMJd7WucP7WWatbECb1+NE+KnN8Bm
	eWE040XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGNiv-0000000DwFD-2jfh;
	Wed, 27 Nov 2024 19:29:17 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGNhx-0000000Dw8X-16lu;
	Wed, 27 Nov 2024 19:28:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 88D53A439E8;
	Wed, 27 Nov 2024 19:26:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D86DC4CECC;
	Wed, 27 Nov 2024 19:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732735696;
	bh=L/s3c4/RZA69fHGylBHRrju1a7fV+Zb4xiWFgej2aOg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cNzNsL0rLiE+MtsxgjGHK9NSnDA4rTiFw6O8KjtLSpBPnT2/5tQpQsjrD+1j+kJGD
	 9mIe7cpoVHj+90qDhpPdYKw4AdSPB0+xF2H/tysr2QsshKlqfGx2R3bKH/pG5ean5v
	 PGJClW/KMtKl1Eehze4NNYbaUneRwjtugENSvl8btR2Tl9NaQNPDW6cRGb/spbvzMO
	 PhSnTkEuR1x5M0nHw36Pb1OVu+Q/GMMuJzWkXiJHf7G4fpS82bJ6H+p1J7zPyedeK+
	 ci5kBtKxIKePvm3LXihTRIKktsxkCgmAzUjJXZHubC38QCBxLgF7Ks0NtXDSIUdTc7
	 BcT4LXqDxR8vQ==
Message-ID: <2e81384a-7165-4f25-b84f-7a0045bad60a@kernel.org>
Date: Wed, 27 Nov 2024 20:28:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] dt-bindings: power: Convert raspberrypi,bcm2835-power
 to Dt schema
To: Karan Sanghavi <karansanghvi98@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
 Alexander Aring <alex.aring@gmail.com>, Eric Anholt <eric@anholt.net>
References: <20241028-raspberrypi-bcm2835-power-v4-1-acf44abd45ff@gmail.com>
 <bdze3425qwrtlvlairw2b4xiycpkmhirzhqn2jt6jngc3bu4ta@uo4nc2lnj4sf>
 <qb5sdh55yj7est52netydaauazgluej6hvvtutmmiw2bhglnpw@lq2cyg3hjhlw>
 <b81cd6bd-4a7e-4032-aa56-843793a0e0c8@kernel.org>
 <5wzekgv7ccja7ucz2w3byprltalflx4am24scecxjokra4t44g@ll56dfqotyoq>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <5wzekgv7ccja7ucz2w3byprltalflx4am24scecxjokra4t44g@ll56dfqotyoq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_112817_446561_BED0E3CC 
X-CRM114-Status: GOOD (  19.74  )
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

On 27/11/2024 19:38, Karan Sanghavi wrote:
> On Sun, Nov 24, 2024 at 11:52:35AM +0100, Krzysztof Kozlowski wrote:
>> On 24/11/2024 09:49, Karan Sanghavi wrote:
>>> On Tue, Oct 29, 2024 at 08:10:23AM +0100, Krzysztof Kozlowski wrote:
>>>> On Mon, Oct 28, 2024 at 04:44:12PM +0000, Karan Sanghavi wrote:
>>>>> Convert the raspberrypi,bcm2835-power binding to Dt schema
>>>>>
>>>>> Signed-off-by: Karan Sanghavi <karansanghvi98@gmail.com>
>>>>> ---
>>>>> Changes in v4:
>>>>> - Corrected misindentations and random differences.
>>>>> - Link to v3: https://lore.kernel.org/r/20241026-raspberrypi-bcm2835-power-v3-1-6621e075d33f@gmail.com
>>>>
>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>
>>>> ---
>>>>
>>>> <form letter>
>>>> This is an automated instruction, just in case, because many review tags
>>>> are being ignored. If you know the process, you can skip it (please do
>>>> not feel offended by me posting it here - no bad intentions intended).
>>>> If you do not know the process, here is a short explanation:
>>>>
>>>> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
>>>> versions, under or above your Signed-off-by tag. Tag is "received", when
>>>> provided in a message replied to you on the mailing list. Tools like b4
>>>> can help here. However, there's no need to repost patches *only* to add
>>>> the tags. The upstream maintainer will do that for tags received on the
>>>> version they apply.
>>>>
>>>> https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577
>>>> </form letter>
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>>
>>>
>>> Dear Krzysztof,
>>>
>>> I hope this email finds you well. 
>>> I'm following up on the patch I recently submitted linked below.
>>> https://lore.kernel.org/all/ZxEm-H-PjlQyXeOH@Emma/
>> I don't understand why do you reply to this patch about other patch.
>> Anyway, you got reply there.
>>
> Really sorry to attach the wrong link 
> Please find the corret link below
> https://lore.kernel.org/all/20241028-raspberrypi-bcm2835-power-v4-1-acf44abd45ff@gmail.com/
> 
> Is there anything more left form my side for this patch as you have given the
> reviewed by tag to it but still it hasn't been applied yet 

Yeah... Two things here:
1. It was not sent to PM domain maintainers, so subsystem maintainers
won't pick it up.
2. If you want to ping someone, then rather ping Broadcom maintainers,
not me. Broadcom maintainers could have taken this patch almost month ago.


For the (1) above, get_maintainers.pl is not accurate in this case. You
will get *additional* addresses to Cc with get_maintainers.pl on
drivers/pmdomain/bcm/raspberrypi-power.c. After merge window, I suggest
to resend this wider audience with *the Rb tag applied*.


Best regards,
Krzysztof

