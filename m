Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2023FD7833F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 09:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GSW1jamcH8evFp3FWbymuEXZldXtvMtRRwDItUf7/t0=; b=EkHrRq3Qc9NAD9E7buPxWi4tcu
	QbBUcz8VoU5FAM4yEw2DaDIRJEmAMOC6IiLO2tRVKCUzS1KRzOj5prbWsAyUO9r0gwPyZYN6kReMP
	oH2LOKJxLWqQq0n/PFhhPN9W7dhu9/HbK/92k9rVLPXVolNmhNvys9oiuw+FeazX0pumtfRYlF9Qj
	nAvBmSO3mtrIXskI3CBLo5ktw+oLQZKnUKHlHu7OOT7lFjeUAfHz8z/7nf3IdEucux1w6DIBFGMPn
	gtxsJJ9hckvIGHQGlyaI48JGxtdiA1OqLZlrW1RXLABBUglY9q2dNjPZhhZybai/pJ+cVUgeQokFt
	8WiKhyGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPYF-00000008yZ0-2o0W;
	Tue, 03 Dec 2024 09:50:39 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPOg-00000008vzN-0Asq;
	Tue, 03 Dec 2024 09:40:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733218844;
	bh=gYMPaFGeU3S7YRLBugo5a0sqD9zXBU5qIQijbCskzNA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qCJD+dRuSqYKWH8eBzj/Tze8DaM+btMEpKNjlrm2TaRpQxFuLatXgGnbzBrPhjIeU
	 uPwVK90bv9gKNOmf1+88aipUUOloXzo4KfiSa51s+BG7D9Al+sT1Ayj4DrF4fiEPha
	 IXgXbRnUb9mfmHN63eXsnv8n8y7X4QTxvYQx4McknAJCWud9QcwjiP4AKch5u1j7kU
	 TTdq8e5WU7DfbLnhmLxYXQt4q6CxkBDw40Q5dJi+FpXT7wvPPVuiMpadwtwdthtOWr
	 RMN9mpdowXT8Wp5URcdUa7WgmSkBXfo8RhQttbqHtPii6lgkmhrYG7EY802q9I7k3u
	 ukArmGA1mOS5g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4CF5C17E35D8;
	Tue,  3 Dec 2024 10:40:44 +0100 (CET)
Message-ID: <e2b381ee-f4d0-4780-b539-53de4477d1c3@collabora.com>
Date: Tue, 3 Dec 2024 10:40:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/18] arm64: dts: mediatek: mt7988: add reserved
 memory
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Frank Wunderlich <frank-w@public-files.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20241202122602.30734-1-linux@fw-web.de>
 <20241202122602.30734-8-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241202122602.30734-8-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_014046_230248_2FE75D33 
X-CRM114-Status: GOOD (  14.84  )
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

Il 02/12/24 13:25, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add memory range handled by ATF to not be touched by linux kernel.
> ATF is SoC specific and not board-specific so add it to mt7988.dtsi.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Since you have to send a v3, can you please move this to be the first commit
of the series?

Would make a lot of sense :-)

> ---
>   arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> index 09dcb39ad098..1cf801486e61 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> @@ -63,6 +63,18 @@ psci {
>   		method = "smc";
>   	};
>   
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		/* 320 KiB reserved for ARM Trusted Firmware (BL31 and BL32) */
> +		secmon_reserved: secmon@43000000 {

Are you ever modifying this outside of mt7988a.dtsi?

No!

So you don't need to add the `secmon_reserved` handle..... :-)

> +			reg = <0 0x43000000 0 0x50000>;
> +			no-map;
> +		};
> +	};
> +
>   	soc {
>   		compatible = "simple-bus";
>   		ranges;



