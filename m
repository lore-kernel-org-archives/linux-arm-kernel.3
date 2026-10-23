Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44138606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 14:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XVvBtQuT;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fVBEVSpF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SwYBO9Kk2wO9Ecr7r+S2LJi21hL4Jf1QQvneYBvL52w=; b=XVvBtQuT7zGJ6iDx77vChmJik4
	Dr5mRk6HgWMAjSA4nXyPU5SXXAQG2v9dmtFRZTflKxXkPywiZtr+kCr4tf43EB+2N6BtDND8pf43y
	H+lQBOafa0qdi9Kw4KFpnx0x9RTv2um2R98WFqiBf+crwR6/ZhEcbhkCI6zxZcUia/VaDUMY1OvBQ
	ncaIVtRmd+EYqpvvCOwy2Pn2YHquVIjDalp8W/bEpCHMz4/D4vdr9QVI0RnN1xKaBEuESKusqjL3B
	640QeclCMFw2ZBanTSmU7oFnNgXpgC3RcNGUIzFRvAwenXdYSgeTzHyYjYbyw6YKzAQKLctHEPq3d
	gQMddisg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFtY-0000000GTKS-0GpL;
	Fri, 23 Oct 2026 14:05:20 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFtW-0000000GTJn-00ou
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 14:05:19 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso8644185e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 07:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792764316; x=1793369116; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SwYBO9Kk2wO9Ecr7r+S2LJi21hL4Jf1QQvneYBvL52w=;
        b=fVBEVSpFT5W5KCEdwcU3aFBT3sk7MdThj6H5XhfwQyjS3ThBbqIXdH1j0Dmc5IF4dg
         r+KJWppOS0Fyr2CTda6rpNGyZNEHPMNERDRx1RG7b/lXsa3u9Qu8hIQLHwkYAS4pfClb
         dOn5/tlzKb3k2HFS80qFSeOGcxn8r/xz7M+qm06H7FMK0eeBdeUMR8fF/a+iUtuoA6a9
         VnwAdTzyQ315yAyaGfQlQ7w2vmu9MQZCLuEa/UIq3TbwpmU+avh+71TwEB1kmz+ivIeo
         wB1XTeGsdwFUbmwkAq84UBZIAfTahRV8YebZ545xc4oM3of0mgT2bygxhKL/Xkzoo6Wi
         LUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792764316; x=1793369116;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SwYBO9Kk2wO9Ecr7r+S2LJi21hL4Jf1QQvneYBvL52w=;
        b=2hvJkB3iR+4IYSIvF1cEAG08N6v8ksA3gvWe3V/bQaQc7uS9uFNaTqL/yKpVQcSziL
         KM0SIjoV3129LjpALsM5brnW6ZBq5c3F2dfn4TxrQLTQvheqNhLkOsCizQ6OpfqIEXGS
         AkskpC6MzCQdrcFEHucufsZZq4SnRGPJCGuH6GYUhzohiYxJO//fm5IuGQF8RxLkqYmm
         2puggJxbrEjVa/xNeMiV3wvUTZDaBmgs2M6KrLFA/vp5n4t4QN+jt3upPstelbu1wWdC
         SPUotnJdVauW5OfQiTPYmQ2l+/hl38Oqo6u7R0Wp4zzFd3n8bnI8reHAPJXFj+ZBqFtb
         HI9g==
X-Forwarded-Encrypted: i=1; AKwUvBzVVBEXgZ+NYTFuzo5wZ0lJwMi+SgYnz4g9zbK7YoDKtHDKGCfPNhkZ4B58b4rRNwv0XXu1x8kX1aErnlU5YuKR@lists.infradead.org
X-Gm-Message-State: AFq9FYI/99WgVCOaWh5gkFq/jpZwAmD/aFP1OMecf4Nzgt71YrgpjLyn
	5TYBGw/5CbHPNYTMKxGFQVZdXTil5u72ip1t/pkkI5M3BAbQb0bJNSGU
X-Gm-Gg: AYBFou0TkoXtrvKg6lCiMWgnKNZSftwYOwBEat6W6oCT3jWLMKr23j6GOweh4eqPggM
	uzU/rtDRGvbgr5EtAiDvkf+XFsdXckH+NzZMUYdyVp8R1A8NpnEleOMrwu1o12aTg05k70kBl1F
	3wSn24ZV1M77qb9z4XW3y0zgq0uBFk9PiE919lO5zHAaxrUA8rFj/HMePinlIBx3ysUwjPO+Pv2
	K8+V5z/b4pV/RDqpHAKpTPLsJ19kDfEfgjQ6y7a/kWDeg8p096KR5EsHJzK/xUikmsoCJtXJmip
	DOoPrhvviErl6t8PGLX5C1lc3TPUBWeQWQ/iqGL5WmylYDSOnfGOuoFrvDyL3Io6p+yno91Hoc8
	7LNS4ioq92/BYkRRcSvOMDeyZH3vuy7bZAkeVPTdQ2f7mbbG29ZPyMoghocJ0PkqvR7PRSXzLdA
	1QuIcOYXOmGTS59T0OBp8tME8H19gBfMt65DzYMzkoNE3dj2psd99Mya62SSsdvpE7cARJu+Hc5
	7+ZxNjve5uCzhSubP1Lelex7xiEg/FQFdHNLdlwB9hn4d42+poDYdZwG2mkdNrYdXAlyX9PMRVM
	7B8vMCFdz8GYaVpqbPlVJsd6WNGBBMz1Nj4W9kI457xcFrNgSusKbiPI
X-Received: by 2002:a05:600c:34c7:b0:4a1:f99e:f22d with SMTP id 5b1f17b1804b1-4a211c9de3bmr42927825e9.6.1792764315768;
        Fri, 23 Oct 2026 07:05:15 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21545973csm31765235e9.4.2026.10.23.07.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 07:05:14 -0700 (PDT)
Date: Fri, 23 Oct 2026 16:05:13 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v3 2/4] arm64: dts: freescale: imx8m{m,p}-verdin: Add
 camera connector nexus
Message-ID: <stl2ybj3psmedmjdjbvzj6sstzte6dqwxywa5eph634qcyuydf@6byf4ay5vqau>
References: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com>
 <20261022-verdin-imx8mp-hmp-camera-ready-v3-2-90a30b0b0d55@toradex.com>
 <atp7I9fBUXhK7b4F@lizhi-Precision-Tower-5810>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atp7I9fBUXhK7b4F@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_070518_071631_CD256A24 
X-CRM114-Status: GOOD (  20.06  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 05:07:47PM -0400, Frank Li wrote:
> On Thu, Oct 22, 2026 at 04:31:26PM +0200, Ernest Van Hoecke wrote:
> > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> >
> > The Verdin Development Board, Dahlia and Mallow expose the same 24-pin CSI
> > camera connector, while Verdin iMX8M Mini and Verdin iMX8M Plus route its
> > sideband signals and media pipeline through different SoC resources.
> >
> > Add a GPIO nexus to each carrier description and stable Verdin-level labels
> > for each module's CSI_1 I2C bus, receiver and capture engine. Keeping the
> > nexus in the carrier files avoids describing the physical connector on
> > carriers which do not provide it.
> >
> > This gives accessory overlays a stable connector and media interface
> > without embedding either module's wiring in the accessory description.
> >
> > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > ---
> ...
> Thank you for good progress.
> 
> >
> > +/* Verdin CSI_1 */
> > +verdin_csi_capture: &csi {};
> > +
> >  &ddrc {
> >  	operating-points-v2 = <&ddrc_opp_table>;
> >
> > @@ -596,7 +599,7 @@ &i2c2 {
> >  /* Verdin I2C_3_HDMI N/A */
> >
> >  /* Verdin I2C_4_CSI */
> > -&i2c3 {
> > +verdin_csi_i2c: &i2c3 {
> >  	clock-frequency = <400000>;
> >  	pinctrl-names = "default", "gpio";
> >  	pinctrl-0 = <&pinctrl_i2c3>;
> > @@ -695,6 +698,9 @@ eeprom_carrier_board: eeprom@57 {
> >  	};
> >  };
> >
> > +/* Verdin CSI_1 */
> > +verdin_csi_rx: &mipi_csi {};
> > +
> 
> Can you refer to port?
> 
> &mipi_csi {
> 	ports {
> 		verdin_csi_rx_port: port@0 {
> 		^^^^
> 		}
> 	}
> }
> 
> because difference mipi controller may use difference port index. If
> define point to port,
> 
> ov5460 can reuse if port@0 change to port@1.
> 
> Frank

Hi Frank,

Good point. In v4, I can refer to ports.

Ernest

