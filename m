Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2904E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 09:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W64i6igLfoaFxQRUhRh4ObIpEa3nRUvfzWFcnEx8u9o=; b=3ZiSIO13DqhcgkC2gN/0BqRwMO
	6jmSejRZ4ooFSGRAmpIXKYBU1aoxXkuKHv9caddhte5UvB69UqM9bmCnufbDrsjv2De4cOfYjrwLg
	cS1QAXSV9piXfjhdhO212OUxLf5LjTD42LpdC8toqYCEVzpm128Rw/8NxKSkbv9egjcNGf+uLKcTw
	JBz2QwuYcyFhN7f/P7K2P4Y1hkJNXacYHxyzi1HzQ+2kuK9ldPXvjE4osiwnRDnA/zqWZnYRX0wzK
	eJknK3grl2I4HguyOYYWqL5o+2OBpjG5uaFJ4QKQstDo9IJosMcDtRrf+wfrOWw7k+TMN/1u/m/9/
	bVaBmeug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTe4I-0000000CdBm-0NGb;
	Fri, 03 Jan 2025 09:34:10 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTe35-0000000Ccrx-1vQi;
	Fri, 03 Jan 2025 09:32:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1735896774;
	bh=FY5E9cL/SAYzqzsgtK3mk9C8t7xTelHCQ0xwdrVefoM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FF6W3Kpd/m+c0lo7fg1PtLKOmpuzIDHPDkecVV3ai2ae1w8RwKwKWmKqIIPYlcQcu
	 hrcb+R/1JfdOeU3/G42lI86QdDjJG3mIY2VMEftHoDAoD3fh76W13H4p+1KMmJm1mU
	 8LeyzhYNy/rdLgCsvUfd9QSzpYfZuGrAuNBM9QUrJ7YtTJmKGJXO5XbwBTotVQB/8o
	 oWlyHTrDdnClumMr7LuWaAWMo+aFsuUq5uxVMHeWgj+z8tbTZDLaghGrf7NUqbDASs
	 CWDFWIxXZZYKmZcPZnabLBx7qEAe0vjbtEIdRZzbK22A3aQPveJlgBfTS/YA8Cy2h/
	 /BNr+9WCLgKng==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5953F17E153F;
	Fri,  3 Jan 2025 10:32:53 +0100 (CET)
Message-ID: <e7d162b8-23c4-4a75-9675-9ba82564a4ff@collabora.com>
Date: Fri, 3 Jan 2025 10:32:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: arm: mediatek: Add MT8186 Skitty Chromebooks
To: Geoffrey Chien <geoffrey_chien@pegatron.corp-partner.google.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 herbert1_wu@pegatron.corp-partner.google.com
References: <20250103-b4-add_mt8186_skitty-v1-1-96ac770842d8@pegatron.corp-partner.google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250103-b4-add_mt8186_skitty-v1-1-96ac770842d8@pegatron.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_013255_644013_E7110FD0 
X-CRM114-Status: GOOD (  14.68  )
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

Il 03/01/25 10:23, Geoffrey Chien ha scritto:
> Add an entry for the MT8186 based Skitty Chromebooks, also known as the
> HP Chromebook G1m 11 inch. The device is a clamshell laptop with an
> optional touchscreen or keyboard.
> 

Since it makes no sense to have this device in the binding without actual
devicetrees, please send this one as the first patch in a series where you
introduce those devices.

Cheers,
Angelo

> Signed-off-by: Geoffrey Chien <geoffrey_chien@pegatron.corp-partner.google.com>
> ---
>   Documentation/devicetree/bindings/arm/mediatek.yaml | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index 1d4bb50fcd8d9aadb7b77e144a474b79da005056..b57e86946d7565720fdee31b2bbef288b0508769 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -263,6 +263,14 @@ properties:
>             - const: google,steelix-sku196608
>             - const: google,steelix
>             - const: mediatek,mt8186
> +      - description: Google Skitty (HP Chromebook G1m 11 inch)
> +        items:
> +          - const: google,skitty-sku1
> +          - const: google,skitty-sku2
> +          - const: google,skitty-sku3
> +          - const: google,skitty-sku4
> +          - const: google,skitty
> +          - const: mediatek,mt8186
>         - description: Google Steelix (Lenovo 300e Yoga Chromebook Gen 4)
>           items:
>             - enum:
> 
> ---
> base-commit: 0bc21e701a6ffacfdde7f04f87d664d82e8a13bf
> change-id: 20250103-b4-add_mt8186_skitty-fe04d863592f
> 
> Best regards,



