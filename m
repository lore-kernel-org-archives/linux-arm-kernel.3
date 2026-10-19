Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE0ECCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 08:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wVbdW4U5nHvILqR2Sarhn6+ygp6qQGiqBjV2V8YyhjM=; b=K3zN09bPVp2iXbVnFrdKru2ubA
	B00NP8RWQIBcN8Dymw1l3x13dCjlEuAJvgeN/P5im56CcVFM+4DB4tDt3u+4nmAKdksyPxO5Oh4A/
	B9tfhMi+CiHEM8GFF1NM+IHl4DKpKg7aXGsLcoCt6hIeKo0lAEebiR1orhQJDUc/AVi6lsH1PSPap
	Na89LFx914qQnQ8RjoCeOHYKe+1QxUO20xNb0T3wSICpqX7wVD7VyVq8xYQCgG8evvY1xFeLgmd01
	JVwBzzYxmtE9KhTu/pL13+xmPTC04sauu878sBaulZATJuzuuSPe0V7iDW2kiZs4XgcyNK4Zt7WFp
	+zWw1zGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIj7n-00000006umM-2oJV;
	Mon, 19 Oct 2026 08:53:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIj7j-00000006ult-3BDG;
	Mon, 19 Oct 2026 08:53:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CCAC06020A;
	Mon, 19 Oct 2026 08:53:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBD951F000C4;
	Mon, 19 Oct 2026 08:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792400018;
	bh=wVbdW4U5nHvILqR2Sarhn6+ygp6qQGiqBjV2V8YyhjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FS66MYHDGt9FkU4MDgxc6VyocLm3TND5YW6PM98TIB4hzWG1Z43tt7Wbc9QkTbT1f
	 poWIuR7Rc8+l3kpDP4+/MkDFLjQyYrSOL5Yu1DbWumqO+qLOVAf6SrLR51W35J9/ph
	 kx1u5nBcM6IlY+RoWwy6Lg3hV9suKE7xljLmC+Krw0geCojFdpNvm64i8al+cQrxy5
	 60eUlfiZtBR1NoGTw5hcbR7QDt/jdqHy3Dj8+5L7BwBdYU8TDT2yTKeTY9gmwHqw8n
	 dzlTbS0QEnhhSB4MGhUYnY2fuRjnEAAqjRSd4vcOYR+OqvAKUhE3iWLBufp9AVQsxe
	 Q2Lqbf0Wc7EeQ==
Date: Mon, 19 Oct 2026 10:53:34 +0200
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
Subject: Re: [PATCH v3 01/21] ASoC: dt-bindings: cs42l84: Document
 sound-name-prefix property
Message-ID: <20261019-zealous-origami-angelfish-207da7@quoll>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
 <20261018-macaudio-v3-1-abdff7741dea@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261018-macaudio-v3-1-abdff7741dea@gmail.com>
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

On Sun, Oct 18, 2026 at 03:53:55PM +1000, James Calligeros wrote:
> Some consumers may wish to prepend the codec's name with a known value
> to identify a specific codec among many. Enable this with the common
> sound-name-prefix property.
>=20
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  .../bindings/sound/cirrus,cs42l84.yaml   | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml =
b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
> index 94062c1d9d45..ca137aa57461 100644
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
> @@ -32,6 +35,8 @@ properties:
>    '#sound-dai-cells':
>      const: 0
> =20
> +  sound-name-prefix: true

Drop. Repeating myself from v2: just use the same code as others, e.g.
cirrus,cs42l51 or other codecs. You only need ref and unevaluatedProps.

Best regards,
Krzysztof


