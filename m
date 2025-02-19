Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21E1C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 11:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UVtRxvxLad9BvG/oOdPx25jo4hBh7IbZUfkALTr+usc=; b=ugjuaPLp7AuBNzAhK7h1NzDGlW
	UXTH3sF8zJhfXYks5olCmjkxf7ike7v+My16Hd3gYrqsNmQjKvhT41orOQaKM13BXtnmUUIs3AJCP
	2rF4IymFxWacU1cvlMvmynwXt7pW3z/ShXwFr6mnA6nY7c5RujpgdU/q1B79KLhotq8QOQtkuu/u/
	bS3DEhZXzZZnZU7hRfupIrzJIFdpLxKj51T9x4xg2K9lciCRzv+qZcsqOyI+EvrEgmwSGHL0/watF
	g14TDCajQU6a3G1DNfbkhFIvV1EfRZgzvWDEm6fVOZ6dym4H4f8JSba14lY5PsTHrQ6DFC7iwVnyt
	Es5T1iqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkiNf-0000000CRYa-1tVe;
	Wed, 19 Feb 2025 11:36:43 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkiGk-0000000CP5W-1utl;
	Wed, 19 Feb 2025 11:29:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739964572;
	bh=nIunaYmNY6dLMbhvaiWgmcAb/hSE9AiSrnJJ32wEXds=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ALgXkMpCetPWAO/3Eta1T7gOHhTLKbz45W0fIZKWkRwKysZBIDvWK/wjUdBbQcY/X
	 575dE/HvAkMk//ONjd/r0MgehqbacGigq6SNRWTM20tjT97Js4ZWdv8SjzY2UPHml2
	 ArLIoLTv5TxBshjXm3uHoxLwoQCvi8TvvhVPlpwxhOM3uTxXFSGlG5Q7ENkJh17Ova
	 tFTyL0hf6hA4brKssoYxBOV4KGmvF/jaH8/CVE7u88lc2GAE9VJD8xwedWdt6yT15e
	 rDYi3w5BxpJXap5/FvYGXn2aXFvLonKOkFrqWR3aX+awKnfC+pjCinmvh0ZYFzt3sM
	 mxVZw4zhrPHpQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 16C0217E00F0;
	Wed, 19 Feb 2025 12:29:32 +0100 (CET)
Message-ID: <214560ed-699e-4f1a-a562-8cd1f8e661bc@collabora.com>
Date: Wed, 19 Feb 2025 12:29:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] ASoC: mediatek: mt8188: Add audsys hires clocks
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
References: <20250218-genio700-dmic-v1-0-6bc653da60f7@collabora.com>
 <20250218-genio700-dmic-v1-1-6bc653da60f7@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250218-genio700-dmic-v1-1-6bc653da60f7@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_032934_668273_850EF9A8 
X-CRM114-Status: GOOD (  13.23  )
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
> Describe and register the aud_dmic_hires audsys clocks, which are needed
> when recording the DMIC at a sample rate of 96k.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>   sound/soc/mediatek/mt8188/mt8188-audsys-clk.c   | 4 ++++
>   sound/soc/mediatek/mt8188/mt8188-audsys-clkid.h | 4 ++++
>   2 files changed, 8 insertions(+)
> 
> diff --git a/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c b/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
> index c796ad8b62eeaa929f24c09755f428116b105404..e7b2c9da61f6b5dbe9002a294ebbb7f4415fe54c 100644
> --- a/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
> +++ b/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
> @@ -81,6 +81,10 @@ static const struct afe_gate aud_clks[CLK_AUD_NR_CLK] = {
>   	GATE_AUD1(CLK_AUD_AFE_DMIC2, "aud_afe_dmic2", "top_a1sys_hp", 11),
>   	GATE_AUD1(CLK_AUD_AFE_DMIC3, "aud_afe_dmic3", "top_a1sys_hp", 12),
>   	GATE_AUD1(CLK_AUD_AFE_DMIC4, "aud_afe_dmic4", "top_a1sys_hp", 13),
> +	GATE_AUD1(CLK_AUD_DMIC_HIRES1, "aud_dmic_hires1", "top_audio_h", 20),
> +	GATE_AUD1(CLK_AUD_DMIC_HIRES2, "aud_dmic_hires2", "top_audio_h", 21),
> +	GATE_AUD1(CLK_AUD_DMIC_HIRES3, "aud_dmic_hires3", "top_audio_h", 22),
> +	GATE_AUD1(CLK_AUD_DMIC_HIRES4, "aud_dmic_hires4", "top_audio_h", 23),
>   	GATE_AUD1(CLK_AUD_AFE_26M_DMIC_TM, "aud_afe_26m_dmic_tm", "top_a1sys_hp", 14),
>   	GATE_AUD1(CLK_AUD_UL_TML_HIRES, "aud_ul_tml_hires", "top_audio_h", 16),
>   	GATE_AUD1(CLK_AUD_ADC_HIRES, "aud_adc_hires", "top_audio_h", 17),
> diff --git a/sound/soc/mediatek/mt8188/mt8188-audsys-clkid.h b/sound/soc/mediatek/mt8188/mt8188-audsys-clkid.h
> index 6f34ffc760e03beddc3001046e554edd7ea2c478..820f2aef17ea40be1a80aece604b4a319934312f 100644
> --- a/sound/soc/mediatek/mt8188/mt8188-audsys-clkid.h
> +++ b/sound/soc/mediatek/mt8188/mt8188-audsys-clkid.h
> @@ -30,6 +30,10 @@ enum{
>   	CLK_AUD_AFE_DMIC2,
>   	CLK_AUD_AFE_DMIC3,
>   	CLK_AUD_AFE_DMIC4,
> +	CLK_AUD_DMIC_HIRES1,
> +	CLK_AUD_DMIC_HIRES2,
> +	CLK_AUD_DMIC_HIRES3,
> +	CLK_AUD_DMIC_HIRES4,
>   	CLK_AUD_AFE_26M_DMIC_TM,
>   	CLK_AUD_UL_TML_HIRES,
>   	CLK_AUD_ADC_HIRES,

Please either put it after CLK_AUD_ADC_HIRES, which corresponds to the end of AUD1
and also orders that alphabetically.

Same for the addition in audsys-clk.c, that would order the clocks also per bit.

Thanks,
Angelo







