Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC9EC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 13:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fyVzxjSlpw7Rufi0vwm/fgYVGIFdY2X6Os1sOaklEt0=; b=RmcVEy6s3k13WOgcJoJMOXsFL/
	DKh/tbbniTGEYjm9L1KF8jzG3/PkMO6f4gcaE71QKCi3V5rmVoixKPwjgQmyPEXZ2q6tymXsmKfpO
	b4BWQ1VeKebJdnb65Xco/i0IE06zIDCJ53bRaMkKK5DSJg1D5BP/zcMe2hGKWQv43K9Qv2hNi6vpw
	5Ki+52q5VjHEOz+wRD5psR5G8+CARdeNQ3H7UTOD4I7x1oWjC1fdFuZT4BANFL+RFOX+Z91rm3KG5
	+E5o8WvvAnKez/c3GlmsM8j9HkEgw9nec7eFj2TXeD/VF3BLK25UFuzFrfxr2F6YIaWnHu/Z4NRz6
	+vPFT3fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkOJ-0000000D2lR-0K9j;
	Wed, 19 Feb 2025 13:45:31 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkMg-0000000D1uZ-0LIh;
	Wed, 19 Feb 2025 13:43:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739972628;
	bh=AWOeMCIP6k+DdjeVem59jvHAY8phtfH/61lO07anvnQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dAWINYM61MZADtGlLWmkm/IFpcjX4E0KXCvxozxCyciEcdp+Sq0J4Rwu1txzlB2gN
	 oWmZ/2UzkdCAZKMt13Q5yYscplizcr/uHx6S8Fv1Kxuu3KnBaeZsL1H3vP2PilHRJY
	 1fyRqK1SmPesLsGhNv7yeIHD4Wma5knfmojHEALD6ZLsAc9hfGI8NRSRebqwZJ1lFV
	 Mx/wWETOXNCzYCTB62VNDVJLflr4AZqmB8oBEFHn5L958tHi3NwE7S3gzyIJ1caOWt
	 h8tD3pEXyWZVy83DqXR2AaJWzxHIRX0Mz2pwOmOgOyosflYwT6N3AK2GFK7EcUFOG9
	 nTTDWJO/e21mA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E1C4C17E14D5;
	Wed, 19 Feb 2025 14:43:47 +0100 (CET)
Message-ID: <8204f202-9af5-46f5-96f8-3cb32fe32179@collabora.com>
Date: Wed, 19 Feb 2025 14:43:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] ASoC: mediatek: mt8188: Support DMIC in AFE
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, kernel@collabora.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 parkeryang <Parker.Yang@mediatek.com>
References: <20250218-genio700-dmic-v1-0-6bc653da60f7@collabora.com>
 <20250218-genio700-dmic-v1-4-6bc653da60f7@collabora.com>
 <6cd2be03-a3e8-4bdc-b91e-51b3e1029782@collabora.com>
 <51ac7a72-9113-46c6-98d8-2924a9572966@notapiano>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <51ac7a72-9113-46c6-98d8-2924a9572966@notapiano>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_054350_262407_F6F4D426 
X-CRM114-Status: GOOD (  17.66  )
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

Il 19/02/25 14:40, Nícolas F. R. A. Prado ha scritto:
> On Wed, Feb 19, 2025 at 12:29:13PM +0100, AngeloGioacchino Del Regno wrote:
>> Il 18/02/25 21:52, Nícolas F. R. A. Prado ha scritto:
>>> From: parkeryang <Parker.Yang@mediatek.com>
>>>
>>> Add the AFE routes that connect the DMIC (I004-I011) to the UL9 frontend
>>> (O002-O009) and register the mt8188-dmic DAI driver during probe.
>>>
>>> Signed-off-by: parkeryang <Parker.Yang@mediatek.com>
>>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>> ---
>>>    sound/soc/mediatek/mt8188/Makefile            |  1 +
>>>    sound/soc/mediatek/mt8188/mt8188-afe-common.h |  1 +
>>>    sound/soc/mediatek/mt8188/mt8188-afe-pcm.c    | 24 ++++++++++++++++++++++++
>>>    3 files changed, 26 insertions(+)
>>>
>>> diff --git a/sound/soc/mediatek/mt8188/Makefile b/sound/soc/mediatek/mt8188/Makefile
>>> index 1178bce45c50ba252672a32b3877732a5a76c610..b9f3e4ad7b07ba9e21c846706371c53269f894db 100644
>>> --- a/sound/soc/mediatek/mt8188/Makefile
>>> +++ b/sound/soc/mediatek/mt8188/Makefile
>>> @@ -6,6 +6,7 @@ snd-soc-mt8188-afe-y := \
>>>    	mt8188-afe-pcm.o \
>>>    	mt8188-audsys-clk.o \
>>>    	mt8188-dai-adda.o \
>>> +	mt8188-dai-dmic.o \
>>>    	mt8188-dai-etdm.o \
>>>    	mt8188-dai-pcm.o
>>
>> The Makefile addition doesn't belong to this commit. Please fix.
> 
> I was divided between adding it here or in the previous commit that adds the
> dmic driver. Only in this commit is the mt8188_dai_dmic_register() added, so
> this is the first commit in which any of the code from the dmic driver is
> actually used, hence why I added it here. But adding the makefile entry together
> with the driver code, even if it's not used, makes sense too, so I'll move it
> there.
> 

You can even squash the two commits... after all, adding a piece that doesn't
get used until a later time is practically useless... right?! :-)

