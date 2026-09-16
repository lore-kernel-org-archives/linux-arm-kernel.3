Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B3CC88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 13:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GadAe13GlwJprJiMN10++IkoLVf6ePl7KeCEDTlx6JU=; b=GMbo2m6PWD96fUzXw9hGXUUrwb
	eRHRV41Bt512bbzGQHS/821yK0UAqGgA89QlR5JjWCWF0xevnc+rQfsmeZx7O2yOLsU9vEqNggAy+
	VzPYoZylSQbpqZ0lXEfbB4MxFy92M4ofGSPq/87PcDSvdIinJiIkrnZe10JOeWAI0IuWDb6HL/+64
	wCNmZHnfnnI3k2y1rneJv16/p4tA3oeQR3zK+aL3gWxJrEG9atGZS1p7cEC/epSxFfbwtUxPER9CM
	T8bZJtrcSC0ul8FGrnpQMR6wIVHRXZs0yYMbzrqtKFabhrfta5pZsFQ483Mc1GGLrNbe2BTDjNR/d
	M/rM0BRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6pGW-00000009Dzm-3mnN;
	Wed, 16 Sep 2026 13:01:32 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6pGU-00000009Dyv-0f81;
	Wed, 16 Sep 2026 13:01:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789563687;
	bh=BfWXz0hTyEvZDYQuGgOzHryecYGfoukaVueR1V16vZY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QK13jFgvAS8N5Ui3mQo1fEcCOEI31/YaZ3tSMEP+XqTpzZ5Tsb9ekWH9F8ZwIJZEi
	 90rVcpKWXariDEcFJ5Yu1ThnnTUNBM+p0bcUZvqATr5zhIGDH2FQFlv+9FhKEc2cXs
	 1WxHw45Egm5d/JRIm4imXp7H6n+/wVOZTxWgp/B93my9IHta6yYkhmoM4F5qRce6yB
	 fRRPGi1U35uB+FwT1sK3ZPsudOIDEVFOzYThQG8DhXKVdQqv/Yox8MIac3lN+iJ6Jx
	 Cqq4BIYvev7JgcTxRPudKu47L8pIcb6w9oNvfxOK03MGXbR5jS93RJDJE7jr0+Nx+4
	 Mp98lkomBXUnA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E07C717E087F;
	Wed, 16 Sep 2026 15:01:26 +0200 (CEST)
Message-ID: <2554743c-1eaf-4799-b64c-4a384f8ea353@collabora.com>
Date: Wed, 16 Sep 2026 15:01:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: iio: adc: mediatek,mt2701-auxadc: add mt6572
To: rva333@protonmail.com, Jonathan Cameron <jic23@kernel.org>,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260916-6572-dt-auxadc-v1-1-e8190d614c33@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260916-6572-dt-auxadc-v1-1-e8190d614c33@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_060130_720882_8F4A50DD 
X-CRM114-Status: GOOD (  13.14  )
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

On 9/16/26 13:42, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> Add a compatible string for the mt6572 AUXADC, that is compatible with
> mt8173 IP.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
> index d9e825e5054f..750e1e837fb8 100644
> --- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
> @@ -38,6 +38,7 @@ properties:
>             - const: mediatek,mt7986-auxadc
>         - items:
>             - enum:
> +              - mediatek,mt6572-auxadc
>                 - mediatek,mt6893-auxadc
>                 - mediatek,mt8183-auxadc
>                 - mediatek,mt8186-auxadc
> 
> ---
> base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
> change-id: 20260814-6572-dt-auxadc-e6df20ab3248
> 
> Best regards,
> --
> Roman Vivchar <rva333@protonmail.com>


