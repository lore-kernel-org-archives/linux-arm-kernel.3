Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58987C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 11:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mSrMpMXGteBa/Ro7IbckIdhn3ptXpeDQ0yL3B0SpPNw=; b=EdsUbii9Je/S/wJ7slV2d4D41T
	OEdQuOSA9gK/+wakqUoSVvzzC8qw0PFXnXTfX7zU0220JVopfytNTJKMqRpiCVrRj+M7vJtK6oqMV
	sSpKIFAOCFBQ3OtYQPWTga2mDQM0YsYHnW77KzFeVz61Joj5XWEgOrEwTOsNrzrDOvfFeoCcA0Xsl
	+ZdJ27IMIAyhO/n5shKt9tMWkAUEoV1eg8QqGWvl/pe2xpwUA5VVbxxRwyBFft4f1DfDsHSM446eI
	EKHxxRmNlKQmZnrwS0rn3Jiz3hVZ3ItCRBpyzcrQVgJ1xBE+WJNPrsZQh3DczDWscCMmhp/+0jSJJ
	i6vAsSpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkiJJ-0000000CPyE-0sLu;
	Wed, 19 Feb 2025 11:32:13 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkiGS-0000000COz4-2ekG;
	Wed, 19 Feb 2025 11:29:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739964554;
	bh=Uuiwp5a925+mqRbjAQSitBZGlf30fFYVlceOO8DU7tA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Dpk7DRDTDqGrV2K4HKfSwGNO/jbFgRGc/0iJ+9dx/sI8mMKmXJFUcOk6/NKEYcROg
	 0jqMrUWIuvkXZVKnpFDxQFOlBg5guB4z24PiOXJ0juzqXLgMUvVyW9jNbIvTnaVMg/
	 1jnzKBYrNAByALxj653jsFeuX0DgOlEGUoxRfpTcCdgVbR3MIhXWqcOUlBc+AXXtpp
	 2vvWnzBsfRcyMznFjayhJPxkSJIvDf5r1lVUkomPs2hjP919XW2xAQtcFADOp2gFe8
	 lEsinOw7o7IzAnb8KLADSWyfhOKuriotj8fi1SDiyDhN/s7hwLYCkNSI7AkSL8TAm/
	 m+4LruStF3G5A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0C15017E0E92;
	Wed, 19 Feb 2025 12:29:14 +0100 (CET)
Message-ID: <6cd2be03-a3e8-4bdc-b91e-51b3e1029782@collabora.com>
Date: Wed, 19 Feb 2025 12:29:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] ASoC: mediatek: mt8188: Support DMIC in AFE
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 parkeryang <Parker.Yang@mediatek.com>
References: <20250218-genio700-dmic-v1-0-6bc653da60f7@collabora.com>
 <20250218-genio700-dmic-v1-4-6bc653da60f7@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250218-genio700-dmic-v1-4-6bc653da60f7@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_032916_821652_CEC02378 
X-CRM114-Status: GOOD (  13.51  )
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

Il 18/02/25 21:52, Nícolas F. R. A. Prado ha scritto:
> From: parkeryang <Parker.Yang@mediatek.com>
> 
> Add the AFE routes that connect the DMIC (I004-I011) to the UL9 frontend
> (O002-O009) and register the mt8188-dmic DAI driver during probe.
> 
> Signed-off-by: parkeryang <Parker.Yang@mediatek.com>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>   sound/soc/mediatek/mt8188/Makefile            |  1 +
>   sound/soc/mediatek/mt8188/mt8188-afe-common.h |  1 +
>   sound/soc/mediatek/mt8188/mt8188-afe-pcm.c    | 24 ++++++++++++++++++++++++
>   3 files changed, 26 insertions(+)
> 
> diff --git a/sound/soc/mediatek/mt8188/Makefile b/sound/soc/mediatek/mt8188/Makefile
> index 1178bce45c50ba252672a32b3877732a5a76c610..b9f3e4ad7b07ba9e21c846706371c53269f894db 100644
> --- a/sound/soc/mediatek/mt8188/Makefile
> +++ b/sound/soc/mediatek/mt8188/Makefile
> @@ -6,6 +6,7 @@ snd-soc-mt8188-afe-y := \
>   	mt8188-afe-pcm.o \
>   	mt8188-audsys-clk.o \
>   	mt8188-dai-adda.o \
> +	mt8188-dai-dmic.o \
>   	mt8188-dai-etdm.o \
>   	mt8188-dai-pcm.o

The Makefile addition doesn't belong to this commit. Please fix.

The rest looks good.

Cheers,
Angelo

