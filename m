Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4A260A261F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 13:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ERz3TBeg;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XJ9B7B/t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LH8YOyx4QS5RNezRx1gXoeqhHEy/U+7vjtN+dlNu8T0=; b=ERz3TBegrvoxkegLF8IfliOJ88
	O3gisgjgQqGaPo6Ipz/CLbgoz5992snqOnwds5iBWIRKLT2xPgWL4Lxxtt257Y7wVWFu0Hiu44sss
	g5E3Yy8P3x6RBitMR4rDF0AVDNCMKDb3Z7TMCaWZ5VzrQWSgEF+KRjYgKk4aDXdSizOZ8SlalkeN8
	Ncw2Ig9qZJZv/6QhlGqi7a9n+6D3nzGDrJbSfvfjElcWKM7RsjCXTZJCmXX7Y1Yh+hnn59FK07HaU
	5LgqreQOgEUYXgTfqMWUXMWDrmRg2I7FFurs1cqZ/SqDun2CoQGDUSrLRwJwH67ufgMxKgnKgvJGG
	92hb/guw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3mi-0000000750d-2yl7;
	Wed, 28 Oct 2026 13:33:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3mh-00000007505-2MOp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 13:33:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 18A2040D94;
	Wed, 28 Oct 2026 13:33:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32DCB1F01825;
	Wed, 28 Oct 2026 13:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793194423;
	bh=LH8YOyx4QS5RNezRx1gXoeqhHEy/U+7vjtN+dlNu8T0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XJ9B7B/tB8GpGL5IB76x+CLKeGq9cMegXjiR3sg9eMy9rdTJcsjGnCXqiuEkeTf2R
	 mCvpHlTAtDVSv/UIWwQ9K0n/4zMk2m+vKTVe930XOpuaE5vQrBCTtGmPBkaXvcd1rM
	 LDh3dwsq3uPhB53MEn4LJwsjs/cjR1DNDAHOniuQUudZhcp7EFQJGILI+9wbFeEjsu
	 sWzk9J3TBICXa1uRosOESnBhafD8IJIvrqxWKUjUzCDby3y/z2nZojXmxPhcVBLfZM
	 N/NLHB3F/bqr382Lfy2AvwAjLtfvyyiIrPnhTdfoAtwhRru2CLzunJBId1Zq4tY8Ov
	 gv0QK25QllpHw==
Date: Wed, 28 Oct 2026 14:33:39 +0100
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
Subject: Re: [PATCH 04/10] dt-bindings: arm: power: apple,pmgr-pwrstate: Add
 t8142 compatible
Message-ID: <20261028-prophetic-crouching-loris-ef41a2@quoll>
References: <20261027-apple-m5-initial-devicetrees-v1-0-1356181bc50d@cyberchaos.dev>
 <20261027-apple-m5-initial-devicetrees-v1-4-1356181bc50d@cyberchaos.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261027-apple-m5-initial-devicetrees-v1-4-1356181bc50d@cyberchaos.dev>
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

On Tue, Oct 27, 2026 at 09:03:24AM +0100, Yureka Lilian wrote:
> The device power state management of the PMGR blocks on the Apple
> silicon M5 SoC (t8142) is compatible with the M1-M4 SoCs.
> Add "apple,t8142-pmgr-pwrstate" as M5 specific compatible.
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
>  Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


