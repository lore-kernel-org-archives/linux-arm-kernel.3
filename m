Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D9E60A3825
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 13:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4NdsjRrJ;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TJLmeehF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DMsRiBknVoRDaECGgJaVBAV8VypoAXINin2meGoRvjI=; b=4NdsjRrJfQ4Ps48N+Ri4fVJehh
	KrCX44pBCVQzA8MRE18BllC17aXRNyJ7Qchya9jc56SFp7czwl+cak2fFVIEOSxlLsfP7QpZBegzb
	yGlLCgBuzD4LqscPonVyh12OlZMGUD6DJWT7yRtv//ms9oIMaK8atwgf6WY+X1t4fyiTbbenBuBes
	APtKHZ3Fn4Pak0h6TyWT3m5NJ+gSWijJFgtGQnTKA+a3KcUCW8kCsyrceENkMin6NK+FaHPmBf3TU
	be5hOyxADfACatFOQDDHu8DOnXLzC26y1kwlhFiMrMMxrDAVibqt3NRU2XIuSsjh1uYg3GIvB3gGX
	uvVDh20Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3mv-0000000757o-3P7n;
	Wed, 28 Oct 2026 13:33:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3mu-0000000756l-35b2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 13:33:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 33CED60232;
	Wed, 28 Oct 2026 13:33:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F2E41F031ED;
	Wed, 28 Oct 2026 13:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793194435;
	bh=DMsRiBknVoRDaECGgJaVBAV8VypoAXINin2meGoRvjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TJLmeehFcs9qsZX9JOI7J+zshbl5pWfJS/NdnsI7OC4u2FQX2qAbqo5vQ3iqOzHL/
	 qjpQXTlbUVpTrkyHvNNb8ZL5rxZFKU+B5SQ7CR8o/+ZUsco+XjWEAHIc/cijE8snx5
	 VjQTlwCF69pqwcUMT3fWk3i7aAWpKAQXbfB2ADc2S9vyjLcM2Y82K9N93AFfANpmCa
	 Di89PaCA7lSyAe6O5qrg7mkdRDRaQ+BT6T3ZTAqVosuXkXB7rxJ3uxJ7VNUwiC17e0
	 4GcAQ624OZJEZ5KR+xD+X/ytTESDK4p9p34QWZ8ltu0rh5zHaPGhJz+DSfgE3Nbn3r
	 dk3NE8JGnc50g==
Date: Wed, 28 Oct 2026 14:33:52 +0100
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
Subject: Re: [PATCH 06/10] dt-bindings: pwm: apple,s5l-fpwm: Add t8142
 compatible
Message-ID: <20261028-aquatic-dainty-tamarin-9aeecb@quoll>
References: <20261027-apple-m5-initial-devicetrees-v1-0-1356181bc50d@cyberchaos.dev>
 <20261027-apple-m5-initial-devicetrees-v1-6-1356181bc50d@cyberchaos.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261027-apple-m5-initial-devicetrees-v1-6-1356181bc50d@cyberchaos.dev>
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

On Tue, Oct 27, 2026 at 09:03:26AM +0100, Yureka Lilian wrote:
> The PWM controller on the Apple silicon t8142 (M5) SoC is compatible
> with t8103. Add "apple,t8142-fpwm" as SoC specific compatible under
> "apple,s5l-fpwm".
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
>  Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


