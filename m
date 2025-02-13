Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF37C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 10:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=10QtXMfgerDPTPBPttpmqpqBaL1nIQxL7Z7YJ+2BWoQ=; b=hm58lepfGm4dTZImDHAnzTVnPH
	XT4GdHB74tEWtnsRHm3pa1/B4YtFZa30Wt7xHhKTEY4OLH/quu2i6KYwNbLlikrBlAZKTmpYsbYWa
	gUAS5oyBHbN7Bc1pYbhwDH8jZy5PWBe3OIBhQmQWoqPZTNPHJY70RCN/lsvpLnMlkKoDRufXY4IqG
	m5U54WtRP4+WLEDt4IDZUyFo86OmY75Kz5Zj3d1e65dgHZeUAg9OCW5VpjleGBm6rAVg911mHY6+w
	gHLrcIgkP7Az/CWmXFrvJdU3LeX1tpQ8Tz5JmOsa9RwOZnpBAr8Gwr1G6iBoK3cNcTZbjS7O+Uodh
	odgIjpaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiWlM-0000000AiZx-0Urc;
	Thu, 13 Feb 2025 10:48:08 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiWd1-0000000AhNp-44zt;
	Thu, 13 Feb 2025 10:39:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739443170;
	bh=LXVJThLjduv+7chq4ELKcznat12qJGf5A21gp7uWdNk=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=PAMFv8qoeRaLMo0F2+g1tIxH7+SuM/So8+w8LA3Ez6Eau2HcNoN0HMyzU080OD7CM
	 Nuws4daGm9/ZleXUPus/28MhtcxeZfOlC0O3IQ1vQQ1swQX7akV7MDjSCVn1SHrKvw
	 6UbNVSQFG3b5yoNN4JzKVbABm16J+4Oqd+ByfX6DoNDkeRX2bascC31u+vtLZQxY9o
	 PvdBu0eiRucRK3hWGp82/Zo9AI10//aaA5NRF6PbOYSg5YSRMtjXqFFulT3kz0tmGy
	 UCZFcROdSYGWyknjdVCBIqzNv/SMahUXAxeOv+nyyLRzJgow5UskF5s/QO+9vsrW6P
	 o0IlQL5jSA8Rw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C0B7A17E00A3;
	Thu, 13 Feb 2025 11:39:29 +0100 (CET)
Message-ID: <b2ee0b9a-2d7a-4bbb-ae1a-c4abe6e7aeff@collabora.com>
Date: Thu, 13 Feb 2025 11:39:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/mediatek/hdmi: Simplify with dev_err_probe
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250112134708.46100-1-krzysztof.kozlowski@linaro.org>
 <20250112134708.46100-2-krzysztof.kozlowski@linaro.org>
 <ef0baed6-54d2-4f1f-9a4a-769ec09a069f@collabora.com>
 <59f8a02e-a716-40a8-bf73-111ad2a7af79@linaro.org>
 <8e8e3eca-dee0-43ab-95d9-aebd636245c7@collabora.com>
 <7341db6b-aed0-4da0-a5b2-6992d86ffaf3@linaro.org>
 <a65b01d8-3716-40bb-9171-ad6ed3121a89@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <a65b01d8-3716-40bb-9171-ad6ed3121a89@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_023932_201878_08B53800 
X-CRM114-Status: GOOD (  10.47  )
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

Il 13/02/25 11:07, Krzysztof Kozlowski ha scritto:
> On 12/02/2025 21:33, Krzysztof Kozlowski wrote:
>> On 13/01/2025 14:48, AngeloGioacchino Del Regno wrote:
>>> Il 13/01/25 14:07, Krzysztof Kozlowski ha scritto:
>>>> On 13/01/2025 13:41, AngeloGioacchino Del Regno wrote:
>>>>> Il 12/01/25 14:47, Krzysztof Kozlowski ha scritto:
>>>>>> Use dev_err_probe() to make error code and deferred probe handling
>>>>>> simpler.
>>>>>>
>>>>>
>>>>> That's already done in [1] so you can drop this commit.
>>>>>
>>>>> [1]:
>>>>> https://lore.kernel.org/r/20250108112744.64686-1-angelogioacchino.delregno@collabora.com
>>>>>
>>>> Eh, this was first in v3 in the middle of Dec, so why you cannot get it
>>>> merged first? Creating such 34-behemoths causes simple cleanups to
>>>> unnecessarily wait.
>>>>
>>>
>>> Getting the series partially merged is okay for me, no complaints about that,
>>> but then ... in v4, there are two minor comments to address (one of which
>>> is a one-char nitpick!) that might as well be done while applying, depending
>>> on what CK thinks about that, so there's no real benefit in getting 28 commits
>>> out of 34 picked instead of, well, just everything...
>>>
>>
>> OK, month passed, I waited, so is your big patchset merged? If it is,
>> then this will effectively rebase my patch, as you requested.
> 
> I think I missed that you took the patch to your patchset, so sorry for
> the noise.

No problem.

Cheers,
Angelo

> 
> Best regards,
> Krzysztof




