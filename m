Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C82606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 11:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1AoR6e4g;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oUeqAFHQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ivlp40VyVn8KszTJtgCYob0RPuAFDPOsj7lo4X2gHHY=; b=1AoR6e4g4dYDKrr2lZ62x79vNp
	2IY1xAKwSOQAzQCwQR0LClUvlaLSmwesz5beVVzhcYVPztI73erV4dwMH0DNnCDx9pogN4uOWZ0Jy
	fMZ8LVplQXx9B3VZDprWVirPMZinX34J8VjImWxouX8tXuFLL/K6iusGhkoCWQL3L4C7hKTK9GUG3
	zf9ICNkZVMkXVJBjlshCOSiRTLX371S5xVt38FsXpA/cZlhmNcwQhxXj9HaAnJkosASQilasmZ4/b
	nANAZGAUr8TtU0G+/qlp0q9gZCjUKTpEJHT88OxtRsuecg6L0E7T4KnAI4esrSHXAFVJqE0pujStV
	c2+ei5nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkg7-0000000BXiU-2Fg3;
	Fri, 30 Oct 2026 11:21:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkg6-0000000BXhT-00mu;
	Fri, 30 Oct 2026 11:21:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 58261438EC;
	Fri, 30 Oct 2026 11:21:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CE601F00A18;
	Fri, 30 Oct 2026 11:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793359305;
	bh=Ivlp40VyVn8KszTJtgCYob0RPuAFDPOsj7lo4X2gHHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oUeqAFHQV6dbP0aw5HxzJN5G39aqc7eFWXNCy/m40JH1jRwjt3iAdOqRY6A3+0/F/
	 NKKYgpuLa0Rx6uOkqb9myzFhRhynrFFsnI8+3Hgv5MykQiWdQApF/Kik6pjLuFBSmI
	 2zc7M4l9V463SuPnDPejWgbmqcQowbr+a39a8F+omLtQoKloVQt8qi0YpWB6QYEU3n
	 8eD+lXsYGf2dljt5/9yEDBLqQboxzSlxJHymEmlXTFx6C1Nd0rAPyvoGrev+cTZH1I
	 pSukKz39WpDiKlMx7qA9Tkxp1/hxoMkNsYZx/lxzIy2GQ/9OwimD021NkiDV4u8bLB
	 gZc90AOO9vAuw==
Date: Fri, 30 Oct 2026 12:21:41 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: ulfh@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com, 
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Christian Stefan =?utf-8?B?S8O2dsOpci1EcmF4bA==?= <ckoever@outlook.de>
Subject: Re: [PATCH 1/2] dt-bindings: mmc: amlogic,meson-gx-mmc: add
 amlogic,core-phase-degrees
Message-ID: <20261030-sarcastic-sophisticated-tortoise-a7a8ea@quoll>
References: <20261025192059.208792-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192059.208792-2-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261025192059.208792-2-christian.koever-draxl@student.uibk.ac.at>
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Oct 25, 2026 at 08:20:58PM +0100, christian.koever-draxl@student.ui=
bk.ac.at wrote:
> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>=20
> The controller samples with a core clock phase that is fixed at 180
> degrees in the driver. Some boards need another phase to work at high
> speed: an SD slot on an S905W2 TV box fails with CRC errors at 50 MHz
> at 180 degrees but works reliably at 270 degrees, which is also what
> the vendor kernel programs for it.
>=20
> Add an optional property to describe the phase.
>=20
> Signed-off-by: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
> ---
>  .../devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml    | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.y=
aml b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
> index 976f36de2091..8123375a66e0 100644
> --- a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
> @@ -58,6 +58,15 @@ properties:
>    power-domains:
>      maxItems: 1
> =20
> +  amlogic,core-phase-degrees:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Phase of the controller core clock relative to the card clock. Some
> +      boards only sample reliably at high speed with a phase other than
> +      the default.
> +    enum: [0, 90, 180, 270]
> +    default: 180

Is this the same as clk-phase- properties from mmc schema?

Best regards,
Krzysztof


