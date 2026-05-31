Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DD5CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 12:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kU3C0Fe5mVTPmf2QmytRlBNptZObb7DHNb86r8nSqWY=; b=SrUSEbrj8itUYp1B+8Z1KHtSAT
	cdN/iDGE6iXBRrojlljoKT79Iuj4AAhE+851YobzRQTFl+oh8ta86UwCfGN1Fw2yf1giTVfbh8Btd
	tXXpA3VFvoBi0/s4vGAI+TWF+SPHqXR1l1zZomT+EyrScBzKLtIr/1vf8QsEmS03UgWr1jGyVW1an
	0k1g6gAtzGYhC9CVgK+h5h3qacPDauzHGN2ZQYnhT3eUix8hisSCcBL7GU012iMCmEmToSTDndD2z
	Oz9HMrhC0t2cOk+rCnwKA1qFvmbT5yhhRDIPW5o/8hn0LTg2LnXROCRMo7Tw/knzr0v81J9tSccTC
	pXRbVHHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTfS5-00000009b5g-0xSZ;
	Sun, 31 May 2026 12:39:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTfS4-00000009b5V-2phk;
	Sun, 31 May 2026 12:39:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A9DFB60123;
	Sun, 31 May 2026 12:39:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3BAC1F00893;
	Sun, 31 May 2026 12:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780231175;
	bh=kU3C0Fe5mVTPmf2QmytRlBNptZObb7DHNb86r8nSqWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OePxq/vWO0dyv59ea02eESX7RYIHLkeAHPNtX+O52so2zGz0j2860tEE/AQ3uFEaS
	 5dmN26dSGYXI121RV0EnD6g3NT2dWKV4GL9PSpiTHywBVmnLRqAku6ywGslEPVdEqx
	 drhbmvbPVm4CZQMN12+ut89VfcdnL39KrwrfTq0iXF/fcgy2LpdpphapyTux431K/v
	 STTQH77KNoO3KRb7dKc7EmlScwcbvDUdNwMSOhxLC0vYKCYPexktLz/b7WzhgTIROk
	 aIB/H5cz8rPQVmeFyh63aJ3d78kDvYjy04d6OW3yQUjwTX81Dm95M6EPuEfevr5BfZ
	 ZWTPNtX9geyJQ==
Date: Sun, 31 May 2026 14:39:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Cyril Chao <Cyril.Chao@mediatek.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Chen-Yu Tsai <wenst@chromium.org>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/4] ASoC: dt-bindings: Add Airoha AN7581 AFE Sound
 card.
Message-ID: <20260531-spicy-sassy-woodlouse-b2674e@quoll>
References: <20260528174840.28644-1-ansuelsmth@gmail.com>
 <20260528174840.28644-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260528174840.28644-2-ansuelsmth@gmail.com>
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

On Thu, May 28, 2026 at 07:48:29PM +0200, Christian Marangi wrote:
> Add YAML schema for Airoha AN7581 AFE SoC sound card.
>

Nit: subject, drop final stop.


> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/sound/airoha,an7581-afe.yaml     | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
> new file mode 100644
> index 000000000000..80d9e87f1470
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/airoha,an7581-afe.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Airoha AFE PCM controller for AN7581
> +
> +maintainers:
> +  - Christian Marangi <ansuelsmth@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: airoha,an7581-afe
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1

This looks incomplete - missing at least clocks. Are you sure that AFE
here is so limited, comparing to other Mediatek designs?

Best regards,
Krzysztof


