Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B201093188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 08:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sumwIp/XON9Oe/8GbTUYhjYsBC/wMmcXux1j23O296g=; b=k5IgSFoQmPHElqFdZl/GYn4idH
	s9bB0ZFUUEO4O86n3jO/NK1pPjoo7AoGD1HPKj/wCtmRSVJycF/h3DB3S+KJE2mqXrsLR7o4zj7dA
	UVwUnLM3AqynrdrJE6fMtiByHQwk8j9MT6wQtgjGGPyUiFYJFNT2voJ9dS6wwVXZaaayt/pL7qavl
	M0Mza0qfGp6Me8S4NEWLvIJ5RpNHyxQjcBK7wOoS06hmnoVR6Ok8moRRJsASTRm4JXPDAg0sb4flO
	IVBtzouXVjUUoAhgHFFCzDtodlPvFZ/vIODU2s9Dd1WI2Siyn40kNeutWg4xmyKt691v+GvOSZDWf
	Mo9UF/Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VCx-0000000CLRE-1CWG;
	Fri, 20 Mar 2026 08:27:51 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VCu-0000000CLQ1-21c8;
	Fri, 20 Mar 2026 08:27:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773995264;
	bh=jzXGL4RFxsipEaOfoGH4eaQWYGkAqlUCFQ+ktI+lCQY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nDhEa0G6i1GHYmuNE+Pr+aYMGbgbyL/5Oo8oC7K80jjluZX+jQvf/6snlTggWU2Ib
	 SlXeSDrxv7BvfwW5HB/iV4DnEYWrTz9xGh6ELhN7f57+oz2/FlL2m+hSOGkm5Bv9Fj
	 AzgyRkVgVm0oN3PdaFIWZvMY3Dg7EtAJdHBugx6OlrGUgslqtvete5/NMmwwNHW+vp
	 NIIDGxlAXbG8cxiaRoqVoW0Z1jGTuO0pRPlwLIWQ3Z1KrfQM10As/H0SnCGP+hYrA6
	 UrH5khIMTFnYxt+mJUoLUD6JqV3fROp07rUVtaPszPBX7X4/vP+xojJ3U17qT7Zq7Q
	 hx24mj1aOhmZg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5818117E0EF1;
	Fri, 20 Mar 2026 09:27:44 +0100 (CET)
Message-ID: <fa4d8347-e662-485b-b2b7-278a469176e8@collabora.com>
Date: Fri, 20 Mar 2026 09:27:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mmc: mtk-sd: add mediatek,mt8183-mmc
 fallback to mediatek,mt8189-mmc
To: David Lechner <dlechner@baylibre.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Wenbin Mei <wenbin.mei@mediatek.com>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260319-mtk-mmc-mt8189-compatible-v1-1-fb7ef2186c92@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260319-mtk-mmc-mt8189-compatible-v1-1-fb7ef2186c92@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_012748_679004_93FA5929 
X-CRM114-Status: GOOD (  18.78  )
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

Il 19/03/26 21:36, David Lechner ha scritto:
> Change mediatek,mt8189-mmc to include mediatek,mt8183-mmc as a fallback
> compatible.
> 
> This has been tested using U-Boot and the MMC is still working using the
> mediatek,mt8183-mmc fallback compatible, so they seem to be compatible
> enough. And there are no upstream users of mediatek,mt8189-mmc yet, so
> this should not be a breaking change.

Devicetree describes hardware. This hardware IP is *not* compatible with the one
found in MT8183, as it is a different revision.

Luck wants that there weren't too many breaking changes, and that whatever does
change may need some more bits to activate before breaking, but describing this
as compatible with MT8183 is wrong, because ... it's not.

Sorry, but... NACK.

Regards,
Angelo

> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
>   Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> index eb3755bdfdf7..9160e449aeb9 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -25,7 +25,6 @@ properties:
>             - mediatek,mt8135-mmc
>             - mediatek,mt8173-mmc
>             - mediatek,mt8183-mmc
> -          - mediatek,mt8189-mmc
>             - mediatek,mt8196-mmc
>             - mediatek,mt8516-mmc
>         - items:
> @@ -36,6 +35,7 @@ properties:
>                 - mediatek,mt6893-mmc
>                 - mediatek,mt8186-mmc
>                 - mediatek,mt8188-mmc
> +              - mediatek,mt8189-mmc
>                 - mediatek,mt8192-mmc
>                 - mediatek,mt8195-mmc
>                 - mediatek,mt8365-mmc
> 
> ---
> base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
> change-id: 20260319-mtk-mmc-mt8189-compatible-a62da7c5dd7e
> 
> Best regards,
> --
> David Lechner <dlechner@baylibre.com>
> 



