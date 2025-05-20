Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CD3C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 10:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/LVJIqVtawUMnqwm6yUXn5zeSlqWXND30JrqQib3DJY=; b=PI1xDYWMh/ZHh7I8qxV+H+4Dnu
	1YubM/4NuglgNwYyUY7MB6WSyAIvjKF0CQTPArCXo+rXGv5vndBazUgOPMUWwfG+mGLYCLIT9Y8Wk
	+JN1RcPc11xdj6qrB/c/9wGyVLytt7CZy/sK/wIgCtx99Pf1uXyeysbCEvzwdb7fLsG1ZpHyTJCcx
	pB80eBqMbif6ed6SzQqrjA4/5FjKquW+7zXImQHhixVtfn83tNOdYR0wOBCwe5sv/VfHYHR0lC4mV
	ACULBAznyGBKujkSxlFh8HZ+H2nF/A1cAoeV1INYP7VfJ3lTkE5xl7EwKngjZoH2LxJYJQMAOfT0C
	ImmANtLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHKMR-0000000CObY-0tk5;
	Tue, 20 May 2025 10:38:15 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHK3y-0000000CJcE-07cF;
	Tue, 20 May 2025 10:19:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747736348;
	bh=9IamjCqlvQvJklBW8oB2MCtgzf/uhXR8hnZBDfqkBCY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ngqMnoV6TclW8p981rXnTE16VJQJ26eVm+bjym3MWdm0qLUZGena3s0d9MhDYIc+M
	 2zz21qlgzXFmKUEHfo/+eS1NAVWe3OVGhds4uH7LDB+6I5hGoqGPzqfVwLucFBXOH8
	 lvplK/HLelavKF0A5A5xE+24csGH2s8QZNTPiQPwpGVPll9ocV2QWHrwtDdZYtNn10
	 rA1kO20dkhGHRfYx4jpmL/w34jAEkO5Qln3enXr5hB+lTQc7aJGYLxfeFl4Rhg4rmH
	 Lzq1KyYblbirWYGQl0EJRG+Z3FpZPH8wPSDRKM8xfIwDm6UgxLbUOuxgvZI6Kp5/Np
	 KxvBoN+1THKmw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D938817E0E89;
	Tue, 20 May 2025 12:19:07 +0200 (CEST)
Message-ID: <b751c8d6-58ab-4a34-8d0e-a5300834962e@collabora.com>
Date: Tue, 20 May 2025 12:19:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: mediatek: Add #reset-cells
 property for MT8188
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Garmin Chang <garmin.chang@mediatek.com>,
 Friday Yang <friday.yang@mediatek.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250516-dtb-check-mt8188-v2-0-fb60bef1b8e1@collabora.com>
 <20250516-dtb-check-mt8188-v2-1-fb60bef1b8e1@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250516-dtb-check-mt8188-v2-1-fb60bef1b8e1@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_031910_214399_49237DAC 
X-CRM114-Status: GOOD (  14.24  )
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

Il 16/05/25 16:12, Julien Massot ha scritto:
> The '#reset-cells' property is permitted for some of the MT8188
> clock controllers, but not listed as a valid property.
> 
> Fixes: 9a5cd59640ac ("dt-bindings: clock: mediatek: Add SMI LARBs reset for MT8188")
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Stephen, please don't forget to pick this one, so that we resolve all those
warnings :-)

Thanks!
Angelo

> ---
>   Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
> index 2985c8c717d72888dd49f1f6249a9e2594d8a38d..5403242545ab12a7736ed4fbac26008aa955c724 100644
> --- a/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
> @@ -52,6 +52,9 @@ properties:
>     '#clock-cells':
>       const: 1
>   
> +  '#reset-cells':
> +    const: 1
> +
>   required:
>     - compatible
>     - reg
> 



