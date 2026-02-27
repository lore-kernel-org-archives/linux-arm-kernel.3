Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B25BFD7F98
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 11:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iAO4WX43a+jfJoE3pqQuIzJnXGJziyHAPaEdAyW/mbs=; b=XPc4SZLMeJpYxCZxOhw6xO0uB3
	CBe2WZb+UOaT8Wu4rrUar6M/WXESIrUxFqsGv2jr13kvz7IQZ4p+BBj4T59BhhuLxZsejhWjKrXNs
	Dnu9vVYU8tLORLwMjHlbMHQp6cE1MsEEe8lRjGbjix6GEiKoZv2b930i+ioUgBUQOqylhcEWitrZr
	JlwJksSlx0T/ays3CzcWIXFHHWE0yL5xRPOFkgUl0iY4j0x0Px4wjIKi7UZ8bykyP+7103+I5QAO8
	GFvdWEIGpfVwZ55+g7DCVK7G397eRUNvvAR7jsDbAQ9pvRV2yUbHVKeTbaKQt7+Y+Z9Jc21j0Iufx
	1p+KyeZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvw9t-00000008IVm-26Ok;
	Fri, 27 Feb 2026 11:37:25 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvw9q-00000008IVM-3ORH;
	Fri, 27 Feb 2026 11:37:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772192238;
	bh=ENbjWJF9SiuxxSiikXhZ3ftmZA+6ZUt7yDgzAKSZBiY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JOydFz/JmMwj4/f2OOR1ovhDA8+gWpkodHpir9ToEkNlhPTp86LncwbfBwVC1stlk
	 Jb+xwkuYjMmF58t6jCDclDKCNitTe8VuIUuKb5rIXyH5X1tO9KvjbsiDTkcnYev4Fe
	 K9pmxHiqhxpF4NGe5dLPyr5Z4rSTwNVvHKZIxbzB98xAaeCFGjxG4D36YUhf6KAVAS
	 wjIcgJtVJehQ8y+GiN1nkzTn29jQYvTL6t1F5gq42Q8B8FWkfdUwVx9MgKngXpoUDw
	 AjHMFLHV5EUKeZlAHBufY3LykFOVpH8X4FoO6U/OxEj4aWPk9oN0myPl05TxI7di4L
	 89FgTQz5xEkow==
Received: from [192.168.1.90] (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1424017E00A3;
	Fri, 27 Feb 2026 12:37:18 +0100 (CET)
Message-ID: <adbbdbb1-b126-4807-821c-c9850befd695@collabora.com>
Date: Fri, 27 Feb 2026 13:37:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] media: dt-bindings: rockchip,vdec: Add alternative
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
References: <20260226-vdec-reg-order-rk3576-v4-0-b8d72dc75250@collabora.com>
 <20260226-vdec-reg-order-rk3576-v4-1-b8d72dc75250@collabora.com>
 <20260227-observant-roaring-ara-ef7eb0@quoll>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20260227-observant-roaring-ara-ef7eb0@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_033723_025597_8A029992 
X-CRM114-Status: GOOD (  18.89  )
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

Hi Krzysztof, Conor,

On 2/27/26 9:46 AM, Krzysztof Kozlowski wrote:
> On Thu, Feb 26, 2026 at 12:46:53PM +0200, Cristian Ciocaltea wrote:
>> With the introduction of the RK3588 SoC, and RK3576 afterwards, two more
>> register blocks have been provided for the video decoder unit.
>>
>> However, the binding does not properly describe the new hardware layout,
> 
> As you shown me last time with excerpt of address spaces from
> datasheet/manual, the binding correctly describes the hardware and above
> sentence is not true.
> 
>> as it breaks the convention expecting the unit address to indicate the
>> start of the first register range, i.e. 'function' block is listed
> 
> Imprecise wording. "start of the main or primary register range"
> 
> (if you have 0x1000 with one reg and 0x20000000 with everything, the
> unit address will be 0x20000000).
> 
>> before 'link' instead of the opposite.
>>
>> Since the binding changes have been already released and a fix would
>> bring up an ABI break, mark the current 'reg-names' ordering as
>> deprecated and introduce an alternative 'link,function,cache' listing
>> which follows the address-based ordering according to the TRM.
>>
>> Additionally, drop the 'reg' description items as the order is not fixed
>> anymore, while the information they offer is not very relevant anyway.
> 
> This is fine for me.

Thanks for the additional feedback!

If I'm not mistaken (please correct me), the only remaining (hard)
blocker for the series would be to improve this commit message.

How about the following:

    With the introduction of the RK3588 SoC, and RK3576 afterwards, three
    register blocks have been provided for the video decoder unit instead of
    just one, which are further referenced in the datasheet by 'link table',
    'function' and 'cache'.  The former is present at the top of the
    listing, starting at video decoder unit base address.

    However, while documenting RK3588, the binding broke the convention
    expecting the unit address to indicate the start of the primary register
    range, i.e. the 'function' block got listed before the 'link' one.

    Since the binding changes have been already released and a fix would
    bring up an ABI break, mark the current 'reg-names' ordering as
    deprecated and introduce an alternative 'link,function,cache' listing
    which follows the address-based ordering according to the TRM.

    Additionally, drop the 'reg' description items as the order is not fixed
    anymore, while the information they offer is not very relevant anyway.

Regards,
Cristian

