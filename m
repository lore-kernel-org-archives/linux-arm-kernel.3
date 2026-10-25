Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD6C606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 11:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cXvr+4T2;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=n+/7kOPi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pNkrUZthoHTKm2i03POzDpLmDVfB4ha/LrHYDPEV1so=; b=cXvr+4T2rvYn9b7PjqFIdyUxog
	XBsOpWJfjZM9QJqef2ORRmVpfJBiRi0f2qnpFBTbMbtx2htUrEgEQ34/W0sQH+vyTxM0o3lWpa4qR
	okGnks6hLlvODBYHhmAusiF6yfntX/bvFeKh1Kt92n/EXkqNkBRN1URzSCEacB2lgmtHb7UP6bHLj
	B/Yv7nDciKFPeRHdk/noDmu301pNFeQm2EbLzWfyGOkhsHOmJ9fDWdfquhdipRkKk5Bd2Cf06wsVN
	L7Y4+tmTWtAf1NweW9YMjCN/OT4SgTP0+zDoO4K/1rHLj9YALmcm5tqWcdb12mClAx76zzPEIvri0
	pAvHlJbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKwdN-000000010Xe-0MqU;
	Sun, 25 Oct 2026 11:43:29 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKwdK-000000010We-12bo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 11:43:27 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a208d93758so24273205e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Oct 2026 04:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792928603; x=1793533403; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pNkrUZthoHTKm2i03POzDpLmDVfB4ha/LrHYDPEV1so=;
        b=n+/7kOPiOlVHd25TsuRyuMvc1E3AwGng2Hzlu7SIFEPNStCnq0LMxRnlT3bh1kze4R
         kmzd/JIGS/S47bbVKeR4lQoL6J6ce9a0178tXEugbuIQIH3J/MMgBskcaRUQvQ7JI0Rt
         NUGMBovwn/oV8ifh3UChVGAcltcda9ErriUowkRqxatzP9oScvA/N4XTNMhUj8uz+JI6
         VLWUDJU778pUggEndMJSLPx7iMh/DUz+1e6nmhq8gR6IoYL7asrety+8KdDMpX5wAz/2
         JNYjdzGhKKczjHMjh+N9Ij6s3TGdwLy0W5tFBK735oyKIYQMz0FDcVjW+0br0lsQCqJ3
         Ge/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792928603; x=1793533403;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pNkrUZthoHTKm2i03POzDpLmDVfB4ha/LrHYDPEV1so=;
        b=A0byJQVNWzzS9pOa+rHulN+v03yC+Z8Rbz+VWYLrxGxmqQHT/YvUDWS34mY4xOyvRH
         JjNsQ2PLoWF6VDqK9DJ2Bcay4EnmAjwWgY1Vm3QvQ5rg2aMnhIw8OqJUWhdMk+cESs4G
         bwWfMaxTmMYIrynHfrQsozG3PpC4YiXn17qEEM2uqXuqieqa/2AhK4EmhUhXruyd5mZf
         7pgtrQTGQbEsAyV0xjHtXX8+iBuRic8y7gbyxaKP9sqXjJWOP5h8pKBIqai24WEFu7Sb
         2lHF5mOSJ1FS2gbQ5j9O+fm2dcpIsEEIPRhJD3DC+Ru45J7ev3I52TjBVJLIe6LM3Fsl
         M+bA==
X-Forwarded-Encrypted: i=1; AKwUvBxUnmwO4zCojsfA2qrB8HXSN5U0zL1zXVB42i10HbKBc561NlOYFaIVuhTq6n2uEYGVst3YVUS7Hq6VeQhLShwi@lists.infradead.org
X-Gm-Message-State: AFq9FYKkd27p1+eJfQMggI8rmBPJCt1ndv/qUCgb12+6sFxWDTRNnacD
	y45N287Z0kzIwVD7KXlHV0VLnyjVVvFqkX+5S58H+txB6vovN3Ae9Cpb
X-Gm-Gg: AYBFou1qviP6e6oGuiAeoQPLlakbvphv1YJm1YAGaevEwBJNm/f4aMn11chXCPCW+8l
	V3hcvWKKs0VkvomrSoHshHIZ76h965/236pY3lcV5ejGMXbHQTspqxZg51Dh0B7XG83AiyC8eAo
	tn3UnxGj3GQEGU+LxDPr33QAL8rQh5NUeSLc2taJ9C41ia6u7gJuV6+1ZIRSbCFgE14mJciDVvS
	Nus5+dgWZXTOvEEcIaZUfg2JTPmqd4anXpU/NV4HHxCCQy1h1Et+3Ja/K44dY4pbVz29Qx3Yh2x
	4Kud/8PhN0LNY1Xs1mRLsKON4ObFy8KblV13ZCa05YqgBXkzQaH0XUFyOuGtX9nGsUWcjEOCalB
	+CM87LooppPB34VcbHm0KF8ALdPeblivZNdXinZpBCZabQNol0F8bN8dR2sEEkdgEJyIfFDMHQR
	23DWg9+2v/ktdQGZneSuZMxQPffl0r6G5eO+W4CLvwKdcB0ga2XX5n9teirFXQXY79Gr/vh5zBS
	PBKpcxXETUiJo5p23PqliwHAMJJgBaRI4jSUvKmDoxGgfqvOEq68F9jXygRvyuLmI3X3NtPjqaa
	3I8XSeWCLWD+GE3dQSl8LtJFaEPbAyKd56qObORdfalN/UPIXg/SPKclD+pzGqYIwVb2+cy2hHt
	XFzgN2g==
X-Received: by 2002:a05:600c:1c1b:b0:4a2:1a:a116 with SMTP id 5b1f17b1804b1-4a35aae5c48mr75332735e9.0.1792928602528;
        Sun, 25 Oct 2026 04:43:22 -0700 (PDT)
Received: from ernest.hoecke-nb (static-2a02-1368-6200-2fbc-a24b-7223-aeca-a4a6.cust.swissbackbone.net. [2a02:1368:6200:2fbc:a24b:7223:aeca:a4a6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a4cb7bece3sm63901465e9.10.2026.10.25.04.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 04:43:21 -0700 (PDT)
Date: Sun, 25 Oct 2026 12:43:20 +0100
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
Message-ID: <ww6nhvo5agqub65eunynauzwkpi7lr2ntbnqhn7xm4nq4hirtf@yceeas6ulqy3>
References: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com>
 <20261022-verdin-imx8mp-hmp-camera-ready-v3-4-90a30b0b0d55@toradex.com>
 <atp-MEqHMT7F75qn@lizhi-Precision-Tower-5810>
 <zv4gir4qrx62cwyl47cypuk57q7ci4l2piml5cgchhiys2hyli@ubzeh3nw4itu>
 <atvCMGUsLXImGhxZ@SMW015318>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atvCMGUsLXImGhxZ@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_044326_319171_00AFEB54 
X-CRM114-Status: GOOD (  25.36  )
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

Hi Frank,

On Fri, Oct 23, 2026 at 03:23:12PM -0500, Frank Li wrote:
> On Fri, Oct 23, 2026 at 03:51:17PM +0200, Ernest Van Hoecke wrote:
> > On Thu, Oct 22, 2026 at 05:20:48PM -0400, Frank Li wrote:
> > > On Thu, Oct 22, 2026 at 04:31:28PM +0200, Ernest Van Hoecke wrote:
> > > > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > >
> > > > The Verdin iMX8M Plus exposes its second MIPI CSI-2 interface through the
> > > > Verdin iMX8M Plus Mezzanine. Add overlays for using a Toradex OV5640 camera
> > > > on this interface.
> > > >
> > > > The mezzanine can route the camera control signals through two jumper
> > > > configurations. Describe each configuration as a GPIO nexus mapping so the
> > > > camera description remains independent of the physical routing.
> > > >
> > > > The default positions share the native CSI_1 GPIOs and are intended for a
> > > > single camera. The alternate positions permit simultaneous native and
> > > > mezzanine cameras, but conflict with the Atmel MXT touchscreen GPIO.
> > > >
> > > > The current camera set uses a 27 MHz on-board oscillator. The legacy camera
> > > > module uses 24 MHz, so provide variants for both.
> > > >
> > > > Link: https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine/
> > > > Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
> > > > Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
> > > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > ---
> > > >  arch/arm64/boot/dts/freescale/Makefile             | 19 ++++++
> > > >  ...-verdin-mezzanine-ov5640-24mhz-alt-jumpers.dtso | 19 ++++++
> > > >  ...din-mezzanine-ov5640-24mhz-default-jumpers.dtso | 18 +++++
> > > >  ...imx8mp-verdin-mezzanine-ov5640-alt-jumpers.dtso | 38 +++++++++++
> > > >  ...mp-verdin-mezzanine-ov5640-default-jumpers.dtso | 42 ++++++++++++
> > > >  .../freescale/imx8mp-verdin-mezzanine-ov5640.dtsi  | 78 ++++++++++++++++++++++
> > >
> > > why not share with imx8m-verdin-ov5640.dtsi, which is almost the same.
> > >
> > > Frank
> >
> > Hi Frank,
> >
> > Both camera modules have their own oscillator, and the native and
> > Mezzanine connectors have their own supply, so each overlay describes its
> > own clock and regulator nodes. They also use a different I2C bus, CSI
> > receiver and connector. Both overlays are applied together for two
> > cameras (imx8mp-verdin-wifi-dev-dual-ov5640),
> 
> Okay, I see share one imx8m-verdin-ov5640.dtso
> 
> > so their node names and
> > labels must be unique, and a single .dtsi cannot be included twice.
> 
> mezzanine actually connect by another connectors ? so it need new one files
> because current nexus node's limitation.
>

Yes, the Mezzanine has its own camera connector, wired to the second
MIPI CSI-2 receiver of the i.MX8M Plus. Its GPIOs already go through a
connector nexus of their own, defined in the Mezzanine overlays.
 
> Can you make imx8mp-verdin-mezzanine-ov5640.dtsi also standardize, like
> use unified camera_i2c_2, camera_connector2, compre to imx8m-verdin-ov5640.dtso
>

This is possible, but the labels used by imx8m-verdin-ov5640.dtso exist
because that overlay is shared by Verdin iMX8M Mini and Verdin iMX8M Plus.
The Mezzanine is specific to the Verdin iMX8M Plus and connects to its
module-specific pins, which another module could wire differently. New
labels in the SoM dtsi would become ABI with these overlays as their only
user, so I would rather not add them. If a future Verdin module shares
this connector, I will add the labels then.
 
> And avoid dtso include dtso file.  Now perfer only include dtsi file.
> 
> Frank

Okay I will go back to only including dtsi in v4 of this series, and
also for the next SMARC series. Thanks.

Kind regards,
Ernest

