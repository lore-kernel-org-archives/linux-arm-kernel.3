Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8F4C3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 07:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tVvq/mCs4l/EVkjWu7d1aZ26ZrwRHdQ55RzXI8LxGPE=; b=H4J6JbG/LR1XEWaPvQlC8JmCz9
	OhHtF8lFOBis0xSaSW2SlBQ3LsbH+8Z6Q88DhKM66XbnHEWish29MBIoa+HcV/ioLT8UX7Q87QR9j
	y7y/hZLmVHU/0ybSoEDQRt5Yew1Qaa4QqNaJQWusAWxHyVeO29GE3SVkFGavCOi/4FEHwdzIf+dXj
	srjgXxe3GF94SwxoBcCFVFcaLp7w/12QEupXJ0UXwBjtmyGYDWXEIMP6Tj6uynvp6cApzrIQDAJbV
	KvCznO4/0JkOzic4Go9GY8qmlFvi7vnUxK5HYfBh4HM9agJtcdnKlvHh7E2CoWo749C2gsht8zw9m
	5H2pbTuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBq9u-00000006djx-2EXR;
	Mon, 05 May 2025 07:22:38 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBq7v-00000006dcF-05Dr;
	Mon, 05 May 2025 07:20:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746429632;
	bh=9byBrgGiWivV4zXfCGyXLK7u6F5KMMq/Ap3brTL2r8E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Xcz0r9Nyr/GBvTffACDxkAv0DCvVxl40GgqtQeif64zW1Jj1VKuW21++n/5L+CwcH
	 WwsLeAUQhz/pAjv0CSWKcU7esBvAb/PnjPRwW3HWWT66sGH1y/lT3HHHNN18sxHAi5
	 Q5rH3aDHLE22aoXPw49tTF1UfTC3AP57J/mAOvWopAdLWN9Kx3Qhcg5b2qd7tbFeuD
	 T9YlnGDey09aUkqj+0axPC7knUJh2m+neJ4fKnOKV25W92xM7w9i9FU6aECdSl7/cX
	 ZI8HLcMMcMhc+TuKfrn3QGt+7DIHhqTQDmYBvphkcby/PAdUsDQHOM1Z0oVHWckqlu
	 gvJrP+TM/SUnw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6A81517E0F89;
	Mon,  5 May 2025 09:20:31 +0200 (CEST)
Message-ID: <97b93862-8572-45fb-ba02-96a0bb747700@collabora.com>
Date: Mon, 5 May 2025 09:20:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: mediatek: mt8188-mt6359: select
 CONFIG_SND_SOC_MT6359_ACCDET
To: Arnd Bergmann <arnd@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 Zoran Zhan <zoran.zhan@mediatek.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250505052106.1811802-1-arnd@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250505052106.1811802-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_002035_214944_89FCC0DA 
X-CRM114-Status: UNSURE (   8.28  )
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

Il 05/05/25 07:20, Arnd Bergmann ha scritto:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The driver support was added without selecting the codec, which leads to
> a link failure:
> 
> aarch64-linux-ld: sound/soc/mediatek/mt8188/mt8188-mt6359.o: in function `mt8188_mt6359_init':
> mt8188-mt6359.c:(.text+0x19f0): undefined reference to `mt6359_accdet_enable_jack_detect'
> 
> Fixes: f35d834d67ad ("ASoC: mediatek: mt8188-mt6359: Add accdet headset jack detect support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



