Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85712E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 12:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fC0/tnyFSQ7fsagllHRASCLpGbRMGFWlv1yTpD9hTbc=; b=xiGmeTxwUf4yRO83y82Xq16nUz
	IlE504mJ3wK4BS00lO0Pso9x3FejjTTh2R99fNEyI9QieP+NPELynB9xuwZ97BZAHPr25cgdq0YYI
	+0EzJ290+dFCWBvHtOUnCbTdEWZ4SHHcmkJAd8BmelEkoxjKsNUsyqbgkrejkN/xTGdQ3CeDpjNio
	kcjpkZqlMV8wJhJJmR65WfJ3g6J9crQrpWbJBmoqE71nO8mmgxZxcHrAQI2oGVSpCETwbO+ucd+Qk
	uK1xVbnm9LszQf7nA5i6vAFuFMsjj2QXjBZ6Duu5E8YidUjVFGQZLDNICILifCjqGCOzi0XTbkg0j
	mSSIcwXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJB29-0000000Fy1r-2yn6;
	Thu, 05 Dec 2024 12:32:41 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAwZ-0000000FwRG-3XxC;
	Thu, 05 Dec 2024 12:26:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733401614;
	bh=zsPKHnrcacW6vTwMq+rykbMwQmETfVdATKj5CCRdNEU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TTCBjD+tdZW5GtuKCQPy/E8lAVHKaqkuLpeREytZM3+ChFIFcx6LGYMTzl7NtDdJj
	 Pp+qTOEo0mhwDYWjHXGx/s0tXcbJ7peBuJ6s5G6GzGfpcDW2hqgKc2JwKaLY6gq6Ce
	 93KiPkfHC9WavruXoVdlFFqfFlZhjd9v+2h+RBbj/xQYpfCEOtiZ2sVoTGuXIfxqZT
	 2wRVJ71jgz4MYPDLulEOVH3s/Y7/fRL01HaS6d848u4JF6t6pOS8E4aHdh02hn1qi4
	 q1WJd7NPcgAIagjKs1pIFALiUgqDlSIvMKCGkof7d8oO20r9aPuSWw6ARXTf9ci0vv
	 hGp73UBEufrbw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2D79D17E35D8;
	Thu,  5 Dec 2024 13:26:54 +0100 (CET)
Message-ID: <9e19d117-ad78-43d0-990e-e3b881428601@collabora.com>
Date: Thu, 5 Dec 2024 13:26:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm64: dts: mediatek: mt8516: fix GICv2 range
To: Val Packett <val@packett.cool>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Fabien Parent <fparent@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241204190524.21862-1-val@packett.cool>
 <20241204190524.21862-2-val@packett.cool>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241204190524.21862-2-val@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_042656_037012_0F3FCD31 
X-CRM114-Status: GOOD (  16.10  )
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

Il 04/12/24 20:05, Val Packett ha scritto:
> On the MT8167 which is based on the MT8516 DTS, the following error
> was appearing on boot, breaking interrupt operation:
> 
> GICv2 detected, but range too small and irqchip.gicv2_force_probe not set
> 
> Similar to what's been proposed for MT7622 which has the same issue,
> fix by using the range reported by force_probe.
> 
> Link: https://lore.kernel.org/all/YmhNSLgp%2Fyg8Vr1F@makrotopia.org/
> Fixes: 5236347bde42 ("arm64: dts: mediatek: add dtsi for MT8516")
> Signed-off-by: Val Packett <val@packett.cool>

Yeah, that's fine, I agree.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt8516.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
> index d0b03dc4d3f4..444429341302 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
> @@ -268,7 +268,7 @@ gic: interrupt-controller@10310000 {
>   			interrupt-parent = <&gic>;
>   			interrupt-controller;
>   			reg = <0 0x10310000 0 0x1000>,
> -			      <0 0x10320000 0 0x1000>,
> +			      <0 0x1032f000 0 0x2000>,
>   			      <0 0x10340000 0 0x2000>,
>   			      <0 0x10360000 0 0x2000>;
>   			interrupts = <GIC_PPI 9


