Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCC0C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 08:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YYSdciPYaZv2TJowlHl5Yq1KGj16CbKyIc5/+T+SCec=; b=zypYmwghqmk7QCS+k69oUqlAhU
	mN2PGvarNufIm1mQSyI2nRENQCOo+SigMXL3QlB5KT6h6D5lVyOvfShvHSIyviq415S5Nc5DCpDQY
	g8TRSobPfdn62ozK/44eUR1D4FV/sUmJ0B/c6WBDvbhk+ZPckGhdikIIrfpf8buCMIhsmVQsPg+Cz
	HLCXUfPmGQPMRnsBDk4s1Lveuva3n1NYPmbGKQvYkqzm2X+GsgEPC+gsw/zoS0c8OyFh1OYY07RiO
	XvFWol8IBMhV3wLZnIzQbq734MQRDvNUxCSrALYppzEVQ8IbriUAOzl1d7mxYLe2XNj44Y/GsHFFO
	7GmvF+nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwpD-000000009Wk-0bRt;
	Thu, 08 May 2025 08:41:51 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwZO-000000006aM-0dxe;
	Thu, 08 May 2025 08:25:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746692728;
	bh=X8K9aCfgxVUPIc1Nk89pKNYOpdNIKQWAwjZlX/4fHuI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bK7yllseP/OemvHwWrRiVJohhF767V7j55lg8o4Jv6l17DHqOBHoAhokjUC9qmZLl
	 tJSQ4zf2AIGQCV87TC0U/7z8EPSPpXQiEVXUtUWgD/y+v1MGvubHRqcAd60v9MAsvE
	 oLS+BZEIV/4obG6mF+DevW459GErxDSnM8bbCTG1sJ3T2z5xjv3WBrkPCTyWz7l6nN
	 HOsjDfQ6+KkgIRCnMsSuidXQTGTPlhhn1n6gaSN/FlpjJBJEShjYnwU0SI2UPY8+iw
	 geT0qj7so72G2Lkw2XpK8TLugpFBHBMQyDGml4653iFCDPZlVMWYBThArtrHji3Pdw
	 e1RODhPsufHiw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 90BC717E02BE;
	Thu,  8 May 2025 10:25:27 +0200 (CEST)
Message-ID: <4b12cb42-a1fc-4687-a5d0-07c2c822d778@collabora.com>
Date: Thu, 8 May 2025 10:25:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: mediatek: mt8188-mt6359: Depend on MT6359_ACCDET
 set or disabled
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Zoran Zhan <zoran.zhan@mediatek.com>, Arnd Bergmann <arnd@arndb.de>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Arnd Bergmann <arnd@kernel.org>
References: <20250507-mt8188-mt6359-accdet-depend-v1-1-aad70ce62964@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250507-mt8188-mt6359-accdet-depend-v1-1-aad70ce62964@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_012530_335608_6880C39B 
X-CRM114-Status: GOOD (  11.70  )
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

Il 07/05/25 22:14, Nícolas F. R. A. Prado ha scritto:
> Commit 0116a7d84b32 ("ASoC: mediatek: mt6359: Add stub for
> mt6359_accdet_enable_jack_detect") added a stub for
> mt6359_accdet_enable_jack_detect() in order to allow the mt8188-mt6359
> driver to be enabled without requiring the mt6359-accdet to also be
> enabled, since it is not always needed.
> 
> However, in the case that CONFIG_SND_SOC_MT8188_MT6359=y and
> CONFIG_SND_SOC_MT6359_ACCDET=m, a link error will happen, which commit
> b19fa45715ce ("ASoC: mediatek: mt8188-mt6359: select
> CONFIG_SND_SOC_MT6359_ACCDET") solved by selecting
> CONFIG_SND_SOC_MT6359_ACCDET.
> 
> In order to not require CONFIG_SND_SOC_MT6359_ACCDET as originally
> intended, but also prevent the link error, depend on ACCDET being
> enabled or disabled (which will force MT8188_MT6359=m if
> MT6359_ACCDET=m).
> 
> Fixes: f35d834d67ad ("ASoC: mediatek: mt8188-mt6359: Add accdet headset jack detect support")
> Fixes: b19fa45715ce ("ASoC: mediatek: mt8188-mt6359: select CONFIG_SND_SOC_MT6359_ACCDET")
> Suggested-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



