Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F14606A322
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 13:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PxgxZp4D;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RdnBz1db
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qDzV/BSCBAxOgkyeUgwhABAV8Xciygx/josgC+QLyV0=; b=PxgxZp4DUlXsxUeRxxstn7P705
	xBFq7V3zx29FDW+/1NGAWfGCa5fV+z2qetgtV8BMum0GddsOIX4mKFdX5r/GgX0+WSBPnrXWjSHMk
	Gb09tlbLVirMdfHSTmzb8K+QGmCuniNMxv5zURVjVgLlx0ZhygqxFdTrt58hrDIWSHIcUgOpvSm4c
	zq3AICFhechCC3zGl7+OCTLQVGSXV8Jg+OvNp5cS8MDNv1b7Gb4hftlxdbofRPG3Ni3xI/xwqeQB0
	gOT67pUjw2lOBgIL/BPbYFN2ch3f4tfTikPUAqrIer6A92xULEHWwt57NfRLw6mWc/EeV0YSVCtgq
	7KjRsTQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3Me-00000007135-1mS5;
	Wed, 28 Oct 2026 13:06:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3Mc-0000000712w-3rvy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 13:06:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5CFA560136;
	Wed, 28 Oct 2026 13:06:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48F191F01828;
	Wed, 28 Oct 2026 13:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793192806;
	bh=qDzV/BSCBAxOgkyeUgwhABAV8Xciygx/josgC+QLyV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RdnBz1dbtXIeb3HyA7QqqOJ302Jd+NkhIn8zrh+yGXspbul4+HP4qUcZg7SvMRyeN
	 ksTnfg3zMNnB6WNBV73M/sAaYcpWVYuM7RoTGnS2DJVKmxQO/jTzecXmsXW48Ymdjq
	 6VKWbhzz3pLQQHIUDgcnRmzeDYGdFA7lJpHW7BwCqGBMisL7y50McuyciglcrV5km7
	 IIclv+4fgj3p6ecCStDcv5+gqxZmEBMMUZuJ60UT2mqy5Zy4V02t9vPwKJc/CcUF8p
	 Fku9mH/mWu5cICCnYkIkWFOWL8dNDDPGQ4UJkzuRb5wFUtHSN/xCrNrmUfPWgb6gAq
	 Y0olpsYneKHmw==
Date: Wed, 28 Oct 2026 14:06:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Ulf Hansson <ulfh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 02/11] dt-bindings: pwm: renesas,pwm-rcar: Add support
 for R-Car X5H
Message-ID: <20261028-snobbish-deft-saiga-1cb2aa@quoll>
References: <cover.1793026273.git.geert+renesas@glider.be>
 <388ee68e120ba73e675ad78fe0b1cbd89b061831.1793026273.git.geert+renesas@glider.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <388ee68e120ba73e675ad78fe0b1cbd89b061831.1793026273.git.geert+renesas@glider.be>
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

On Mon, Oct 26, 2026 at 03:55:18PM +0100, Geert Uytterhoeven wrote:
> Document support for the Pulse Width Modulation (PWM) module in the
> Renesas R-Car X5H (R8A78000) SoC.
> 
> R-Car Gen5 enlarged the PWM output cycle and high-level period fields
> from 10 to 24 bits.  While the added register bits have initial states
> of all-zeroes, and thus look compatible with previous generations, the
> register bits may have been modified before Linux boots.  Hence no
> fallback to renesas,pwm-rcar is included.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../bindings/pwm/renesas,pwm-rcar.yaml        | 61 ++++++++++---------
>  1 file changed, 33 insertions(+), 28 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


