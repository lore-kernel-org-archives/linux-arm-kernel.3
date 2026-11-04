Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F61606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 10:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0Y0Gw/7Y;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ii+Uo71R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=r0yndPxUhhPiOlKsOGZcPIxshPKvfSmviX9txktuT6o=; b=0Y0Gw/7YGKAzRC8RiHk5mgeB4c
	c6VdOS2rku4rHu9AHIQg0PEgWM21Mhy8wFJFmQshUSMfaCt8xCFUkme60LjcAaN8Ya8XBexPVugWm
	5aK+LKpBb8S1Xtwg+uzrVaCY0m4ZrBOM+Ljh0w3ldHDz88uuX76p4Ux4+qZBqmEqSAQe64PMp4/MM
	K6tDMymWAlO1tB9ur/B8r7paoywBmzFjWnuUfzsK9rlx2UpFsTI2LkIO2hsS1J7t7OGIg8PX3xBjF
	y+RZt/bvuYZe1trpXsLihMrxSruvXXjVbQnD2U/0Hx91h8QZHjHxVn2C2ArgVmfXSp4i1G7ySjdKW
	nhwFYqUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYXg-0000000532s-1LJh;
	Wed, 04 Nov 2026 10:48:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYXf-00000005327-0aE5;
	Wed, 04 Nov 2026 10:48:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7477140EFA;
	Wed,  4 Nov 2026 10:48:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE90C1F00A17;
	Wed,  4 Nov 2026 10:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793789310;
	bh=r0yndPxUhhPiOlKsOGZcPIxshPKvfSmviX9txktuT6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ii+Uo71R6czgiB17H6WDqTqqQ0xTPO1fBU8EtxEAPFVA4ntlhk8S/834W7Pv6V8hT
	 4I3EDGs2Vw8QG+GxUZnGI6VK5tQWb9XMVplL4OtWSzZcBFry5H59dnlb11Lvs8lEYL
	 8T10fWSGuC1ATHYC8zw4tU9LQufBL1cex5+YM3EqwjCkde/aqypXt+VaxUemgcwMlX
	 SCEw9cYwrP9UCaPJ8VmjkUz+r6pPTExufacLcsbeopvqtO7IdX592eEc3Gihl42hXK
	 Xhf5Cvo9LJL7Cdni19/YDPKq/zmmiShUn7gysgrntxpBFyB/7lAyFDJ+YgzSFfg4It
	 bxYOpHci/bRRA==
Date: Wed, 4 Nov 2026 11:48:25 +0100
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
Subject: Re: [PATCH v4 01/22] ASoC: dt-bindings: cs42l84: Allow referenced
 dai-common properties
Message-ID: <20261104-eccentric-auk-of-zoology-55bcc4@quoll>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
 <20261103-macaudio-v4-1-637484efe46d@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261103-macaudio-v4-1-637484efe46d@gmail.com>
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

On Tue, Nov 03, 2026 at 05:39:49PM +1000, James Calligeros wrote:
> Some consumers may wish to prepend the codec's name with a known value
> to identify a specific codec among many and set #sound-dai-cells. Allow
> this by allowing referenced properties from dai-common.yaml.
>=20
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml =
b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
> index 94062c1d9d45..66cae8b7db5d 100644
> --- a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
> +++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
> @@ -9,6 +9,9 @@ title: Cirrus Logic CS42L84 audio CODEC
>  maintainers:
>    - Martin Povi=C5=A1er <povik+lin@cutebit.org>
> =20
> +allOf:
> +  - $ref: dai-common.yaml#
> +
>  description: |
>    The CS42L84 is a headphone jack codec made by Cirrus Logic and embedded
>    in personal computers sold by Apple. It was first seen in 2021 Macbook
> @@ -29,14 +32,11 @@ properties:
>    interrupts:
>      maxItems: 1
> =20
> -  '#sound-dai-cells':
> -    const: 0

This should not be removed. Why cells of 1 would be correct? If so,
explain in commit msg.

Best regards,
Krzysztof


