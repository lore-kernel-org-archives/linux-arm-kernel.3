Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4E5606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 13:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zXXYT9jW;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hsvG9Jr1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vJiYJ2IsilIwmVzS1k6YMZ9rFUOVDWV3fT63vEQKSD4=; b=zXXYT9jW5gdFFGIGsn4i9CTOrJ
	Pvukw11y3iRo1ziF8ymsoWpbJjzBULFIRx60eed0Z9jrEWtQU4ZCeygPSS4VdgKYbdUS+TQVGIfGJ
	GivNMtmdPj4tXu/BN9soYeOT1q4zOxaSab4xTOISY3yLXR2DlfPYborddInUwuqrzk5lQZLxheOCR
	y/wf2jiRcfL0LaiaFBy7pSBMw/i3Rdj1e5h0D5LblMGiTprgcHbIjKB3daq0GlmysiS+PFZJJGBU+
	qKmGbIweUIw2YJVduP9ODYgrv7U9lZ29l7LqI9TVdl3P3zKkbWN5cJCHs8N0sh73Gf5CON3se4HgZ
	5W15a9YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3m6-000000074s7-22yJ;
	Wed, 28 Oct 2026 13:33:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3m5-000000074ru-31Vg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 13:33:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2DE5E60136;
	Wed, 28 Oct 2026 13:33:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 237661F01825;
	Wed, 28 Oct 2026 13:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793194384;
	bh=vJiYJ2IsilIwmVzS1k6YMZ9rFUOVDWV3fT63vEQKSD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hsvG9Jr1y9pHMKOD1l+/76s8H2Lw4G48Da4qm361dB66ivZWYZ3PKRbNiqaMLXHcw
	 dmn8HBB/hRwkU3PXOD4h9SIMrCUgVQ/1T/K9dnEWKGHwnoIGS94/WAROZoRlylkk1q
	 RAH8vpd5yWhGtjqV60OyGF0rrVzH6uDHe8xPmAlzU5hPnC2B1Fii3owMiFi5z1wKx/
	 0YMIP/RvCebPbowQKvhgVWur5NnxdodCUoIxU22cB6JCsfy2EPKnCkH/HFo2NTU3Jv
	 iklkvckaSA5y6hbv1oALOTl3AODT7YZWT/wNB9wp+XAkyHXkmar5V0PGMSMDhcIJxl
	 hkQf6jFVXPkKw==
Date: Wed, 28 Oct 2026 14:33:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Hector Martin <marcan@marcan.st>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Sasha Finkelstein <k@chaosmail.tech>, 
	Linus Walleij <linusw@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, 
	Andi Shyti <andi.shyti@kernel.org>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 07/10] dt-bindings: pinctrl: apple,pinctrl: Add t8142
 compatible
Message-ID: <20261028-quizzical-proficient-stallion-ddeb59@quoll>
References: <20261027-apple-m5-initial-devicetrees-v1-0-1356181bc50d@cyberchaos.dev>
 <20261027-apple-m5-initial-devicetrees-v1-7-1356181bc50d@cyberchaos.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261027-apple-m5-initial-devicetrees-v1-7-1356181bc50d@cyberchaos.dev>
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

On Tue, Oct 27, 2026 at 09:03:27AM +0100, Yureka Lilian wrote:
> The pin controller on the Apple Silicon T8142 (M5) SoCs is compatible
> with t8140. Add "apple,t8142-pinctrl" as SoC specific compatible under
> "apple,t8140-pinctrl".
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
>  Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
> index 0984e4e58af3..a4a15b117035 100644
> --- a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
> @@ -17,6 +17,9 @@ description: |
>  properties:
>    compatible:
>      oneOf:
> +      - items:
> +          - const: apple,t8142-pinctrl
> +          - const: apple,t8140-pinctrl

List should be after apple,t8103-pinctrl list, as entries are ordeded by
fallback compatible.

Best regards,
Krzysztof


