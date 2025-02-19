Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63901C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 11:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d/MUn+p7mU8AeJg8jgr1NeX71t7I0k5FAA4N3NZJfWg=; b=HjoOESBlB7FQaoODkMFe1Wt22R
	lfbNI3aoZZ5ACJ/57QtxGrhKMzQeyAJzvbboJWBU5dMwak18hkhuW4sJGF1fslSEIOskUxIJ4PDEF
	yGU9GISXHpzmjj9ftvnZwywsiiaY8I8h3B8niR/i1pI8hxrYw4QgPdUNf6/eG7BnuJHiLD4SIs0sc
	rd+s/JbWvCq9xpoXvdZksIpvaMohwJZTa2iWKitP+kSMjJFOdSYxDVYsZCThbK4OOkSbxo0Q6p+Mk
	R1CqlwSHuhAGsBsBHXvSqMKFr/8E85eR2DURjVXwlbOYuajof/BBz57OqhbS78JVCNvjfFk48qgoB
	tRzSitsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkiMD-0000000CQt0-1ci5;
	Wed, 19 Feb 2025 11:35:13 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkiGa-0000000CP0t-0B0r;
	Wed, 19 Feb 2025 11:29:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739964562;
	bh=tN6WEDR1AiRFyMbMUMu3VS4saSRBZMCNYL/A1DybkbI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HBwcvFSAJBqL0cqZaEXuOVDLwC85LkTybMrZkelTOGsFm/2GE5cwAP1wxNpgIC5oB
	 03D8YMmlDT44THbtloNW03EnzqJeRHjglYQTj/in5ZLYwdtA4WgTKAvNJVBLJ+DoAA
	 ccS6oJk05pETwYZTtQBcvxgpKnKFsGR9t1NgDx7E/szT1L47y9GI3UFJBpV/cKf4d0
	 bOR9db3RnHE2GnWL6T3mmqS7tvICsitVxqvmR0FH4tg7vkhclcvbpMWz1dT7ZMgtTb
	 clhwNcAOXlNpWAKpI1h4jjNNqHd/0vSPS+udXawIXharMCWecWWd8HpAgPvonA2WtL
	 BC6Qr2w9BtSxg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9A7E617E00F0;
	Wed, 19 Feb 2025 12:29:21 +0100 (CET)
Message-ID: <1dc0da53-0bc1-41f2-8478-f72bd0f33115@collabora.com>
Date: Wed, 19 Feb 2025 12:29:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] ASoC: mediatek: mt8188: Add reference for dmic clocks
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
References: <20250218-genio700-dmic-v1-0-6bc653da60f7@collabora.com>
 <20250218-genio700-dmic-v1-2-6bc653da60f7@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250218-genio700-dmic-v1-2-6bc653da60f7@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_032924_255050_4F7B78BF 
X-CRM114-Status: GOOD (  14.42  )
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
> Add the names for the dmic clocks, aud_afe_dmic* and aud_dmic_hires*, so
> they can be acquired and enabled by the platform driver.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>   sound/soc/mediatek/mt8188/mt8188-afe-clk.c | 8 ++++++++
>   sound/soc/mediatek/mt8188/mt8188-afe-clk.h | 8 ++++++++
>   2 files changed, 16 insertions(+)
> 
> diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
> index e69c1bb2cb239596dee50b166c20192d5408be10..44c25b6e3d873448163b22e70f5b94cb5070654d 100644
> --- a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
> +++ b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
> @@ -58,6 +58,14 @@ static const char *aud_clks[MT8188_CLK_NUM] = {
>   	[MT8188_CLK_AUD_ADC] = "aud_adc",
>   	[MT8188_CLK_AUD_DAC_HIRES] = "aud_dac_hires",
>   	[MT8188_CLK_AUD_A1SYS_HP] = "aud_a1sys_hp",
> +	[MT8188_CLK_AUD_AFE_DMIC1] = "aud_afe_dmic1",
> +	[MT8188_CLK_AUD_AFE_DMIC2] = "aud_afe_dmic2",
> +	[MT8188_CLK_AUD_AFE_DMIC3] = "aud_afe_dmic3",
> +	[MT8188_CLK_AUD_AFE_DMIC4] = "aud_afe_dmic4",
> +	[MT8188_CLK_AUD_DMIC_HIRES1] = "aud_dmic_hires1",
> +	[MT8188_CLK_AUD_DMIC_HIRES2] = "aud_dmic_hires2",
> +	[MT8188_CLK_AUD_DMIC_HIRES3] = "aud_dmic_hires3",
> +	[MT8188_CLK_AUD_DMIC_HIRES4] = "aud_dmic_hires4",
>   	[MT8188_CLK_AUD_ADC_HIRES] = "aud_adc_hires",
>   	[MT8188_CLK_AUD_I2SIN] = "aud_i2sin",
>   	[MT8188_CLK_AUD_TDM_IN] = "aud_tdm_in",
> diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-clk.h b/sound/soc/mediatek/mt8188/mt8188-afe-clk.h
> index ec53c171c170a8b4b47900e63ef79d53641e9b12..68c46feb72271b950d4e538f63cedf524354147e 100644
> --- a/sound/soc/mediatek/mt8188/mt8188-afe-clk.h
> +++ b/sound/soc/mediatek/mt8188/mt8188-afe-clk.h
> @@ -54,6 +54,14 @@ enum {
>   	MT8188_CLK_AUD_ADC,
>   	MT8188_CLK_AUD_DAC_HIRES,
>   	MT8188_CLK_AUD_A1SYS_HP,
> +	MT8188_CLK_AUD_AFE_DMIC1,
> +	MT8188_CLK_AUD_AFE_DMIC2,
> +	MT8188_CLK_AUD_AFE_DMIC3,
> +	MT8188_CLK_AUD_AFE_DMIC4,
> +	MT8188_CLK_AUD_DMIC_HIRES1,
> +	MT8188_CLK_AUD_DMIC_HIRES2,
> +	MT8188_CLK_AUD_DMIC_HIRES3,
> +	MT8188_CLK_AUD_DMIC_HIRES4,
>   	MT8188_CLK_AUD_ADC_HIRES,

Following the comments from audsys, put those after CLK_AUD_ADC_HIRES.

Cheers,
Angelo

>   	MT8188_CLK_AUD_I2SIN,
>   	MT8188_CLK_AUD_TDM_IN,
> 


