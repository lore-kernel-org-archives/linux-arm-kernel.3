Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F4E0C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 11:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rGJveFqFdd4rg7V6pj5VRC0DXtHbP4pqzHJWTyABUE0=; b=QgFBgRbRK/Pad1SNubpD5wQDwP
	VoYe0SPCoWN3gOMAHiNipl9FOozdzc8D06/qBNXFOSEb5g3elmrqiAKogYaQh4TVP5OQK9n+U4KUA
	ZaQdOESFQUgFLUQdSTRxGjruMEmKP75bk+I+AioQClS3+W8nZkX3aV8HmJauet0lMqEa6GSod7+qH
	7Z396PqWeFsKIEU5x7VIBNDKJ5/A3ZM+7yDcNg7JWNLnuuBIK9dJQHwQkz+zbJP3rOx1255B3gn3e
	l2xgXds5a9Ug1r4DSHgfBI73BxluLCvjLJYrf4NzIlkYv6ZgZC+BIM2uc2wp64SSHhKuXW65yLPt1
	GzcrHIUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4HnG-00000001igt-0Jc8;
	Mon, 14 Apr 2025 11:16:02 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Hgj-00000001gFv-2ZtH;
	Mon, 14 Apr 2025 11:09:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744628955;
	bh=wjnJnWMkojXnEo1V8ScaOLq3IF7OMdLybc1gyWhzlmI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bm83xP1tD0JnIrATrbQIMEtpktlE/Z1bIw1eXJGyGVv1ngWG1Hro9fHFlmCy7g/GX
	 Qn2A4ntb4XnkqFJO0J+0h6YAodB5abD4pjeEQFiWvtwApTKkShnIIGIWWCNW9JZRQk
	 FofNz1nxl8itoPV4dRoHgYmBdVqvdpesiUk6Rdaq/ElUPqHUry2ysa2Vvyjef3+Izj
	 mG6OX0Zp9gSUX/IM5z5qt4kRMKAFCJO+JXeaKmZ9wJ1ltT0atdhHTWMI8ql3yYLIv8
	 vBUTkP96MILKzAH01LORDHQipJUWx60mLLoLArD2OGq9ubX64BsrE44tyo780JFp8j
	 rreUitkY3193w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 224D717E00AC;
	Mon, 14 Apr 2025 13:09:15 +0200 (CEST)
Message-ID: <968001f7-96d1-4ad5-8c36-28cac5dc30f1@collabora.com>
Date: Mon, 14 Apr 2025 13:09:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] rtc: mt6397: Remove start time parameters
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: Eddie Huang <eddie.huang@mediatek.com>, Sean Wang
 <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250109-enable-rtc-v3-0-f003e8144419@baylibre.com>
 <20250109-enable-rtc-v3-4-f003e8144419@baylibre.com>
 <20250411133609a1295543@mail.local> <202504111339359e840246@mail.local>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <202504111339359e840246@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_040917_803551_D3BA1412 
X-CRM114-Status: GOOD (  14.96  )
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

Il 11/04/25 15:39, Alexandre Belloni ha scritto:
> On 11/04/2025 15:36:12+0200, Alexandre Belloni wrote:
>> On 11/04/2025 14:35:57+0200, Alexandre Mergnat wrote:
>>> The start time parameters is currently hardcoded to the driver, but
>>> it may not fit with all equivalent RTC that driver is able to support.
>>>
>>> Remove the start_secs and set_start_time value setup because it
>>> will be handled by the rtc_device_get_offset function using the
>>> start-year DTS property.
>>>
>>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>>> ---
>>>   drivers/rtc/rtc-mt6397.c | 2 --
>>>   1 file changed, 2 deletions(-)
>>>
>>> diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
>>> index 692c00ff544b2..d47626d47602f 100644
>>> --- a/drivers/rtc/rtc-mt6397.c
>>> +++ b/drivers/rtc/rtc-mt6397.c
>>> @@ -291,8 +291,6 @@ static int mtk_rtc_probe(struct platform_device *pdev)
>>>   	rtc->rtc_dev->ops = &mtk_rtc_ops;
>>>   	rtc->rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_1900;
>>>   	rtc->rtc_dev->range_max = mktime64(2027, 12, 31, 23, 59, 59);
>>> -	rtc->rtc_dev->start_secs = mktime64(1968, 1, 2, 0, 0, 0);
>>> -	rtc->rtc_dev->set_start_time = true;
>>>   
>>
>> This is going to break the time for people upgrading their kernel, you
>> are unfortunately stuck with this.
>>
> 
> To be clear, the breakage will happen when upgrading the kernel but not
> the device tree with 5/5
> 

Yes, you're stuck with this. Devicetree has to be retrocompatible.

Besides, this start_secs is what gets used by default, and the start-year
devicetree property should take precedence and effectively override the
start_secs default.

Just keep it there.... :-)

Cheers,
Angelo

>>>   	return devm_rtc_register_device(rtc->rtc_dev);
>>>   }
>>>
>>> -- 
>>> 2.25.1
>>>
>>
>> -- 
>> Alexandre Belloni, co-owner and COO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
> 




