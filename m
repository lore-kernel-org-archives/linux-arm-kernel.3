Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12DF0C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 15:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H/FpeM3ZtxgsbE4T3PAbecTA/op4UYGK9unyFHZ4wTo=; b=tmc8wPyeUzktI/tp7UWFRCfS0E
	XlupsVs/c3i9LZon0+5YPhGIWrKPv9BcxDRUl5fAXMQeORkKeIAoZp0P2xx1vubqnZ3X9EQCn1ZEB
	sm2IMvwmnmjW0tkcKKFCWKC73TDk3oF/KboHegmgINAglPb2d0K1BI1Fie1vackeT1O1AyW/B6DmW
	rVC/MCQ1VUm7QWTDodiNRP3XfyH90bvfpK+DciRYaxeQGoyUFK6VQyEZavMy9+sZhMihxoQXtzrgQ
	TlB3oIBYiBykP48OI2SXZgbmk1/UvRfNogXtQW2AoqUtqB/JFFPn9S+sHLtPr5OSN+YHW85W8eI5S
	b2IxT1uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMho-00000005inm-4286;
	Mon, 13 Jan 2025 15:50:21 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLxF-00000005XAH-2Vdg;
	Mon, 13 Jan 2025 15:02:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736780532;
	bh=265nxCvfezAfbeFJCqIxtN+G127kPTOrMaQzfRcCeTw=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=fDDmtoSRqvFFanYJ+9hrkU5K8pqVSZaQY9ILmB2R/vsT7dM5wg62BnS/GX5Kb8Q6M
	 r5/pdhN3/E9R6cLarWc9UrAnZW1PxpykoFZZXvdFZB0MOo6qEhFf8GHfB1uN8C553T
	 ACL3doGqdTFwT44EftkKQSgTbjNTPG7Z+EP28A803YgHUSMuMV6lCy8MCq3jNmhnrF
	 VNCqHxSqSd9qz6NxLEwzI1s1vVkn2ZUZzjLANVJ//BP3hGaDMh/xj+PLz+NEGQXsvE
	 v1Ekfk/BFHaj+cFOK3MuHo3DXS9OM18L0/LyLKNPHKgdQYO1GTACE/23LY5X4qwuzN
	 S8QpoJAolaLJw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7869917E0E64;
	Mon, 13 Jan 2025 16:02:11 +0100 (CET)
Message-ID: <a6d18d83-a485-4e5b-aac4-181550a4cd46@collabora.com>
Date: Mon, 13 Jan 2025 16:02:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/mediatek/hdmi: Use
 syscon_regmap_lookup_by_phandle_args
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250112134708.46100-1-krzysztof.kozlowski@linaro.org>
 <516d16e3-6fc6-49ba-a0ce-f451b65a6c1a@collabora.com>
 <fef6b198-d916-4b71-86ed-0cbdd55cb3c4@linaro.org>
 <fcf8ebde-46c9-406e-b4d9-933623a9786b@collabora.com>
 <e64ab0c7-25da-449e-abd2-e4c70dee3041@linaro.org>
 <48e4def6-3d40-4cbe-8008-a299869342b0@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <48e4def6-3d40-4cbe-8008-a299869342b0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_070213_793361_FE1A1AC7 
X-CRM114-Status: GOOD (  18.16  )
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

Il 13/01/25 15:31, Krzysztof Kozlowski ha scritto:
> On 13/01/2025 15:27, Krzysztof Kozlowski wrote:
>> On 13/01/2025 14:58, AngeloGioacchino Del Regno wrote:
>>> Il 13/01/25 14:05, Krzysztof Kozlowski ha scritto:
>>>> On 13/01/2025 13:41, AngeloGioacchino Del Regno wrote:
>>>>> Il 12/01/25 14:47, Krzysztof Kozlowski ha scritto:
>>>>>> Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
>>>>>> syscon_regmap_lookup_by_phandle() combined with getting the syscon
>>>>>> argument.  Except simpler code this annotates within one line that given
>>>>>> phandle has arguments, so grepping for code would be easier.
>>>>>>
>>>>>> There is also no real benefit in printing errors on missing syscon
>>>>>> argument, because this is done just too late: runtime check on
>>>>>> static/build-time data.  Dtschema and Devicetree bindings offer the
>>>>>> static/build-time check for this already.
>>>>>>
>>>>>
>>>>> I agree with this change but can you please rebase it over [1]?
>>>>>
>>>>> The same code got migrated to mtk_hdmi_common.c instead :-)
>>>>>
>>>>> [1]:
>>>>> https://lore.kernel.org/r/20250108112744.64686-1-angelogioacchino.delregno@collabora.com
>>>> My is 2-patch cleanup, your is 34 patch rework and new features with
>>>> existing build reports, so rebase is not reasonable. It would make this
>>>> 2-patch cleanup wait for many cycles.
>>>>
>>> If adding the `#include <linux/bitfield.h>` line to a file would take
>>> *many cycles*, that'd be a bit weird, wouldn't it? :-)
>> It's not about include, it is about rebase. If I rebase on 34-patchset,
>> that's my dependency and this work cannot be merged before yours is.
>>
>> And yours already have kbuild reports, so there will be v5, maybe v6 etc.
> 
> 
> Although "NO!!!! No more huge patch bombs to
> linux-kernel@vger.kernel.org people!" was removed, but its spirit is
> kind of still valid and requesting to rebase cleanups on top of patch
> bombs with new features is just not reasonable.
> 

I understand Krzysztof, but since my 34-patchset should be ready and I don't
expect to send any v6 for how it is right now, your patch would make it
necessary to send yet another patchbomb on my side... we're kind-of in the
same situation here, and I feel like we're making a big issue out of something
that should not really be a problem.

I'm sorry about this situation, and I feel like this doesn't really depend
on me, as much as it doesn't really depend on you... let's just see what CK
thinks about this, or else, I don't know how to make this easier on all of
us - me, you and the maintainer.

If it felt like me being rude in any way, that wasn't my intention, btw.

I can offer to rebase this patch on my own keeping your authorship, if that
makes things easier.

Cheers,
Angelo

