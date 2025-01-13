Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D0DE7719F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 13:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hTKU8HaQVMsfaXH/Y/UaKLedhu+tQc8goyNqDmKfOhs=; b=MkV3g7NBiIqDYPRRkND6RrQLaW
	nx6zz3aFE6LK4oDclFhUQMUcEvPe5AqaINT9dtPcBWCRAhURcApJ18UWF/+4M/XG605XTs8xHYNnr
	u9HVnIi44qC+343wZ1yB5cfkCRkHpp+a5SxSIJE7Flr4nH/5RpVP1nzblePGzHGqJbwMvWTxIErXU
	AYVZwk+5NpgBg1hrlFfnCfaHSPyApHrlpi/SFBBkVQuFCoaAZ3odVGP31PaRnYvVpW+LTJF18Xjk3
	WzwgfxrhRZ1FIyyHzo91MpE1McNXLGgUPjd0ThZ56ecB4EQbt/mTsBNr7nxry9mGHW9TEsyc2TdT4
	r4hyp8cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXKsI-00000005Jp8-1fu4;
	Mon, 13 Jan 2025 13:53:02 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXKnc-00000005IqA-39GJ;
	Mon, 13 Jan 2025 13:48:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736776090;
	bh=hj/tpubYtWMF9OtI/D/dKcAezXzb8evhqd+mQKXW1QI=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Gn3SbNgJ/Y8hdqYSwdOXqZ9DsEkzobA5L8GJFfxvwQ8W8KXgRF8gmBtrLOedmph27
	 TUM9w4ikBq9IOfm5B/aP8dRpOAGxyfoOH2Iveh+yDSLFgEsDhjQx/Mg04CJn10YE5m
	 xKt3MuKbAG16e8F2ebTvKbKheEOGGMh7ehTntr6TrE2Yuere64IU7Et59VLo3zngyE
	 i1hH5X2TTiIl2GGjsHYxaaC9BdQkX19pM2tNkI2XMVMmCp+QWk+MhAqtEyHI2gTwwi
	 6gZEIP14DUWgXyt7nq/XujEF+vqFigyIukgEU5OQDq3iKx+aRy2S5kDnlSvbK7o4hL
	 3e79G/MFOVuCQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A8CDC17E0DB7;
	Mon, 13 Jan 2025 14:48:09 +0100 (CET)
Message-ID: <8e8e3eca-dee0-43ab-95d9-aebd636245c7@collabora.com>
Date: Mon, 13 Jan 2025 14:48:09 +0100
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
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <59f8a02e-a716-40a8-bf73-111ad2a7af79@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_054812_974542_AC980A13 
X-CRM114-Status: UNSURE (   8.81  )
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

Il 13/01/25 14:07, Krzysztof Kozlowski ha scritto:
> On 13/01/2025 13:41, AngeloGioacchino Del Regno wrote:
>> Il 12/01/25 14:47, Krzysztof Kozlowski ha scritto:
>>> Use dev_err_probe() to make error code and deferred probe handling
>>> simpler.
>>>
>>
>> That's already done in [1] so you can drop this commit.
>>
>> [1]:
>> https://lore.kernel.org/r/20250108112744.64686-1-angelogioacchino.delregno@collabora.com
>>
> Eh, this was first in v3 in the middle of Dec, so why you cannot get it
> merged first? Creating such 34-behemoths causes simple cleanups to
> unnecessarily wait.
> 

Getting the series partially merged is okay for me, no complaints about that,
but then ... in v4, there are two minor comments to address (one of which
is a one-char nitpick!) that might as well be done while applying, depending
on what CK thinks about that, so there's no real benefit in getting 28 commits
out of 34 picked instead of, well, just everything...

Cheers!
Angelo

