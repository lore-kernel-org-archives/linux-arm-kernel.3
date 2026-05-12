Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E95CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 13:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KRIEdeJis5rGydKJJXhaBbOfKTqtKZoz5JJcuzHlVQY=; b=vAVl+obOz+2cWIeO4U+tvFhh5u
	8YPGP7xuYpS77QBCQsDdpZd+eOlYUq+H7X+NBGGl6qaB0txDSK/gXm1VvXgDP03i5qgwOXtJdjg61
	ZQN73Qg3oaTlNlfMjhSCPf9cxOeBEMZFPHAZgGymQ57tg+BdMRP0+7lHLU8q1dsW8LbYWjvSz4WO9
	lkM6LtETHjO20Byc+kENzg0hn5op5C3R84Y6MDof1cxQ14MuGz8XRu+IkYP88DbLugK5KZhfk9qNf
	Th9VhkUVCGIig34b0nE/KE1XRF40lqvAxuApFLRVx3v11z+4F4nxwXJ5O0SqJDAOc7HDMH5W0KU0o
	7vwFKMPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMmvT-0000000Gmt4-1ZcL;
	Tue, 12 May 2026 13:13:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMmvR-0000000Gmsb-3iRM;
	Tue, 12 May 2026 13:13:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C84A66014B;
	Tue, 12 May 2026 13:13:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40D4FC2BCF5;
	Tue, 12 May 2026 13:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778591608;
	bh=CX64YbIUWl8RdUzb+Ud5wV0VY7WrYZ76F+BXobyWbII=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AdVhf77DDYTVZmGXLlltu0/q6TBCLetH1UoFRP1R3kE5gCkvJp6uotziv0XpbnhvZ
	 ZBXrMa7/wdpIGS7+aqDmIowf/NH9PUFAefogOzbqegaNUk/15Ez055zuXCEOhi4213
	 7+6zJtg/85Ba46OXrtQJQwolpGtGo5gTEf/NW3B/mL13ydYbMpvzpxzkUbbRsX/1D+
	 wkhHl6o8uMeAfTJwPBJ1GhnYK2K6LECg0Ho5SKIlBSe9oWU/r/hexQJ6vxpeB8ypOR
	 AImGo0WI5aoCXBG/wMR3WrOvRW2jC0cMUkJVuWA1FMqJA2ckh1zLgRGWGRm0ZAbqj1
	 T8VMzMJLfQNqA==
Date: Tue, 12 May 2026 14:13:13 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Cc: rva333@protonmail.com, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Sen Chu <sen.chu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Lee Jones <lee@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, "Rafael
 J. Wysocki" <rafael@kernel.org>, Daniel Lezcano
 <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
 <lukasz.luba@arm.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, Ben Grisdale <bengris32@protonmail.ch>
Subject: Re: [PATCH v2 01/16] dt-bindings: iio: adc: mt6359: generalize
 description for mt63xx series
Message-ID: <20260512141313.425535d9@jic23-huawei>
In-Reply-To: <20260512-mt6323-v2-1-3efcba579e88@protonmail.com>
References: <20260512-mt6323-v2-0-3efcba579e88@protonmail.com>
	<20260512-mt6323-v2-1-3efcba579e88@protonmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 12 May 2026 08:18:15 +0300
Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org> wrote:

> From: Roman Vivchar <rva333@protonmail.com>
> 
> Update binding title to the MT63xx, since the list of compatibles already
> includes mt6363 and mt6373 which don't belong to the mt6350 family.
Hi Roman,

Wild cards have a nasty habit of going wrong.  I'd prefer to see
language like: MT6359 and similar PMIC AUXADC

It is less important here than in many other places because the
file has an explicit list soon after this, but none the less
we've been bitten by this too often to think manufacturers won't
throw a completely non compatible part in the middle of a wild
card covered range.

> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
>  Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
> index 5d4ab701f51a..2e8857e104f5 100644
> --- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/iio/adc/mediatek,mt6359-auxadc.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: MediaTek MT6350 series PMIC AUXADC
> +title: MediaTek MT63xx series PMIC AUXADC
>  
>  maintainers:
>    - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 


