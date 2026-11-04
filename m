Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CB4606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 10:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GE7aC7O5;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=le3NFuUc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vZTO7e+scOHMZfZ0rgBwT14GC+n8HQAdcfXeVAuK/yM=; b=GE7aC7O50KVA+ci2uPd254aAd/
	qeifzpzJWGILbg/MBR5f0HZdKHzoa4muqodSoKcPtJ1xOyC+1J/ClyBFGiHwz0BQUQqn/nxNPsQQp
	67uu+U3H8tgUFxUOzCAK61XKzqiTxgQn7F7+wTXon2PGCV9i9KQGysQGigKb8oZLP9BbOITnPRWP1
	8ZB5CIKbnC3xrnpRtwu8VA1UU0ytlV3FkZRjmc7WWd2wo9biIxJC8Dt00dWrQ8d3tf0baC2stzPrJ
	YAuAt2HuAEHUHeImQL95zOMFvbYbBRx1IqoXtojBH0NX7Sq/CVGvTen9iIBB+g6FZwYgvCy0A7IQ5
	x7PV1aMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYYJ-000000053Ja-1DAv;
	Wed, 04 Nov 2026 10:49:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYYI-000000053Iw-0KxF;
	Wed, 04 Nov 2026 10:49:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C2F9941AAF;
	Wed,  4 Nov 2026 10:49:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B9A61F000C1;
	Wed,  4 Nov 2026 10:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793789349;
	bh=vZTO7e+scOHMZfZ0rgBwT14GC+n8HQAdcfXeVAuK/yM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=le3NFuUcHXFH8dt8dhX/enpkJvbAqvt5iYEuKTjz/MCdSCaMfBEGrXZiEz6bnNscf
	 0VNK4hsQ8MC8BRbBEpdSkBgB0XUPK+UPUof5+jfwAW6p2fFs2fpcGPXn1jAaaXzROt
	 9+Ai0sn8EtYyfzlLGeTjaqZCQBIwaOgxl1j7gAevqnG5PGVs/5JT/rkroEgoh18okE
	 h+56o3Z3abo3yst7h8q0sbnSLX6dZ8EOPIG2fvBpPHGYn+O2H2plaWyhGBS2lkXW4f
	 yjXtGqyurw91eBLXwq6miaQEbrVxPRREeIMzphddaoa+mtotdoS5pER5ypfeYLSTur
	 V9D1C4ZvOBamw==
Date: Wed, 4 Nov 2026 11:49:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, Sven Peter <sven@kernel.org>, 
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 02/22] ASoC: dt-bindings: cs42l42: Allow referenced
 dai-common properties
Message-ID: <20261104-strict-precise-mouflon-85cbad@quoll>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
 <20261103-macaudio-v4-2-637484efe46d@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261103-macaudio-v4-2-637484efe46d@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 05:39:50PM +1000, James Calligeros wrote:
> We may need to define both #sound-dai-cells and sound-name-prefix on some
> machines where this codec is part of a simple DAI. Allow this by refrencing
> dai-common.yaml and allowing its properties to be used.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
> index ab4c7d22dc0e..4ac0af34c464 100644
> --- a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
> +++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
> @@ -9,6 +9,9 @@ title: Cirrus Logic CS42L42 audio CODEC
>  maintainers:
>    - patches@opensource.cirrus.com
>  
> +allOf:
> +  - $ref: dai-common.yaml#
> +
>  description:
>    The CS42L42 is a low-power audio codec designed for portable applications.
>    It provides a high-dynamic range, stereo DAC for audio playback and a mono
> @@ -193,7 +196,7 @@ required:
>    - VL-supply
>    - VA-supply

Missing dai-cells constraint

Best regards,
Krzysztof


