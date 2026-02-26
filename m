Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7A9FC5926
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 10:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rRCTN+8mh+nJiNDHEitoalpM8uZzEk3mPWkttWu0iYI=; b=zJsWhfcQVBF/6NXU63mbOsrJNe
	Iv+gJUHk/h5Nsq3GwOn/mt9rFG2nI1NY1mzpqaCFJT+KV6pgUzW/+ger6Pz/EXusNAtRr6bk5r+ek
	ahJL25zGORd6grFATJ8SUzhAgWI+79l3uWW/3/5RnKCOaFMadZdIegiuldJLTz8ODiR+stYEaoy5o
	7E4C6OKQwsiAyqiwDrKtJEoXTIKb3h2EiD2GPWYCUkeYSdrjhklbPAeoLqjpjW4Y2fYeinptpquLZ
	PJqi9jPhET8iiOLSJW3IfwyxWbroFAnq7oewFPkIZKqahs+H2si/ULHlMkk8yQFHtGwX76IQC3UYm
	2b+r/Jkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvYyY-00000005xyA-1keT;
	Thu, 26 Feb 2026 10:52:10 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvYyV-00000005xwz-3Y7F;
	Thu, 26 Feb 2026 10:52:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772103125;
	bh=XzneIRZzyc+1SaJw/OACAJR1d66oV8Ny3EVQs5tDFCQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WDwZD6SaRD40fYYK7SgVaH//kDPOuKUXdNhL6CeX0W1O8CqQS8++FSoIRJt1KJsrq
	 3jhwzkmVW5Us7ek5ZlYoexfZrzGZrcAvdrCbAV1Qu9Aeke8q5EdEDrO4wVxB6AwFxP
	 Z1ALASrmZVO93Jlm5J5k1XhbWG972TU8HRLrZnidgYKkVKOmjOwnThyy3LDtw6QUiV
	 dtcov3qY9GGwFgqvnLoV+dYfD3va5XTLjMLVcQo0pq6Ta4o2trF1xQkYLVJR6brM9D
	 s1qDinkKTpprPOgkFvCYhgeotAbhpNGm4jKjJoucg3zoM1Tk7tvoP2nH3K/I6NsYmB
	 Xxx69l0hzZSfw==
Received: from [192.168.1.90] (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D82D817E03E5;
	Thu, 26 Feb 2026 11:52:04 +0100 (CET)
Message-ID: <1748aeb6-8504-4acb-afd0-ac1d2cb46937@collabora.com>
Date: Thu, 26 Feb 2026 12:52:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] media: dt-bindings: rockchip,vdec: Add alternative
 reg-names order for RK35{76,88}
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil@kernel.org>, kernel@collabora.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, linux-media@vger.kernel.org
References: <20260225-vdec-reg-order-rk3576-v3-0-5a2ebe1b11a8@collabora.com>
 <20260225-vdec-reg-order-rk3576-v3-1-5a2ebe1b11a8@collabora.com>
 <9bb74438-e759-46a7-9fa1-2c6b1fced76b@kernel.org>
 <d5a244f3-5f1b-4bcb-8042-646320a47b6c@collabora.com>
 <85793250-425d-40da-b382-ada9fc7b50e1@kernel.org>
 <72a72c50-4816-47d4-b533-be4b7feee027@collabora.com>
 <20260226-screeching-manatee-of-amplitude-6dfbf6@quoll>
 <12b30229-1c55-429d-8a3c-0d831c4d33ab@kernel.org>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <12b30229-1c55-429d-8a3c-0d831c4d33ab@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_025208_057969_2C75021B 
X-CRM114-Status: GOOD (  14.98  )
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

On 2/26/26 9:26 AM, Krzysztof Kozlowski wrote:
> On 26/02/2026 08:25, Krzysztof Kozlowski wrote:
>> On Thu, Feb 26, 2026 at 12:26:37AM +0200, Cristian Ciocaltea wrote:
>>>>> Sorry, but I don't quite get why would this be a better approach than just
>>>>> properly list the items according to the HW layout, i.e. following the
>>>>> address-based ordering?
>>>>
>>>> We always expect the list to grow, to have common set. That's rule given
>>>> during reviews multiple times. For multiple reasons, also explained
>>>> (consistency, maintenance and actually proper description of hardware
>>>> like the main reg address space).
>>>>
>>>> Probably this was also given to that binding during discussions when it
>>>> was upstream, so your change reverts previous discussion and to that I
>>>> do not agree.
>>>
>>> Thank you for detailing this, I get your point now.
>>>
>>> After digging a bit further, it looks like the "function" naming has been
>>> introduced as part of the RK3588 support via commit c6ffb7e1fb90 ("media:
>>> dt-bindings: rockchip: Document RK3588 Video Decoder bindings").
>>>
>>> Morever, it also sets `reg-names: false` for all the SoCs other than RK3588 -
>>> sorry for missing this initially.
>>>
>>> Hence "function" wasn't used at all in the context of the older SoCs, while on
>>> RK3588 & RK3576 there is no indication that "function" should be treated as the
>>> main address space or anything like that.  E.g. RK3588 TRM clearly shows the
>>> "link" range at the top of the listing, starting at video decoder unit base
>>> address:
>>>
>>> --------------------------------------------------------------------------------
>>> Config Register                         |   Base addr
>>> --------------------------------------------------------------------------------
>>> VDPU381 core0/1 link table config base  |   VDPU381_core0/1_base+0x000
>>> VDPU381 core0/1 function config base    |   VDPU381_core0/1_base+0x100
>>> --------------------------------------------------------------------------------
>>>                                         |   VDPU381_core0/1_base+0x600 for Y channel
>>> VDPU381 core0/1 cache config base       |   VDPU381_core0/1_base+0x640 for C channel
>>>                                         |   VDPU381_core0/1_base+0x680 for head channel
>>> --------------------------------------------------------------------------------
>>>
>>> Assuming the reasoning above is now good enough to move further with the
>>> proposed approach, I can prepare a new revision dropping the unnecessary
>>> one-entry item from the reg-names, while keeping all the rest in the series as
>>> is.
>>
>> Yes, with drop of the oneOf this would be fine.
> 
> I meant, the "one item option" in oneOf.

Yes, handled in v4:

https://lore.kernel.org/all/20260226-vdec-reg-order-rk3576-v4-0-b8d72dc75250@collabora.com/

Thanks,
Cristian

