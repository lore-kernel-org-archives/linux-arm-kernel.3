Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832BA606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 13:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b+F72j+b;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z5vpilQ7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0ooKXWeY0e7A+cuVjpBUsBgmOIh24PcaXz1sFnrQ4fM=; b=b+F72j+bJ85FNYUHzEEDvJbH+f
	ZEI4D9jEMjjx30XfEsjyTBzU0Ujo/3L772g/ppeb4DWIHjT1DryyTnFF1yKvbBDNBphRCOhFsz49k
	94BUigZnpY0LiD2r7U+d7qjvNUS8B3/oHB1JYlwczH0piKxUQjaI713fKAte7VbE5M8mT/EdyCwlq
	RyBToAP8s/3pe73r4rRBo8i87KDPWT7j2xE5lNhpN19GXq4tmio88cDNhjwnSUxXLtWECionzxUHB
	ShLqAAnCPNCRlyX+IQ5GVl1UL3KIIAUYruxM9r+rPKQat3/N6ijGnXKWyi9qxMvYmy7AS94ST2obk
	iLWfkruQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM40v-000000076xf-2MvX;
	Wed, 28 Oct 2026 13:48:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM40u-000000076xR-0oG0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 13:48:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ECE70438F9;
	Wed, 28 Oct 2026 13:48:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC59A1F01825;
	Wed, 28 Oct 2026 13:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793195303;
	bh=0ooKXWeY0e7A+cuVjpBUsBgmOIh24PcaXz1sFnrQ4fM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z5vpilQ7PNSjA4l86QAE5jE8wKTYRLOPm7/ETBRqj1umF13SyEZF+5ffwObn95W2I
	 91KPJsJFPk4c7uJHp5Ft7YqOdgbFFXrCNXac9BMTpKtJUDe2L+ElpMh24tgFHcNFLd
	 UABIfjaEnkTC0jAC9luDzwM7U8IplIjMBPMHxQmsCb4hsGlDksNErQSchPfymWDhe3
	 MGil62ygEofOw5L/XFCGblF01lC2kk0r5m+UhZ0fgLH7BuQqLxFJOy8IJ4cLz9RuKg
	 8ST+NaVvnbgKjYlfcZwk1QPXWJTphCq5QmVogKv6J5EMwJY8tZ4ZZbreWXtXudW6j4
	 Qb4wzMwhLE8NQ==
Date: Wed, 28 Oct 2026 14:48:20 +0100
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
Subject: Re: [PATCH 09/10] dt-bindings: arm: apple: Add M5 based devices
Message-ID: <20261028-teal-boa-of-attraction-dc0381@quoll>
References: <20261027-apple-m5-initial-devicetrees-v1-0-1356181bc50d@cyberchaos.dev>
 <20261027-apple-m5-initial-devicetrees-v1-9-1356181bc50d@cyberchaos.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261027-apple-m5-initial-devicetrees-v1-9-1356181bc50d@cyberchaos.dev>
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

On Tue, Oct 27, 2026 at 09:03:29AM +0100, Yureka Lilian wrote:
> Only the MacBook Pro (14-inch) and MacBook Air (13/15-inch) were offered
> with the M5 (t8142) SoC. Add the corresponding compatibles.
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
>  Documentation/devicetree/bindings/arm/apple.yaml | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


