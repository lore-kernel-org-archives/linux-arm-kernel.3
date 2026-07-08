Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 924E2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 08:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0XJWRl+ddl7ZcLOVI4Dq6FDBTx5ez5QcB+HtudEUcog=; b=U/piqnu/OgpHedePuRsw73yY5D
	a11BMZ9An2wEMBv560dSFzv99fLAunSQOIwcxJVZ6/JJLk1H/y3QrWDjezFBmaEIba24wX1/MpLyG
	S48bLcgNPB21dSDRFS9zSJbbHPzk3716EnXYrG/1rrQpD0/0mZRhktR6KC4O056vHJO3cv8fI9Kkk
	I3HZb+HOtzBJf8W1Xv9M2xv1H2XoaVJWwWNrBI6bexHbu0L1cSP7hbsi1B7DG/XZRDsWBroDH03IZ
	z4t/BiqzdvMy9oqqczQKvVA4EKD8SKvVvhCmfiUBBldtCnR1v0O48pqkgPmZ4CjzQw8jS04KtvlPX
	GI0jg+RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNl0-0000000GdI7-30Es;
	Wed, 08 Jul 2026 08:35:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNkz-0000000GdHl-4AT1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 08:35:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E6F360008;
	Wed,  8 Jul 2026 08:35:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9FD31F000E9;
	Wed,  8 Jul 2026 08:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783499748;
	bh=0XJWRl+ddl7ZcLOVI4Dq6FDBTx5ez5QcB+HtudEUcog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U9V1lVIeVVqdoTYSYzUAFYsmq6sqva2cYrU4298FXbIK74DeqLHRoM7vli1J/CYKS
	 3ndckJeK5jNmjDBdnVhpNVBG8OyuDSVNNhLY9xA8fC1r6tJEpYHnx+FDXqBMIhdHxd
	 UTF4/DlGeP2JTzUP0uC3MJ2SlNQ7LApKAwEHz30n8NUjyuK7NYG737EOa9iQlePy7h
	 llNw/6HjPi8FWOdkHV/NbsIF7z71va3QtkgyeLrWP6c5Fb16pdWJ+/YiT9SfNr44Fg
	 9AZQ5XAXrTUIPwKjWkHR+MRylh3lKMlQJ36Vnc/THNcpwGBgXHuZ/LTe0uSrSIJoRs
	 sPJlhqBsfINDw==
Date: Wed, 8 Jul 2026 10:35:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Thomas Gleixner <tglx@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Hector Martin <marcan@marcan.st>, Linus Walleij <linusw@kernel.org>, 
	Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Sasha Finkelstein <k@chaosmail.tech>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-watchdog@vger.kernel.org, linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH 01/10] dt-bindings: arm: cpus: Add Apple M4 CPU core
 compatibles
Message-ID: <20260708-vigilant-agile-wombat-461a9a@quoll>
References: <20260705-apple-m4-initial-devicetrees-v1-0-e5655ee56523@cyberchaos.dev>
 <20260705-apple-m4-initial-devicetrees-v1-1-e5655ee56523@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260705-apple-m4-initial-devicetrees-v1-1-e5655ee56523@cyberchaos.dev>
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

On Sun, Jul 05, 2026 at 03:17:20PM +0200, Yureka Lilian wrote:
> The core types of the M4 SoC no longer carry individual codenames.
> Apple's device trees re-use the 'everest' and 'sawtooth' codenames from
> the M3 generation for all later cores.
> 
> Instead, we use a combination of the SoC's codename ('Donan') and the
> type of core ('e' and 'p' for the efficiency and performance cores
> respectively) as compatible for these cores.
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


