Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7003F606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 13:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NFfWa/tY;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QSaazTTi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wLlMw0tkVCijJdHRbK9nVgzTmO5b6r27lqMQqqKuArg=; b=NFfWa/tYA0Kud183rhi0pFmkv9
	qo/LSEHpmTfSfLem5jNJTfdwK5b94L8zmCC9aMMX4vxeEbk3vaTSOi9uMiaQ0L5FsJtgVMn84jBTJ
	OLrmq5n5PPIdzDY25vP3t1FUjmI5AwsPpxFKPglmac1qb1EIBAgOXyqfWgJf71Hna8CGV68hhE2fR
	CInLEo7QMvWzNsBoKAWfPYlDz9Ije+hgrbM2u87LKqW0FGdUInHb1Q+tJ0QenwR5bLAkxFm6GV/Xl
	MHC3SLp1HAEQCp2jFxmkRD2onxK1Qi3HFaTtxXkuWfdTzpzNCOOU+V8kuFOO0gwhpJZRff2A4vjJ2
	1AKUwiiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFg4-0000000GRiE-1u4D;
	Fri, 23 Oct 2026 13:51:24 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFg1-0000000GRh1-2yZ0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 13:51:23 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so571934f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 06:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792763479; x=1793368279; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wLlMw0tkVCijJdHRbK9nVgzTmO5b6r27lqMQqqKuArg=;
        b=QSaazTTiAkPMTkFYoyXsrp7Af3Th46c+cDyIpKgIs06Npt5cR5AsBZecrp/Jdgb5fv
         4lBwgQ0MY8XGvbd3Yga60mdJxMxxDvHShiCaFvbwMK77msNYSlFa8QNx942MwvEe5r+w
         8zkSuhCyoW35cbI4OBNu5VhfoxwvtUhCjXTbf1+IuWVXBphcJMiXM4r1EgeYhjz5XtM1
         bH0AFBN0EBlWoVWN+3jG8Z4s5VS4ikgIO4RpzxMy+vYrGo64OkZq6OKtuH3F7Ba/S9u3
         J3mYNCQqwrOii+wN/87njaXK6X5HXqnEhCQXON6uyQC42U0NmXAWCqgv2ehOLoNvd7/B
         5tFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792763479; x=1793368279;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wLlMw0tkVCijJdHRbK9nVgzTmO5b6r27lqMQqqKuArg=;
        b=Cr0zoeNiEfq4z6xWSxFS2PwziJDSRPL7tKTBnuEH4WiYe+yj/EI3xQy6fX2Ypt3lQK
         vx52vLco4EkYs2Xt6HRBJ7Ab+gvranaEIaXQaNg2rtymy05S/nh5UQrBjGurOqz+fozp
         QO2hcD6sqxo+6LeJE+0bJVIEhGVxTZg9LRlN8uQO9XvHmNFftomtlb5Wczm5LQqgpf2O
         /PC/PbkCC+a79jz39rNltAMk9ImuGq0rdhVKfFYWmSZoYnI8oSLbXDQGFi1vulVd8rVL
         DRh01fMb4tCjUZx2XR4CKt2UmkJTM7oURb7lw4HYN80CZjXe9mO1HwztRT4ICRmEn3vw
         QkpA==
X-Forwarded-Encrypted: i=1; AKwUvBz3iV3NCaPn4kHCcYzHGxGNsjMRGlMBD4Pnct/VOSd14LcgILpJDVK29qrrKnzxp73mKV29xVuOm067ptsvoyYa@lists.infradead.org
X-Gm-Message-State: AFq9FYKqRPXKPLU9RLW8baiTaZ1CMWljttWxWIIs7+p2qBCz3/RFcLz4
	Bx+I4+FxvRHx+zfAOyyM8UxHqzajQ/XsqnMMIMswqwooJuN5W/IRIjY5
X-Gm-Gg: AYBFou12OyqF3AK+1PIrqD1nlOqSoC9KMIEEngb1BQUup7Q3YxbGR8AkNme8Lh1Zl6q
	qp/NOmus3pGpbowDU4/Z1eOQV1/0QSnLjs1L71v/o6ZCrv240UJvBORG33CoqiD0OIrjux73zZj
	9hGbk9FZ15p9ED2q8YZjUhVJhIif8pxYKVSxS8c2Uzg9t00Ve0/w54yRfAJh6TDI8KOwe9BrO3y
	dcRyJy+WCSjO6KFY6LE33cIu4237z5B20hi2cux20klPN34ijevi8ukx74oIcBa4ZaLmJo3t02r
	CpAimu6h7VwbBXIuyJrXjBy+JXcX1z41k7sVCQatQBdPvtYv7APcoxn2qArIlmTh8Z1VRMTRwXX
	AHMkciuYuOYE9yRQxbjl7ybISi2ILMDLOKhAYB0ZPvSYRnAkp/1hD/myn48YyWGX9EtrFwlaXHb
	U7Ri7MziapedhvJw2ib00yc3beJ+kyighddAUQh+AnSXBHe7fMc6TYR+3PklDNULzLhQa9028X+
	H/uvKz7lFj9otvCTTSVyOfZDMIfA2AfQBT22WJsXpWMwC1JGjTKWHa/zyTiRvEkfGa/c44V7hBa
	+y6HDnEqsdKJaKoONr5Nd74b8adnfIvPBPthpsOQLZ3fYvkt0Gt/6Xs=
X-Received: by 2002:a05:6000:46c8:b0:48d:f3ec:e818 with SMTP id ffacd0b85a97d-48e2d1430d7mr7952493f8f.7.1792763479100;
        Fri, 23 Oct 2026 06:51:19 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e380314a3sm4401217f8f.27.2026.10.23.06.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:51:18 -0700 (PDT)
Date: Fri, 23 Oct 2026 15:51:17 +0200
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
Message-ID: <zv4gir4qrx62cwyl47cypuk57q7ci4l2piml5cgchhiys2hyli@ubzeh3nw4itu>
References: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com>
 <20261022-verdin-imx8mp-hmp-camera-ready-v3-4-90a30b0b0d55@toradex.com>
 <atp-MEqHMT7F75qn@lizhi-Precision-Tower-5810>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atp-MEqHMT7F75qn@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_065121_772176_20E1A633 
X-CRM114-Status: GOOD (  18.01  )
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

On Thu, Oct 22, 2026 at 05:20:48PM -0400, Frank Li wrote:
> On Thu, Oct 22, 2026 at 04:31:28PM +0200, Ernest Van Hoecke wrote:
> > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> >
> > The Verdin iMX8M Plus exposes its second MIPI CSI-2 interface through the
> > Verdin iMX8M Plus Mezzanine. Add overlays for using a Toradex OV5640 camera
> > on this interface.
> >
> > The mezzanine can route the camera control signals through two jumper
> > configurations. Describe each configuration as a GPIO nexus mapping so the
> > camera description remains independent of the physical routing.
> >
> > The default positions share the native CSI_1 GPIOs and are intended for a
> > single camera. The alternate positions permit simultaneous native and
> > mezzanine cameras, but conflict with the Atmel MXT touchscreen GPIO.
> >
> > The current camera set uses a 27 MHz on-board oscillator. The legacy camera
> > module uses 24 MHz, so provide variants for both.
> >
> > Link: https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine/
> > Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
> > Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
> > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > ---
> >  arch/arm64/boot/dts/freescale/Makefile             | 19 ++++++
> >  ...-verdin-mezzanine-ov5640-24mhz-alt-jumpers.dtso | 19 ++++++
> >  ...din-mezzanine-ov5640-24mhz-default-jumpers.dtso | 18 +++++
> >  ...imx8mp-verdin-mezzanine-ov5640-alt-jumpers.dtso | 38 +++++++++++
> >  ...mp-verdin-mezzanine-ov5640-default-jumpers.dtso | 42 ++++++++++++
> >  .../freescale/imx8mp-verdin-mezzanine-ov5640.dtsi  | 78 ++++++++++++++++++++++
> 
> why not share with imx8m-verdin-ov5640.dtsi, which is almost the same.
> 
> Frank

Hi Frank,

Both camera modules have their own oscillator, and the native and
Mezzanine connectors have their own supply, so each overlay describes its
own clock and regulator nodes. They also use a different I2C bus, CSI
receiver and connector. Both overlays are applied together for two
cameras (imx8mp-verdin-wifi-dev-dual-ov5640), so their node names and
labels must be unique, and a single .dtsi cannot be included twice.

The connector nexus makes the GPIOs independent of the routing, but an
overlay still has to name the connector, bus and receiver it uses. One
overlay for either connector would need the target to be chosen when it
is applied, which is what the DT connector/addon work is about, so sadly
we have to wait for that to make things more generic.

What is left in common is a few constant sensor properties, so I would
like to keep the two files.

Thanks for your input and best regards,
Ernest


