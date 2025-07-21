Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 319BAC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 10:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XbN2ZZ/zVeHptoWdOvqOsyTTtjz4IhjZz3gw8d+2COs=; b=rLOB8t7ouHFyq97/fkxZqKws//
	iCbLIfe6/VHuQnbMePucpCw3Q/NEWs++lh6Hb+zH3/86hvhhmhFqKeuEkMsGI25fv7LUQ7vYM48gg
	epXpVVsPqQfhJwPU4GhV/pDtL+vOi1n99HFNFKeSNyHTUSzOWcBnPoxeENQT3jbkF96gVkUbW+rwG
	i4GyHlFCGs8wp6cwxYqlXTCjWDW7SdlkSRslXY3LJPp4FAmTiseR3VfWXGXZciCrLLccKMKpeEv5B
	YB2njgeSkCzn5ks7UJLd7TSsAnjZMcOR46WgIJIPeAL3muZAyXP4msN2C4FGmlLFOYpPgrNwM/JU5
	iG0bUl8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udneo-0000000Gx67-3wrc;
	Mon, 21 Jul 2025 10:22:06 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udmwO-0000000GpVR-155k;
	Mon, 21 Jul 2025 09:36:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 96DD1A5283B;
	Mon, 21 Jul 2025 09:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA3F0C4CEED;
	Mon, 21 Jul 2025 09:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753090571;
	bh=amn7S0NK0vIN78Usz2dx0uMxGfBGU5rx/5LvBfYs5/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IgGamjwtmndD+gnnGza+t+EPyeECFRH27kjjM+ujLlTLy1QsDQfEXjn5HP4wShXwF
	 RwDiLWL9Fpa3Rwnlnb/d8HX7dVZQg+MFJIgOLDCrhYTrp8vdnunLAynHcTe96tvUM+
	 FtsS3jqnN2ecBF/3SBuKMJRqHer7r9HwMGU2TLuP8ked97MWkY8WzbHGnnYQ3BOt7f
	 iSMfyX0cVBq6mLJj8EYjtFuaZdQpusHgKk7HqKkkPK0aZM0pkJ8qHJMYndyCrKXZ0F
	 ndQAKDdxsGBBq2xFCCS/XLDigkB8KP90WkR+458zI4kVIRelwf2hcmCt80wNHVHZyo
	 e6RReoc5oGFQw==
Date: Mon, 21 Jul 2025 11:36:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, atenart@kernel.org, linux-crypto@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: add crypto offload support on
 MT7981
Message-ID: <20250721-camouflaged-dramatic-rattlesnake-e7f87f@kuoka>
References: <20250720174903.1321533-1-olek2@wp.pl>
 <20250720174903.1321533-2-olek2@wp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250720174903.1321533-2-olek2@wp.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_023612_364725_A09465A4 
X-CRM114-Status: GOOD (  14.58  )
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

On Sun, Jul 20, 2025 at 07:49:03PM +0200, Aleksander Jan Bajkowski wrote:
> The MT7981 as well as the MT7986 have a built-in EIP-97 crypto accelerator.
> This commit adds the missing entry in the dts.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>  arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> index 5cbea9cd411f..ebab8dde1e70 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> @@ -94,6 +94,20 @@ pwm@10048000 {
>  			#pwm-cells = <2>;
>  		};
>  
> +		crypto@10320000 {
> +			compatible = "inside-secure,safexcel-eip97";

Missing SoC compatible. You should not use IP block compatibles alone
and your previous patch explains why: some wires can be connected
differently.

Best regards,
Krzysztof


