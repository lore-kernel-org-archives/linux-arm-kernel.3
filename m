Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E34606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 15:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QzjbGvPj;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NIX2qQTo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ErqmRoNtosEyKipfBKvwtNRAfh9+mgslrcK6rd69LR8=; b=QzjbGvPjWNqG+dOIwzlClug1XR
	70dao2ch1GgZMmdJ52W+Nnbp2nP5apr3+TenJwMfIx3Pp850lz1heS3pAWlldfYncj+6wsWJihD4m
	Plgyc7RauER+Tt1ZMDaoDQ9L1NweIhUvE/cDbHBZe3tBhneJXYx1TKjH6S1/5MCI0b0i258ew2WPS
	8S5lnY75Qs/k+wtvhN5gn8RZHQ+WGHf9qMzY9Mq3D4Wls9xnMMX4osMIevrGKJhWHQ+DGTihBRJnh
	2fSwN3as3QEpBaGY2ze5/E0qVyvzJR3iuZWhjKnxSYKguq12D+yEw4M6LOTAC3Dz1JQgPyHKLBGxY
	n/UR79XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSQl-00000009fna-2Oim;
	Thu, 29 Oct 2026 15:52:43 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSQj-00000009fn5-1Kdm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 15:52:42 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so19623815e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 08:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793289158; x=1793893958; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ErqmRoNtosEyKipfBKvwtNRAfh9+mgslrcK6rd69LR8=;
        b=NIX2qQToj/nFf05Ptn9Vd6V1S9p23jmuBmzukoiB1fCufo1M+OeebtHRJgAztVuzDZ
         kYJXMywYy3rSMDLA67kJMQMmWJ0mY5PKClgoQUz4LmwtlKZNjBsghQXQUMFv88FDGkEo
         +EnMEStOVsScOdcSo/gn3yESVMsFRCzIsK9w1+JOTUhWXyQcSLGRKi6tjMLVXzj8LGEp
         InUJSH3nM6XbTmm4Z+ECOxSPkMP0fUWvlKj1CHd+c9or4D+8bcogJJrrTP/5rNNQEJwM
         L+G3rV/xbD+msEV3KBqtYZtJzmH7p2alzgzlOARhpwlAMyn9mgmeaTtrXlsFUPnT8xXP
         M38g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793289158; x=1793893958;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ErqmRoNtosEyKipfBKvwtNRAfh9+mgslrcK6rd69LR8=;
        b=GE2Gz8p7eAeOckbhLFPSt8HVukpQw0rWlCWhIBMzOekBGn5hzZh0w+68CjjwPZUKmN
         3YZz7k3zigUgA2eficgdgxEjlZhKcFHvjyQAM0gPtE+TUdLajyBf4ijG6AeypKouYcwV
         mY4zuPnp3/7nLDmjkg8Wwx4QNuBEyFjCmG6d5bAJHe3DUDOnyCD9pSOmLY+/iIMTRAzi
         krM7o/qFcIYOm+6O0/Fp/palLU9EbbzugzV5jm8inDdivZRdUbEDl88hOe8wOf3hMEmm
         dMsjTj8tE50ijNqSXfPkT3ULV/ASPzkOky+FpPimuwIXfPo27G2CsZAe6VO8KPZ1DDcA
         wTZQ==
X-Forwarded-Encrypted: i=1; AKwUvByzUdRdo2uU+r/4nH1M5JszvgzQA0GDYMVClnSDi7/2Rwnuz1L6Yi81PGJGWZ1fjQYNI6oIh1XjRHtIhJzFHfkh@lists.infradead.org
X-Gm-Message-State: AFq9FYJsNdU9QRD07uuVBld2LBjQcASzdrYF9cbHq6d6C67FcyxI0k8Q
	bTLile4PGySoeCiaeC+IX2YFKQGgjLWbRt853YBwmShqtf3u46Bxm3Ky
X-Gm-Gg: AYBFou3OtMi+b9E1YcePwM8oW/hOEC2UpXPkgJ4EBGTtn01K1wY55Ps1q+sUQlfsq6N
	RCk6gaWJz0+qb14qJ9bbayha2VV4PIzDDAVYqdyqwO4JhZTcTiPL285psAXYhzwy3/nbpFv0DPA
	TKfGTPUkXoO1EKbVwmbZZD6z6jlPPUyqow3T2QJEDt+10ljQwVOqpUh2Dg7f5Sn72COUZdQliaM
	qbjj5gi+Ow4TOlgUsUahE6yt5aZqkIK2m01n5poStMQ4FtTI/BMyPM/ACWPoKVPRB7APuzsGbEM
	+EpeygKSnRV56yRTU8YsBN4DPc46Pn7jaYPbV1FrSTCTc7kQ4g0+kVvEQVa87Xo/krze4ZZUeWn
	prk9MzqrTqkbxnhC5zfKtbm52E15KfIn0T4q+uuQRIG16kVjiGf/XqHJat8LPpuQNzcIcfpq+vZ
	4BgRuidXjFxB8oGX/IP7+R4jXOt1AYUyrOut3DtXV7yr89QHe4obisNeY3Uikxju/CM3vYoTa5C
	gm/VrGUXdytZ6WvHp6RC9Gynl6+g7pDWiKLjAmcICPJsxrTDayGXdmBxpko5O6iWb+W63T0bu7h
	PtcK02sUkX/HqDPJDuyY7lJc4DvsHlGZIqueTL7/YFvrgCfxuRwWI/AbQDRkMGlB8fKwFDY+OwD
	PAiyKRq25LWC7U71xwhL2h3az/6FpLOQCfHAo+mOCTM7gcX2/hXwXlIM=
X-Received: by 2002:a05:600c:154d:b0:4a3:5a42:b2a4 with SMTP id 5b1f17b1804b1-4a96720266bmr144690445e9.12.1793289158295;
        Thu, 29 Oct 2026 08:52:38 -0700 (PDT)
Received: from ernest.hoecke-nb (static-2a02-1368-6200-2fbc-d3e8-e0a5-7e8a-a15c.cust.swissbackbone.net. [2a02:1368:6200:2fbc:d3e8:e0a5:7e8a:a15c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4d8dsm36538183f8f.36.2026.10.29.08.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:52:37 -0700 (PDT)
Date: Thu, 29 Oct 2026 16:52:36 +0100
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: freescale: imx8mp-verdin: Add
 mezzanine OV5640 overlays
Message-ID: <dmtpajvbw7cfrda4msnjvorjt67tycvu7qbsio4irvdydsbxny@mxxqqwht7mzu>
References: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com>
 <20261022-verdin-imx8mp-hmp-camera-ready-v3-4-90a30b0b0d55@toradex.com>
 <atp-MEqHMT7F75qn@lizhi-Precision-Tower-5810>
 <zv4gir4qrx62cwyl47cypuk57q7ci4l2piml5cgchhiys2hyli@ubzeh3nw4itu>
 <atvCMGUsLXImGhxZ@SMW015318>
 <ww6nhvo5agqub65eunynauzwkpi7lr2ntbnqhn7xm4nq4hirtf@yceeas6ulqy3>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ww6nhvo5agqub65eunynauzwkpi7lr2ntbnqhn7xm4nq4hirtf@yceeas6ulqy3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_085241_381984_5D6010DD 
X-CRM114-Status: GOOD (  30.11  )
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

On Sun, Oct 25, 2026 at 12:43:20PM +0100, Ernest Van Hoecke wrote:
> Hi Frank,
> 
> On Fri, Oct 23, 2026 at 03:23:12PM -0500, Frank Li wrote:
> > On Fri, Oct 23, 2026 at 03:51:17PM +0200, Ernest Van Hoecke wrote:
> > > On Thu, Oct 22, 2026 at 05:20:48PM -0400, Frank Li wrote:
> > > > On Thu, Oct 22, 2026 at 04:31:28PM +0200, Ernest Van Hoecke wrote:
> > > > > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > >
> > > > > The Verdin iMX8M Plus exposes its second MIPI CSI-2 interface through the
> > > > > Verdin iMX8M Plus Mezzanine. Add overlays for using a Toradex OV5640 camera
> > > > > on this interface.
> > > > >
> > > > > The mezzanine can route the camera control signals through two jumper
> > > > > configurations. Describe each configuration as a GPIO nexus mapping so the
> > > > > camera description remains independent of the physical routing.
> > > > >
> > > > > The default positions share the native CSI_1 GPIOs and are intended for a
> > > > > single camera. The alternate positions permit simultaneous native and
> > > > > mezzanine cameras, but conflict with the Atmel MXT touchscreen GPIO.
> > > > >
> > > > > The current camera set uses a 27 MHz on-board oscillator. The legacy camera
> > > > > module uses 24 MHz, so provide variants for both.
> > > > >
> > > > > Link: https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine/
> > > > > Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
> > > > > Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
> > > > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/freescale/Makefile             | 19 ++++++
> > > > >  ...-verdin-mezzanine-ov5640-24mhz-alt-jumpers.dtso | 19 ++++++
> > > > >  ...din-mezzanine-ov5640-24mhz-default-jumpers.dtso | 18 +++++
> > > > >  ...imx8mp-verdin-mezzanine-ov5640-alt-jumpers.dtso | 38 +++++++++++
> > > > >  ...mp-verdin-mezzanine-ov5640-default-jumpers.dtso | 42 ++++++++++++
> > > > >  .../freescale/imx8mp-verdin-mezzanine-ov5640.dtsi  | 78 ++++++++++++++++++++++
> > > >
> > > > why not share with imx8m-verdin-ov5640.dtsi, which is almost the same.
> > > >
> > > > Frank
> > >
> > > Hi Frank,
> > >
> > > Both camera modules have their own oscillator, and the native and
> > > Mezzanine connectors have their own supply, so each overlay describes its
> > > own clock and regulator nodes. They also use a different I2C bus, CSI
> > > receiver and connector. Both overlays are applied together for two
> > > cameras (imx8mp-verdin-wifi-dev-dual-ov5640),
> > 
> > Okay, I see share one imx8m-verdin-ov5640.dtso
> > 
> > > so their node names and
> > > labels must be unique, and a single .dtsi cannot be included twice.
> > 
> > mezzanine actually connect by another connectors ? so it need new one files
> > because current nexus node's limitation.
> >
> 
> Yes, the Mezzanine has its own camera connector, wired to the second
> MIPI CSI-2 receiver of the i.MX8M Plus. Its GPIOs already go through a
> connector nexus of their own, defined in the Mezzanine overlays.
>  
> > Can you make imx8mp-verdin-mezzanine-ov5640.dtsi also standardize, like
> > use unified camera_i2c_2, camera_connector2, compre to imx8m-verdin-ov5640.dtso
> >
> 
> This is possible, but the labels used by imx8m-verdin-ov5640.dtso exist
> because that overlay is shared by Verdin iMX8M Mini and Verdin iMX8M Plus.
> The Mezzanine is specific to the Verdin iMX8M Plus and connects to its
> module-specific pins, which another module could wire differently. New
> labels in the SoM dtsi would become ABI with these overlays as their only
> user, so I would rather not add them. If a future Verdin module shares
> this connector, I will add the labels then.
>  
> > And avoid dtso include dtso file.  Now perfer only include dtsi file.
> > 
> > Frank
> 
> Okay I will go back to only including dtsi in v4 of this series, and
> also for the next SMARC series. Thanks.
> 
> Kind regards,
> Ernest

Hi Frank,

Just a heads-up that I'll be off in November so you can expect these
changes in December, together with v3 of SMARC iMX8MP camera series.

Thanks,
Ernest


