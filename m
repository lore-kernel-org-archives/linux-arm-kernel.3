Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CF5CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 08:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NuhYqOb0TYRwqy3AN367Dp0WjMoAcmdmQel9CM5tbA0=; b=kd+Q4rzBwloXJNDbtHbKdPApO3
	SS+3YtA98bCwyP3dhYYpkeT7bYPGYp7ZXPtKNaNgQLcDiyp7gn1SI/RO9GmPs/AjGCm3S459WMg4U
	ENVq1eoDok/bg4VikqR+zA1kmp3sSm/AmEfKSnfB/73gvHuGzhPeacl6X1c2xXhueMNjot5JgE8Qx
	vPpyhA3b9YctFpD1e7DWlOVgrEZ67xx9H317rlKUQIcaq5T7SxPX870vdiupaR3Zi+9o+PnxuQ6gw
	oJohsC2ElZeAGqNWePIm++KwLC5gB/OiOh9HVufqVr7h5AJXk2cESGw4WpGTUlxOQT6QbOchGlu13
	Eyp96dMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1KqF-0000000Fry0-3pqR;
	Wed, 24 Sep 2025 08:27:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1KqD-0000000Frvc-08rn;
	Wed, 24 Sep 2025 08:27:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758702427;
	bh=6Wtt45GCrcyLE7Y+MjZ0xRGSIEip4Qk9mzL+4G6Noh8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=C+eiHwu5PH2XvRjUDDPKl/cjs3WlZViR0RFmhNVG5mu2kN+qHXOyf1R9JGqEk0vKz
	 rBP+czHXptgenYuE6tUvFUROm644KdcAyJG1VoweCC0JoD+8EDLzbjHklWa5tSsJlx
	 5pc2ovu1A6qBaTlOcZuI9/ilMvO/sZVLJw7JsB43UXBJr36dnEUWML2QDfjUG/fna9
	 4n9fYhv+C+I58FqJKab3KsbpAgYGloWiT3p6RTple/pXyM9CM2VVHJDkWQxqKOk+MI
	 yM/gw1AMS3m6MhXn44AimDZNqOGp14I7FSC/rpOW0tl37fqrKagIG4z2r3HJmfx16p
	 F95p9XMb676EA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 73B8017E068C;
	Wed, 24 Sep 2025 10:27:06 +0200 (CEST)
Message-ID: <9dd2fea8-f828-4298-97a2-10ef1c61799f@collabora.com>
Date: Wed, 24 Sep 2025 10:27:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: clock: airoha: Add reset support to
 EN7523 clock binding
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Felix Fietkau <nbd@nbd.name>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Andreas Gnau <andreas.gnau@iopsys.eu>
References: <20250924060509.1889131-1-mikhail.kshevetskiy@iopsys.eu>
 <20250924060509.1889131-2-mikhail.kshevetskiy@iopsys.eu>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250924060509.1889131-2-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_012709_241189_4AAF0DE6 
X-CRM114-Status: GOOD (  14.43  )
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

Il 24/09/25 08:05, Mikhail Kshevetskiy ha scritto:
> Introduce reset capability to EN7523 device-tree clock binding
> documentation. Also this patch makes mandatory '#reset-cells'
> property for EN7523 SoC dts.
> 
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>   .../bindings/clock/airoha,en7523-scu.yaml     |  4 +-
>   .../dt-bindings/reset/airoha,en7523-reset.h   | 61 +++++++++++++++++++
>   2 files changed, 63 insertions(+), 2 deletions(-)
>   create mode 100644 include/dt-bindings/reset/airoha,en7523-reset.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> index fe2c5c1baf43..a0df16485300 100644
> --- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> +++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> @@ -53,6 +53,7 @@ required:
>     - compatible
>     - reg
>     - '#clock-cells'
> +  - '#reset-cells'

I can't find any reason why #reset-cells should be a required property: this is a
clock controller, it doesn't necessarily have to provide resets, and you don't
necessarily have to use resets, so this shall not be a required property.


>   
>   allOf:
>     - if:
> @@ -64,8 +65,6 @@ allOf:
>           reg:
>             minItems: 2
>   
> -        '#reset-cells': false
> -
>     - if:
>         properties:
>           compatible:
> @@ -85,6 +84,7 @@ examples:
>         reg = <0x1fa20000 0x400>,
>               <0x1fb00000 0x1000>;
>         #clock-cells = <1>;
> +      #reset-cells = <1>;
>       };
>   
>     - |

Regards,
Angelo

