Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0C8D6ACD2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 13:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZGgO84nnDViiWQ9xM5YaD5WOTB6oIw2dCU8rfoM4gFY=; b=LCdviNxZFq6TkFMMXui2baioSV
	W02VS6sEw4RtbosO9dC/3cUGE3qZBuUY2bLCMtkq415n47hVFomAwuy5rM47CZpYjYzcNMMfoxLNo
	c79nHcuFZVJsQPZO2u9zxEEVh6Qjziq8qc0YBg/QYrBfbTNFVSO4W8KzYTPh/SqgNZ+IJ0T5LrUU1
	qQagXNtyKxHXwSlxTS/Md0oXJ1NBO42m7ni/CvRYWKU3TElUKVQj/1aDbOXmx74Ybz5bbAQ/orQM2
	yM8aKP/d/inONu8H+p3DGkYdfbVKV00QtR9VETsBM1qxh02ccYOabI69DINmcwip8JnqnSbWiL/Zy
	g8FuszaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGIEk-0000000DFwn-3q8L;
	Wed, 27 Nov 2024 13:37:46 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGIBu-0000000DFMZ-0i5G;
	Wed, 27 Nov 2024 13:34:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732714488;
	bh=A8gAgVEiZnE1R/aMVQBm05Lt+bamxYymAWe7jZVjljk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nQgV+ldIPj1gKbmYnxdVD91tLqAhTi0nkIptkvrBJCc5RVTHj0ouPwEWS0nGifcu0
	 swz8eJNPtF4yK7AuDy6qN9kDFyGVF/SjB+stwyZv8kf71sxZpLyWXwDrLMRAPTy7Lf
	 QTGGXxC67U9KecN0wvFYtgNJi5WKlL7uNLEO1DwhQunY9cEBW+9et1SwCVg6Q/Okqf
	 yOIYU7w3zWdV4xOGZIF83Qp+XDDeJNUqU88gVw8Gq5INwnyKBsbXgEYAie7fOQitv+
	 vb7X4Cz6a8tWwkPGeSq64FfmQD937gZ5vQ9UdajAB90HlgQev7ezaPofUgd/SdNwvG
	 B4uirEwJFBfSg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 387F717E3706;
	Wed, 27 Nov 2024 14:34:48 +0100 (CET)
Message-ID: <369df136-220a-44c9-a48c-1307f3741d27@collabora.com>
Date: Wed, 27 Nov 2024 14:34:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 12/14] arm64: dts: mediatek: mt7988: add reserved memory
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Frank Wunderlich <frank-w@public-files.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20241029103937.45852-1-linux@fw-web.de>
 <20241029103937.45852-13-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241029103937.45852-13-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_053450_354116_92D5C6C6 
X-CRM114-Status: GOOD (  12.61  )
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

Il 29/10/24 11:39, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add memory range handled by ATF to not be touched by linux kernel.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

If you are really sure that this is always the same for all boards based on MT7988,
I will trust you and give you my R-b once this series gets out of RFC state.

Cheers,
Angelo

> ---
>   arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> index a3a7deda35a5..7721d2ec06ee 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> @@ -81,6 +81,18 @@ reg_3p3v: regulator-3p3v {
>   		regulator-always-on;
>   	};
>   
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		/* 320 KiB reserved for ARM Trusted Firmware (BL31 and BL32) */
> +		secmon_reserved: secmon@43000000 {
> +			reg = <0 0x43000000 0 0x50000>;
> +			no-map;
> +		};
> +	};
> +
>   	soc {
>   		compatible = "simple-bus";
>   		ranges;


