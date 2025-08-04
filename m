Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60568C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 15:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rowLDWg2EH/vK2G1fIisCg8E4+PlZuh7zr+Dia5YY+U=; b=k3unmAuw2jMlI1BLNtWaQQ8wgw
	0onX3E/tlCdiCv24pY5rXqtU9aEWaO6UMCerxpyXz4D2kSinhURyBoPIVq4eZj1WZrwL2OQ0+IDU5
	au4EJgSHcti+/VVsTIY4E9jdr/As9ti4O7ByAbE9Du9IKIk6HVT8nNO8+LFrVA9/lKvAGvjbjoj2X
	loZ/74hyKySbZWfV1jWvOhQA9FVylGBKuoJLjvwOb7Fk7ce0yFxW45JEM7HS4NBOCxdAjStcCMv9M
	TMnb6RlLtXSsp8aaQ9W3/ocHmLZp8jqH9QYX7BRzq57xJdY1ghcNjHovsS6ok5izMfuACTN5Asq9N
	nKIJw7nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiwzM-0000000Am2y-1oAl;
	Mon, 04 Aug 2025 15:20:36 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiw86-0000000AfCZ-0PSR;
	Mon, 04 Aug 2025 14:25:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754317532;
	bh=4w4UyDIzjxo+3JmIQukX+lOYpSKSPWdj2NvIBHpwDLs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=L+twoUC0xA5IgdbWFl5hIHuXPsHMLJxr0wFn8/SYfhBCM1lxXB6W3iv+8Y3ew555Z
	 iidpjcu9JxLy6g9AizgAnFCdZyRNQ9qhjihWqYIbhCCADWn8KxVQPnKwePzvf/d7P5
	 pPbcvhN8fkHxiCVCnLc6jOkuQR2qP1pLyHuRKu9Re44KVSrfyfQHENP6SWoKWyhHAp
	 nW62hGmQytUMWxI/a3E/GLo0ccxkfR2rFZ0akabORXAEHOeLu+vEAQ2LAEftTUsd3Q
	 K6/YkB+4WagTbnSYIFlzQAwpr/c1vzmKPDPnn7sPy2po7t7a7dGDm7SavjWh5ic5qz
	 pSv5yYrHoek3w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 872B117E046C;
	Mon,  4 Aug 2025 16:25:31 +0200 (CEST)
Message-ID: <dfd6b5be-f28b-4451-b548-884043f9715a@collabora.com>
Date: Mon, 4 Aug 2025 16:25:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/27] dt-bindings: clock: mediatek: Describe MT8196
 clock controllers
To: Krzysztof Kozlowski <krzk@kernel.org>, Laura Nao
 <laura.nao@collabora.com>, wenst@chromium.org
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org,
 guangjie.song@mediatek.com, kernel@collabora.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, mturquette@baylibre.com, netdev@vger.kernel.org,
 nfraprado@collabora.com, p.zabel@pengutronix.de, richardcochran@gmail.com,
 robh@kernel.org, sboyd@kernel.org
References: <fbe7b083-bc3f-4156-8056-e45c9adcb607@kernel.org>
 <20250804083540.19099-1-laura.nao@collabora.com>
 <373f44c3-8a6a-4d52-ba6b-4c9484e2eac1@kernel.org>
 <1db77784-a59a-49bd-89b5-9e81e6d3bafc@collabora.com>
 <e9ee33b0-d6b0-4641-aeeb-9803b4d1658a@kernel.org>
 <00a12553-b248-4193-8017-22fea07ee196@collabora.com>
 <2555e9fe-3bc0-4f89-9d0b-2f7f946632e7@kernel.org>
 <62edb8e3-aff6-4225-b520-f4b73aef145d@collabora.com>
 <c16070db-c086-45b8-bc0d-9e3bc02924b6@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <c16070db-c086-45b8-bc0d-9e3bc02924b6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_072534_292251_D2246CB5 
X-CRM114-Status: GOOD (  15.06  )
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

Il 04/08/25 16:21, Krzysztof Kozlowski ha scritto:
> On 04/08/2025 16:15, AngeloGioacchino Del Regno wrote:
>> Il 04/08/25 15:58, Krzysztof Kozlowski ha scritto:
>>> On 04/08/2025 15:27, AngeloGioacchino Del Regno wrote:
>>>>
>>>> We discussed about aggregating votes, yes, in software - this instead is a
>>>> *broken* hardware that does the aggregation internally and does not require
>>>> nor want external drivers to do the aggregation.
>>>>
>>>>> Maybe it is just the name, so avoid all the confusing "votes" if this is
>>>>> not voting system. If this is a voting system, then don't use custom
>>>>> phandles.
>>>>
>>>> Being it fundamentally *broken*, this being a voting system is what the hardware
>>>> initially wanted to be - but effectively, since it requires YOU to:
>>>>     - Make sure that power supplies are turned on, if not, turn them on by "touching"
>>>>       HW registers (so, without any assistance from the voter MCU), if any;
>>>>     - Turn on parent clocks manually, if any, before using the "voter mcu" to try
>>>>       to ungate that clock; and
>>>>       - Enable the "FENC" manually, after the mcu says that the clock was ungated.
>>>
>>>
>>> I understand that "YOU" as Linux driver, when you want to do something
>>> (e.g. toggle) a clock?
>>
>> "you" == Linux driver, yes.
>>
>>> If so this looks a lot like power domain, although with some differences.
>>>
>>
>> A power domain ungates power to something.
> 
> Does more, it is not a simple supply.
> 

Yes, does more, but still manages power, and not clocks.

>>
>> These are clocks, giving a (x) (M)Hz signal to something.
> 
> Your earlier message about "YOU" said:
> 
> "   - Make sure that power supplies are turned on, if not, turn them on
> by "touching"
>       HW registers (so, without any assistance from the voter MCU), if any;"
> 
> so not a simple clocks stuff.

That's a characteristic of MediaTek's clock controllers: each hardware macroblock
needs to be powered in order to be able to enable clocks.

This is nothing new in MT8196/MT6991, it's how MediaTek SoCs have always been split
by hardware, and it's like that since ages.

Some other SoCs have the clock controllers always powered on - MediaTek doesn't.

