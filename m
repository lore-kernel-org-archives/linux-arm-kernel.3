Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED2CFEFB72
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 17:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kdCaK5xTTvO3nx17qF/7onW8qMmShwaRuY3RiVJpNo8=; b=uGViwl8MrxvAJirKpdHo0KBn9K
	4FQucz/3IXFQXCoEIuzxsgLBNz0yGalzxgF+pLEBgTkLPXnhbOgr0DEkrN8e0st2fq06ZZG55D1qA
	zDgVZdPLFdFTjIThzR/oVlm2W7O8nEc5fmPxKK8UUT7BNNo1BZ9uFlehnVRKdLRutNO1goJCiu4XP
	bhBgh6qGdIN57/pBP5xq62JmrabkGbDz6ZYSwFKMNjpoNFoBs7YjXtg0Mfze4OWhx3uN+twEJUqPs
	40MqV7eTahj1mHs6pr4xIgeS6bkd0nBL2iTJsjIGVAiYW9mWuKJzpSiKUFcC1YUsckfwfHphN5O3M
	MAvNZw3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw1rh-00000008p9J-2VtX;
	Fri, 27 Feb 2026 17:43:01 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw1re-00000008p81-0oj2;
	Fri, 27 Feb 2026 17:43:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772214174;
	bh=aDAKaw20C2di4uN7BXhImcGDLjfd5fyDY9Dh/9GzZsg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IdnW9gYrbNJfc/RG3EWyuzv7sY7WI/C7ZO2Uvr1qDCKyf8QvO0tjrmFG980Azn9I1
	 JXm4kMMICJ5c17MkWlEpUdsQw40imN+QoZzH+oExhDQXIbON74Ve09LPnqLbLEXal7
	 mMUaDCgzBR/Zd9Xjf3eUmNatNRb9Q8zNAXalmAZ3Kc5ypyQyoZ5K/Acuh5pmRwIvGB
	 ULCQIj+9ZnBZX7h62KIwO8aHTEs8UO+yeW8NsZ77hk1HrfJYU2TUzCjOQVyD3cN3e6
	 u9ciT268ZhvsGdlGkAhv2wyNt/OzUGUWJkx1zP7qgfYmFcIRFN3cqRRJF5sDWzuZiC
	 sFnyxihP3TOSg==
Received: from [192.168.1.90] (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 23A4817E03E5;
	Fri, 27 Feb 2026 18:42:54 +0100 (CET)
Message-ID: <3ab4f91e-37d0-4950-af88-01920705d31a@collabora.com>
Date: Fri, 27 Feb 2026 19:42:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] media: dt-bindings: rockchip,vdec: Add alternative
 reg-names order for RK35{76,88}
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil@kernel.org>, kernel@collabora.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, linux-media@vger.kernel.org
References: <20260226-vdec-reg-order-rk3576-v4-0-b8d72dc75250@collabora.com>
 <20260226-vdec-reg-order-rk3576-v4-1-b8d72dc75250@collabora.com>
 <20260227-observant-roaring-ara-ef7eb0@quoll>
 <adbbdbb1-b126-4807-821c-c9850befd695@collabora.com>
 <20260227-omission-stoic-417d7109ad4d@spud>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20260227-omission-stoic-417d7109ad4d@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_094258_446299_081EDCCB 
X-CRM114-Status: GOOD (  22.90  )
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

On 2/27/26 7:13 PM, Conor Dooley wrote:
> On Fri, Feb 27, 2026 at 01:37:17PM +0200, Cristian Ciocaltea wrote:
>> Hi Krzysztof, Conor,
>>
>> On 2/27/26 9:46 AM, Krzysztof Kozlowski wrote:
>>> On Thu, Feb 26, 2026 at 12:46:53PM +0200, Cristian Ciocaltea wrote:
>>>> With the introduction of the RK3588 SoC, and RK3576 afterwards, two more
>>>> register blocks have been provided for the video decoder unit.
>>>>
>>>> However, the binding does not properly describe the new hardware layout,
>>>
>>> As you shown me last time with excerpt of address spaces from
>>> datasheet/manual, the binding correctly describes the hardware and above
>>> sentence is not true.
>>>
>>>> as it breaks the convention expecting the unit address to indicate the
>>>> start of the first register range, i.e. 'function' block is listed
>>>
>>> Imprecise wording. "start of the main or primary register range"
>>>
>>> (if you have 0x1000 with one reg and 0x20000000 with everything, the
>>> unit address will be 0x20000000).
>>>
>>>> before 'link' instead of the opposite.
>>>>
>>>> Since the binding changes have been already released and a fix would
>>>> bring up an ABI break, mark the current 'reg-names' ordering as
>>>> deprecated and introduce an alternative 'link,function,cache' listing
>>>> which follows the address-based ordering according to the TRM.
>>>>
>>>> Additionally, drop the 'reg' description items as the order is not fixed
>>>> anymore, while the information they offer is not very relevant anyway.
>>>
>>> This is fine for me.
>>
>> Thanks for the additional feedback!
>>
>> If I'm not mistaken (please correct me), the only remaining (hard)
>> blocker for the series would be to improve this commit message.
> 
> No, you also need to fix the problem I pointed out about reg-names being
> optional on the devices you're relying on reg-names for. 

My only concern is that by marking reg-names as required we would break the ABI,
since the RK3588 related changes in the binding (not the DTS ones) got already
released (i.e. since v6.17). That's also the reason we went with this deprecated
order approach.

> The new commit
> message I am happy with, provided you also add the information Nicolas
> provided about the impact on users.

Nicolas, can you please provide here the statement so that we can agree on the
wording?

Thanks,
Cristian

> 
>>
>> How about the following:
>>
>>     With the introduction of the RK3588 SoC, and RK3576 afterwards, three
>>     register blocks have been provided for the video decoder unit instead of
>>     just one, which are further referenced in the datasheet by 'link table',
>>     'function' and 'cache'.  The former is present at the top of the
>>     listing, starting at video decoder unit base address.
>>
>>     However, while documenting RK3588, the binding broke the convention
>>     expecting the unit address to indicate the start of the primary register
>>     range, i.e. the 'function' block got listed before the 'link' one.
>>
>>     Since the binding changes have been already released and a fix would
>>     bring up an ABI break, mark the current 'reg-names' ordering as
>>     deprecated and introduce an alternative 'link,function,cache' listing
>>     which follows the address-based ordering according to the TRM.
>>
>>     Additionally, drop the 'reg' description items as the order is not fixed
>>     anymore, while the information they offer is not very relevant anyway.
>>
>> Regards,
>> Cristian


