Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D167E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 12:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z/KaeDb4jhwVyfpWTf+pM2xw3edUlnwH5Ep89GQm1VQ=; b=yWq3kCw7Uc8ovLt3CTea/CeNw6
	V/Qnrapk2v8BYPBWvam7y/TrFCAYDP7h5Sc/s2wWjy9sHipepO4BYjSRjsN07JMkXedro8jqGj0iP
	5RKF93f0nZIJmI0wVUxbQNkzz5iqeomDRl3IuNQfRdAwjv40i+XVqfv2qZ6KIOikAVbk5xcd8MEWN
	u6srR0xAc6vc9fOKwcmNmzXDqtIAG/ZkReX8uOBAkLYiLYTm8GZQu1sQG3hgyC7T5QJsLc1BpXsXl
	teeNIRISzCQCg6PRUzHraxVp65X8qmHYAKydb9VqSl5bAec70VrZ0QhxvVh2LMBEk25leEcH0Y2NT
	mZIJftlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJBFR-0000000G0p8-0Z7s;
	Thu, 05 Dec 2024 12:46:25 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJBBI-0000000Fzla-2IBD;
	Thu, 05 Dec 2024 12:42:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733402527;
	bh=LM2gUsX/c1KVTYV3HmF0p9792S12iewI4CRKDypr+as=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e0zKmW/eBTcWod3x01BANWCi2/KHwDjSdRb9jaCq0pv8j2puM8OFQ8CY4ZbUboONF
	 xcIfdySa4bT4UbJviXFc7XTv/0D1LRrt2gnhO6qfPWT1DcTgNEna/uXvC76kvZ/sqn
	 LzTRf89s8zrcVzPUJQvSdZVtMLNiU92WI/yfuF7BBbZDXoCPqtdk7otxuk08laXnT9
	 m9buhbyjhHqkAnsaF+N5PG6MVkiTqwUTX0d13GnshiMbjcnYB0PZaJEa+1dPKswzlk
	 1Nq+ReaDNS6SW0qlGisTH0CvdFO0k6y91n4BNNcTjwv+6vMPkY7RZZnGoWEe3k9iz6
	 ovUvEzRTUb+7g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8852C17E367E;
	Thu,  5 Dec 2024 13:42:06 +0100 (CET)
Message-ID: <ce2f6f07-0276-4a8b-ae3f-4188c707c6e7@collabora.com>
Date: Thu, 5 Dec 2024 13:42:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: mediatek: mt8390-genio-700-evk: Add sound
 output support
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
 Aary Patil <aary.patil@mediatek.com>,
 Suhrid Subramaniam <suhrid.subramaniam@mediatek.com>,
 parkeryang <Parker.Yang@mediatek.com>
References: <20241205-genio700-audio-output-v1-0-0e955c78c29e@collabora.com>
 <20241205-genio700-audio-output-v1-5-0e955c78c29e@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241205-genio700-audio-output-v1-5-0e955c78c29e@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_044208_726227_BDEB9E2E 
X-CRM114-Status: GOOD (  13.75  )
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

Il 05/12/24 13:13, Nícolas F. R. A. Prado ha scritto:
> Describe all the components to get sound output working on the two audio
> jacks, Earphone and Speaker, present on the Genio 700 EVK board with the
> audio DSP enabled.
> 
> Co-developed-by: Aary Patil <aary.patil@mediatek.com>
> Signed-off-by: Aary Patil <aary.patil@mediatek.com>
> Co-developed-by: Suhrid Subramaniam <suhrid.subramaniam@mediatek.com>
> Signed-off-by: Suhrid Subramaniam <suhrid.subramaniam@mediatek.com>
> Co-developed-by: parkeryang <Parker.Yang@mediatek.com>
> Signed-off-by: parkeryang <Parker.Yang@mediatek.com>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>   .../boot/dts/mediatek/mt8390-genio-700-evk.dts     | 50 ++++++++++++++++++++++
>   1 file changed, 50 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts b/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
> index bb68665f0b2da80397b833db0241a06648a322a0..2fded39078773e81d8e0313d6b118b3064be308d 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
> @@ -92,6 +92,24 @@ vpu_mem: memory@57000000 {
>   			compatible = "shared-dma-pool";
>   			reg = <0 0x57000000 0 0x1400000>; /* 20 MB */
>   		};
> +
> +		adsp_mem: memory@60000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0 0x60000000 0 0xf00000>;
> +			no-map;
> +		};
> +
> +		afe_dma_mem: memory@60f00000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0 0x60f00000 0 0x100000>;
> +			no-map;
> +		};
> +
> +		adsp_dma_mem: memory@61000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0 0x61000000 0 0x100000>;
> +			no-map;
> +		};
>   	};
>   
>   	common_fixed_5v: regulator-0 {
> @@ -209,6 +227,16 @@ usb_p2_vbus: regulator-9 {
>   	};
>   };
>   
> +&adsp {
> +	memory-region = <&adsp_dma_mem>, <&adsp_mem>;
> +	status = "okay";
> +};
> +
> +&afe {
> +	memory-region = <&afe_dma_mem>;
> +	status = "okay";
> +};
> +
>   &gpu {
>   	mali-supply = <&mt6359_vproc2_buck_reg>;
>   	status = "okay";
> @@ -912,6 +940,28 @@ &scp {
>   	status = "okay";
>   };
>   
> +&sound {
> +	compatible = "mediatek,mt8390-mt6359-evk", "mediatek,mt8188-mt6359-evb";
> +	model = "mt8390-evk";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&audio_default_pins>;
> +	audio-routing =
> +		"Headphone", "Headphone L",
> +		"Headphone", "Headphone R";
> +	mediatek,adsp = <&adsp>;
> +	mediatek,dai-link = "DL_SRC_BE", "UL_SRC_BE", "AFE_SOF_DL2",
> +		"AFE_SOF_DL3", "AFE_SOF_UL4", "AFE_SOF_UL5";

Are you really, really, really, extremely sure that you need mediatek,dai-link?

I say you don't... :-)

Cheers,
Angelo


