Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822FEC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 11:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K5XCJiQYLzy4CqPDayuilENtg2EBVCdlMYiOLkbjJoI=; b=f4H2/+ykpY7Ms6T0c/mkuchtpT
	ePuSBnfVENBMegiPoiJy1GXa+/6IY6aYOwoFnKuAJz3gTyP7nqgWpn8bvhKdAkUoT6g78K2/lz6BI
	mleCXtk9r4fLGKPNx6yUp+CANi4pvAeL6OWroBSopCVGpVL9fy56dKWEovDghAZWGtpwkii5RDrpC
	dvHHHytEd0PZ6+v4Km6QJONNImPmtmrtd0FbyvZO/tGC+UBFC1wFFQSu3XyJNb+f2nOrN4MpEqYhU
	doYA7g7svPosdAx5njBrLHCz9ZblMMUS+SE9Hxc7t+HE5m3tgoMHUQviZA82/y/1WSC9ebkFhswMu
	ykTrhADQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thRam-0000000H8d3-0Msd;
	Mon, 10 Feb 2025 11:04:44 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thRP2-0000000H5fp-1jyQ;
	Mon, 10 Feb 2025 10:52:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739184754;
	bh=KBC0SN9ZNkKsUcI/8ctTgW1gIXMompB/BTtCm6ni5hQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Rx3cquvwsmRw0UkoLMz0QCGKNYa1T5ZkCy6cujfIsa7/XGn/VihPwuoG/XI5uRMvJ
	 GiZ4Exc644jgL1QF8/fwMdZ6bZK/3qfg7fg95mrGe7uvUMkGYojF2pI4bvurKoplXq
	 Zd8rgOe7f8HqnkrhnOOu2xjNoth5VtZ0DMlUKcP9aFJ2vbSlMidUj3QmH1Le9tPngW
	 Unrm4UJxU6yW8H2u8QMOlWjNbc2vWtex4uUCluEc1vygJM38JwunYAMaGzFFJSFUch
	 hAixoBznnKha1lY8wlTqmZ998e9M+V21tbXlcXqQ52fJqq9fHSoJHFBvgJrr4G+dgp
	 ajPU7f6DORL/w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EDD9817E121B;
	Mon, 10 Feb 2025 11:52:33 +0100 (CET)
Message-ID: <b7ed1848-2e66-42af-a266-34689fd1c93b@collabora.com>
Date: Mon, 10 Feb 2025 11:52:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: gpu: mali-bifrost: Add compatible for
 MT8370 SoC
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250207-mt8370-enable-gpu-v3-0-75e9b902f9c1@collabora.com>
 <20250207-mt8370-enable-gpu-v3-1-75e9b902f9c1@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250207-mt8370-enable-gpu-v3-1-75e9b902f9c1@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_025236_645515_5026B1C5 
X-CRM114-Status: GOOD (  16.39  )
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

Il 07/02/25 16:18, Louis-Alexis Eyraud ha scritto:
> Add a compatible for the MediaTek MT8370 SoC, with an
> integrated ARM Mali G57 MC2 GPU (Valhall-JM, dual core).
> This new compatible is needed for this SoC support, as the other
> existing compatibles for the same GPU architecture (MT8188, MT8192) do
> not match the required power domain number.
> The other compatibles (especially MT8186) cannot be reused because of
> GPU architecture difference.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index 735c7f06c24e632ab738d062f15378f754c8adaf..6f6211950bb495fa6bfcdfe8d1e27e5ce7aeeae0 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -37,6 +37,7 @@ properties:
>             - enum:
>                 - mediatek,mt8188-mali
>                 - mediatek,mt8192-mali
> +              - mediatek,mt8370-mali
>             - const: arm,mali-valhall-jm # Mali Valhall GPU model/revision is fully discoverable
>   
>     reg:
> @@ -217,7 +218,9 @@ allOf:
>         properties:
>           compatible:
>             contains:
> -            const: mediatek,mt8186-mali
> +            enum:
> +              - mediatek,mt8186-mali
> +              - mediatek,mt8370-mali
>       then:
>         properties:
>           power-domains:
> 



