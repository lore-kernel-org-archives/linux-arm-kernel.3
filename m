Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7A2606D801
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 14:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rmJ64G8c;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nEBFhzWR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tIsim5wpkIICh192gsX8FGT+MKKG5Z56KVBTAyYasJg=; b=rmJ64G8cV9P6N/5NUq5CJ5dmdL
	FpfsvueuqQZiPCC6tzO9hq1B8mb8M+t0CLSLAdS+M+IFJk3QQujaGlKCORjh4NodnxGct59A8Q7RJ
	zQ6W6gs2x4wl7quknm8Wus20Nf42gN9xT+rv+eMeLi6x4l/bT34WCrN78pOMAwd5O15IzchQ7dNPh
	aR6UFDCSN1z2qk/mclRHaM9Ofyg2zP1bGIuj/gwufHNLgvN4xskEC60D8bWZHAbdbCIiQ0oBRlI0D
	OfVxa4RSWSpBqI8Vo3UueScJ3uh7pOWBwtbxWirUGb8Re7VeiMcX37ashMnVIwBoIC/MoJgzmf+/g
	TnAz543A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObp2-00000005bcE-1Zy8;
	Wed, 04 Nov 2026 14:18:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObp0-00000005bc7-3WqR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 14:18:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id D81C660A95;
	Wed,  4 Nov 2026 14:18:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 6513B1F000C1;
	Wed,  4 Nov 2026 14:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793801917;
	bh=tIsim5wpkIICh192gsX8FGT+MKKG5Z56KVBTAyYasJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nEBFhzWRIks+RPRMz6B9YBuEcxelF78jOoxhaGbQlrGOIEOF3j0r4ZN3AsSw82HWM
	 PfVd37jaJHJA+9usuXZNPgGRYSimbNDnYfzEwcjLVi5tPC1p2ENsIUifco3Hk2uHSN
	 P/0XtOlU/mMN6xk3YzmiKARg901Rn0WgDEBbY4JlDVbPe2swPcY88Z1iwTzkQCWHhv
	 c+SQFgiIZzd+Pr4Baa+2NRTAiI8nBCg1miIKasAnUU3Bp3toOaQJe1MOLo/AwjY39B
	 7KmrsqnOjGE0Cvdu5GFOyqlkNWPdX6oqfaiJmVQdZ+RhaBXHtAonVyvJLCZIenqIm2
	 dkqzeViYeSr+Q==
Date: Wed, 4 Nov 2026 15:18:33 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Oleksij Rempel <o.rempel@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Vignesh R <vigneshr@ti.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Linus Walleij <linusw@kernel.org>, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: Convert to subsys_platform_driver()
Message-ID: <ef6ce6fqyefm6ywoaym2f4ww5nclotp7i7ohmqnaikb2lb5dsm@lcrmzg2z7v7n>
References: <20261104113316.1634141-1-peng.fan@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104113316.1634141-1-peng.fan@oss.nxp.com>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 07:33:16PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Replace the open-coded subsys_initcall()/module_exit() platform driver
> registration with subsys_platform_driver().
> 
> No functional change.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com> 

