Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BC4606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 01:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3teXiUG0;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZaP8xPb+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:From:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hofK0JryGgKL/fZhmAQm61x9/fz9wA6S77HE9ruycGk=; b=3teXiUG0H2x8WLadSWn/k43FFd
	1v+4ZvnYifhjYvBOgaQou6iB8/FsZbbwBh0TKyKvhwZ+ELtB8eDZI1yyCfBkbXtTNMPT/s7r6EzbT
	NDX3BpLtWK9Tqz1h2564+WY3oUzSHOUrlPZGPYeUjFyjnhF4KTu2LE9gLn7h8HaAE+aqn8+bB72cH
	AzrLFWagbNCoNCOO7XIpMKyaW0AEZdfSqWzMu4Ai+COSofB0AG73f+qcd/fa1IJmhG+zOr8BxXg2+
	PP4CuUHd/2Z3H1x1r9Zp9ACWWh7+7o8UH3vQAOyXG7yWLjsNi2GDYfKiM/xC7dEyPOuxaw+g5l8LR
	Z7BNKNTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOm51-00000007Rem-3VfY;
	Thu, 05 Nov 2026 01:15:55 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOm4w-00000007Re6-0T4x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 01:15:50 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-1ae18eb9b69so1322976c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 17:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793841345; x=1794446145; darn=lists.infradead.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hofK0JryGgKL/fZhmAQm61x9/fz9wA6S77HE9ruycGk=;
        b=ZaP8xPb+rTNdf55giLndS/vXCM1Zn4Zq4UdmnIRN7BauoYd1uzdDe+Rwxaw9IIvPdj
         aPqOSTk8oi6pn/7q/XMnk0VKRPieeeeLvgDSvMyz55NHCYxXpV5a6KFUoJzA6VEqGxnS
         ElR78Ann2ABef8SEyHhRQBS2Usv3sV+jj16magk2cZhovnAfYbPXHYbzm5/eMC3/2MXM
         XIP3hyps+TAmS6vmJ3BD81855RNABRhyGiotWeCB2CBbRAP0nEjOWtlnjtIeULqqn9YS
         KPKMlN8r9WulmrHuTr0zqoQGrHj23FdxCrx3+LBThMZ7KbnZqQr2u0YagrA4IDRJuUur
         BrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793841345; x=1794446145;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hofK0JryGgKL/fZhmAQm61x9/fz9wA6S77HE9ruycGk=;
        b=wnTthPADFBT87Xsz4Uihim0caIEAQdBm4Qi3VvP23d6YAWYswWnn3RK0i4BKzcN5XP
         EaBhMOojnxp5+8grFYlQkum8YzgZQ0uzDlJfTGxoGDsLIYMwHzPjqG/kFSPzMLOPboKo
         VZ+ywdPatVjDJ2tI6lRsaXKqcQXCIFD0/6rq2YMXub0FSlGdrCf6J/p7e/XB6ebM2/vY
         Jx3xaLbuIfrL9/pQlzAtqaR0PRTXuOapB4o0KC3+SotSqjtNkR1ffTEaf6Wp13g5S23V
         875xAE+jzZTr9e8lq0+1oGm+NskV2JXPP2y74jfwuk3glFJZcIvsNnpVxtW3IgBBArK1
         xLFw==
X-Forwarded-Encrypted: i=1; AKwUvBxig+U8KC2C8/9HJ1QfBChHse3CeJWMlDibOwpkLkYOj+RcaDH2DtC2Zmdy//g33/X2FUr3QR01g5rrbAEBtmOL@lists.infradead.org
X-Gm-Message-State: APuU4Z/9NZJHqoBeIB/ZiPdnxvEMcxGTAmnumZsA3GH66rMY3WSACuBL
	wJp8fdYTwFMxV8fhb1rH2fjhn2IaRjSQq8rYCYthQf54TORFGYa6iGn2
X-Gm-Gg: AYBFou1n0cJTw0sKkX8xyMcGlsfWXYRFMwtI9bkex3WzMtqlywo8ISZjtCadYk7eOzn
	TokiFIftxtmzOQyIWJrLzpYeIpogY3mffqh7+vl0m4FQBpjBP4tW4HBsmEjQlCodp7K9tjCCSBI
	dOBmdeasUEsEkN0xXz554iKRS31nkuxK9P7WhwMjiPiPXE8WAZruBbwiVL4urannub7mpEFQqYZ
	9X2kvaOKmkqVuuvXWfjx8QhCzMy6K6SHI2SHIBC7Ksu5hhc31Gkj6i6NoyorEeANGhGHpVf/w3I
	Pz8c1PnTbmBYzw+mpDxgpWRUsgfUugx+d3H6eKjm1/OTewX2QXuZbyOGXeHWmau5xoDrAwFKocB
	dl4Zrvvc5PSdqyITBlgxF35WC4AdkQ4ndSQd0gPAvuQ4K7xz0rGDNXZqYmiXgoYyKVRRZDolVmz
	TdCZap6ynT25+gb7i+WIBYiqUztCu0+WCc9e3hSOpJ4vYLcF0JDbbcy6ugCNJWZ/9XRI/fQBbzG
	NcmiyQLyKoanyzEeOENnh1QpUWlLPd9Pfniinek61r32isqjLTtJ6zzoZAgJfbU6QLr3rEv7Ycr
	EdI4c82RStOhn+nnewIOMmcUlOa9cZR0cCvvwFa1wQzczDuIVUvt/K/cenyEhs7dx2Gy4g==
X-Received: by 2002:a05:7022:3c87:b0:1ad:4ef5:ffed with SMTP id a92af1059eb24-1aea05f4bcfmr18283181c88.38.1793841344539;
        Wed, 04 Nov 2026 17:15:44 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:c8f4:b7d9:252f:4483])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c283sm12146627c88.4.2026.11.04.17.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 17:15:43 -0800 (PST)
Date: Wed, 04 Nov 2026 17:15:42 -0800
Message-ID: <ad02069b0cdede7ae191e4a3df57f33a@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Russell King <linux@armlinux.org.uk>,
	Mark Brown <broonie@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Arnd Bergmann <arnd@arndb.de>,
	mfd@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] mfd: wm831x: Support software nodes for DCDC regulators
In-Reply-To: <20261104181429.GE1650678@google.com>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com> <20261024-samsung-kp-v4-1-e21253295e68@gmail.com> <20261104181429.GE1650678@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_171546_197756_7F908F80 
X-CRM114-Status: GOOD (  26.17  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Lee,

On Wed, Nov 04, 2026 at 06:14:29PM +0000, Lee Jones wrote:
> On Sat, 24 Oct 2026, Dmitry Torokhov wrote:
> > +static int wm831x_add_devices(struct wm831x *wm831x, int wm831x_num,
> > +			      const struct mfd_cell *cells, int num_cells)
> > +{
> > +	struct wm831x_pdata *pdata = &wm831x->pdata;
> > +	int i;
> > +
> > +	struct mfd_cell *local_cells __free(kfree) =
> > +		kmemdup_array(cells, num_cells, sizeof(*cells), GFP_KERNEL);
> > +	if (!local_cells)
> > +		return -ENOMEM;
> > +
> > +	for (i = 0; i < num_cells; i++) {
> > +		struct mfd_cell *cell = &local_cells[i];
> > +
> > +		if (strcmp(cell->name, "wm831x-buckv") == 0) {
> > +			int id = cell->id - 1;
> > +
> > +			if (id >= 0 && id < WM831X_MAX_DCDC)
> > +				cell->swnode = pdata->dcdc_swnodes[id];
> > +		}
> > +	}
>
> I can't begin to tell you how much I hate this.
>
> Why are we duplicating massive static const structs just to add a S/W
> node?  Is there no other way we can do this statically?

The software node itself is defined statically in the board file
(crag_dcdc1_swnode in arch/arm/mach-s3c/mach-crag6410.c in patch 2/4),
as it describes board-specific and PMIC-instance-specific wiring -
specifically the host SoC GPIO wired to the PMIC's DVS pin (GPK(0) on
Cragganmore 6410).

Because wm831x-core.c is a generic PMIC driver that can be instantiated
on different boards or even multiple times on the same board (for
example, Cragganmore 6410 has two WM831x PMIC instances, only one of
which has a DVS GPIO wired to DCDC1), the shared static mfd_cell arrays
in wm831x-core.c cannot point to a board's software node at compile
time.

Note that local_cells is annotated with __free(kfree), so the duplicate
array only lives for the duration of the mfd_add_devices() call (which
makes its own per-device copy of each mfd_cell anyway) and is freed
immediately before wm831x_add_devices() returns.

> Since pdata is being populated already, why not just pass that on to the
> consuming child device (the regulator)?

The regulator driver (wm831x_buckv_dvs_init() in
drivers/regulator/wm831x-dcdc.c) acquires the DVS GPIO using
devm_gpiod_get(&pdev->dev, "dvs", ...). When converting the board file
away from legacy gpiod_lookup_table to software nodes (to drop the
fragile MFD device name matching and fix the GPIO chip label lookup),
gpiolib resolves the "dvs-gpios" property against the consumer device's
fwnode (&pdev->dev), so the software node needs to be attached to the
wm831x-buckv platform device.

In v2 of this series I actually tried passing the software_node pointer
through wm831x_buckv_pdata and attaching it to &pdev->dev inside the
regulator driver's probe() [1]. However, attaching a software node to
an already-registered platform device inside probe() is awkward and
requires manual teardown in the child driver, whereas mfd-core already
has built-in support for cell->swnode in mfd_add_device() (attaching
the node via device_add_software_node() before platform_device_add(),
and cleaning it up via device_remove_software_node() on error or
removal). Populating cell->swnode lets mfd-core manage the software
node lifecycle cleanly and keeps the regulator driver untouched.

If you prefer not to kmemdup the full cell table, another option would
be to split the buckv cells out of the main wm831x cell arrays and
register them via a separate mfd_add_devices() call, though that seemed
more intrusive across wm8310/wm8311/wm8312/wm8320. Please let me know
what you would prefer here.

[1] https://lore.kernel.org/all/20260708-samsung-kp-v2-7-3c6ed4c9b3b6@gmail.com/

Thanks.

-- 
Dmitry

