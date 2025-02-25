Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E377AC021BB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=weIP+16IMFhCX+4obB+QHG7tC2SlsLzHNqhDXSKKWS0=; b=goCwFsytmDhIt9jJy1oQh5+9BZ
	RHRx6nvtnx8fzBifjAFE6o2o9+Tx4w+2vMyMoJF4E85+IdWueRAsDe2LCMaNhMF8Fqg04PG5fxed3
	MW/nluMoTVPpR5DocbjKWi43/hJj0TF+9QXcryM1JgbUKtdyQFQIomN/vqfLzhbsIjvJXtiW/DwjG
	zmy0CJhNBb8e0c9WxBDhcdv7LYJVngS6BzVjYvWL2uJ6jNXQxr6iayjbHzvZOVrNwUQtB4OoYax6u
	YuHFwqKIoe6GC6Suuy5nZrFyN4BpN9A91E+jwgKbcJ+bqfr4MG8Cj1VGhOL5KugugyMP7xMZuwPKc
	WP+uzN1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy0T-00000000KkI-3EUD;
	Tue, 25 Feb 2025 16:42:05 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmw8I-0000000HZ0f-21AA;
	Tue, 25 Feb 2025 14:42:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740494521;
	bh=HfTj5K9Kjj+z5exhuyb8N2wVDV/qu3WxEJW/q8QSD6Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZO2QbpmMUpNVhvsrZelu+P5KHnWA9JLuq5mB+DNwu9jzh6np56CMors6MuuU5BYNQ
	 qTcApVXJ+jXzhYyExUzIdQuNvScXRyLM+iU+WCNBqn+PHsbvF0ziLgqa+CQbDI97I3
	 He4GS6mZXSvWXlXmFeXvu/kRQSLz5MtzASQCIkKTH335dP0DR3RBCadLEmsJ6p9B+S
	 ciLHsybTC7UUJpmUO6HkLs+QeI8N7vC542vW4QTU8xjGAGwzkVoRUxmptFkZVmQ+Ys
	 8La6q6JxOluCZMBIWKN8W/2gb6f5eCZebzXEi8WOE8hjAnmSKxlsn/aJEAe2+9BU1Q
	 1GDGtjXCg8XSg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4FE0217E0E91;
	Tue, 25 Feb 2025 15:42:00 +0100 (CET)
Message-ID: <7ca0eb8a-de9d-48a1-87ca-f563c607929c@collabora.com>
Date: Tue, 25 Feb 2025 15:42:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] ASoC: mediatek: mt8188: Add audsys hires clocks
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
References: <20250225-genio700-dmic-v2-0-3076f5b50ef7@collabora.com>
 <20250225-genio700-dmic-v2-1-3076f5b50ef7@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250225-genio700-dmic-v2-1-3076f5b50ef7@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_064202_665165_392F0A16 
X-CRM114-Status: GOOD (  12.18  )
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

Il 25/02/25 15:33, Nícolas F. R. A. Prado ha scritto:
> Describe and register the aud_dmic_hires audsys clocks, which are needed
> when recording the DMIC at a sample rate of 96k.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   sound/soc/mediatek/mt8188/mt8188-audsys-clk.c   | 4 ++++
>   sound/soc/mediatek/mt8188/mt8188-audsys-clkid.h | 4 ++++
>   2 files changed, 8 insertions(+)
> 
> diff --git a/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c b/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
> index c796ad8b62eeaa929f24c09755f428116b105404..40d2ab0a7677b64985f9fc9eb38f67bca7ecd4f9 100644
> --- a/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
> +++ b/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
> @@ -84,6 +84,10 @@ static const struct afe_gate aud_clks[CLK_AUD_NR_CLK] = {
>   	GATE_AUD1(CLK_AUD_AFE_26M_DMIC_TM, "aud_afe_26m_dmic_tm", "top_a1sys_hp", 14),
>   	GATE_AUD1(CLK_AUD_UL_TML_HIRES, "aud_ul_tml_hires", "top_audio_h", 16),
>   	GATE_AUD1(CLK_AUD_ADC_HIRES, "aud_adc_hires", "top_audio_h", 17),
> +	GATE_AUD1(CLK_AUD_DMIC_HIRES1, "aud_dmic_hires1", "top_audio_h", 20),
> +	GATE_AUD1(CLK_AUD_DMIC_HIRES2, "aud_dmic_hires2", "top_audio_h", 21),
> +	GATE_AUD1(CLK_AUD_DMIC_HIRES3, "aud_dmic_hires3", "top_audio_h", 22),
> +	GATE_AUD1(CLK_AUD_DMIC_HIRES4, "aud_dmic_hires4", "top_audio_h", 23),
>   
>   	/* AUD3 */
>   	GATE_AUD3(CLK_AUD_LINEIN_TUNER, "aud_linein_tuner", "top_apll5", 5),
> diff --git a/sound/soc/mediatek/mt8188/mt8188-audsys-clkid.h b/sound/soc/mediatek/mt8188/mt8188-audsys-clkid.h
> index 6f34ffc760e03beddc3001046e554edd7ea2c478..9cb732863c104383b9859b4bb5b3f5c289ad1864 100644
> --- a/sound/soc/mediatek/mt8188/mt8188-audsys-clkid.h
> +++ b/sound/soc/mediatek/mt8188/mt8188-audsys-clkid.h
> @@ -33,6 +33,10 @@ enum{
>   	CLK_AUD_AFE_26M_DMIC_TM,
>   	CLK_AUD_UL_TML_HIRES,
>   	CLK_AUD_ADC_HIRES,
> +	CLK_AUD_DMIC_HIRES1,
> +	CLK_AUD_DMIC_HIRES2,
> +	CLK_AUD_DMIC_HIRES3,
> +	CLK_AUD_DMIC_HIRES4,
>   	CLK_AUD_LINEIN_TUNER,
>   	CLK_AUD_EARC_TUNER,
>   	CLK_AUD_I2SIN,
> 



