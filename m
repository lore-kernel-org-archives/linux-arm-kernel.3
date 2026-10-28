Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57044606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 13:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dqi27QgJ;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EyWASZTF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EK+K9qrLcWGfFuyJXBU9FNLXhFL/gszCgTQEAYirt60=; b=dqi27QgJUFBeSHFkdKiicZ9LuY
	Up4TbO9fmc8rSnpe1UblHB+WWrj+9JOiwxdhELzLGSA/+7Qzqxxml/z5rbm2MlpDfX5djhYm/poW9
	VnNOzRWcNdZ/ZdiQ3/S+0yWs+IYeoDuYo6nfjbs8fFbTSR7jrzwUa1KWBcHroeUMVFOquRFpGwrYT
	CSQejAzeVq9vIA50kQF/EfLNIzAMTewPzbwKa+nVJ9nqXbkqnMwFisW7nW6MOUyet+xMLa+rLguM9
	Y9HoTCnFr+4OJuTXRi9pK9RTRANgk0EfAfl5ctzcDuVKPLQue7gSDHKoXwwgNqp1ITOWmvyEQHZ6P
	Ybs8qskQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM40b-000000076tG-1df5;
	Wed, 28 Oct 2026 13:48:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM40Z-000000076tA-347O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 13:48:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7364D43ECC;
	Wed, 28 Oct 2026 13:48:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82ABA1F01828;
	Wed, 28 Oct 2026 13:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793195283;
	bh=EK+K9qrLcWGfFuyJXBU9FNLXhFL/gszCgTQEAYirt60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EyWASZTF9xJvCW12+5wPYsP5WXMRB6HGXmkJ9i0tu6Jxheh4z/m2T+wjtCwI762t8
	 Ovg9kHQlhk3x0vDq7ZlVQh+fPds4V/l+Jn7XVXmjkKzS12pildNSZyDN18mqUOaCZL
	 SRnypw0hQLY5g3mN7pG4Kt/lbgm9FxNKHtwSKFAWw5FXGRHtwOoh15HHzGT6fxOr/k
	 Zsai9a1LsxJ7gzOMn6uIhE+HJZohtTqSyVfeVwsaKrGBeL+DAPjolfg4wboT6ABv5W
	 GUY2VN7SmwkMQlYLESoTxVXNi9OIRYWy+oPoySD+Mapj0f3YTGdXagozPthHoUjObD
	 w5LTkpyuDSXkw==
Date: Wed, 28 Oct 2026 14:47:59 +0100
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
Subject: Re: [PATCH 05/10] dt-bindings: arm: apple: apple,pmgr: Add t8142
 compatible
Message-ID: <20261028-teal-platypus-of-poetry-a2febf@quoll>
References: <20261027-apple-m5-initial-devicetrees-v1-0-1356181bc50d@cyberchaos.dev>
 <20261027-apple-m5-initial-devicetrees-v1-5-1356181bc50d@cyberchaos.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261027-apple-m5-initial-devicetrees-v1-5-1356181bc50d@cyberchaos.dev>
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

On Tue, Oct 27, 2026 at 09:03:25AM +0100, Yureka Lilian wrote:
> The PMGR blocks on the Apple Silicon M5 SoC (t8142) are compatible
> with the M1-M4 SoCs. Add "apple,t8142-pmgr" as M5 specific
> compatible.
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
>  Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


