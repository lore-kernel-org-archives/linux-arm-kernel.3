Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 014C2E77171
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 08:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LMFtiwUdUqwrxdjEBusTcZgGwFjXia4Vke/I7vmZaZ8=; b=oYOWzLleDQp5AFJLkhljlS7sKS
	oEJ09JLvj2kbNVMRM+dOMRfz9zKWsxBqkGUG29wi6C2srfYJc59YbdV3RR8RxsCsuHcUljijJuFqN
	J3zMoRMIcdwypwsbAKMyDdoqVbvdmQ+gtRQowjrYRIITZTkbWX9ilA9X3C5WmOd9wb4bSJ1WD8pgo
	L1icZw6BoaxHnz3XRymakw6IN6hQi0gRvy5EyHh+zJ0NGmK7a8jZrH5M1/O0TxggHjmsFxkOftF5z
	JLZGcNy5fEzPQQhqwP/T65RJpWj89P0lDxsN2q70QPGU0Xn3zWlRcc8L4HpSTgzBubvVv/PvcYFlW
	7deP9apA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ73q-0000000F9Fk-3QvK;
	Thu, 05 Dec 2024 08:18:10 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ72b-0000000F92w-2ysQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 08:16:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 887B6A420B3;
	Thu,  5 Dec 2024 08:15:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BDCBC4CED1;
	Thu,  5 Dec 2024 08:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733386612;
	bh=v5YMVBLFaNQyG3N8yGkbXOj72cn8bq1dBgHNk+/bZkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AIKVnjdgpYOAF4L/6FlAtcAhJFHh4xev7UfxqA2l+ZnfHiqERX+6EzaroIgUXXCpU
	 Dua6HfKGySb7XskcQ8aLXSe2HsTJWmL1JhBadbTlhsH4xyADdIzeS3CcvZq3kKGdMt
	 f9ajM0l9i42fm5iQrRT1UI31re78agJ6VtmKlKw4qAZNzdTiIQSnF21wK9TSoXr2gd
	 lBmmQ6rhA67MZfxWmIaFiw+S3pP7xk6T/kMPRYw4Y+WDzEi2lSMMV7qvcy7q4HgWLc
	 4vC75sqN1clPjRixrDBcO+9ZtGPtFYySgGJhgpQeMYGlYrAjj9NgnzLC7XIMLIRipk
	 HNeCNmNKMhyOg==
Date: Thu, 5 Dec 2024 09:16:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	James Cowgill <james.cowgill@blaize.com>, Matt Redfearn <matt.redfearn@blaize.com>, 
	Neil Jones <neil.jones@blaize.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev
Subject: Re: [PATCH v5 6/6] MAINTAINER: Add entry for Blaize SoC
Message-ID: <h5awakp52e6pxnnfrclhtlhhs3i66twvmqwlf5vmnfwk2xhbwr@marp6wti72ti>
References: <20241204-blaize-blzp1600_init_board_support-v5-0-b642bcc49307@blaize.com>
 <20241204-blaize-blzp1600_init_board_support-v5-6-b642bcc49307@blaize.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241204-blaize-blzp1600_init_board_support-v5-6-b642bcc49307@blaize.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_001653_811762_AFF116EC 
X-CRM114-Status: GOOD (  14.59  )
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

On Wed, Dec 04, 2024 at 04:05:29PM +0000, Nikolaos Pasaloukos wrote:
> Add MAINTAINERS entry for Blaize SoC platform with a list of
> maintainers.
> 
> Signed-off-by: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 273a84483b74543b510de7b08804bbd1f6514358..43846a23f9d990ae9fe066e65ed2bdd36376e327 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2238,6 +2238,15 @@ F:	arch/arm64/boot/dts/bitmain/
>  F:	drivers/clk/clk-bm1880.c
>  F:	drivers/pinctrl/pinctrl-bm1880.c
>  
> +ARM/BLAIZE ARCHITECTURE
> +M:	James Cowgill <james.cowgill@blaize.com>
> +M:	Matt Redfearn <matt.redfearn@blaize.com>
> +M:	Neil Jones <neil.jones@blaize.com>
> +M:	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>

Just to be clear: this is list of active maintainers, so all above are
supposed to perform reviews or maintainer duties. This is not
credits/managers/I-need-to-please-someone list.

With the assumption these are active maintainers:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

They should also ack it to confirm they understand the burden.

Best regards,
Krzysztof


