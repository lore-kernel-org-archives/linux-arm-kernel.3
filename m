Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3351606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 09:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=up+qlwlR;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=niylCJHV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ym7ZIQqtoG4e+CQqKSyynH5jiOK9eEJXm56IzwNu0EM=; b=up+qlwlRneUfZBPZaGHkDtqg8k
	6f7USwNrrjo5o93Mok0CW3EwTUTYtFuWVazGaJMvmt1zYh3lA+aVWh1XKX6xq0gB1tRU08GEKfT14
	5sNPE31gHlljJ+Tm4s1GQy/u/1fPkArRISkeG5E0zgVLLEB8vB7iZ2D2qAh9G9wSGgkSi/1wge+LN
	rVu3Df4QGE/7dQVOu6uiIcPWBMcWVpx2GL5UzI/+zdxrwkMIXYYu7e+6TnXuyrneUpznYyGG1v5vg
	Dvz5qZUemr/yIBmi5ulA73WZidvd8s4v/NKImaLik6U1o43w9fSHbyMvH0ETz3iGsUd2rog10FGqU
	YE4iXlTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdfS-00000004BfI-1qpU;
	Tue, 27 Oct 2026 09:40:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdfR-00000004Bf2-2S4i;
	Tue, 27 Oct 2026 09:40:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B939060211;
	Tue, 27 Oct 2026 09:40:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 869B31F01829;
	Tue, 27 Oct 2026 09:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793094028;
	bh=ym7ZIQqtoG4e+CQqKSyynH5jiOK9eEJXm56IzwNu0EM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=niylCJHV2ZImXnkjYlAJxdDnlpnsoxyiyXvvFTcuTukzjwbi6++qUCJ0vIgqTAjnX
	 iXOC/6UMZoKUfsATd0m+ZEuLBvjXA3geQ/g+tTh/hMxAkd+DxEpRLkxQBVh6HcNnTe
	 C5x1i4411+4Z/M6uldP2CmSkOedf2ML0MMV2WSsFkp75LXXm8kOZF+SHwvQqXtoswd
	 syo7vsImSV9MUeCncdCJuOy3r5v9XVsphFndCP4JTpXjP0KF9UZbwvdgOfH+KM0X+y
	 /iBSvRqRrLaPizPQMyMx+iVQBHtVFl3JFMh6OvhGtdfMlybkYHMMLX5vE+heRJtdhB
	 MdPFa183wn2gg==
Date: Tue, 27 Oct 2026 10:40:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com, sboyd@kernel.org, 
	bmasney+clk@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	lgirdwood@gmail.com, broonie@kernel.org, khilman@baylibre.com, 
	martin.blumenstingl@googlemail.com, perex@perex.cz, tiwai@suse.com, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Jiebing Chen <jiebing.chen@amlogic.com>, 
	Christian Stefan =?utf-8?B?S8O2dsOpci1EcmF4bA==?= <ckoever@outlook.de>
Subject: Re: [PATCH v7 1/7] dt-bindings: clock: meson: Add audio power domain
 for S4 soc
Message-ID: <20261027-aloof-lush-hog-c7beeb@quoll>
References: <20261025192404.209695-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192404.209695-2-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261025192404.209695-2-christian.koever-draxl@student.uibk.ac.at>
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Oct 25, 2026 at 08:23:58PM +0100, christian.koever-draxl@student.ui=
bk.ac.at wrote:
> From: Jiebing Chen <jiebing.chen@amlogic.com>
>=20
> The audio power domain has been found on S4 device.
> It must be enabled prior to audio operations.
>=20
> Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
> Signed-off-by: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
> ---
>  .../bindings/clock/amlogic,axg-audio-clkc.yaml | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-cl=
kc.yaml b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.ya=
ml
> index fd7982dd4cea..1cd9a99e5ff3 100644
> --- a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> +++ b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> @@ -20,6 +20,7 @@ properties:
>      enum:
>        - amlogic,axg-audio-clkc
>        - amlogic,g12a-audio-clkc
> +      - amlogic,s4-audio-clkc
>        - amlogic,sm1-audio-clkc
> =20
>    '#clock-cells':
> @@ -99,7 +100,8 @@ properties:
> =20
>    resets:
>      description: internal reset line
> -

Why removing this blank line?

> +  power-domains:
> +    maxItems: 1

Best regards,
Krzysztof


