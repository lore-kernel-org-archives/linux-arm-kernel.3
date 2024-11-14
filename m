Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0678BD65C63
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 09:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:To:From:References:Cc:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PdfhdSbAfns2eclQbeWYXlZXe1SCEzMWAIbRV2J8fus=; b=dBwaDdeBXqT1aEOGrXbyIMWRVU
	lsyv4KNSytFShvwfFODX5Ar09ZzecpPGDeoKB6ZkUNsYQZ2+EvpieUg/8/wZFHMpb0VXXkxtCj1Tl
	YMDpZjgwlB88iw4vklGkzqAXiJkA42d4c93UUX1YZNWzxqPqW8Mt2hZmpZpZPFJkCb0sjKxGymv4y
	FhS9w9LvvVj2DODT2gnCeJRvE3KPHgw353/LZtJL53Zal30C+MVV7ANEnD2rgKql2mIbK5FBvkZnF
	zWTgy/QK2mT5eNkBywKmjRANzpdGhMpmUy+Ictz4gd4Hm7KwMaIZx9KJn8VomSr6AmprJ/9IJIh0i
	hdBbEnVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBW9R-00000009MWR-2LTd;
	Thu, 14 Nov 2024 09:28:33 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBW7a-00000009M9F-2KKI;
	Thu, 14 Nov 2024 09:26:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731576395;
	bh=bYzcUGF7hCrjkXL1fsayWn1/CBgbO0ZZ6aSmChTaQt8=;
	h=Date:Subject:Cc:References:From:To:In-Reply-To:From;
	b=hsoLDJmrvZeIQPuX9zZPHFsDVyqts0ZNfONnp53S0u1wSY4gI6SNQatZNdXS/iRJD
	 Zzn+MsQrvvhsXlrZHcySjYGxTqvBvHGZgOcPMlirFAhjcJ48nOAgcaD5EqyV35JXFT
	 T30pWXchhQ5ftFf5GwhU/kQtFKMsOobGjucg+lHsaP03toFfGTVzagCQXx8ecx4fZb
	 OCX9KjbSp7uJ1diSutOUC7BX4VkisUZN3bQdZQYABhfBFXyLI2pII5cbs415p4qG+5
	 qF/hN6djXJyHw91lytp8g16N6MOFI5u81O35Jmcbn++WL3e6Y5BHxwHpX4EDfQuaI1
	 fPTWvybugzk+Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9893117E1522;
	Thu, 14 Nov 2024 10:26:34 +0100 (CET)
Message-ID: <bdbfb1db-1291-4f95-adc9-36969bb51eb4@collabora.com>
Date: Thu, 14 Nov 2024 10:26:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: mediatek: Set mediatek,mac-wol on
 DWMAC node for all boards
Cc: kernel@collabora.com, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Biao Huang <biao.huang@mediatek.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Andrew Halaney <ahalaney@redhat.com>, Simon Horman <horms@kernel.org>
References: <20241109-mediatek-mac-wol-noninverted-v2-0-0e264e213878@collabora.com>
 <20241109-mediatek-mac-wol-noninverted-v2-2-0e264e213878@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Michael Walle <mwalle@kernel.org>
In-Reply-To: <20241109-mediatek-mac-wol-noninverted-v2-2-0e264e213878@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_012638_809989_BA456052 
X-CRM114-Status: GOOD (  15.56  )
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

Il 09/11/24 16:16, Nícolas F. R. A. Prado ha scritto:
> Due to the mediatek,mac-wol property previously being handled backwards
> by the dwmac-mediatek driver, its use in the DTs seems to have been
> inconsistent.
> 
> Now that the driver has been fixed, correct this description. All the
> currently upstream boards support MAC WOL, so add the mediatek,mac-wol
> property to the missing ones.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt2712-evb.dts                   | 1 +
>   arch/arm64/boot/dts/mediatek/mt8195-demo.dts                  | 1 +
>   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts | 1 +
>   3 files changed, 3 insertions(+)
> 

..snip..

> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> index 31d424b8fc7cedef65489392eb279b7fd2194a4a..c12684e8c449b2d7b3b3a79086925bfe5ae0d8f8 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> @@ -109,6 +109,7 @@ &eth {
>   	pinctrl-names = "default", "sleep";
>   	pinctrl-0 = <&eth_default_pins>;
>   	pinctrl-1 = <&eth_sleep_pins>;
> +	mediatek,mac-wol;

The demo board has the same WoL capability as the EVK, so you can avoid adding the
mac-wol property here.

>   	status = "okay";
>   
>   	mdio {
> diff --git a/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts b/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
> index e2e75b8ff91880711c82f783c7ccbef4128b7ab4..4985b65925a9ed10ad44a6e58b9657a9dd48751f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
> @@ -271,6 +271,7 @@ &eth {
>   	pinctrl-names = "default", "sleep";
>   	pinctrl-0 = <&eth_default_pins>;
>   	pinctrl-1 = <&eth_sleep_pins>;
> +	mediatek,mac-wol;

I'm mostly sure that Kontron's i1200 works the same as the EVK in regards to WoL.

Michael, I recall you worked on this board - can you please confirm?

Thanks,
Angelo


