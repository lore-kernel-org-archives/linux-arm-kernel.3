Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B52606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 22:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tKKba7a1;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QbzkOfk0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AYZMbGj7oht89My8sN94ja1hxWH99fDkLAWp50IGFJo=; b=tKKba7a1lZAoz9
	Kl0oe4xP7mqcWTXGd6mT2FK0fq/rToOglddIBD6si3gF5bwzEYJDHw3g2Vj7eCRJC0Hnb5uSCHAk9
	mClyRWs56oaSe8rFM1lhrMw+iKVbicP15OMaQt88cgPxvoEDg/44Sq/mIAoReajWtPcDOy0UQGIiw
	2wmJOEkRkXwn/PGf27rlJMgqm/3JuX57nLBgxcKbyJXqqu+Q3TQ6XqhkVls7YtjNDZvnhzc7I3/sK
	/u3XrkYtL69LYVe4V2yqhMcvLpqpZv05FuI06KUiz3jY/4LseQnqZGFJxZTPnk5yLYFJZiRaCPNYS
	3+PKhk4fSE7pQJXRfcCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL6x6-00000001UJD-2C2Z;
	Sun, 25 Oct 2026 22:44:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL6x5-00000001UJ4-1NdX;
	Sun, 25 Oct 2026 22:44:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A89DC41478;
	Sun, 25 Oct 2026 22:44:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A03D91F01825;
	Sun, 25 Oct 2026 22:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792968270;
	bh=AYZMbGj7oht89My8sN94ja1hxWH99fDkLAWp50IGFJo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=QbzkOfk0XPYKteukRUGvuLPQYRS4mq7rMHUgD77pb2OiFDr2Q1PMmb2d0hQGZjnkW
	 jjW4nFKcGkFnUQOUc9ODSiwMAGYlX+FyGFbruw9Q9h2esLYajcQ0q+rs9LR3SWpOIz
	 22Upn+oRQMrP/uWAUQmgVozXGGNJLExk4puWIAY4JqwrVFujFX43vrQiAy5rIYBZT7
	 FqB8W6Q0RVLCUpGcOi6Q+PwC+ACC9O50tQha+HYdPWCU48M/tSdCLyXflBdPpLHp7/
	 /A93MTZbp532wVURITqVSA76dA0npntH6/l+iOGNZlNTUrujL+GU53Ue+Vi/4lGeib
	 rlXCbYR04VNqw==
Date: Sun, 25 Oct 2026 22:44:21 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Roman
 Vivchar <rva333@protonmail.com>, Luca Leonardo Scorcia
 <l.scorcia@gmail.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Andy Shevchenko
 <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v5 0/2] iio: adc: add mt6397 PMIC AUXADC support
Message-ID: <20261025224421.551f3a7b@jic23-hlaptop>
In-Reply-To: <20261025-rbrue-suez-upstreaming-mt6397-auxadc-v5-0-5c3c7a5a1851@gmail.com>
References: <20261025-rbrue-suez-upstreaming-mt6397-auxadc-v5-0-5c3c7a5a1851@gmail.com>
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
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 25 Oct 2026 00:18:07 -0500
Ryan Brue <ryanbrue.dev@gmail.com> wrote:

> The MediaTek mt6397 PMIC has a 10-bit AUXADC that nothing in-tree can
> reach. On boards built around it that ADC is the only path to the battery:
> the SoC's AUXADC is wired to board thermistors, and the charger ICs these
> boards use have no ADC at all, so without it there is no pack voltage and
> no state of charge.
Applied to the testing branch of iio.git. I'll be rebasing that on rc1
once available. At that point I'll push out as togreg which gets picked up
by linux-next.

Thanks,

Jonathan

