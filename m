Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D669606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 13:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dFr21QhA;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bOWvRrde
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mgaExbvnghCg31gnn54x4d+C6t6alfhG7i2H1RjCe5A=; b=dFr21QhA9XM16wc1x7q5wAjv3Z
	VQ0etL0A4FtvRmHrMdkHgxEhDHxlYSBEyYqrFySlRhQmifFlmXcaUEZJVE+nnvYmQfOF1engMyDNo
	vR7Bw3fQWyb5P65Av4wS5DS7NhEUIFcezOdxGJtIYCmD/NzwOS/wYzIYBL6YPlP5bIyYohxYzhEDJ
	vhB/RHJKQpcADtN2k37ljjt8UDebm72ut6jOYnVd9U2iCFOlhwVOqemTVf1YHNj4GRCVsua3EpcAI
	Akp4Z+ca/4ciEEJcFLdTJheu9+AFbnOA/YALIZPbtS2mU1N7zxif1J84yVFfIu4K1RZmhdciWr1oY
	ct9Qt4sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3lS-000000074j2-1VPf;
	Wed, 28 Oct 2026 13:32:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3lR-000000074if-3WJi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 13:32:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B19E60120;
	Wed, 28 Oct 2026 13:32:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3CA51F01825;
	Wed, 28 Oct 2026 13:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793194344;
	bh=mgaExbvnghCg31gnn54x4d+C6t6alfhG7i2H1RjCe5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bOWvRrdeUnHYioSZaC5f8If9tjlM+7mCemmNsVYNzXBDL81TIpncPRCB29Evee1i8
	 Ue1F+3otI1pxWLCjOvNwJ5MOH9KQ4JseVfWkue+Y1/EGGv1+Mj4MqHDMZIcHvv3atH
	 66f0/dMj95GeP+xU2+OWhNnZbgWRo5VuoD5pDmQqLm8ncAc+VeEIjl1JMCe0hAAzuE
	 tjROXmaSqoGiYkVP9dPvNc6QlmKXtP0pIrUteMqqlYumfWjSqvBdG/eVky1WWO2QKP
	 1dQOw9OWfaKwDWoxQJ+kMw6tTTcnsgD4a7K/SsQksCvc7nLEdsbCzgmB4dBxGfjzBZ
	 GU1AN1lunQ1BQ==
Date: Wed, 28 Oct 2026 14:32:21 +0100
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
Subject: Re: [PATCH 03/10] dt-bindings: arm: cpus: Add Apple M5 CPU core
 compatibles
Message-ID: <20261028-stylish-thick-numbat-f4f8fc@quoll>
References: <20261027-apple-m5-initial-devicetrees-v1-0-1356181bc50d@cyberchaos.dev>
 <20261027-apple-m5-initial-devicetrees-v1-3-1356181bc50d@cyberchaos.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261027-apple-m5-initial-devicetrees-v1-3-1356181bc50d@cyberchaos.dev>
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

On Tue, Oct 27, 2026 at 09:03:23AM +0100, Yureka Lilian wrote:
> Add "apple,hidra-e" and "apple,hidra-p" compatibles for the M5
> efficiency and performance CPU cores respectively.
> The compatible strings are chosen based on SoC codename ("Hidra") plus
> core type (E-Core / P-Core).
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


