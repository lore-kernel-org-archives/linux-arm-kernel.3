Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE294C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 13:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ynzHgNdh5whbkOl9D6HEQroVq0utHC41eUIdFvTNFY=; b=KgLrlMtMAQlX0ndBDOEP1mim7A
	Ghs9N/329DxSYNxiP2n4xJ77c1bQK+LI7wM0WU/oJAOBMDY8y6gRol5yCK8O6uQ6raEKYBXdhyEgZ
	SfSHApPCaHWs1bGqX297xM/V0f5Yig13S+jwUxgeEWy0Z7IrY+aisAEptdel7QYeYqdYJuqYB3vTu
	496GorRjgr/WlaB4czXq+SBmQFM2JJAfLr/WS7IMkogRnR6O3mm3rW4TDSTrl7bObJNUCcNk9mH4K
	g8A6wqSfFly5pTr3Bshw8ECrEtwDFusZuoQoiiVw7QQpyU+bus8/7Tav0d4/5sOf+T3zb3q5R35Ph
	yQ4cM2Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6pHs-00000009EHY-1H1i;
	Wed, 16 Sep 2026 13:02:56 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6pHp-00000009EGv-1kAv;
	Wed, 16 Sep 2026 13:02:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789563771;
	bh=2kjukwKHhvxex4UWdS38ePUoswpvqsSXD+LWBFfMADE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iVO/NUWz7XlEkldHQ8fJFgw516V1fuZCTBhCW4JfIuOvywCJ0tRW1Nm0ssUrJhb/j
	 c0yx5Tgb6JMAxWh+oxhKXzx8xCWmxKuV33u9LJEgd+Az/BDYjdPTZ4kCOe+UoszWLs
	 5wOz8P6cd4/reWtT0xj2yidbGolDL7+yMCO0Ov+KkVMBymhxalcZnU8OJEBYq/xdC8
	 PAR7rQUa5gfh8hVpmFzw5zYIjP5M/z+6aTwAYk3MAYOcZ1kFq8ICPFxtIhE8OQ7y+E
	 MKTV1gOlQ41eRm0jDEViBii0lnuXRIt3F64Njhg6Kau4svjJ3Uyw9xuTKcTNfKvjZd
	 iz5wqiM4mPUFg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DF03817E03B6;
	Wed, 16 Sep 2026 15:02:50 +0200 (CEST)
Message-ID: <bd18c1fc-6ff5-4724-8b20-dbbb716e299e@collabora.com>
Date: Wed, 16 Sep 2026 15:02:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: input: mediatek,mt6779-keypad: add the
 MT8173 keypad
To: Ryan Brue <ryanbrue.dev@gmail.com>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260915-rbrue-suez-upstreaming-mt8173-keypad-v1-1-96c325efacbe@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260915-rbrue-suez-upstreaming-mt8173-keypad-v1-1-96c325efacbe@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_060253_692039_27E7BF64 
X-CRM114-Status: GOOD (  18.72  )
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

On 9/16/26 05:47, Ryan Brue wrote:
> MT8173's keypad controller is the same block this driver already handles.
> Its register map agrees offset for offset with the MT6779 one -- STA 0x00,
> MEM1..MEM5 0x04..0x14, DEBOUNCE 0x18, SEL 0x20, EN 0x24 -- and
> mt6779-keypad drives it with no code change, so the node only needs the
> fallback compatible in second position. Add the mt8173 string to the
> existing enum, which is what mt6873, mt8183, mt8365 and mt8516 already do.
> 
> Verified on an MT8173 board (Amazon Fire HD 10 2017): the volume rocker
> reports through mt6779-keypad with no driver modification.
> 
> Assisted-by: LLM
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> This is the binding half only. The board device tree that uses it, an Amazon
> Fire HD 10 (2017), is not upstream yet and comes with the rest of that
> board's nodes later; adding the compatible first keeps that submission from
> carrying a forward reference.
> 
> No driver change goes with it. mt6779-keypad matches on the fallback, which
> is how mt8183, mt8365 and mt8516 bind today -- only mt6779 and mt6873 are in
> the driver's own match table.
> ---
>   Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
> index 914dd3283df3..b45dbf805ac8 100644
> --- a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
> +++ b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
> @@ -27,6 +27,7 @@ properties:
>         - items:
>             - enum:
>                 - mediatek,mt6873-keypad
> +              - mediatek,mt8173-keypad
>                 - mediatek,mt8183-keypad
>                 - mediatek,mt8365-keypad
>                 - mediatek,mt8516-keypad
> 
> ---
> base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
> change-id: 20260914-rbrue-suez-upstreaming-mt8173-keypad-fddc316ae098
> 
> Best regards,
> --
> Ryan Brue <ryanbrue.dev@gmail.com>


