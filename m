Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1015D606A327
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 21:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=unNckJnG;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MtI0IhGI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZNkRVh6Ty401RG6V3W3YBuDyeqLwtI1cJ5oxr/TdzUs=; b=unNckJnGJ/L3kk
	lTKfUo3JOANKgQYUUpoj70vD6lH+kh9VKM8zvOKA+8dScv8FE9Ra0m+/s2ng1oJo/TzdPCXBbzuXC
	FqEi6U6j5iwMkx5TWUYKXzXZNIXvKughx2yPAOqiEm4ZMnkHqGeDmEoF8Lh+DwQGAVq5S3xCSmgLx
	U6EueKAGIEBqDntVF5jtVsvsDYbXD+P3UkaxsZecCzntXMpXpVk0o3vOb8LIv3KMNs/RaRAgMHBaU
	0pzndQE9Toz67v+/aWuqLb2oFHedlBvRS9zSp4GNDg9quZlDRWDjhz64S+wtYgaqvFr9wxhOuTCk0
	KLwVNIO3beu6/1uRfcQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNcse-0000000EuD7-1qeR;
	Sun, 01 Nov 2026 21:14:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNcsd-0000000EuCu-0WHm;
	Sun, 01 Nov 2026 21:14:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2DFDB40D93;
	Sun,  1 Nov 2026 21:14:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D9831F000C1;
	Sun,  1 Nov 2026 21:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793567658;
	bh=ZNkRVh6Ty401RG6V3W3YBuDyeqLwtI1cJ5oxr/TdzUs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=MtI0IhGI+f3QNHD3CTexim/4WGzwoaiHljWQsSqfmi4liMSnO9BMV0v/Tqb5Mwi7g
	 3mBHxE+bw5aYdqBHlmXNZ6ZRgwwAUBKPTVzFMWIeBc+Vi/EHjtd9G/jCLOmdhbro3L
	 ehq87f1GKiyV9p1CPOnrRa03HsulXIsfNuvg7zDaVURrEZq9UswFDM8XqXtLSJ+Coi
	 gmvN/efPtlG5AVDpcLd6jfpOUIODKw3o/07Vp+2Zq2WHIloyWcqmvGoh7ixl3JWCRv
	 0P4xOdAnL9igbVMeJP8kUvlIfCZm6bLFt1KD3KcYyB35AcPePY0xO3cMOZQOusgtGS
	 2vqFkWqH7+tZw==
Date: Sun, 1 Nov 2026 21:14:10 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Rupesh Majhi <zoone.rupert@gmail.com>
Cc: Alex Lanzano <lanzano.alex@gmail.com>, Andy Shevchenko
 <andy@kernel.org>, Benson Leung <bleung@chromium.org>, David Lechner
 <dlechner@baylibre.com>, Guenter Roeck <groeck@chromium.org>, Jagath Jog J
 <jagathjog1996@gmail.com>, Javier Carrasco
 <javier.carrasco.cruz@gmail.com>, Jean-Baptiste Maneyrol
 <jean-baptiste.maneyrol@tdk.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Jinseob Kim <kimjinseob88@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Matti Vaittinen
 <mazziesaccount@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Remi Buisson
 <remi.buisson@tdk.com>, chrome-platform@lists.linux.dev,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Marco Elver <elver@google.com>, Bart Van
 Assche <bvanassche@acm.org>
Subject: Re: [PATCH v4 0/9] iio: enable context analysis for all drivers
Message-ID: <20261101211410.5fa14b39@jic23-hlaptop>
In-Reply-To: <20261101105832.55605-1-zoone.rupert@gmail.com>
References: <20261027124954.110697-1-zoone.rupert@gmail.com>
	<20261101033018.05897c08@jic23-hlaptop>
	<20261101105832.55605-1-zoone.rupert@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun,  1 Nov 2026 12:58:32 +0200
Rupesh Majhi <zoone.rupert@gmail.com> wrote:

> On Sun, 01 Nov 2026 03:30:18 +0000
> Jonathan Cameron <jic23@kernel.org> wrote:
> 
> > Please take a look and check I didn't mess it up.  
> 
> Diff is fine. Built drivers/iio with clang 23 allmodconfig: no
> warnings, and a dropped unlock is still caught.
> 
> Subject line got lost though. It should be "iio: enable context
> analysis for all drivers".
Doh.  Cut and paste bug!
> 
> CONTEXT_ANALYSIS_dps310.o := y in pressure/Makefile can go now too.
> I can send a follow-up.
No problem - I roled that in.  Didn't bother changing the commit message
as it is obvious what is going on there.

> 
> Jinseob Kim's Tested-by didn't make it in:
> https://lore.kernel.org/linux-iio/CALMSew+nhZp9BoqS5tOgFdiVy13U1r2f4UQa9Sd5zc9pSt_YcA@mail.gmail.com/
Ah. b4 didn't pick that. I guess because the formatting was missing the <> around the email address
that is standard.  Anyhow, fixed up.

Thanks!

Jonathan

> 
> Rupesh


